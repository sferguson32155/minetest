#include <fstream>
#include <cstdint>
#include <vector>
#include <string>

#include <iostream>

#include "WasmInjector.h"

std::string WasmInjector::get_wasm_bytes(const char* path) {
    std::ifstream fin(path, std::ios::binary);
    std::vector<uint8_t> buffer;
    fin.seekg(0, fin.end);
    size_t length = fin.tellg();
    fin.seekg(0, fin.beg);

    if (length > 0) {
        buffer.resize(length);    
        fin.read((char*)&buffer[0], length);
    }

    std::string formatted = "[";
    for (auto b : buffer) formatted += std::to_string(b) + ",";

    formatted = formatted.substr(0, formatted.length()-1) + "]";
    fin.close();
    return formatted;
}

std::vector<std::string> WasmInjector::get_js_contents(const char* path) {
    std::ifstream fin(path, std::ios::binary);

    std::vector<std::string> contents;
    std::string raw;
    while (!fin.eof()) {
        std::getline(fin, raw);
        contents.push_back(raw);
    }

    fin.close();
    return contents;
}

bool WasmInjector::write_js(std::vector<std::string> js, const char *path) {
    std::ofstream fout(path);

    for (auto line : js) {
        fout << line;
    }

    fout.close();
    return true;
}

std::string WasmInjector::get_containing_directory(const char *path) {
	std::string stringPath(path);
	std::size_t delimiter = stringPath.find_last_of("/\\");

	return stringPath.substr(0, delimiter);
}

bool WasmInjector::inject_wasm(const char *path) {
    // Path to the target directory to inject
	std::string js_path(path);
	js_path += "\\mod.js";

    // Get the path to the model file
    std::string modelJS_path = get_containing_directory(path) + "\\mod.js";
	std::cout << modelJS_path << std::endl;

    // Copy the model file to the target directory
	std::cout << "Opening Streams..." << std::endl;
	{
		std::ifstream modModelJS(modelJS_path, std::ios::binary);
		std::ofstream wasmModJS(js_path, std::ios::binary);

		std::cout << "Copying Files..." << std::endl;
		wasmModJS << modModelJS.rdbuf();
	}

	// Read the file contents to a string
    std::cout << "Reading JS..." << std::endl;
	auto js = WasmInjector::get_js_contents(js_path.c_str());

    // Read the WASM bytes
	std::cout << "Reading WASM..." << std::endl;
	std::string wasm_path(path);
	wasm_path += "\\mod.wasm";
	auto wasm_bytes = WasmInjector::get_wasm_bytes(wasm_path.c_str());

	// Write the WASM to a buffer. This is line 9, an empty line
	std::cout << "Injecting..." << std::endl;
	js[8] = "var buffer = new Uint8Array(" + wasm_bytes + ")";

    // Write to the JS File
	std::cout << "Writing to File..." << std::endl;
	return write_js(js, js_path.c_str());
}

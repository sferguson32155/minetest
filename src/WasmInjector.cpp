#include <fstream>
#include <cstdint>
#include <vector>
#include <string>

#include <iostream>
// #include <experimental/filesystem>

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

bool WasmInjector::file_exists(const std::string &name)
{
	if (FILE *file = fopen(name.c_str(), "r")) {
		fclose(file);
		return true;
	} 
	else {
		return false;
	}
}

void WasmInjector::compile_mod(const char *path) {
    // Check for a file to be compiled
	std::string mod_name = "";
	std::string mod_names[] = {"\\mod.c", "\\mod.cpp", "\\mod.js"};
	for (std::string name : mod_names) {
		if (file_exists(path + name)) {
			mod_name = path + name;
			std::cout << name << std::endl;
			break;
        }
    }

	if (mod_name == "") {
	    std::cout << "Mod file not found" << std::endl;
		return;
	}

    // Command strings
	std::string path_str(path);
    std::string version("2.0.1");
	std::string clone_command = "git clone https://github.com/emscripten-core/emsdk";
	std::string compile_command = "cd " + path_str + " && emcc " + mod_name + " -o mod.wasm -Os -s \" EXPORTED_FUNCTIONS=[ \"_getName\", "
			"\"_getDescription\", \"_getTexture\", \"_getMaterial\"]\" ";
	std::string install_command = "cd emsdk && .\\emsdk install " + version + " && "
					  ".\\emsdk activate " + version +" && .\\emsdk_env.bat && " + compile_command;

    // Attempt to install emsdk and compile the mod
	std::cout << "Checking emcc installation..." << std::endl;
	if (!file_exists("emsdk")) {
		std::cout << "emsdk not found." << std::endl;
		std::cout << clone_command << std::endl;
		system(clone_command.c_str()); // clone emsdk
	}
	system(install_command.c_str()); // install and activate the correct versions, then compile the mod
}

bool WasmInjector::inject_wasm(const char *path)
{
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

    // Attempt to compile the mod if mod.wasm doesn't exist
	std::string wasm_path(path);
	wasm_path += "\\mod.wasm";

    if (!file_exists(wasm_path))
		compile_mod(path);

    // Read the WASM files
    std::cout << "Reading WASM..." << std::endl;
	auto wasm_bytes = WasmInjector::get_wasm_bytes(wasm_path.c_str());

	// Write the WASM to a buffer. This is line 9, an empty line
	std::cout << "Injecting..." << std::endl;
	js[8] = "var buffer = new Uint8Array(" + wasm_bytes + ");\n";

    // Write to the JS File
	std::cout << "Writing to File..." << std::endl;
	return write_js(js, js_path.c_str());
}

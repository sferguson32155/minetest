#include <fstream>
#include <cstdint>
#include <vector>
#include <string>

#include "WasmInjector.h"
#include <iostream>

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

    std::ifstream fin;
    fin.open(path, std::ios::binary);
    if (fin.fail()) {
	    std::string err = "Could not open: " + std::string(path);
	    throw std::runtime_error(err);
    }
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

bool WasmInjector::inject_wasm(const char *path) {

    auto js = WasmInjector::get_js_contents(path);
    int begin, end, line;
    std::string wasm_path = "";
    for (int i = 0; i < js.size(); i++) {
        begin = js[i].find("%wb");
        end = js[i].find("wb%");
        if (begin != std::string::npos) {
            line = i;
            wasm_path = js[i].substr(begin+3, end-begin-3);
            break;
        }
    }
    if (wasm_path == "") return false;

    auto wasm_bytes = WasmInjector::get_wasm_bytes(wasm_path.c_str());
    js[line] = js[line].substr(0, begin) + wasm_bytes + js[line].substr(end+3, js[line].length()-end);

    return write_js(js, path);
}

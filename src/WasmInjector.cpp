#include <fstream>
#include <cstdint>
#include <vector>
#include <string>

#include "WasmInjector.h"
#include <log.h>

std::string WasmInjector::get_wasm_bytes(const char* path) {
	infostream << "made it here331\n";
    std::ifstream fin(path, std::ios::binary);
    std::vector<uint8_t> buffer;
    fin.seekg(0, std::ios_base::end);
    size_t length = fin.tellg();
    fin.seekg(0, std::ios_base::beg);
    infostream << "made it here332\n";

    infostream << "length:  " << length << "\n";
    if (length > 0) {
	    buffer.resize(length);
	    infostream << "made it here3321\n"; 
        fin.read((char *)&buffer[0], length);
	    infostream << "made it here3322\n";
    }
    infostream << "made it here333\n";

    std::string formatted = "[";
    for (auto b : buffer) formatted += std::to_string(b) + ",";
    
    infostream << "made it here334\n";
    formatted = formatted.substr(0, formatted.length()-1) + "]";
    fin.close();
    infostream << "made it here335\n";
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

bool WasmInjector::inject_wasm(const char *path) {
	infostream << "made it here31\n";
	auto js = WasmInjector::get_js_contents(path);
	infostream << "made it here32\n";
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

    infostream << "made it here33\n";
    auto wasm_bytes = WasmInjector::get_wasm_bytes(wasm_path.c_str());
    infostream << "made it here34\n";
    js[line] = js[line].substr(0, begin) + wasm_bytes + js[line].substr(end+3, js[line].length()-end);

    infostream << "made it here35\n";
    return write_js(js, path);
}

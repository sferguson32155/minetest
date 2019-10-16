#include <string>
#include <vector>

class WasmInjector {
    private:
        WasmInjector() {}
        static std::string get_wasm_bytes(const char* path);
        static std::vector<std::string> get_js_contents(const char* path);
        static bool write_js(std::vector<std::string> js, const char *path);
    public:
        static bool inject_wasm(const char *path);
};

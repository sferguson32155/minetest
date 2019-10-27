#pragma once
#include <string>
#include <vector>
#include "jsapi.h"
#include "js/Initialization.h"
#include "js/CompilationAndEvaluation.h"
#include "js/SourceText.h"
#include "js/Utility.h"
#include "js/CompileOptions.h"

class WasmLoader
{
	public:
		WasmLoader() {};
		static std::vector<std::string> loadWasmData(const std::string &path);
	private:
		static std::string getModProperty(JSContext *cx, JSObject *source, const char *prop);
};

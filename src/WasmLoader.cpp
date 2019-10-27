/*
 * new class that holds all the code that spins up spidermonkey and runs js/wasm
*/

#include <iostream>
#include <string>
#include <vector>

#include "jsapi.h"
#include "js/Initialization.h"
#include "js/CompilationAndEvaluation.h"
#include "js/SourceText.h"
#include "js/Utility.h"
#include "js/CompileOptions.h"

#include "WasmInjector.h"
#include "WasmLoader.h"

static JSClassOps global_ops = { nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,
		nullptr, nullptr, nullptr, nullptr, JS_GlobalObjectTraceHook };
/* The class of the global object. */
static JSClass global_class = { "global", JSCLASS_GLOBAL_FLAGS, &global_ops };

std::string WasmLoader::getModProperty(JSContext *cx, JSObject *source, const char *prop)
{
	JS::HandleObject object = JS::HandleObject::fromMarkedLocation(&source);

	JS::Value v;
	JS::MutableHandleValue prop_value =
		JS::MutableHandleValue::fromMarkedLocation(&v);

	JS_GetProperty(cx, object, prop, prop_value);

	JSString *str = prop_value.toString();
	size_t size = JS_GetStringLength(str);
	char *buffer = (char *)malloc(size);
	JS_EncodeStringToBuffer(cx, str, buffer, size);

	std::string res = "";
	for (int i = 0; i < size; i++) {
		res += buffer[i];
	}
	free(buffer);

	return res;
}

std::vector<std::string> WasmLoader::loadWasmData(const std::string &path)
{
	JS_Init();
	std::vector<std::string> ret_vec;
	JSContext *cx = JS_NewContext(8L * 1024 * 1024);
	if (!cx)
		return ret_vec;

	if (!JS::InitSelfHostedCode(cx))
		return ret_vec;

	{
		JS::RealmOptions options;
		JS::RootedObject global(cx, JS_NewGlobalObject(cx, &global_class, nullptr, JS::FireOnNewGlobalHook, options));
		if (!global)
			return ret_vec;

		JS::RootedValue rval(cx);
		{
			JSAutoRealm ar(cx, global);
			if (!JS::InitRealmStandardClasses(cx))
				return ret_vec;

			const char *filename = "noname";
			int lineno = 1;
			JS::CompileOptions opts(cx);
			opts.setFileAndLine(filename, lineno);

			std::string js_path = path + "\\mod.js";
			WasmInjector::inject_wasm(js_path.c_str());
			bool ok = JS::EvaluateUtf8Path(cx, opts, js_path.c_str(), &rval);
			if (!ok)
				return ret_vec;

			if (rval.isObject()) {
				JSObject *res = rval.toObjectOrNull();

				ret_vec.push_back(WasmLoader::getModProperty(cx, res, "name"));
				ret_vec.push_back(WasmLoader::getModProperty(cx, res, "description"));
				ret_vec.push_back(WasmLoader::getModProperty(cx, res, "texture"));
				ret_vec.push_back(WasmLoader::getModProperty(cx, res, "material"));
			}
		}
	}
	JS_DestroyContext(cx);
	JS_ShutDown();
	return ret_vec;
}

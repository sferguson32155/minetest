#include <iostream>
#include <string>
#include <vector>
#include <direct.h>

#include "jsapi.h"
#include "js/Initialization.h"
#include "js/CompilationAndEvaluation.h"
#include "js/SourceText.h"
#include "js/Utility.h"
#include "js/CompileOptions.h"

#include "WasmInjector.h"

#include "jsExecutor.h"

jsExecutor *jsExecutor::instance = NULL;

jsExecutor *jsExecutor::getInstance()
{
	if (!instance)
		instance = new jsExecutor;

	return instance;
}

int jsExecutor::executeJS(lua_State *L)
{
	char buff[FILENAME_MAX];
	getcwd(buff, FILENAME_MAX);
	std::string path(buff);
	path.append(lua_tostring(L, 1));

	std::vector<jsTypeWrapper> arguments;
	getArguments(L, arguments);

	jsExecutor * executor = getInstance();
	std::vector<jsTypeWrapper> returnValues;
	executor->runSpidermonkey(path, arguments, returnValues);

	// put return values on lua stack
	for (auto value : returnValues)
		pushOnStack(L, value);

	return returnValues.size();
}

JSObject *jsExecutor::getGlobalObject()
{
	JSObject *gNR = JS::CurrentGlobalOrNull(cx);

	return gNR;
}

void jsExecutor::pushOnStack(lua_State *L, jsTypeWrapper value)
{
	switch (value.type) {
	case 3:
		lua_pushstring(L, value.s.c_str());
		break;
	case 4:
		lua_pushnumber(L, value.n);
		break;
	case 5:
		lua_pushboolean(L, value.b);
		break;
	}
}

void jsExecutor::getArguments(
		lua_State *L, std::vector<jsExecutor::jsTypeWrapper> &arguments)
{

	/* get number of arguments */
	int n = lua_gettop(L);

	for (int i = 2; i <= n; i++) {
		jsTypeWrapper arg;

		if (lua_isnumber(L, i)) {
			arg.type = 4;
			arg.n = lua_tonumber(L, i);
		} else if (lua_isstring(L, i)) {
			arg.type = 3;
			arg.s = lua_tostring(L, i);
		} else if (lua_isboolean(L, i)) {
			arg.type = 5;
			arg.b = lua_toboolean(L, i);
		} else
			throw std::runtime_error("Invalid argument datatype");

		arguments.push_back(arg);
	}
}

static JSClassOps global_ops1 = {nullptr, nullptr, nullptr, nullptr, nullptr, nullptr,
		nullptr, nullptr, nullptr, nullptr, JS_GlobalObjectTraceHook};
/* The class of the global object. */
static JSClass global_class1 = {"global", JSCLASS_GLOBAL_FLAGS, &global_ops1};


jsExecutor::jsExecutor()
{
	JS_Init();
	cx = JS_NewContext(8L * 1024 * 1024);

	if (!cx)
		throw std::runtime_error("Failed Context Creation");

	if (!JS::InitSelfHostedCode(cx))
		throw std::runtime_error("Failed InitSelfHostedCode");

	JS::RealmOptions options;
	//::RootedObject g(cx, JS_NewGlobalObject(cx, &global_class1, nullptr,
	//					    JS::FireOnNewGlobalHook, options));
	global.init(cx, JS_NewGlobalObject(cx, &global_class1, nullptr,
					JS::FireOnNewGlobalHook, options));

	if (!global)
		throw std::runtime_error("Failed Global check");
	
	JSAutoRealm ar(cx, global);
			if (!JS::InitRealmStandardClasses(cx))
				throw std::runtime_error(
						"Failed InitRealmStandardClasses");
}

void jsExecutor::runSpidermonkey(const std::string path,
		const std::vector<jsTypeWrapper> &arguments, std::vector<jsTypeWrapper> &returnValues)
{
	//JSContext *cx = JS_NewContext(8L * 1024 * 1024);
	

	{
			

		JS::RootedValue rval(cx);

		{
			insertArguments(arguments);

			const char *filename = "noname";
			int lineno = 1;
			JS::CompileOptions opts(cx);
			opts.setFileAndLine(filename, lineno);
						
			WasmInjector::inject_wasm(path.c_str());

			bool ok = JS::EvaluateUtf8Path(cx, opts, path.c_str(), &rval);
			if (!ok)
				throw std::runtime_error("Failed EvaluateUtf8Path");

			if (rval.isObject()) {
				JSObject *res = rval.toObjectOrNull();
				getReturnValues(res, returnValues);
			}
				
		}
	}
	//JS_DestroyContext(cx);
}


void jsExecutor::getReturnValues(JSObject *res, std::vector<jsTypeWrapper> &returnValues)
{
	jsTypeWrapper nextValue;
	int i = 1;
	do {
		std::string key = "return" + std::to_string(i++);
		nextValue = getJSValue(res, key.c_str());
		if (nextValue.type != -1)
			returnValues.push_back(nextValue);
		else
			break;
	} while (true);
}


void jsExecutor::insertArguments(
		const std::vector<jsTypeWrapper> &arguments)
{
	JS::RootedObject obj(cx,global.get());

	for (int i = 0; i < arguments.size(); i++) {

		std::string key = "input" + std::to_string(i + 1);
		JSString *arg;
		JS::HandleString val = JS::HandleString::fromMarkedLocation(&arg);
		switch (arguments[i].type) {
		case 3:
			arg = JS_NewStringCopyZ(cx, arguments[i].s.c_str());
			JS_DefineProperty(cx, obj, key.c_str(), val, 0);
			break;
		case 4:
			JS_DefineProperty(cx, obj,
					key.c_str(), arguments[i].n, 0);
			break;
		case 5:
			JS_DefineProperty(cx, obj,
					key.c_str(), arguments[i].b, 0);
			break;
		}
	}

}


jsExecutor::jsTypeWrapper jsExecutor::getJSValue(
		JSObject *source, const char *prop)
{
	JS::HandleObject object = JS::HandleObject::fromMarkedLocation(&source);

	JS::Value v;
	JS::MutableHandleValue prop_value =
			JS::MutableHandleValue::fromMarkedLocation(&v);

	JS_GetProperty(cx, object, prop, prop_value);

	jsTypeWrapper value;

	if (prop_value.isUndefined()) {
		// property not found
		value.type = -1;
		return value;
	}

	value.type = JS_TypeOfValue(cx, prop_value);

	// gets type index. 3 = string, 4 = int, 5 = Bool
	switch (value.type) {
	case 3: {

		JSString *str = prop_value.toString();
		size_t size = JS_GetStringLength(str);
		char *buffer = (char *)malloc(size);
		JS_EncodeStringToBuffer(cx, str, buffer, size);

		value.s = "";
		for (int i = 0; i < size; i++) {
			value.s += buffer[i];
		}
		free(buffer);
	} break;
	case 4:
		value.n = prop_value.toNumber();
		break;
	case 5:
		value.b = prop_value.toBoolean();
		break;
	default:
		throw std::runtime_error("Invalid Return Type");
		break;
	}

	return value;
}





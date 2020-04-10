#pragma once
#include "lua_api/l_object.h"

extern "C" {
#include "lualib.h"
#if USE_LUAJIT
#include "luajit.h"
#endif
}

class jsExecutor
{
	//For moving around arguments and return values
	struct jsTypeWrapper
	{
		
		double n;
		std::string s;
		bool b;

		// gets type index. 3 = string, 4 = int, 5 = Bool
		int type;
	};

	private:
	static void runSpidermonkey(const std::string path,
			const std::vector<jsTypeWrapper> &arguments,
			std::vector<jsTypeWrapper> &returnValues);
		static jsTypeWrapper getJSValue(JSContext *cx, JSObject *source, const char *prop);
		static void pushOnStack(lua_State *L, jsTypeWrapper value);
		static void getArguments(lua_State *L,
				std::vector<jsExecutor::jsTypeWrapper> &arguments);
		static void jsExecutor::insertArguments(JSContext *cx, JS::RootedObject *global,
				const std::vector<jsExecutor::jsTypeWrapper> &arguments);
		static void jsExecutor::getReturnValues(JSContext *cx, JSObject *res,
				std::vector<jsTypeWrapper> &returnValues);
	
	public:
		static int executeJS(lua_State *L);
};

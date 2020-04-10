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
		static jsExecutor *instance;
		

		jsExecutor();

		void runSpidermonkey(const std::string path,
				const std::vector<jsTypeWrapper> &arguments,
				std::vector<jsTypeWrapper> &returnValues);
		jsTypeWrapper getJSValue(JSObject *source, const char *prop);
		static void pushOnStack(lua_State *L, jsTypeWrapper value);
		static void getArguments(lua_State *L,
				std::vector<jsExecutor::jsTypeWrapper> &arguments);
		void jsExecutor::insertArguments(
				const std::vector<jsExecutor::jsTypeWrapper> &arguments);
		void jsExecutor::getReturnValues(JSObject *res,
				std::vector<jsTypeWrapper> &returnValues);
	
	public:
		JSContext *cx;
		JS::PersistentRootedObject global;
		static jsExecutor *getInstance();
		static int executeJS(lua_State *L);

		JSObject *getGlobalObject();
};

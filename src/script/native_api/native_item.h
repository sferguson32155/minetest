#include "inventory.h"  // ItemStack

// TODO: original inherits from  : public ModApiBase 

class NativeItemStack {
private:
    ItemStack m_stack;

    // TODO: determine if this is necessary, it looks like this is just for lua
    // static const char className[];
};

// TODO: original inherits from  : public ModApiBase 
class NativeModApiItemMod {
private:
	static int native_register_item_raw(Server *server, std::string name, 
		std::string description, std::string short_description, std::string inventory_image, 
		std::string inventory_overlay, std::string wield_image, std::string wield_overlay,
		std::string palette_image, std::string feature_name, bool on_construct,
		bool on_destruct, bool after_destruct, bool rightclickable 
	);

	static int native_unregister_item_raw(Server *server, std::string name);
	static int native_register_alias_raw(Server *server, std::string name, 
		std::string name, std::string convert_to
	);
	static content_t native_get_content_id(Server *server, std::string name);
	static const char* native_get_name_from_content_id(Server *server, content_t c);

public:
	// static void Initialize(lua_State *L, int top);
};








	// luamethod(LuaItemStack, is_empty),
	// luamethod(LuaItemStack, get_name),
	// luamethod(LuaItemStack, set_name),
	// luamethod(LuaItemStack, get_count),
	// luamethod(LuaItemStack, set_count),
	// luamethod(LuaItemStack, get_wear),
	// luamethod(LuaItemStack, set_wear),
	// luamethod(LuaItemStack, get_meta),
	// luamethod(LuaItemStack, get_metadata),
	// luamethod(LuaItemStack, set_metadata),
	// luamethod(LuaItemStack, get_description),
	// luamethod(LuaItemStack, get_short_description),
	// luamethod(LuaItemStack, clear),
	// luamethod(LuaItemStack, replace),
	// luamethod(LuaItemStack, to_string),
	// luamethod(LuaItemStack, to_table),
	// luamethod(LuaItemStack, get_stack_max),
	// luamethod(LuaItemStack, get_free_space),
	// luamethod(LuaItemStack, is_known),
	// luamethod(LuaItemStack, get_definition),
	// luamethod(LuaItemStack, get_tool_capabilities),
	// luamethod(LuaItemStack, add_wear),
	// luamethod(LuaItemStack, add_item),
	// luamethod(LuaItemStack, item_fits),
	// luamethod(LuaItemStack, take_item),
	// luamethod(LuaItemStack, peek_item),


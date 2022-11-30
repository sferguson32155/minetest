stack = ItemStack("default:stone 99")

-- is_empty()
minetest.register_chatcommand("lua_item_is_empty", {
	description = "Invokes lua_api > l_item.l_is_empty",
	func = function(self)
		local res = stack:is_empty()
		return true, "Success, is_empty() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_is_empty", {
	description = "Invokes lua_api > l_item.l_native_is_empty",
	func = function(self)
		local res = stack:is_empty()
		return true, "Success, native_is_empty() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_is_empty", {
	description = "Tests lua vs native API for is_empty()",
	func = function(self)
		local lua = stack:is_empty()
		local native = stack:native_is_empty()
		if lua == native then
			return true, "(Success) [Item] is_empty()"
		else
			return false, "(Fail) [Item] is_empty()"
		end
	end
})

-- get_name()
minetest.register_chatcommand("lua_item_get_name", {
	description = "Invokes lua_api > l_item.l_get_name",
	func = function(self)
		local res = stack:get_name()
		return true, "Success, get_name() returned: "..res
	end
})

minetest.register_chatcommand("native_item_get_name", {
	description = "Invokes lua_api > l_item.l_native_get_name",
	func = function(self)
		local res = stack:native_get_name()
		return true, "Success, native_get_name() returned: "..res
	end
})

minetest.register_chatcommand("test_item_get_name", {
	description = "Tests lua vs native API for get_name()",
	func = function(self)
		local lua = stack:get_name()
		local native = stack:native_get_name()
		if lua == native then
			return true, "(Success) [Item] get_name()"
		else
			return false, "(Fail) [Item] get_name()"
		end
	end
})

-- set_name()
minetest.register_chatcommand("lua_item_set_name", {
	description = "Invokes lua_api > l_item.l_set_name",
	func = function(self)
		local res = stack:set_name("default:dirt")
		return true, "Success, set_name() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_set_name", {
	description = "Invokes lua_api > l_item.l_native_set_name",
	func = function(self)
		local res = stack:native_set_name("default:dirt")
		return true, "Success, native_set_name() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_set_name", {
	description = "Tests lua vs native API for set_name()",
	func = function(self)
		local lua = stack:set_name("default:dirt")
		local native = stack:native_set_name("default:dirt")
		if lua == native then
			return true, "(Success) [Item] set_name()"
		else
			return false, "(Fail) [Item] set_name()"
		end
	end
})

-- get_count()
minetest.register_chatcommand("lua_item_get_count", {
	description = "Invokes lua_api > l_item.l_get_count",
	func = function(self)
		local res = stack:get_count()
		return true, "Success, get_count() returned: "..res
	end
})

minetest.register_chatcommand("native_item_get_count", {
	description = "Invokes lua_api > l_item.l_native_get_count",
	func = function(self)
		local res = stack:native_get_count()
		return true, "Success, native_get_count() returned: "..res
	end
})

minetest.register_chatcommand("test_item_get_count", {
	description = "Tests lua vs native API for get_count()",
	func = function(self)
		local lua = stack:get_count()
		local native = stack:native_get_count()
		if lua == native then
			return true, "(Success) [Item] get_count()"
		else
			return false, "(Fail) [Item] get_count()"
		end
	end
})

-- set_count()
minetest.register_chatcommand("lua_item_set_count", {
	description = "Invokes lua_api > l_item.l_set_count",
	func = function(self)
		local res = stack:set_count(99)
		return true, "Success, set_count() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_set_count", {
	description = "Invokes lua_api > l_item.l_native_set_count",
	func = function(self)
		local res = stack:native_set_count(99)
		return true, "Success, native_set_count() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_set_count", {
	description = "Tests lua vs native API for set_count()",
	func = function(self)
		local lua = stack:set_count(99)
		local native = stack:native_set_count(99)
		if lua == native then
			return true, "(Success) [Item] set_count()"
		else
			return false, "(Fail) [Item] set_count()"
		end
	end
})

-- get_wear()
minetest.register_chatcommand("lua_item_get_wear", {
	description = "Invokes lua_api > l_item.l_get_wear",
	func = function(self)
		local res = stack:get_wear()
		return true, "Success, get_wear() returned: "..res
	end
})

minetest.register_chatcommand("native_item_get_wear", {
	description = "Invokes lua_api > l_item.l_native_get_wear",
	func = function(self)
		local res = stack:native_get_wear()
		return true, "Success, native_get_wear() returned: "..res
	end
})

minetest.register_chatcommand("test_item_get_wear", {
	description = "Tests lua vs native API for get_wear()",
	func = function(self)
		local lua = stack:get_wear()
		local native = stack:native_get_wear()
		if lua == native then
			return true, "(Success) [Item] get_wear()"
		else
			return false, "(Fail) [Item] get_wear()"
		end
	end
})

-- set_wear()
minetest.register_chatcommand("lua_item_set_wear", {
	description = "Invokes lua_api > l_item.l_set_wear",
	func = function(self)
		local res = stack:set_wear(99)
		return true, "Success, set_wear() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_set_wear", {
	description = "Invokes lua_api > l_item.l_native_set_wear",
	func = function(self)
		local res = stack:native_set_wear(99)
		return true, "Success, native_set_wear() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_set_wear", {
	description = "Tests lua vs native API for set_wear()",
	func = function(self)
		local lua = stack:set_wear(99)
		local native = stack:native_set_wear(99)
		if lua == native then
			return true, "(Success) [Item] set_wear()"
		else
			return false, "(Fail) [Item] set_wear()"
		end
	end
})

-- get_meta()
minetest.register_chatcommand("lua_item_get_meta", {
	description = "Invokes lua_api > l_item.l_get_meta",
	func = function(self)
		local res = stack:get_meta():get_string("description")
		return true, "Success, get_meta() returned: "..res
	end
})
--broken
minetest.register_chatcommand("native_item_get_meta", {
	description = "Invokes lua_api > l_item.l_native_get_meta",
	func = function(self)
		local res = stack:native_get_meta():get_string("description")
		return true, "Success, native_get_meta() returned: "..res
	end
})

minetest.register_chatcommand("test_item_get_meta", {
	description = "Tests lua vs native API for get_meta()",
	func = function(self)
		local lua = stack:get_meta():get_string("description")
		local native = stack:native_get_meta():get_string("description")
		if lua == native then
			return true, "(Success) [Item] get_meta()"
		else
			return false, "(Fail) [Item] get_meta()"
		end
	end
})

-- get_metadata()
minetest.register_chatcommand("lua_item_get_metadata", {
	description = "Invokes lua_api > l_item.l_get_metadata",
	func = function(self)
		local res = stack:get_metadata()
		return true, "Success, get_metadata() returned: "..res
	end
})

minetest.register_chatcommand("native_item_get_metadata", {
	description = "Invokes lua_api > l_item.l_native_get_metadata",
	func = function(self)
		local res = stack:native_get_metadata()
		return true, "Success, native_get_metadata() returned: "..res
	end
})

minetest.register_chatcommand("test_item_get_metadata", {
	description = "Tests lua vs native API for get_metadata()",
	func = function(self)
		local lua = stack:get_metadata()
		local native = stack:native_get_metadata()
		if lua == native then
			return true, "(Success) [Item] get_metadata()"
		else
			return false, "(Fail) [Item] get_metadata()"
		end
	end
})

-- set_metadata()
minetest.register_chatcommand("lua_item_set_metadata", {
	description = "Invokes lua_api > l_item.l_set_metadata",
	func = function(self)
		local res = stack:set_metadata("")
		return true, "Success, set_metadata() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_set_metadata", {
	description = "Invokes lua_api > l_item.l_native_set_metadata",
	func = function(self)
		local res = stack:native_set_metadata("")
		return true, "Success, native_set_metadata() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_set_metadata", {
	description = "Tests lua vs native API for set_metadata()",
	func = function(self)
		local lua = stack:set_metadata("")
		local native = stack:native_set_metadata("")
		if lua == native then
			return true, "(Success) [Item] set_metadata()"
		else
			return false, "(Fail) [Item] set_metadata()"
		end
	end
})

-- get_description()
minetest.register_chatcommand("lua_item_get_description", {
	description = "Invokes lua_api > l_item.l_get_description",
	func = function(self)
		local res = stack:get_description()
		return true, "Success, get_description() returned: "..res
	end
})
--broken, issue with native_get_meta()?
minetest.register_chatcommand("native_item_get_description", {
	description = "Invokes lua_api > l_item.l_native_get_description",
	func = function(self)
		local res = stack:native_get_description()
		return true, "Success, native_get_description() returned: "..res
	end
})

minetest.register_chatcommand("test_item_get_description", {
	description = "Tests lua vs native API for get_description()",
	func = function(self)
		local lua = stack:get_description()
		local native = stack:native_get_description()
		if lua == native then
			return true, "(Success) [Item] get_description()"
		else
			return false, "(Fail) [Item] get_description()"
		end
	end
})

-- get_short_description()
minetest.register_chatcommand("lua_item_get_short_description", {
	description = "Invokes lua_api > l_item.l_get_short_description",
	func = function(self)
		local res = stack:get_short_description()
		return true, "Success, get_short_description() returned: "..res
	end
})

minetest.register_chatcommand("native_item_get_short_description", {
	description = "Invokes lua_api > l_item.l_native_get_short_description",
	func = function(self)
		local res = stack:native_get_short_description()
		return true, "Success, native_get_short_description() returned: "..res
	end
})

minetest.register_chatcommand("test_item_get_short_description", {
	description = "Tests lua vs native API for get_short_description()",
	func = function(self)
		local lua = stack:get_short_description()
		local native = stack:native_get_short_description()
		if lua == native then
			return true, "(Success) [Item] get_short_description()"
		else
			return false, "(Fail) [Item] get_short_description()"
		end
	end
})

-- clear()
minetest.register_chatcommand("lua_item_clear", {
	description = "Invokes lua_api > l_item.l_clear",
	func = function(self)
		local res = stack:clear()
		return true, "Success, clear() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_clear", {
	description = "Invokes lua_api > l_item.l_native_clear",
	func = function(self)
		local res = stack:native_clear()
		return true, "Success, native_clear() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_clear", {
	description = "Tests lua vs native API for clear()",
	func = function(self)
		local lua = stack:clear()
		local native = stack:native_clear()
		if lua == native then
			return true, "(Success) [Item] clear()"
		else
			return false, "(Fail) [Item] clear()"
		end
	end
})

-- replace()
minetest.register_chatcommand("lua_item_replace", {
	description = "Invokes lua_api > l_item.l_replace",
	func = function(self)
		local res = stack:replace("default:dirt")
		return true, "Success, replace() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_replace", {
	description = "Invokes lua_api > l_item.l_native_replace",
	func = function(self)
		local res = stack:native_replace("default:dirt")
		return true, "Success, native_replace() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_replace", {
	description = "Tests lua vs native API for replace()",
	func = function(self)
		local lua = stack:replace("default:dirt")
		local native = stack:native_replace("default:dirt")
		if lua == native then
			return true, "(Success) [Item] replace()"
		else
			return false, "(Fail) [Item] replace()"
		end
	end
})

-- to_string()
minetest.register_chatcommand("lua_item_to_string", {
	description = "Invokes lua_api > l_item.l_to_string",
	func = function(self)
		local res = stack:to_string()
		return true, "Success, to_string() returned: "..tostring(res)
	end
})
--broken
minetest.register_chatcommand("native_item_to_string", {
	description = "Invokes lua_api > l_item.l_native_to_string",
	func = function(self)
		local res = stack:native_to_string()
		return true, "Success, native_to_string() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_to_string", {
	description = "Tests lua vs native API for to_string()",
	func = function(self)
		local lua = stack:to_string()
		local native = stack:native_to_string()
		if lua == native then
			return true, "(Success) [Item] to_string()"
		else
			return false, "(Fail) [Item] to_string()"
		end
	end
})

-- to_table()
minetest.register_chatcommand("lua_item_to_table", {
	description = "Invokes lua_api > l_item.l_to_table",
	func = function(self)
		local res = stack:to_table()
		return true, "Success, to_table() returned: "..tostring(res)
	end
})
-- broken, crashes 
minetest.register_chatcommand("native_item_to_table", {
	description = "Invokes lua_api > l_item.l_native_to_table",
	func = function(self)
		local res = stack:native_to_table()
		return true, "Success, native_to_table() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_to_table", {
	description = "Tests lua vs native API for to_table()",
	func = function(self)
		local lua = stack:to_table()
		local native = stack:native_to_table()
		if lua == native then
			return true, "(Success) [Item] to_table()"
		else
			return false, "(Fail) [Item] to_table()"
		end
	end
})

-- get_stack_max()
minetest.register_chatcommand("lua_item_get_stack_max", {
	description = "Invokes lua_api > l_item.l_get_stack_max",
	func = function(self)
		local res = stack:get_stack_max()
		return true, "Success, get_stack_max() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_get_stack_max", {
	description = "Invokes lua_api > l_item.l_native_get_stack_max",
	func = function(self)
		local res = stack:native_get_stack_max()
		return true, "Success, native_get_stack_max() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_get_stack_max", {
	description = "Tests lua vs native API for get_stack_max()",
	func = function(self)
		local lua = stack:get_stack_max()
		local native = stack:native_get_stack_max()
		if lua == native then
			return true, "(Success) [Item] get_stack_max()"
		else
			return false, "(Fail) [Item] get_stack_max()"
		end
	end
})

-- get_free_space()
minetest.register_chatcommand("lua_item_get_free_space", {
	description = "Invokes lua_api > l_item.l_get_free_space",
	func = function(self)
		local res = stack:get_free_space()
		return true, "Success, get_free_space() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_get_free_space", {
	description = "Invokes lua_api > l_item.l_native_get_free_space",
	func = function(self)
		local res = stack:native_get_free_space()
		return true, "Success, native_get_free_space() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_get_free_space", {
	description = "Tests lua vs native API for get_free_space()",
	func = function(self)
		local lua = stack:get_free_space()
		local native = stack:native_get_free_space()
		if lua == native then
			return true, "(Success) [Item] get_free_space()"
		else
			return false, "(Fail) [Item] get_free_space()"
		end
	end
})

-- is_known()
minetest.register_chatcommand("lua_item_is_known", {
	description = "Invokes lua_api > l_item.l_is_known",
	func = function(self)
		local res = stack:is_known()
		return true, "Success, is_known() returned: "..tostring(res)
	end
})
-- broken
minetest.register_chatcommand("native_item_is_known", {
	description = "Invokes lua_api > l_item.l_native_is_known",
	func = function(self)
		local res = stack:native_is_known()
		return true, "Success, native_is_known() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_is_known", {
	description = "Tests lua vs native API for is_known()",
	func = function(self)
		local lua = stack:is_known()
		local native = stack:native_is_known()
		if lua == native then
			return true, "(Success) [Item] is_known()"
		else
			return false, "(Fail) [Item] is_known()"
		end
	end
})
-- come back
-- get_definition()
minetest.register_chatcommand("lua_item_get_definition", {
	description = "Invokes lua_api > l_item.l_get_definition",
	func = function(self)
		local res = stack:get_definition()
		return true, "Success, get_definition() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_get_definition", {
	description = "Invokes lua_api > l_item.l_native_get_definition",
	func = function(self)
		local res = stack:native_get_definition()
		return true, "Success, native_get_definition() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_get_definition", {
	description = "Tests lua vs native API for get_definition()",
	func = function(self)
		local lua = stack:get_definition()
		local native = stack:native_get_definition()
		if lua == native then
			return true, "(Success) [Item] get_definition()"
		else
			return false, "(Fail) [Item] definition()"
		end
	end
})

-- get_tool_capabilities()
minetest.register_chatcommand("lua_item_get_tool_capabilities", {
	description = "Invokes lua_api > l_item.l_get_tool_capabilities",
	func = function(self)
		local pickaxe = ItemStack("default:pick_wood 1 21323")
		local res = pickaxe:get_tool_capabilities()
		return true, "Success, get_tool_capabilities() returned: "..tostring(res)
	end
})
-- broken
minetest.register_chatcommand("native_item_get_tool_capabilities", {
	description = "Invokes lua_api > l_item.l_native_get_tool_capabilities",
	func = function(self)
		local pickaxe = ItemStack("default:pick_wood 1 21323")
		local res = pickaxe:native_get_tool_capabilities()
		return true, "Success, native_get_tool_capabilities() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_get_tool_capabilities", {
	description = "Tests lua vs native API for get_tool_capabilities()",
	func = function(self)
		local pickaxe = ItemStack("default:pick_wood 1 21323")
		local lua = pickaxe:get_tool_capabilities()
		local native = pickaxe:native_get_tool_capabilities()
		if lua == native then
			return true, "(Success) [Item] get_tool_capabilities()"
		else
			return false, "(Fail) [Item] get_tool_capabilities()"
		end
	end
})

-- add_wear()
minetest.register_chatcommand("lua_item_add_wear", {
	description = "Invokes lua_api > l_item.l_add_wear",
	func = function(self)
		local res = stack:add_wear(20)
		return true, "Success, add_wear() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_add_wear", {
	description = "Invokes lua_api > l_item.l_native_add_wear",
	func = function(self)
		local res = stack:native_add_wear(20)
		return true, "Success, native_add_wear() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_add_wear", {
	description = "Tests lua vs native API for add_wear()",
	func = function(self)
		local lua = stack:add_wear(20)
		local native = stack:native_add_wear(20)
		if lua == native then
			return true, "(Success) [Item] add_wear()"
		else
			return false, "(Fail) [Item] add_wear()"
		end
	end
})

-- add_wear_by_uses() is not supported in CPP API

-- add_item()
minetest.register_chatcommand("lua_item_add_item", {
	description = "Invokes lua_api > l_item.l_add_item",
	func = function(self)
		stack2 = ItemStack("default:stone 99")
		local res = stack:add_item(stack2)
		return true, "Success, add_item() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_add_item", {
	description = "Invokes lua_api > l_item.l_native_add_item",
	func = function(self)
		stack2 = ItemStack("default:stone 99")
		local res = stack:native_add_item(stack2)
		return true, "Success, native_add_item() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_add_item", {
	description = "Tests lua vs native API for add_item()",
	func = function(self)
		stack2 = ItemStack("default:stone 99")
		local lua = stack:add_item(stack2)
		local native = stack:native_add_item(stack2)
		if lua == native then
			return true, "(Success) [Item] add_item()"
		else
			return false, "(Fail) [Item] add_item()"
		end
	end
})

-- item_fits()
minetest.register_chatcommand("lua_item_item_fits", {
	description = "Invokes lua_api > l_item.l_item_fits",
	func = function(self)
		stack2 = ItemStack("default:stone 99")
		local res = stack:item_fits(stack2)
		return true, "Success, item_fits() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_item_fits", {
	description = "Invokes lua_api > l_item.l_native_item_fits",
	func = function(self)
		stack2 = ItemStack("default:stone 99")
		local res = stack:native_item_fits(stack2)
		return true, "Success, native_item_fits() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_item_fits", {
	description = "Tests lua vs native API for item_fits()",
	func = function(self)
		stack2 = ItemStack("default:stone 99")
		local lua = stack:item_fits(stack2)
		local native = stack:native_item_fits(stack2)
		if lua == native then
			return true, "(Success) [Item] item_fits()"
		else
			return false, "(Fail) [Item] item_fits()"
		end
	end
})

-- take_item()
minetest.register_chatcommand("lua_item_take_item", {
	description = "Invokes lua_api > l_item.l_take_item",
	func = function(self)
		local res = stack:take_item(20)
		return true, "Success, take_item() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_take_item", {
	description = "Invokes lua_api > l_item.l_native_take_item",
	func = function(self)
		local res = stack:native_take_item(20)
		return true, "Success, native_take_item() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_take_item", {
	description = "Tests lua vs native API for take_item()",
	func = function(self)
		local lua = stack:take_item(20)
		local native = stack:native_take_item(20)
		if lua == native then
			return true, "(Success) [Item] take_item()"
		else
			return false, "(Fail) [Item] take_item()"
		end
	end
})

-- peek_item()
minetest.register_chatcommand("lua_item_peek_item", {
	description = "Invokes lua_api > l_item.l_peek_item",
	func = function(self)
		local res = stack:peek_item(20)
		return true, "Success, peek_item() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_item_peek_item", {
	description = "Invokes lua_api > l_item.l_native_peek_item",
	func = function(self)
		local res = stack:native_peek_item(20)
		return true, "Success, native_peek_item() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_item_peek_item", {
	description = "Tests lua vs native API for peek_item()",
	func = function(self)
		local lua = stack:peek_item(20)
		local native = stack:native_peek_item(20)
		if lua == native then
			return true, "(Success) [Item] peek_item()"
		else
			return false, "(Fail) [Item] peek_item()"
		end
	end
})

-- equals() is not supported

--command to test entire class
minetest.register_chatcommand("test_item", {
	description = "testing all item methods",
	func = function()

		local methods = {
			"is_empty",
			"get_name",
			"set_name",
			"get_count",
			"set_count",
			"get_wear",
			"set_wear",
			"get_meta",
			"set_meta",
			"get_metadata",
			"set_metadata",
			"get_description",
			"set_description",
			"get_short_description",
			"set_short_description",
			"clear",
			"replace",
			"to_string",
			"to_table",
			"get_stack_max",
			"get_free_space",
			"is_known",
			"get_definition",
			"get_tool_capabilities",
			"add_wear",
			"add_item",
			"item_fits",
			"take_item",
			"peek_item"
		}

		return native_tests.test_class("item", methods), 
		"Item tests completed."
	end
})
--is_empty()
minetest.register_chatcommand("lua_isempty", {
	description = "Invokes lua_api > l_inventory.l_is_empty()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:is_empty("main");
		if res then
			return true, "Success, is_empty() returned: true"
		else
			return true, "Success, is_empty() returned: false"
		end
	end
})

minetest.register_chatcommand("native_isempty", {
	description = "Invokes lua_api > l_inventory.l_native_is_empty()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:native_is_empty("main");
		if res then
			return true, "Success, native_is_empty() returned: true"
		else
			return true, "Success, native_is_empty() returned: false"
		end
	end
})

minetest.register_chatcommand("test_isempty", {
	description = "Compares output of lua and native command for is_empty()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local lres = inv:is_empty("main")
		local nres = inv:native_is_empty("main")
		if lres then
			print("l_is_empty() returned true")
		else
			print("l_is_empty() returned false")
		end
		if nres then
			print("native_is_empty() returned true")
		else
			print("native_is_empty() returned false")
		end
		if lres == nres then
			return true, "Success, function output matches - check console for more details"
		else
			return false, "Failure, function output does not match - check console for more details"
		end
	end
})

--get_size()
minetest.register_chatcommand("lua_getsize", {
	description = "Invokes lua_api > l_inventory.l_get_size()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:get_size("main");
		return true, "Success, get_size() returned: "..res
	end
})

minetest.register_chatcommand("native_getsize", {
	description = "Invokes lua_api > l_inventory.l_native_get_size()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:native_get_size("main");
		return true, "Success, native_get_size() returned: "..res
	end
})

minetest.register_chatcommand("test_getsize", {
	description = "Compares output of lua and native command for get_size()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local lres = inv:get_size("main")
		local nres = inv:native_get_size("main")
		print("l_get_size() returned: "..lres)
		print("native_get_size() returned: "..nres)
		if lres == nres then
			return true, "Success, function output matches - check console for more details"
		else
			return false, "Failure, function output does not match - check console for more details"
		end
	end
})

--set_size()
minetest.register_chatcommand("lua_setsize", {
	description = "Invokes lua_api > l_inventory.l_set_size()",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:set_size("main", param);
		if res then
			return true, "Success, set_size() returned: true"
		else
			return true, "Success, set_size() returned: false"
		end
	end
})

minetest.register_chatcommand("native_setsize", {
	description = "Invokes lua_api > l_inventory.l_native_set_size()",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:native_set_size("main", param);
		if res then
			return true, "Success, native_set_size() returned: true"
		else
			return true, "Success, native_set_size() returned: false"
		end
	end
})

minetest.register_chatcommand("test_setsize", {
	description = "Compares output of lua and native command for set_size()",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		inv:set_size("main", param)
		lres = inv:get_size("main")
		inv:native_set_size("main", param)
		nres = inv:get_size("main")
		print("l_set_size() set inventory to size: "..lres)
		print("native_set_size() set inventory to sizef: "..nres)
		if lres == nres then
			return true, "Success, function output matches - check console for more details"
		else
			return false, "Failure, function output does not match - check console for more details"
		end
	end
})

--get_width()
minetest.register_chatcommand("lua_getwidth", {
	description = "Invokes lua_api > l_inventory.l_get_width()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:get_width("main");
		return true, "Success, get_width() returned: "..res
	end
})

minetest.register_chatcommand("native_getwidth", {
	description = "Invokes lua_api > l_inventory.l_native_get_width()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:native_get_width("main");
		return true, "Success, native_get_width() returned: "..res
	end
})

minetest.register_chatcommand("test_getwidth", {
	description = "Compares output of lua and native command for get_width()",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local lres = inv:get_width("main")
		local nres = inv:native_get_width("main")
		print("l_get_width() returned: "..lres)
		print("native_get_width() returned: "..nres)
		if lres == nres then
			return true, "Success, function output matches - check console for more details"
		else
			return false, "Failure, function output does not match - check console for more details"
		end
	end
})

--set_width()
minetest.register_chatcommand("lua_setwidth", {
	description = "Invokes lua_api > l_inventory.l_set_width()",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:set_width("main", param);
		if res then
			return true, "Success, set_width() returned: true"
		else
			return true, "Success, set_width() returned: false"
		end
	end
})

--get_stack()
--TODO: Find way to display info about item stack
minetest.register_chatcommand("lua_getstack", {
	description = "Invokes lua_api > l_inventory.l_get_stack()",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		local inv = player:get_inventory()
		local res = inv:get_stack("main", param);
		return true, "Success, get_stack() returned: "..res.name
	end
})

minetest.register_chatcommand("test_inventory", {
	description = "testing all inventory methods",
	func = function()

		local methods = {
			"isempty",
			"getsize",
			"setsize"
		}

		return native_tests.test_class("inventory", methods), 
		"Inventory tests complete. See server_dump.txt for details."
	end
})
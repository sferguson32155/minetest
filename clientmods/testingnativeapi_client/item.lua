-- get_name()
minetest.register_chatcommand("lua_item_get_name", {
	description = "Invokes lua_api > l_item.l_get_name",
	func = function(self)
		local res = minetest.item:get_name();
		return true, "Success, get_name() returned: "..res
	end
})
local testPos = {}
testPos.x = tonumber(16)
testPos.y = tonumber(16)
testPos.z = tonumber(16)

local testPos2 = {}
testPos2.x = tonumber(32)
testPos2.y = tonumber(32)
testPos2.z = tonumber(32)

-- show() shows the minimap
minetest.register_chatcommand("lua_minimap_show", {
	description = "Invokes lua_api > l_minimap.l_minimap_show",
	func = function(self)
		local res = minetest.ui.minimap:show()
		return true, "Success, show() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_show", {
	description = "l_minimap.l_minimap_show > native_minimap.native_minimap_show",
	func = function(self)
		local res = minetest.ui.minimap:native_show()
		return true, "Success, native_show() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_show", {
	description = "Asserts lua api and native api behaviors for l_minimap.show",
	func = function(self)
        local lua = minetest.ui.minimap:show()
		minetest.ui.minimap:hide()
		local native = minetest.ui.minimap:native_show()

		if lua == native then
			return true, "(Success) [Minimap] show()"
		else
			return false, "(Fail) [Minimap] show()"
		end
	end
})

-- hide() hides the minimap
minetest.register_chatcommand("lua_minimap_hide", {
	description = "Invokes lua_api > l_minimap.l_minimap_hide",
	func = function(self)
		local res = minetest.ui.minimap:hide()
		return true, "Success, hide() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_hide", {
	description = "l_minimap.l_minimap_hide > native_minimap.native_minimap_hide",
	func = function(self)
		minetest.ui.minimap:show()
		local res = minetest.ui.minimap:native_hide()
		return true, "Success, native_hide() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_hide", {
	description = "Asserts lua api and native api behaviors for l_minimap.hide",
	func = function(self)

        minetest.ui.minimap:show()
		local lua = minetest.ui.minimap:hide()
		minetest.ui.minimap:show()
		local native = minetest.ui.minimap:native_hide()


		if lua == native then
			return true, "(Success) [Minimap] hide)"
		else
			return false, "(Fail) [Minimap] hide()"
		end
	end
})

--get_pos() get position of minimap

minetest.register_chatcommand("lua_minimap_getpos", {
	description = "Invokes lua_api > l_minimap.l_minimap_get_pos",
	func = function(self)
		local res = minetest.ui.minimap:get_pos()
		return true, "Success, get_pos() returned: "..dump(res)
	end
})

minetest.register_chatcommand("native_minimap_getpos", {
	description = "l_minimap.l_minimap_get_pos > native_minimap.native_minimap_get_pos",
	func = function(self)
		local res = minetest.ui.minimap:native_get_pos()
		return true, "Success, native_get_pos() returned: "..dump(res)
	end
})

minetest.register_chatcommand("test_minimap_getpos", {
	description = "Asserts lua api and native api behaviors for l_minimap.get_pos",
	func = function(self)
		local lua = minetest.ui.minimap:get_pos()
		local native = minetest.ui.minimap:native_get_pos()

		if dump(lua) == dump(native) then
			return true, "(Success) [Minimap] get_pos()"
		else
			return false, "(Fail) [Minimap] get_pos()"
		end
	end
})


--set_pos() sets the minimap position on screen
minetest.register_chatcommand("lua_minimap_setpos", {
	description = "Invokes lua_api > l_minimap.l_minimap_set_pos",
	func = function(self)
		local res = minetest.ui.minimap:set_pos(testPos)
		return true, "Success, set_pos() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_setpos", {
	description = "l_minimap.l_minimap_set_pos > native_minimap.native_minimap_set_pos",
	func = function(self)
		local res = minetest.ui.minimap:native_set_pos(testPos2)
		return true, "Success, native_set_pos() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_setpos", {
	description = "Asserts lua api and native api behaviors for l_minimap.set_pos",
	func = function(self)
		local lua = minetest.ui.minimap:set_pos(testPos2)
		local native = minetest.ui.minimap:native_set_pos(testPos2)
		if lua == native then
			return true, "(Success) [Minimap] set_pos()"
		else
			return false, "(Fail) [Minimap] set_pos()"
		end
	end
})


--get_angle() returns the current minimap angle in degrees
minetest.register_chatcommand("lua_minimap_getangle", {
	description = "Invokes lua_api > l_minimap.l_minimap_get_angle",
	func = function(self)
		local res = minetest.ui.minimap:get_angle()
		return true, "Success, get_angle() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_getangle", {
	description = "l_minimap.l_minimap_get_angle > native_minimap.native_minimap_get_angle",
	func = function(self)
		local res = minetest.ui.minimap:native_get_angle()
		return true, "Success, native_get_angle() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_getangle", {
	description = "Asserts lua api and native api behaviors for l_minimap.get_angle",
	func = function(self)
		local lua =  minetest.ui.minimap:get_angle()
		local native = minetest.ui.minimap:native_get_angle()
		if lua == native then
			return true, "(Success) [Minimap] get_angle()"
		else
			return false, "(Fail) [Minimap] get_angle()"
		end
	end
})

--set_angle() sets the minimap angle in degrees
minetest.register_chatcommand("lua_minimap_setangle", {
	description = "Invokes lua_api > l_minimap.l_minimap_set_angle",
	func = function(self)
		local res = minetest.ui.minimap:set_angle(180)
		return true, "Success, set_angle() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_setangle", {
	description = "l_minimap.l_minimap_set_angle > native_minimap.native_minimap_set_angle",
	func = function(self)
		local res = minetest.ui.minimap:native_set_angle(180)
		return true, "Success, native_set_angle() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_setangle", {
	description = "Asserts lua api and native api behaviors for l_minimap.set_angle",
	func = function(self)
		local lua = minetest.ui.minimap:set_angle(180)
		local native = minetest.ui.minimap:native_set_angle(180)
		if lua == native then
			return true, "(Success) [Minimap] set_angle()"
		else
			return false, "(Fail) [Minimap] set_angle()"
		end
	end
})

--get_mode() returns the current minimap mode
minetest.register_chatcommand("lua_minimap_getmode", {
	description = "Invokes lua_api > l_minimap.l_minimap_get_mode",
	func = function(self)
		local res = minetest.ui.minimap:get_mode()
		return true, "Success, get_mode() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_getmode", {
	description = "l_minimap.l_minimap_get_mode > native_minimap.native_minimap_get_mode",
	func = function(self)
		local res = minetest.ui.minimap:native_get_mode()
		return true, "Success, native_get_mode() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_getmode", {
	description = "Asserts lua api and native api behaviors for l_minimap.get_mode",
	func = function(self)
		local lua = minetest.ui.minimap:get_mode()
		local native = minetest.ui.minimap:native_get_mode()
		if lua == native then
			return true, "(Success) [Minimap] get_mode()"
		else
			return false, "(Fail) [Minimap] get_mode()"
		end
	end
})


--set_mode() sets the minimap mode (0 to 6)
minetest.register_chatcommand("lua_minimap_setmode", {
	description = "Invokes lua_api > l_minimap.l_minimap_set_mode",
	func = function(self)
		local res = minetest.ui.minimap:set_mode(2)
		return true, "Success, set_mode() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_setmode", {
	description = "l_minimap.l_minimap_set_mode > native_minimap.native_minimap_set_mode",
	func = function(self)
		local res = minetest.ui.minimap:native_set_mode(3)
		return true, "Success, native_set_mode() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_setmode", {
	description = "Asserts lua api and native api behaviors for l_minimap.set_mode",
	func = function(self)
		local lua = minetest.ui.minimap:set_mode(4)
		local native = minetest.ui.minimap:set_mode(4)
		if lua == native then
			return true, "(Success) [Minimap] set_mode()"
		else
			return false, "(Fail) [Minimap] set_mode()"
		end
	end
})

--get_shape()  Gets the minimap shape. (0 = square, 1 = round)
minetest.register_chatcommand("lua_minimap_getshape", {
	description = "Invokes lua_api > l_minimap.l_minimap_get_shape",
	func = function(self)
		local res = minetest.ui.minimap:get_shape()
		return true, "Success, get_shape() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_getshape", {
	description = "l_minimap.l_minimap_get_shape > native_minimap.native_minimap_get_shape",
	func = function(self)
		local res = minetest.ui.minimap:native_get_shape()
		return true, "Success, native_get_shape() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_getshape", {
	description = "Asserts lua api and native api behaviors for l_minimap.get_shape",
	func = function(self)
		local lua = minetest.ui.minimap:get_shape()
		local native = minetest.ui.minimap:native_get_shape()
		if lua == native then
			return true, "(Success) [Minimap] get_shape()"
		else
			return false, "(Fail) [Minimap] get_shape()"
		end
	end
})

--set_shape() Sets the minimap shape. (0 = square, 1 = round)
minetest.register_chatcommand("lua_minimap_setshape", {
	description = "Invokes lua_api > l_minimap.l_minimap_set_shape",
	func = function(self)
		local res = minetest.ui.minimap:set_shape(0)
		return true, "Success, set_shape() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("native_minimap_setshape", {
	description = "l_minimap.l_minimap_set_shape > native_minimap.native_minimap_set_shape",
	func = function(self)
		local res = minetest.ui.minimap:native_set_shape(0)
		return true, "Success, native_set_shape() returned: "..tostring(res)
	end
})

minetest.register_chatcommand("test_minimap_setshape", {
	description = "Asserts lua api and native api behaviors for l_minimap.set_shape",
	func = function(self)
		local lua = minetest.ui.minimap:set_shape(1)
		local native = minetest.ui.minimap:native_set_shape(1)
		if lua == native then
			return true, "(Success) [Minimap] set_shape()"
		else
			return false, "(Fail) [Minimap] set_shape()"
		end
	end
})


minetest.register_chatcommand("test_minimap", {
	description = "testing all minimap methods",
	func = function()

		local methods = {
			"show",
			"hide",
			"getpos",
			"setpos",
			"getangle",
			"setangle",
			"getmode",
			"setmode",
			"getshape",
			"setshape"
		}

		return native_tests.test_class("minimap", methods), 
		"Minimap tests completed. See console for details."
	end
})
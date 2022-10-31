-- get_camera()
minetest.register_chatcommand("lua_camera_getcamera", {
	description = "Invokes lua_api > l_camera.l_get_camera_mode",
	func = function(self)
		local res = minetest.camera:get_camera_mode()
		return true, "Success, get_camera_mode() returned: "..res
	end
})

minetest.register_chatcommand("native_camera_getcamera", {
	description = "Invokes lua_api > l_camera.l_native_get_camera_mode > native_camera.native_get_camera_mode",
	func = function(self)
		local res = minetest.camera:native_get_camera_mode()
		return true, "Success, native_get_camera_mode() returned: "..res
	end
})

minetest.register_chatcommand("test_camera_getcamera", {
	description = "Asserts lua api and native api behaviors for l_camera.get_camera",
	func = function(self)
		local lua = minetest.camera:get_camera_mode()
		local native = minetest.camera:native_get_camera_mode()
		if lua == native then
			return true, "(Success) [Camera] get_camera_mode()"
		else
			return false, "(Fail) [Camera] get_camera_mode()"
		end
	end
})

-- set_camera()
minetest.register_chatcommand("lua_camera_setcamera", {
	description = "Invokes lua_api > l_camera.l_set_camera_mode",
	func = function(self)
		local curr = minetest.camera:get_camera_mode()
		local res
		
		-- Calculate which camera mode to change to and switch, and return result
		if curr == 0 then
			minetest.camera:set_camera_mode(1)
			return true, "Done, set_camera_mode(1) called. We do not expect a return result as it is a SET command. Please confirm the camera perspective changed."
		else
			minetest.camera:set_camera_mode(0)
			return true, "Done, set_camera_mode(0) called. We do not expect a return result as it is a SET command. Please confirm the camera perspective changed."
		end
	end
})

minetest.register_chatcommand("native_camera_setcamera", {
	description = "Invokes lua_api > l_camera.l_native_set_camera_mode > native_camera.native_set_camera_mode",
	func = function(self)
		local curr = minetest.camera:get_camera_mode()
		local res
		
		-- Calculate which camera mode to change to and switch, and return result
		if curr == 0 then
			minetest.camera:native_set_camera_mode(1)
			return true, "Done, native_set_camera_mode(1) called. We do not expect a return result as it is a SET command. Please confirm the camera perspective changed."
		else
			minetest.camera:native_set_camera_mode(0)
			return true, "Done, native_set_camera_mode(0) called. We do not expect a return result as it is a SET command. Please confirm the camera perspective changed."
		end
	end
})

minetest.register_chatcommand("test_camera_setcamera", {
	description = "Asserts lua api and native api behaviors for l_camera.set_camera",
	func = function(self)
		local curr = minetest.camera:get_camera_mode()
		
		-- Calculate which camera mode to change to and switch, and return result
		local res1;
		local res2;
		local first;
		local second;
		if curr == 0 then
			first = 1
			second = 0
		else
			first = 0
			second = 1
		end

		-- Test lua
		minetest.camera:set_camera_mode(first)
		res1 = minetest.camera:get_camera_mode()

		-- Test native
		minetest.camera:native_set_camera_mode(second)
		res2 = minetest.camera:get_camera_mode()

		-- Return result
		if res1 == 1 and res2 == 0 then
			return true, "(Success) [Camera] set_camera_mode()"
		else
			return false, "(Fail) [Camera] set_camera_mode()"
		end
	end
})

-- get_fov()
minetest.register_chatcommand("lua_camera_getfov", {
	description = "Invokes lua_api > l_camera.l_get_fov",
	func = function(self)
		local res = minetest.camera:get_fov()
		print("Success, get_fov() returned:")
		for key, value in pairs(res) do
    		print(key, value)
		end
		return true, ""
	end
})

minetest.register_chatcommand("native_camera_getfov", {
	description = "Invokes lua_api > l_camera.l_native_get_fov > native_fov.native_get_fov",
	func = function(self)
		local res = minetest.camera:native_get_fov()
		print("Success, get_fov() returned:")
		for key, value in pairs(res) do
    		print(key, value)
		end
		return true, ""
	end
})

minetest.register_chatcommand("test_camera_getfov", {
	description = "Asserts lua api and native api behaviors for l_camera.get_fov",
	func = function(self)
		local lua = minetest.camera:get_fov()
		local native = minetest.camera:native_get_fov()
		if lua == native then
			return true, "(Success) [camera] get_fov()"
		else
			return false, "(Fail) [camera] get_fov()"
		end
	end
})

-- get_pos()
minetest.register_chatcommand("lua_camera_getpos", {
	description = "Invokes lua_api > l_camera.l_get_pos",
	func = function(self)
		local res = minetest.camera:get_pos()
		print("Success, get_pos() returned:")
		for key, value in pairs(res) do
    		print(key, value)
		end
		return true, ""
	end
})

minetest.register_chatcommand("native_camera_getpos", {
	description = "Invokes lua_api > l_camera.l_native_get_pos > native_pos.native_get_pos",
	func = function(self)
		local res = minetest.camera:native_get_pos()
		print("Success, get_pos() returned:")
		for key, value in pairs(res) do
    		print(key, value)
		end
		return true, ""
	end
})

minetest.register_chatcommand("test_camera_getpos", {
	description = "Asserts lua api and native api behaviors for l_camera.get_pos",
	func = function(self)
		local lua = minetest.camera:get_pos()
		local native = minetest.camera:native_get_pos()
		if lua == native then
			return true, "(Success) [camera] get_pos()"
		else
			return false, "(Fail) [camera] get_pos()"
		end
	end
})

-- get_offset()
minetest.register_chatcommand("lua_camera_getoffset", {
	description = "Invokes lua_api > l_camera.l_get_offset",
	func = function(self)
		local res = minetest.camera:get_offset()
		print("Success, get_offset() returned:")
		for key, value in pairs(res) do
    		print(key, value)
		end
		return true, ""
	end
})

minetest.register_chatcommand("native_camera_getoffset", {
	description = "Invokes lua_api > l_camera.l_native_get_offset > native_offset.native_get_offset",
	func = function(self)
		local res = minetest.camera:native_get_offset()
		print("Success, get_offset() returned:")
		for key, value in pairs(res) do
    		print(key, value)
		end
		return true, ""
	end
})

minetest.register_chatcommand("test_camera_getoffset", {
	description = "Asserts lua api and native api behaviors for l_camera.get_offset",
	func = function(self)
		local lua = minetest.camera:get_offset()
		local native = minetest.camera:native_get_offset()
		if lua == native then
			return true, "(Success) [camera] get_offset()"
		else
			return false, "(Fail) [camera] get_offset()"
		end
	end
})

-- get_look_dir()
minetest.register_chatcommand("lua_camera_getlookdir", {
	description = "Invokes lua_api > l_camera.l_get_look_dir",
	func = function(self)
		local res = minetest.camera:get_look_dir()
		print("Success, get_look_dir() returned:")
		for key, value in pairs(res) do
    		print(key, value)
		end
		return true, ""
	end
})

minetest.register_chatcommand("native_camera_getlookdir", {
	description = "Invokes lua_api > l_camera.l_native_get_look_dir > native_look_dir.native_get_look_dir",
	func = function(self)
		local res = minetest.camera:native_get_look_dir()
		print("Success, native_get_look_dir() returned:")
		for key, value in pairs(res) do
    		print(key, value)
		end
		return true, ""
	end
})

minetest.register_chatcommand("test_camera_getlookdir", {
	description = "Asserts lua api and native api behaviors for l_camera.get_look_dir",
	func = function(self)
		local lua = minetest.camera:get_look_dir()
		local native = minetest.camera:native_get_look_dir()
		if lua == native then
			return true, "(Success) [camera] get_look_dir()"
		else
			return false, "(Fail) [camera] get_look_dir()"
		end
	end
})

-- get_look_horizontal()
minetest.register_chatcommand("lua_camera_getlookhorizontal", {
	description = "Invokes lua_api > l_camera.l_get_look_horizontal",
	func = function(self)
		local res = minetest.camera:get_look_horizontal()
		return true, "Success, get_look_horizontal() returned: "..res
	end
})

minetest.register_chatcommand("native_camera_getlookhorizontal", {
	description = "Invokes lua_api > l_camera.l_native_get_look_horizontal > native_look_horizontal.native_get_look_horizontal",
	func = function(self)
		local res = minetest.camera:native_get_look_horizontal()
		return true, "Success, native_get_look_horizontal() returned: "..res
	end
})

minetest.register_chatcommand("test_camera_getlookhorizontal", {
	description = "Asserts lua api and native api behaviors for l_camera.get_look_horizontal",
	func = function(self)
		local lua = minetest.camera:get_look_horizontal()
		local native = minetest.camera:native_get_look_horizontal()
		if lua == native then
			return true, "(Success) [camera] get_look_horizontal()"
		else
			return false, "(Fail) [camera] get_look_horizontal()"
		end
	end
})

-- get_look_vertical()
minetest.register_chatcommand("lua_camera_getlookvertical", {
	description = "Invokes lua_api > l_camera.l_get_look_vertical",
	func = function(self)
		local res = minetest.camera:get_look_vertical()
		return true, "Success, get_look_vertical() returned: "..res
	end
})

minetest.register_chatcommand("native_camera_getlookvertical", {
	description = "Invokes lua_api > l_camera.l_native_get_look_vertical > native_look_vertical.native_get_look_vertical",
	func = function(self)
		local res = minetest.camera:native_get_look_vertical()
		return true, "Success, native_get_look_vertical() returned: "..res
	end
})

minetest.register_chatcommand("test_camera_getlookvertical", {
	description = "Asserts lua api and native api behaviors for l_camera.get_look_vertical",
	func = function(self)
		local lua = minetest.camera:get_look_vertical()
		local native = minetest.camera:native_get_look_vertical()
		if lua == native then
			return true, "(Success) [camera] get_look_vertical()"
		else
			return false, "(Fail) [camera] get_look_vertical()"
		end
	end
})

-- get_aspect_ratio()
minetest.register_chatcommand("lua_camera_getaspectratio", {
	description = "Invokes lua_api > l_camera.l_get_aspect_ratio",
	func = function(self)
		local res = minetest.camera:get_aspect_ratio()
		return true, "Success, get_aspect_ratio() returned: "..res
	end
})

minetest.register_chatcommand("native_camera_getaspectratio", {
	description = "Invokes lua_api > l_camera.l_native_get_aspect_ratio > native_aspect_ratio.native_get_aspect_ratio",
	func = function(self)
		local res = minetest.camera:native_get_aspect_ratio()
		return true, "Success, native_get_aspect_ratio() returned: "..res
	end
})

minetest.register_chatcommand("test_camera_getaspectratio", {
	description = "Asserts lua api and native api behaviors for l_camera.get_aspect_ratio",
	func = function(self)
		local lua = minetest.camera:get_aspect_ratio()
		local native = minetest.camera:native_get_aspect_ratio()
		if lua == native then
			return true, "(Success) [camera] get_aspect_ratio()"
		else
			return false, "(Fail) [camera] get_aspect_ratio()"
		end
	end
})
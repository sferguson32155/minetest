-- get_camera()
minetest.register_chatcommand("lua_camera_getcamera", {
	description = "Invokes lua_api > l_camera.l_get_camera_mode",
	func = function(self)
		local res = minetest.camera:get_camera_mode()
		return true, "Success, get_camera_mode() returned: "..res
	end
})

minetest.register_chatcommand("native_camera_getcamera", {
	description = "Invokes lua_api > l_camera.l_get_camera_mode > native_camera.native_get_camera_mode",
	func = function(self)
		local res = minetest.camera:native_get_camera_mode()
		return true, "Success, native_get_camera_mode() returned: "..res
	end
})

minetest.register_chatcommand("test_camera_getcamera", {
	description = "Invokes lua_api > l_camera.l_get_camera_mode > native_camera.native_get_camera_mode",
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

-- set_camera(int)
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
	description = "Invokes lua_api > l_camera.l_set_camera_mode > native_camera.native_set_camera_mode",
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
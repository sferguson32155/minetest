minetest.register_chatcommand("getcamera", {
	description = "Invokes lua_api > l_camera.l_get_camera_mode > native_camera.native_get_camera_mode",
	func = function(self)
		local res = minetest.camera:get_camera_mode()
		return true, "Success, get_camera_mode() returned: "..res
	end
})

minetest.register_chatcommand("setcamera", {
	description = "Invokes lua_api > l_camera.l_set_camera_mode > native_camera.native_set_camera_mode",
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

minetest.register_chatcommand("nativegetcamera", {
	description = "Invokes lua_api > l_camera.l_get_camera_mode > native_camera.native_get_camera_mode",
	func = function(self)
		local res = minetest.camera:native_get_camera_mode()
		return true, "Success, native_get_camera_mode() returned: "..res
	end
})

minetest.register_chatcommand("resettime", {
	description = "",
	func = function()
		minetest.set_timeofday(0)
		return true, "Set time of day to 0"
	end
})
minetest.register_chatcommand("log", {
	description = "testing get_player_by_name and object:get_look_dir",
	func = function(name)
		local player = minetest.get_player_by_name(name)
		local msg
		if player then
			local dir = player:get_look_dir()
			print("-------------------------------------GLOBAL TABLE-------------------------------------")
			for key, value in pairs(_G) do
    				print(key, value)
			end
			print("------------------------------------MINETEST TABLE-----------------------------------")
			for key, value in pairs(_G["minetest"]) do
    				print(key, value)
			end
			return true, "Successfully logged to console"
		else
			msg = "Could not find player with name " .. name
			return false, msg
		end
	end
})
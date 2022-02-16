minetest.register_chatcommand("camera", {
	description = "Invokes lua_api > l_camera.l_set_camera_mode > native_camera.native_set_camera_mode",
	func = function()
		local cam = minetest.camera
		if cam then
			local res = cam:set_camera_mode(1)
			if res == 0 then
				return true, "Success"
			else
				return false, "Fail"
			end
		else
			return false, "Did not find cam"
		end
	end
})
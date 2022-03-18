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

minetest.register_chatcommand("TEST", {
	description = "",
	func = function(self)
		local clientObjects = {
			[1] = minetest.raycast,
			[2] = minetest.localplayer,
			[3] = minetest.camera
		}
		
		for i, obj in ipairs(clientObjects) do
			if obj ~= nil then
				return true, i..": Success"
			else
				return false, i..": Fail"
			end
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

-- add_particlespawner()
minetest.register_chatcommand("debug_particles_addparticlespawner", {
	params = "<x> <y> <z>",--"[<optional>]",
	description = "Invokes lua_api > l_particles.l_add_particlespawner",
	func = function(param)
		if param == nil then
			return false, "Fail, the input parameters were invalid. Format: ./debug_particles_addparticlespawner <x> <y> <z>"
		end
	
		local p = {}
		p.x, p.y, p.z = string.match(param, "^([%d.-]+)[ ] *([%d.-]+)[ ] *([%d.-]+)$")
		p.x = tonumber(p.x)
		p.y = tonumber(p.y)
		p.z = tonumber(p.z)
		if p.x and p.y and p.z then
			-- spawn particles at (x,y,z)
			res = minetest.add_particlespawner({ amount = 1000, time = 100, minpos = p,
					maxpos = p, minvel = {x=0, y=0, z=0}, maxvel = {x=3, y=3, z=3},
					minacc = {x=0, y=0, z=0}, maxacc = {x=1, y=1, z=1}, minexptime = 1, maxexptime = 3, minsize = 1, maxsize = 5,
					collisiondetection = false, vertical = false, texture = "default_wood.png"})
				
			-- handle result
			if res ~= -1 then
				return true, "Success, add_particlespawner() at (".. p.x .. ",".. p.y.. "," .. p.z ..") returned: "..res
			else
				return false, "Fail, add_particlespawner() at (".. p.x .. ",".. p.y .. "," .. p.z ..") returned: "..res
			end
		else
			return false, "Fail, the input parameters were invalid. Format: ./debug_particles_addparticlespawner <x> <y> <z>"
		end
		
		--[[
	    local p1, res
		-- spawn particles at player location
		--if optional == "here" then
			-- get player
			local player = minetest.get_player_by_name(player_name)
			if player == nil then
				return false, "Fail, unable to get player " .. player_name .. "position"
			end
			
			-- get player coordinates
			local p1 = player:get_pos()
			
			-- spawn paricles
			res = minetest.add_particlespawner({ amount = 10, time = 10, minpos = p1,
				maxpos = p2, minvel = {x=0, y=0, z=0}, maxvel = {x=0, y=0, z=0},
				minacc = {x=0, y=0, z=0}, maxacc = {x=0, y=0, z=0}, minexptime = 1, maxexptime = 1, minsize = 1, maxsize = 1,
				collisiondetection = false, vertical = false, texture = "default_wood.png" })
			
			-- handle result
			if res ~= -1 then
				return true, "Success, add_particlespawner() at <".. p1.x .. ",".. p1.y.. "," .. p1.z .."> returned: "..res
			else
				return false, "Fail, add_particlespawner() at <".. p1.x .. ",".. p1.y .. "," .. p1.z .."> returned: "..res
			end
		-- spawn particles at 0,0,0
		else
			-- spawn particles
			res = minetest.add_particlespawner({ amount = 10, time = 10, minpos = {x=0, y=0, z=0},
				maxpos = {x=0, y=0, z=0}, minvel = {x=0, y=0, z=0}, maxvel = {x=0, y=0, z=0},
				minacc = {x=0, y=0, z=0}, maxacc = {x=0, y=0, z=0}, minexptime = 1, maxexptime = 1, minsize = 1, maxsize = 1,
				collisiondetection = false, vertical = false, texture = "default_wood.png" })
			
			-- handle result
			if res ~= -1 then
				return true, "Success, add_particlespawner() at <0,0,0> returned: "..res
			else
				return false, "Fail, add_particlespawner() at <0,0,0> returned: "..res
			end
		end
		--]]
	end
})

-- Testing if client mod can access lua api functions from l_env, which is loaded on the common side
minetest.register_chatcommand("debug_env_spawntree", {
	params = "<x> <y> <z>",
	description = "Invokes lua_api > l_env.l_spawn_tree",
	func = function(param)
		if param == nil then
			return false, "Fail, the input parameters were invalid. Format: ./spawn_tree <x> <y> <z>"
		end
	
		local p = {}
		p.x, p.y, p.z = string.match(param, "^([%d.-]+)[ ] *([%d.-]+)[ ] *([%d.-]+)$")
		p.x = tonumber(p.x)
		p.y = tonumber(p.y)
		p.z = tonumber(p.z)
		if p.x and p.y and p.z then
			-- source: https://dev.minetest.net/minetest.spawn_tree
			local treedef = { axiom="FFFFFAFFBF", rules_a="[&&&FFFFF&&FFFF][&&&++++FFFFF&&FFFF][&&&----FFFFF&&FFFF]",
							rules_b="[&&&++FFFFF&&FFFF][&&&--FFFFF&&FFFF][&&&------FFFFF&&FFFF]", trunk="default:tree",
							leaves="default:leaves", angle=30, iterations=2, random_level=0, trunk_type="single",
							thin_branches=true, fruit_chance=10, fruit="default:apple" }
			minetest.spawn_tree(pos, treedef)
			return true, "Success, spawn_tree() at (".. p.x .. ",".. p.y.. "," .. p.z ..") returned: "..res
		else
			return false, "Fail, the input parameters were invalid. Format: ./spawn_tree <x> <y> <z>"
		end
	end
})

-- Random commands, used for better understanding how mods/chat commands work.
-- Can scrap later
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
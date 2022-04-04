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
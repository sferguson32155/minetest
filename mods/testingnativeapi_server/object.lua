-- Written By Sean Ferguson
minetest.log("object_test_obj")

minetest.register_chatcommand("lua_object", {
    description = "List all avaliable chat commands",
    func = function(name, param)
        if param == "" then
            minetest.log("Enter a page number - /lua_object #")
        end
        if param == "1" then
            minetest.log("lua_object_remove\n")
            minetest.log("lua_object_get_pos\n")
            minetest.log("lua_object_set_pos #\n")
            minetest.log("lua_object_move_to #\n")
            minetest.log("lua_object_punch - Not Working\n")
            minetest.log("lua_object_right_click\n")
            minetest.log("lua_object_set_hp\n")
            minetest.log("lua_object_get_hp\n")
            minetest.log("lua_object_get_inventory\n")
            minetest.log("lua_object_get_wield_list\n")
        end
        if param == "2" then
            minetest.log("lua_object_get_wield_index\n")
            minetest.log("lua_object_get_wielded_item\n")
            minetest.log("lua_object_set_wielded_item\n")
            minetest.log("lua_object_set_armor_groups - Not Working\n")
            minetest.log("lua_object_get_armor_groups\n")
            minetest.log("lua_object_set_animation - Not Working\n")
            minetest.log("lua_object_get_animation\n")
            minetest.log("lua_object_set_local_animation - Not Working\n")
            minetest.log("lua_object_get_local_animation\n")
            minetest.log("lua_object_get_eye_offset\n")
        end
        if param == "3" then
            minetest.log("lua_object_set_eye_offset #")
            minetest.log("lua_object_send_mapblock")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
        end
    end,
})

-- l_remove
minetest.register_chatcommand("lua_object_remove", {
    description = "Test Object Remove",
    func = function(name, param)
        minetest.log("lua_object_remove is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 8)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)

        for i, object in ipairs(saos) do
            if not object:is_player() then
                minetest.log("Removed: "..object:get_entity_name())
                local objectRemove = object:remove()
            end
        end
    end,
})


-- l_remove
minetest.register_chatcommand("native_object_remove", {
    description = "Test Object Remove",
    func = function(name, param)
        minetest.log("lua_object_remove is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 8)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)

        for i, object in ipairs(saos) do
            if not object:is_player() then
                minetest.log("Removed: "..object:get_entity_name())
                local objectRemove = object:native_remove()
            end
        end
    end,
})

-- l_get_pos
minetest.register_chatcommand("lua_object_get_pos", {
    description = "Test Object Get Pos",
    func = function(name, param)
        minetest.log("lua_object_get_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)
        
        -- Get the position of the first object in saos
        local firstSaosPos = saos[1]:get_pos()
        minetest.log("Position of first Reference Object: " .. minetest.pos_to_string(firstSaosPos))
    end,
})

-- native_get_pos
minetest.register_chatcommand("native_object_get_pos", {
    description = "Test Object Get Pos",
    func = function(name, param)
        minetest.log("native_object_get_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)
        
        -- Get the position of the first object in saos
        local firstSaosPos = saos[1]:get_pos()
        minetest.log("Position of first Reference Object: " .. minetest.pos_to_string(firstSaosPos))
    end,
})

-- l_set_pos
minetest.register_chatcommand("lua_object_set_pos", {
    description = "Test Object Set Pos - /lua_object_set_pos (Z_Value)",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                local v3f = {x = 100, y = 22, z = tonumber(param)}
                local player_pos = object:set_pos(v3f)
                minetest.log("Player " .. object:get_player_name() .. " is at position: " .. minetest.pos_to_string(v3f))
            end
        end
    end,
})  

-- native_set_pos
minetest.register_chatcommand("native_object_set_pos", {
    description = "Test Object Set Pos - /native_object_set_pos (Z_Value)",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                local v3f = {x = 100, y = 22, z = tonumber(param)}
                local player_pos = object:set_pos(v3f)
                minetest.log("Player " .. object:get_player_name() .. " is at position: " .. minetest.pos_to_string(v3f))
            end
        end
    end,
})

-- l_move_to
minetest.register_chatcommand("lua_object_move_to", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            local v3f = {x = 100, y = 22, z = tonumber(param)}
            local player_pos = object:move_to(v3f, false)
            minetest.log(#saos .. " objects moved to position: " .. minetest.pos_to_string(v3f))
        end
    end,
})

-- native_move_to
minetest.register_chatcommand("native_object_move_to", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            local v3f = {x = 100, y = 22, z = tonumber(param)}
            local player_pos = object:move_to(v3f, false)
            minetest.log(#saos .. " objects moved to position: " .. minetest.pos_to_string(v3f))
        end
    end,
})

-- l_punch
minetest.register_chatcommand("lua_object_punch", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                for i, floorobj in ipairs(saos) do
                    if not floorobj:isplayer() then
                        -- Wear all objects on floor
                        -- punch(self, puncher, time_from_last_punch, tool_capabilities, dir)
                        -- object:punch(floorobj, 5, )
                    end
                end
            end
        end
    end,
})

-- l_right_click
-- right_click(self, clicker)
minetest.register_chatcommand("lua_object_right_click", {
    description = "Test Object Right Click",
    func = function(name, param)
        minetest.log("lua_object_right_click is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        -- Insert Lua code here that if saos == 2 then set plyr = saos[0] and rclk = saos[1]
        if #saos == 2 then
            local plyr = saos[1]
            local rclk = saos[2]
            plyr:right_click(rclk)
            minetest.log("Object: "..plyr:get_player_name().." right clicked on ".. rclk:get_entity_name())
        end
    end,
})

--set_hp
minetest.register_chatcommand("lua_object_set_hp", {
    description = "Set the player's current HP - 0-20",
    func = function(name, param)
        minetest.log("lua_object_et_hp is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)
        for i, object in ipairs(saos) do
            local a = object:set_hp(tonumber(param), "set_hp")
            minetest.log("The object's HP was set to " ..param)
            minetest.log("The object's HP is currently " ..dump(a))
        end
    end,
})

--get_hp
-- get_hp(self)
minetest.register_chatcommand("lua_object_get_hp", {
    description = "Get the player's current HP",
    func = function(name, param)
        minetest.log("lua_object_get_hp is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)
        for i, object in ipairs(saos) do
            local a = object:get_hp()
            minetest.log("The object's HP is currently " ..dump(a))
        end
    end,
})

-- get_inventory(self)
minetest.register_chatcommand("lua_object_get_inventory", {
    description = "Check player's inventory and returns inventory functions",
    func = function(name, param)
        minetest.log("lua_object_get_inventory is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_inventory()
        minetest.log(dump(a:get_list("main")))
    end,
})

-- get_weild_list(self)
minetest.register_chatcommand("lua_object_get_wield_list", {
    description = "Get the player's current wield list",
    func = function(name, param)
        minetest.log("lua_object_get_weild_list is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_wield_list()
        minetest.log("The player's wield list is " ..dump(a))
    end,
})

-- get_weild_index(self)
minetest.register_chatcommand("lua_object_get_wield_index", {
    description = "Get the player's current wield index",
    func = function(name, param)
        minetest.log("lua_object_get_weild_index is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_wield_index()
        minetest.log("The player's wield list is " ..dump(a))
    end,
})

-- get_weilded_item(self)
minetest.register_chatcommand("lua_object_get_wielded_item", {
    description = "Get the player's current wielded item",
    func = function(name, param)
        minetest.log("lua_object_get_weilded_item is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_wielded_item()
        minetest.log("The player's wielded item is " ..dump(a))
        minetest.log("The player's wielded item is " ..dump(a:to_string()))
    end,
})

-- Look into
-- set_weilded_item(self)
minetest.register_chatcommand("lua_object_set_wielded_item", {
    description = "Set the player's current wielded item",
    func = function(name, param)
        minetest.log("lua_object_set_weilded_item is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        if tonumber(param) == 0 then
            local wieldeditem = nil
            local a = plyr:set_wielded_item(wieldeditem)
            minetest.log("The player's wielded item is " ..dump(a))
        elseif tonumber(param) == 1 then
            local wieldeditem = "basetools:sword_stone"
            local a = plyr:set_wielded_item(wieldeditem)
            minetest.log("The player's wielded item is " ..dump(a))
        else
            minetest.log("input a param: \n 0 - null \n 1 - stone sword")
        end
    end,
})

--Skip set armor (fleshy, crumbly, cracky)

-- get_armor_groups(self)
minetest.register_chatcommand("lua_object_get_armor_groups", {
    description = "Get the player's current armor groups",
    func = function(name, param)
        minetest.log("lua_object_get_weilded_item is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_armor_groups()
        local b = player:get_armor_groups()
        -- minetest.log("The player's armor group information is " ..dump(a:to_string()))
        minetest.log("The player's armor group information is " ..dump(a))
        minetest.log("The player's armor group information is " ..dump(b))
    end,
})

-- set_animation(self, frame_range, frame_speed, frame_blend, frame_loop)
-- get_animation(self)
minetest.register_chatcommand("lua_object_get_animation", {
    description = "Get the object's animation",
    func = function(name, param)
        minetest.log("lua_object_get_animation is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        if #saos == 2 then
            -- local plyr = saos[1]
            local rclk = saos[2]
            local a = rclk:get_animation()
            minetest.log("The Current animation information for ".. rclk:get_entity_name().." is "..dump(a))
        else
            local plyr = saos[1]
            local a = plyr:get_animation()
            minetest.log("The Current animation information for ".. plyr:get_player_name() .." is "..dump(a))
        end
    end,
})
-- set_local_animation(self, idle, walk, dig, walk_while_dog, frame_speed)
-- get_local_animation(self)
minetest.register_chatcommand("lua_object_get_local_animation", {
    description = "Get the player's animation",
    func = function(name, param)
        minetest.log("lua_object_get_local_animation_item is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)


        local plyr = saos[1]
        local a = plyr:get_local_animation()
        minetest.log("The Current animation information for ".. plyr:get_player_name() .." is "..dump(a))
    end,
})

-- get_eye_offset(self)
minetest.register_chatcommand("lua_object_get_eye_offset", {
    description = "Get the player's current eye offset",
    func = function(name, param)
        minetest.log("lua_object_get_eye_offset is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_eye_offset()
        --local b = player:get_armor_groups()
        -- minetest.log("The player's armor group information is " ..dump(a:to_string()))
        minetest.log("The player's eye offset is " ..dump(a))

    end,
})

-- set_eye_offset(self)
minetest.register_chatcommand("lua_object_set_eye_offset", {
    description = "Set the player's current eye offset",
    func = function(name, param)
        minetest.log("lua_object_get_eye_offset is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        if param ~= "" then
            local v3f = {x = 0, y = tonumber(param), z = 0}
            local a = plyr:set_eye_offset(v3f)
            minetest.log("The player's eye offset is now" ..dump(v3f))
        else
            local v3f = {x = 0, y = 0, z = 0}
            local a = plyr:set_eye_offset(v3f)
            minetest.log("lua_object_set_eye_offset # (0 is default)")
        end
    end,
})

-- send_mapblock(self, pos)
-- Figure out how to trigger it
minetest.register_chatcommand("lua_object_send_mapblock", {
    description = "Sends an already loaded mapblock to the player.\nReturns false if nothing was sent (note that this can also mean that the client already has the block)\nResource intensive - use sparsely",
    func = function(name, param)
        minetest.log("Sends an already loaded mapblock to the player.\nReturns false if nothing was sent (note that this can also mean that the client already has the block)\nResource intensive - use sparsely")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:send_mapblock(pos)
        --local b = player:get_armor_groups()
        -- minetest.log("The player's armor group information is " ..dump(a:to_string()))
        if a then
            minetest.log("Mapblock was sent to player. Responce:  " ..dump(a))
        else 
            minetest.log("Mapblock was NOT sent to player. Responce:  " ..dump(a))
        end
    end,
})

--set_animation_frame_speed(self, frame_speed)

--set_bone_position(self, bone, position, rotation)

--get_bone_position(self, bone)

--set_attach(self, parent, bone, position, rotation, force_visable)

--get_attach(self)

--get_children(self)

--set_detach(self)

--set_properties(self, properties)

--get_properties(self)

--is_player(self) Used in most functions

--set_nametag_attributes

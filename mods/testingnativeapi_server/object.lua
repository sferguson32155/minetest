-- Written By Sean Ferguson
minetest.log("object_test_obj")

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

-- native_remove
minetest.register_chatcommand("native_object_remove", {
    description = "Test Object Remove",
    func = function(name, param)
        minetest.log("native_object_remove is running!")
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
        local firstSaosPos = saos[1]:native_get_pos()
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
minetest.register_chatcommand(" native_object_set_pos", {
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
                local player_pos = object:native_set_pos(v3f)
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
            local player_pos = object:native_move_to(v3f, false)
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
                        object:punch(floorobj)
                    end
                end
            end
        end
    end,
})

-- native_punch
minetest.register_chatcommand("native_object_punch", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
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
                        object:native_punch(floorobj)
                    end
                end
            end
        end
    end,
})
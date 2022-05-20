-- Test mod for getting values from lua.
-- yoinked from game_commands mod from game build 5.10

-- https://stackoverflow.com/questions/9168058/how-to-dump-a-table-to-console referenced
function print_table(x)
    local s = '{'
    if type(x) == 'table' then
        for i, data in pairs(x) do
            s = s .. '['..i..'] = ' .. data .. ','
        end
        s = s .. '}'
        return s
    end
end

minetest.register_chatcommand("josh", {
    description = "get cam data",
    func = function(param)
        return true, minetest.camera:get_camera_mode()
    end
})

minetest.register_chatcommand("set_cam", {
    description = "set cam data",
    func = function(param)
        param = tonumber(param)
        if param >= 0 and param <= 2 then
            minetest.camera:set_camera_mode(param)
            return true
        else
            return true, "please enter valid camera type"
        end
    end
})
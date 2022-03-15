testing = {}

function testing.print_to_everything(msg)
	minetest.log("action", msg)
	minetest.chat_send_all(msg)
end

minetest.log("info", "[testing] modname="..dump(minetest.get_current_modname()))
minetest.log("info", "[testing] modpath="..dump(minetest.get_modpath("testing")))

minetest.register_on_mods_loaded(function()
	minetest.log("action", "[testing] on_mods_loaded()")
end)

local modpath = minetest.get_modpath("testingnativeapi")

-- Load files
dofile(modpath .. "/commands.lua")
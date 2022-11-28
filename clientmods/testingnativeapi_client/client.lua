minetest.register_chatcommand("lua_client_get_current_modname", {
	description = "Invokes lua_api > l_client.l_get_current_modname",
	func = function(self)
		--modname is nil unless you run this at load time
		local modname = minetest.get_current_modname()
		return true, "get_current_modname() only works at load time"
	end
})

minetest.register_chatcommand("native_client_get_current_modname", {
	description = "Invokes lua_api > l_client.l_native_get_current_modname > native_client.native_get_current_modname",
	func = function(self)
		local modname = minetest.native_get_current_modname()
		return true, "native_get_current_modname() only works at load time"
	end
})

--test this in init.lua
minetest.register_chatcommand("test_client_get_current_modname", {
	description = "Asserts lua api and native api behaviors for l_client.get_current_modname",
	func = function(self)
		local lua = minetest.get_current_modname()
		local native = minetest.native_get_current_modname()
		if lua == native then
			return true, "(Success) get_current_modname()"
		else
			return false, "(Fail) get_current_modname(), modnames aren't similar"
		end
	end
})

minetest.register_chatcommand("lua_client_get_modpath", {
	description = "Invokes lua_api > l_client.l_get_modpath",
	func = function(self)
		local modpath = minetest.get_modpath("testingnativeapi_client")
		return true, "Success, get_modpath() returned: "..modpath
	end
})

minetest.register_chatcommand("native_client_get_modpath", {
	description = "Invokes lua_api > l_client.l_native_get_modpath > native_client.native_get_modpath",
	func = function(self)
		local modpath = minetest.native_get_modpath("testingnativeapi_client")
		return true, "Success, native_get_modpath() returned: "..modpath
	end
})

minetest.register_chatcommand("test_client_get_modpath", {
	description = "Asserts lua api and native api behaviors for l_client.get_modpath",
	func = function(self)
		local lua = minetest.get_modpath("testingnativeapi_client")
		local native = minetest.native_get_modpath("testingnativeapi_client")
		if lua == native then
			return true, "(Success) get_modpath()"
		else
			return false, "(Fail) get_modpath(), modpaths aren't similar"
		end
	end
})

minetest.register_chatcommand("lua_client_get_last_run_mod", {
	description = "Invokes lua_api > l_client.l_get_last_run_mod",
	func = function(self)
		local last_mod = minetest.get_last_run_mod();
		return true, "Success, get_last_run_mod() returned: "..last_mod
	end
})

minetest.register_chatcommand("native_client_get_last_run_mod", {
	description = "Invokes lua_api > l_client.l_native_get_last_run_mod > native_client.native_get_last_run_mod",
	func = function(self)
		local modpath = minetest.native_get_modpath("testingnativeapi_client")
		return true, "Success, native_get_last_run_mod() returned: "..modpath
	end
})

minetest.register_chatcommand("test_client_get_last_run_mod", {
	description = "Asserts lua api and native api behaviors for l_client.get_modpath",
	func = function(self)
		local lua = minetest.get_modpath("testingnativeapi_client")
		local native = minetest.native_get_modpath("testingnativeapi_client")
		if lua == native then
			return true, "(Success) get_last_run_mod()"
		else
			return false, "(Fail) get_last_run_mod(), modpaths aren't similar"
		end
	end
})

minetest.register_chatcommand("lua_client_set_last_run_mod", {
	description = "Invokes lua_api > l_client.l_set_last_run_mod",
	func = function(self)
		if minetest.set_last_run_mod("test") and minetest.get_last_run_mod() == "test" then
			return true, "Success, get_last_run_mod() is now: test"
		else
			return false, "Fail, get_last_run_mod() is: "..minetest.get_last_run_mod()
		end
	end
})

minetest.register_chatcommand("native_client_set_last_run_mod", {
	description = "Invokes lua_api > l_client.l_native_set_last_run_mod > native_client.native_set_last_run_mod",
	func = function(self)
		if minetest.native_set_last_run_mod("test") and minetest.get_last_run_mod() == "test" then
			return true, "Success, get_last_run_mod() is now: test"
		else
			return false, "Fail, get_last_run_mod() is: "..minetest.get_last_run_mod()
		end
	end
})

minetest.register_chatcommand("test_client_set_last_run_mod", {
	description = "Asserts lua api and native api behaviors for l_client.set_last_run_mod",
	func = function(self)

		minetest.set_last_run_mod("lua")
		local mod = minetest.get_last_run_mod()
		if mod == "lua" then

			minetest.native_set_last_run_mod("native")
			mod = minetest.get_last_run_mod()
			if mod == "native" then
				return true, "(Success) set_lat_run_mod()"
			else
				return false, "(Fail) get_last_run_mod(), mod still set to "..mod
			end
		else
			return false, "(Fail) get_last_run_mod(), mod still set to "..mod
		end
	end
})

minetest.register_chatcommand("lua_client_print", {
	description = "Invokes lua_api > l_client.l_print",
	func = function(self)
		print("client printed successfully")
		return true, "Success, check chat/console (above) for printed message"
	end
})

minetest.register_chatcommand("native_client_print", {
	description = "Invokes lua_api > l_client.l_native_print > native_client.native_print",
	func = function(self)
		minetest.native_print("native printed successfully")
		return true, "Success, check chat/console (above) for printed message"
	end
})

minetest.register_chatcommand("test_client_print", {
	description = "Asserts lua api and native api behaviors for l_client.print",
	func = function(self)
		print("client printed successfully")
		minetest.native_print("native printed successfully")
		return true, "(Success) print(), check chat/console (above) for printed messages"
	end
})

minetest.register_chatcommand("lua_client_display_chat_message", {
	description = "Invokes lua_api > l_client.l_display_chat_message",
	func = function(self)
		minetest.display_chat_message("client displayed successfully")
		return true, "Success, check chat (above) for displayed message"
	end
})

minetest.register_chatcommand("native_client_display_chat_message", {
	description = "Invokes lua_api > l_client.l_native_display_chat_message > native_client.native_display_chat_message",
	func = function(self)
		minetest.native_display_chat_message("native displayed successfully")
		return true, "Success, see chat (above) for displayed message"
	end
})

minetest.register_chatcommand("test_client_display_chat_message", {
	description = "Asserts lua api and native api behaviors for l_client.display_chat_message",
	func = function(self)
		minetest.display_chat_message("client displayed successfully")
		minetest.native_display_chat_message("native displayed successfully")
		return true, "(Success) display_chat_message(), check chat (above) for displayed messages"
	end
})

--can invoke server and other client commands (however, they are not handled synchronously and you can't wait on their response)
--ex: minetest.send_chat_message(".lua_client_print")
--ex: minetest.send_chat_message("/lua_areastore_getarea")
minetest.register_chatcommand("lua_client_send_chat_message", {
	description = "Invokes lua_api > l_client.l_send_chat_message",
	func = function(self)
		minetest.send_chat_message("client sent successfully")
		return true, "Success, send_chat_message() sent message (see below)"
	end
})

minetest.register_chatcommand("native_client_send_chat_message", {
	description = "Invokes lua_api > l_client.l_native_send_chat_message > native_client.native_send_chat_message",
	func = function(self)
		minetest.native_send_chat_message("native sent successfully")
		return true, "Success, native_send_chat_message() sent message (see below)"
	end
})

minetest.register_chatcommand("test_client_send_chat_message", {
	description = "Asserts lua api and native api behaviors for l_client.send_chat_message",
	func = function(self)
		minetest.send_chat_message("client sent successfully")
		minetest.native_send_chat_message("native sent successfully")
		return true, "(Success) send_chat_message(), messages sent (see below)"
	end
})

--no way to test these work unless you modify client.cpp
minetest.register_chatcommand("lua_client_clear_out_chat_queue", {
	description = "Invokes lua_api > l_client.l_clear_out_chat_queue",
	func = function(self)
		minetest.send_chat_message("hello")
		minetest.clear_out_chat_queue()
		local chatSize = minetest.native_get_chat_size()
		if chatSize == 0 then
			return true, "Success, clear_out_chat_queue() cleared chat"
		else
			return true, "Fail, there are still "..chatSize.. " messages in the chat queue"
		end
	end
})

minetest.register_chatcommand("native_client_clear_out_chat_queue", {
	description = "Invokes lua_api > l_client.l_native_clear_out_chat_queue > native_client.native_clear_out_chat_queue",
	func = function(self)
		minetest.send_chat_message("hello")
		minetest.native_clear_out_chat_queue()
		local chatSize = minetest.native_get_chat_size()
		if chatSize == 0 then
			return true, "Success, native_clear_out_chat_queue() cleared chat"
		else
			return true, "Fail, there are still "..chatSize.. " messages in the chat queue"
		end
	end
})

minetest.register_chatcommand("test_client_clear_out_chat_queue", {
	description = "Asserts lua api and native api behaviors for l_client.clear_out_chat_queue",
	func = function(self)
		minetest.send_chat_message("adding to queue")
		minetest.clear_out_chat_queue()
		minetest.send_chat_message("adding to queue")
		minetest.native_clear_out_chat_queue()

		local chatSize = minetest.native_get_chat_size()
		if chatSize == 0 then
			return true, "(Success) clear_out_chat_queue(), chat cleared"
		else
			return true, "(Fail) clear_out_chat_queue(), chat still contains "..chatSize.." messages"
		end
	end
})

minetest.register_chatcommand("lua_client_get_player_names", {
	description = "Invokes lua_api > l_client.l_get_player_names",
	func = function(self)
		local names = minetest.get_player_names()
		if names then
			return true, "Success, get_player_names() returned: "..minetest.serialize(names)
		else
			return false, "Fail, get_player_names() returned: nil; Set \'csm_restriction_flags = 0\' in minetest.conf"
		end
	end
})

minetest.register_chatcommand("native_client_get_player_names", {
	description = "Invokes lua_api > l_client.l_native_get_player_names > native_client.native_get_player_names",
	func = function(self)
		local names = minetest.native_get_player_names()
		if names then
			return true, "Success, native_get_player_names() returned: "..minetest.serialize(names)
		else
			return false, "Fail, native_get_player_names() returned: nil; Set \'csm_restriction_flags = 0\' in minetest.conf"
		end
	end
})

minetest.register_chatcommand("test_client_get_player_names", {
	description = "Asserts lua api and native api behaviors for l_client.get_player_names",
	func = function(self)
		local lua = minetest.get_player_names()
		local native = minetest.native_get_player_names()
		if lua and native then
			if minetest.serialize(lua) == minetest.serialize(native) then
				return true, "(Success) get_player_names()"
			else
				return false, "(Fail) get_player_names(), names are not the same"
			end
		else
			return false, "(Fail) get_player_names(), set \'csm_restriction_flags = 0\' in minetest.conf"
		end
	end
})

--formspecs define how GUIs (such as inventories) are displayed
minetest.register_chatcommand("lua_client_show_formspec", {
	description = "Invokes lua_api > l_client.l_show_formspec",
	func = function(self)
		local testSpec = {
			"size[8,9]",
			"position[0, 0.5]",
			"anchor[0, 0.5]",
			"label[0.375,0.5;", minetest.formspec_escape("LUA"), "]",
			"list[current_player;main;0,5;8,4;]"
		}
		if minetest.show_formspec("lua", table.concat(testSpec, "")) then
			return true, "Success, show_formspec() rendered a formspec as a menu"
		else
			return false, "Fail, show_formspec() could not render the provided formspec"
		end
	end
})

minetest.register_chatcommand("native_client_show_formspec", {
	description = "Invokes lua_api > l_client.l_native_show_formspec > native_client.native_show_formspec",
	func = function(self)
		local testSpec = {
			"size[8,9]",
			"position[1.0, 0.5]",
			"anchor[1.0, 0.5]",
			"label[0.375,0.5;", minetest.formspec_escape("NATIVE"), "]",
			"list[current_player;main;0,5;8,4;]"
		}
		if minetest.show_formspec("native", table.concat(testSpec, "")) then
			return true, "Success, native_show_formspec() rendered a formspec as a menu"
		else
			return false, "Fail, native_show_formspec() could not render the provided formspec"
		end
	end
})

--latest formspec written will be the one that's drawn on the screen (so only nativeSpec should be rendered)
minetest.register_chatcommand("test_client_show_formspec", {
	description = "Asserts lua api and native api behaviors for l_client.show_formspec",
	func = function(self)
		local formSpec1 = {
			"size[8,9]",
			"position[0, 0.5]",
			"anchor[0, 0.5]",
			"label[0.375,0.5;", minetest.formspec_escape("LUA"), "]",
			"list[current_player;main;0,5;8,4;]"
		}
		local luaSpec = table.concat(formSpec1, "")

		local formSpec2 = {
			"size[8,9]",
			"position[1.0, 0.5]",
			"anchor[1.0, 0.5]",
			"label[0.375,0.5;", minetest.formspec_escape("NATIVE"), "]",
			"list[current_player;main;0,5;8,4;]"
		}
		local nativeSpec = table.concat(formSpec2, "")

		if minetest.show_formspec("lua", luaSpec) and minetest.native_show_formspec("native", nativeSpec) then
			return true, "(Success), show_formspec() rendered formspecs as a menus"
		else
			return false, "(Fail) show_formspec(), could not render both formspecs"
		end
	end
})

--this doesn't work for some reason... (see register_on_respawnplayer)
minetest.register_chatcommand("lua_client_send_respawn", {
	description = "Invokes lua_api > l_client.l_send_respawn",
	func = function(self)
		minetest.send_respawn()
		return true, "Success, send_respawn()"
	end
})

minetest.register_chatcommand("native_client_send_respawn", {
	description = "Invokes lua_api > l_client.l_native_send_respawn > native_client.native_send_respawn",
	func = function(self)
		minetest.native_send_respawn()
		return true, "Success, native_send_respawn()"
	end
})

minetest.register_chatcommand("test_client_send_respawn", {
	description = "Asserts lua api and native api behaviors for l_client.send_respawn",
	func = function(self)
		minetest.send_respawn()
		minetest.native_send_respawn()
		return true, "(Success) send_respawn()"
	end
})

minetest.register_chatcommand("lua_client_disconnect", {
	description = "Invokes lua_api > l_client.l_disconnect",
	func = function(self)
		minetest.disconnect()
		return true, "Success, disconnect()"
	end
})

minetest.register_chatcommand("native_client_disconnect", {
	description = "Invokes lua_api > l_client.l_native_disconnect > native_client.native_disconnect",
	func = function(self)
		minetest.native_disconnect()
		return true, "Success, native_disconnect()"
	end
})

--asserting the two functions doesn't make sense since the game will no longer be running
minetest.register_chatcommand("test_client_disconnect", {
	description = "Asserts lua api and native api behaviors for l_client.disconnect",
	func = function(self)
		minetest.disconnect()
		return true, "(Success) disconnect()"
	end
})

--translates english text to client's language locale 
--to test: change language under advanced settings on main menu
minetest.register_chatcommand("lua_client_gettext", {
	description = "Invokes lua_api > l_client.l_gettext",
	func = function(self)
		local text = minetest.gettext("this used to be in english!")
		return true, "Success, gettext() returned: "..text
	end
})

minetest.register_chatcommand("native_client_gettext", {
	description = "Invokes lua_api > l_client.l_native_gettext > native_client.native_gettext",
	func = function(self)
		local text = minetest.native_gettext("this used to be in english!")
		return true, "Success, native_gettext() returned: "..text
	end
})

minetest.register_chatcommand("test_client_gettext", {
	description = "Asserts lua api and native api behaviors for l_client.gettext",
	func = function(self)
		local lua = minetest.gettext("this used to be in english!")
		local native = minetest.native_gettext("this used to be in english!")
		if lua == native then
			return true, "(Success) gettext()"
		else
			return false, "(Fail) gettext(), translated text not the same"
		end
	end
})

minetest.register_chatcommand("lua_client_get_node_or_nil", {
	description = "Invokes lua_api > l_client.l_get_node_or_nil",
	func = function(self)
		local pos = minetest.localplayer:get_pos()
		pos.y = pos.y - 1
		local node = minetest.get_node_or_nil(pos)
		node = nil
		return true, "Success, get_node_or_nil() returned: "..minetest.serialize(node)
	end
})

minetest.register_chatcommand("native_client_get_node_or_nil", {
	description = "Invokes lua_api > l_client.l_native_get_node_or_nil > native_client.native_get_node_or_nil",
	func = function(self)
		local pos = minetest.localplayer:get_pos()
		pos.y = pos.y - 1
		local node = minetest.native_get_node_or_nil(pos)
		return true, "Success, native_get_node_or_nil() returned: "..minetest.serialize(node)
	end
})

minetest.register_chatcommand("test_client_get_node_or_nil", {
	description = "Asserts lua api and native api behaviors for l_client.get_node_or_nil",
	func = function(self)
		local pos = minetest.localplayer:get_pos()
		pos.y = pos.y - 1
		local lua = minetest.get_node_or_nil(pos)
		local native = minetest.native_get_node_or_nil(pos)
		if minetest.serialize(lua) == minetest.serialize(native) then
			return true, "(Success) get_node_or_nil()"
		else
			return false, "(Fail) get_node_or_nil(), node data is not the same"
		end
	end
})

minetest.register_chatcommand("lua_client_get_language", {
	description = "Invokes lua_api > l_client.l_get_language",
	func = function(self)
		local locale, code = minetest.get_language()
		return true, "Success, get_language() returned locale: "..locale.." and language code: "..code
	end
})

minetest.register_chatcommand("native_client_get_language", {
	description = "Invokes lua_api > l_client.l_native_get_language > native_client.native_get_language",
	func = function(self)
		local locale, code = minetest.native_get_language()
		return true, "Success, native_get_language() returned locale: "..locale.." and language code: "..code
	end
})

minetest.register_chatcommand("test_client_get_language", {
	description = "Asserts lua api and native api behaviors for l_client.get_language",
	func = function(self)
		local lLocale, lCode = minetest.get_language()
		local nLocale, nCode = minetest.native_get_language()
		if lLocale == nLocale then
			if lCode == nCode then
				return true, "(Success) get_language"
			else
				return false, "(Fail) get_language(), returned different language codes"
			end
		else
			return false, "(Fail) get_language(), returned different gettext locales"
		end
	end
})


--tests the metadata for the node at player's position (should be air?)
--if no meta data, will be nil (need a block with metadata already set or have server set metadata)
minetest.register_chatcommand("lua_client_get_meta", {
	description = "Invokes lua_api > l_client.l_get_meta",
	func = function(self)
		local pos = minetest.localplayer:get_pos()
		pos.y = pos.y - 1
		local metadata = minetest.get_meta(pos)

		if metadata then
			return true, "Success, get_meta() returned: "..minetest.serialize(metadata:to_table())
		else
			return false, "Fail, get_meta() returned: nil; Set \'csm_restriction_flags = 0\' in minetest.conf"
		end
	end
})

minetest.register_chatcommand("native_client_get_meta", {
	description = "Invokes lua_api > l_client.l_native_get_meta > native_client.native_get_meta",
	func = function(self)
		local pos = minetest.localplayer:get_pos()
		pos.y = pos.y - 1
		local metadata = minetest.native_get_meta(pos)

		if metadata then
			return true, "Success, native_get_meta() returned: "..minetest.serialize(metadata:to_table())
		else
			return false, "Fail, native_get_meta() returned: nil; Set \'csm_restriction_flags = 0\' in minetest.conf"
		end
	end
})

minetest.register_chatcommand("test_client_get_meta", {
	description = "Asserts lua api and native api behaviors for l_client.get_meta",
	func = function(self)
		local pos = minetest.localplayer:get_pos()
		pos.y = pos.y - 1
		local lua = minetest.get_meta(pos)
		local native = minetest.native_get_meta(pos)
		if lua and native then
			if minetest.serialize(lua:to_table()) == minetest.serialize(native:to_table()) then
				return true, "(Success) get_meta()"
			else
				return false, "(Fail) get_meta(), node metadata different"
			end
		else
			return false, "(Fail) get_meta(), set \'csm_restriction_flags = 0\' in minetest.conf"
		end
	end
})

--to test custom sounds, add modname_soundname.ogg to modfolder/sounds
minetest.register_chatcommand("lua_client_sound_play", {
	description = "Invokes lua_api > l_client.l_sound_play",
	func = function(self)
		--defines the sound
		local soundSpec = {name = "player_damage"}

		--defines how sound is played
		local soundParams = {
			to_player = "singleplayer",
			gain = 1.0,   -- default (volume)
			fade = 0.0,   -- default (>0 if you want sound to fade-in)
			pitch = 1.0,  -- default (1.0 = 100%)
		}

		local handle = minetest.sound_play(soundSpec, soundParams)
		if handle > 0 then
			return true, "Success, sound_play() returned: "..handle
		else
			return true, "Fail, sound_play() tried to play an invalid sound effect"
		end
	end
})

minetest.register_chatcommand("native_client_sound_play", {
	description = "Invokes lua_api > l_client.l_native_sound_play > native_client.native_sound_play",
	func = function(self)
		local soundSpec = {name = "player_damage"}

		local soundParams = {
			to_player = "singleplayer",
			gain = 1.0,   -- default (volume)
			fade = 0.0,   -- default (>0 if you want sound to fade-in)
			pitch = 1.0,  -- default (1.0 = 100%)
		}

		local handle = minetest.native_sound_play(soundSpec, soundParams)
		if handle > 0 then
			return true, "Success, native_sound_play() returned: "..handle
		else
			return true, "Fail, native_sound_play() tried to play an invalid sound effect"
		end
	end
})

--asserting the two functions doesn't make sense since the game will no longer be running
minetest.register_chatcommand("test_client_sound_play", {
	description = "Asserts lua api and native api behaviors for l_client.sound_play",
	func = function(self)
		local soundSpec = {name = "player_damage"}

		local soundParams = {
			to_player = "singleplayer",
			gain = 1.0,   -- default (volume)
			fade = 0.0,   -- default (>0 if you want sound to fade-in)
			pitch = 1.0,  -- default (1.0 = 100%)
		}

		--handle is the ID for a sound effect (ID increments each time a sound is played)
		local lua = minetest.sound_play(soundSpec, soundParams)
		local native = minetest.sound_play(soundSpec, soundParams)
		if lua > 0 and native > 0 and native == lua + 1 then
			return true, "(Success) sound_play()"
		else
			return false, "(Fail) sound_play()"
		end
	end
})

minetest.register_chatcommand("lua_client_sound_stop", {
	description = "Invokes lua_api > l_client.l_sound_stop",
	func = function(self)
		--play looping sound
		local soundSpec = {name = "player_damage"}
		local soundParams = {
			to_player = "singleplayer", gain = 1.0, fade = 0.0, pitch = 1.0, loop = true
		}
		local handle = minetest.sound_play(soundSpec, soundParams)

		--stop it
		minetest.sound_stop(handle)
		return true, "Success, sound_stop() stopped sound"
	end
})

minetest.register_chatcommand("native_client_sound_stop", {
	description = "Invokes lua_api > l_client.l_native_sound_stop > native_client.native_sound_stop",
	func = function(self)
		--play looping sound
		local soundSpec = {name = "player_damage"}
		local soundParams = {
			to_player = "singleplayer", gain = 1.0, fade = 0.0, pitch = 1.0, loop = true
		}
		local handle = minetest.sound_play(soundSpec, soundParams)

		--stop it
		minetest.native_sound_stop(handle)
		return true, "Success, native_sound_stop() stopped sound"
	end
})

minetest.register_chatcommand("test_client_sound_stop", {
	description = "Asserts lua api and native api behaviors for l_client.sound_stop",
	func = function(self)
		local soundSpec = {name = "player_damage"}
		local soundParams = {
			to_player = "singleplayer", gain = 1.0, fade = 0.0, pitch = 1.0, loop = true
		}
		local lua = minetest.sound_play(soundSpec, soundParams)
		local native = minetest.sound_play(soundSpec, soundParams)

		minetest.sound_stop(lua)
		minetest.sound_stop(native)
		return true, "(Success), sound_stop()"
	end
})

minetest.register_chatcommand("lua_client_sound_fade", {
	description = "Invokes lua_api > l_client.l_sound_fade",
	func = function(self)
		local soundSpec = {name = "player_damage"}
		local soundParams = {
			to_player = "singleplayer", gain = 1.0, fade = 1.0, pitch = 1.0
		}
		local handle = minetest.sound_play(soundSpec, soundParams)

		if handle > 0 then
			return true, "Success, sound_fade() faded sound "..soundSpec.name..".ogg"
		else
			return false, "Fail, "..soundSpec.name..".ogg is not a valid sound effect"
		end
	end
})

minetest.register_chatcommand("native_client_sound_fade", {
	description = "Invokes lua_api > l_client.l_native_sound_fade > native_client.native_sound_fade",
	func = function(self)
		local soundSpec = {name = "player_damage"}
		local soundParams = {
			to_player = "singleplayer", gain = 1.0, fade = 1.0, pitch = 1.0
		}
		local handle = minetest.native_sound_play(soundSpec, soundParams)

		if handle > 0 then
			return true, "Success, native_sound_fade() faded sound "..soundSpec.name..".ogg"
		else
			return false, "Fail, "..soundSpec.name..".ogg is not a valid sound effect"
		end
	end
})

minetest.register_chatcommand("test_client_sound_fade", {
	description = "Asserts lua api and native api behaviors for l_client.sound_fade",
	func = function(self)
		local soundSpec = {name = "player_damage"}
		local soundParams = {
			to_player = "singleplayer", gain = 1.0, fade = 1.0, pitch = 1.0
		}
		local lua = minetest.sound_play(soundSpec, soundParams)
		local native = minetest.sound_play(soundSpec, soundParams)

		if lua > 0 and native > 0 and lua == native + 1 then
			return true, "(Success), sound_fade()"
		else
			return false, "(Fail), sound_fade()"
		end
	end
})

minetest.register_chatcommand("lua_client_get_server_info", {
	description = "Invokes lua_api > l_client.l_get_server_info",
	func = function(self)
		local info = minetest.get_server_info()
		return true, "Success, get_server_info() returned: "..minetest.serialize(info)
	end
})

minetest.register_chatcommand("native_client_get_server_info", {
	description = "Invokes lua_api > l_client.l_native_get_server_info > native_client.native_get_server_info",
	func = function(self)
		local info = minetest.native_get_server_info()
		return true, "Success, native_get_server_info() returned: "..minetest.serialize(info)
	end
})

minetest.register_chatcommand("test_client_get_server_info", {
	description = "Asserts lua api and native api behaviors for l_client.get_server_info",
	func = function(self)
		local lua = minetest.get_server_info()
		local native = minetest.native_get_server_info()
		if minetest.serialize(lua) == minetest.serialize(native) then
			return true, "(Success), get_server_info()"
		else
			return false, "(Fail), get_server_info()"
		end
	end
})

minetest.register_chatcommand("lua_client_get_item_def", {
	description = "Invokes lua_api > l_client.l_get_item_def",
	func = function(self)
		--pass itemstring, get item definition table
		--itemstrings are serialized representations of items that are used when passing items to functions
		local itemDef = minetest.get_item_def("default:dirt")

		if itemDef then
			return true, "Success, get_item_def() returned: "..minetest.serialize(itemDef)
		else
			return false, "Fail, get_item_def() returned: nil; unkown itemstring or csm_restriction_flags not set in minetest.conf"
		end
	end
})

minetest.register_chatcommand("native_client_get_item_def", {
	description = "Invokes lua_api > l_client.l_native_get_item_def > native_client.native_get_item_def",
	func = function(self)
		local itemDef = minetest.native_get_item_def("default:dirt")

		if itemDef then
			return true, "Success, native_get_item_def() returned: "..minetest.serialize(itemDef)
		else
			return false, "Fail, native_get_item_def() returned: nil; unkown itemstring or csm_restriction_flags not set in minetest.conf"
		end
	end
})

minetest.register_chatcommand("test_client_get_item_def", {
	description = "Asserts lua api and native api behaviors for l_client.get_item_def",
	func = function(self)
		local lua = minetest.get_item_def("default:dirt")
		local native = minetest.native_get_item_def("default:dirt")

		if lua and native then
			if minetest.serialize(lua) == minetest.serialize(native) then
				return true, "(Success) get_item_def()"
			else
				return false, "(Fail) get_item_def(), item definition tables not the same"
			end
		else
			return false, "(Fail) get_item_def(), unkown itemstrings or csm_restriction_flags not set in minetest.conf"
		end
	end
})

minetest.register_chatcommand("lua_client_get_node_def", {
	description = "Invokes lua_api > l_client.l_get_node_def",
	func = function(self)
		--pass node name, get node definition table
		--node names are block/node identifiers
		local nodeDef = minetest.get_node_def("default:dirt")

		if nodeDef then
			return true, "Success, get_node_def() returned: "..minetest.serialize(nodeDef)
		else
			return false, "Fail, get_node_def() returned: nil; unkown node name or csm_restriction_flags not set in minetest.conf"
		end
	end
})

minetest.register_chatcommand("native_client_get_node_def", {
	description = "Invokes lua_api > l_client.l_native_get_node_def > native_client.native_get_node_def",
	func = function(self)
		local nodeDef = minetest.native_get_node_def("default:dirt")

		if nodeDef then
			return true, "Success, native_get_node_def() returned: "..minetest.serialize(nodeDef)
		else
			return false, "Fail, native_get_node_def() returned: nil; unkown node name or csm_restriction_flags not set in minetest.conf"
		end
	end
})

minetest.register_chatcommand("test_client_get_node_def", {
	description = "Asserts lua api and native api behaviors for l_client.get_node_def",
	func = function(self)
		local lua = minetest.get_node_def("default:dirt")
		local native = minetest.native_get_node_def("default:dirt")

		if lua and native then
			if minetest.serialize(lua) == minetest.serialize(native) then
				return true, "(Success) get_node_def()"
			else
				return false, "(Fail) get_node_def(), node definition tables not the same"
			end
		else
			return false, "(Fail) get_node_def(), unkown node names or csm_restriction_flags not set in minetest.conf"
		end
	end
})

minetest.register_chatcommand("lua_client_get_privilege_list", {
	description = "Invokes lua_api > l_client.l_get_privilege_list",
	func = function(self)
		local privileges = minetest.get_privilege_list()
		return true, "Success, get_privilege_list() returned: "..minetest.serialize(privileges)
	end
})

minetest.register_chatcommand("native_client_get_privilege_list", {
	description = "Invokes lua_api > l_client.l_native_get_privilege_list > native_client.native_get_privilege_list",
	func = function(self)
		local privileges = minetest.native_get_privilege_list()
		return true, "Success, native_get_privilege_list() returned: "..minetest.serialize(privileges)
	end
})

minetest.register_chatcommand("test_client_get_privilege_list", {
	description = "Asserts lua api and native api behaviors for l_client.get_privilege_list",
	func = function(self)
		local lua = minetest.get_privilege_list()
		local native = minetest.native_get_privilege_list()
		if minetest.serialize(lua) == minetest.serialize(native) then
			return true, "(Success) get_privilege_list()"
		else
			return false, "(Fail) get_privilege_list(), privileges are not the same"
		end
	end
})

minetest.register_chatcommand("lua_client_get_builtin_path", {
	description = "Invokes lua_api > l_client.l_get_builtin_path",
	func = function(self)
		local path = minetest.get_builtin_path()
		return true, "Success, get_builtin_path() returned: "..path
	end
})

minetest.register_chatcommand("native_client_get_builtin_path", {
	description = "Invokes lua_api > l_client.l_native_get_builtin_path > native_client.native_get_builtin_path",
	func = function(self)
		local path = minetest.native_get_builtin_path()
		return true, "Success, native_get_builtin_path() returned: "..path
	end
})

minetest.register_chatcommand("test_client_get_builtin_path", {
	description = "Asserts lua api and native api behaviors for l_client.get_builtin_path",
	func = function(self)
		local lua = minetest.get_builtin_path()
		local native = minetest.native_get_builtin_path()
		if lua == native then
			return true, "(Success) get_builtin_path()"
		else
			return false, "(Fail) native_get_builtin_path(), paths not the same"
		end
	end
})

minetest.register_chatcommand("lua_client_get_csm_restrictions", {
	description = "Invokes lua_api > l_client.l_get_csm_restrictions",
	func = function(self)
		local restrictions = minetest.get_csm_restrictions()
		return true, "Success, get_csm_restrictions() returned: "..minetest.serialize(restrictions)
	end
})

minetest.register_chatcommand("native_client_get_csm_restrictions", {
	description = "Invokes lua_api > l_client.l_native_gget_csm_restrictions > native_client.native_get_csm_restrictions",
	func = function(self)
		local restrictions = minetest.native_get_csm_restrictions()
		return true, "Success, native_get_csm_restrictions() returned: "..minetest.serialize(restrictions)
	end
})

minetest.register_chatcommand("test_client_get_csm_restrictions", {
	description = "Asserts lua api and native api behaviors for l_client.get_csm_restrictions",
	func = function(self)
		local lua = minetest.get_csm_restrictions()
		local native = minetest.native_get_csm_restrictions()
		if minetest.serialize(lua) == minetest.serialize(native) then
			return true, "(Success) get_csm_restrictions()"
		else
			return false, "(Fail) native_get_csm_restrictions(), restrictions not the same"
		end
	end
})


--command to test entire class
minetest.register_chatcommand("test_client", {
	description = "testing all client methods",
	func = function()

		--disconnect removed since it ends the game instance
		local methods = {
			"get_current_modname",
			"get_modpath",
			"get_last_run_mod",
			"set_last_run_mod",
			"print",
			"display_chat_message",
			"send_chat_message",
			"clear_out_chat_queue",
			"get_player_names",
            "show_formspec",
            "send_respawn",
            "gettext",
            "get_node_or_nil",
			"get_language",
            "get_meta",
            "sound_play",
            "sound_stop",
            "sound_fade",
            "get_server_info",
            "get_item_def",
            "get_node_def",
            "get_privilege_list",
            "get_builtin_path",
            "get_csm_restrictions"
		}

		return native_tests.test_class("client", methods), 
		"Camera tests completed. See console for details."
	end
})
minetest.register_chatcommand("wasm", {
    privs = {
        interact = true,
    },
    func = function(name, param)
	returnVal = wasmExecute("\\..\\..\\games\\minimal\\mods\\wasm_chat\\mod.js")
	if type(returnVal) == "boolean" then
		if returnVal then
			returnVal = "True"
		else
			returnVal = "False"
		end
	end
	
        return true, returnVal
    end,
})

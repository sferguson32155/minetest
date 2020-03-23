minetest.register_chatcommand("wasm", {
    privs = {
        interact = true,
    },
    func = function(name, param)
        return true, wasmExecute("\\..\\..\\games\\minimal\\mods\\wasm_chat\\mod.js")
    end,
})

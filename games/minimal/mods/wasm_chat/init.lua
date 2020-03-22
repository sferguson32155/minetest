minetest.register_chatcommand("wasm", {
    privs = {
        interact = true,
    },
    func = function(name, param)
        return true, wasmExecute("C:\\minetest\\bin\\Debug\\..\\..\\games\\minimal\\mods\\wasm_chat")
    end,
})

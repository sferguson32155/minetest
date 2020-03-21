minetest.register_chatcommand("wasm", {
    privs = {
        interact = true,
    },
    func = function(name, param)
        wasmCalc("C:\\minetest19\\games\\minimal\\mods\\simple_wasm")
        return true
    end,
})

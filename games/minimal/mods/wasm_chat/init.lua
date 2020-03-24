minetest.register_chatcommand("wasm", {
    privs = {
        interact = true,
    },
    func = function(name, param)
	returnVal = wasmExecute("\\..\\..\\games\\minimal\\mods\\wasm_chat\\add5.js", 6)
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

minetest.register_chatcommand("add5", {
    privs = {
        interact = true,
    },
    func = function(name, param)
	returnVal = wasmExecute("\\..\\..\\games\\minimal\\mods\\wasm_chat\\add5.js", param)
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

minetest.register_chatcommand("reverse", {
    privs = {
        interact = true,
    },
    func = function(name, param)
	a, b = wasmExecute("\\..\\..\\games\\minimal\\mods\\wasm_chat\\reverseStrings.js", "string1", "string2")
	if type(returnVal) == "boolean" then
		if returnVal then
			returnVal = "True"
		else
			returnVal = "False"
		end
	end

        return true, a .. b
    end,
})

minetest.register_chatcommand("add5and3", {
    privs = {
        interact = true,
    },
    func = function(name, param)
	returnVal = wasmExecute("\\..\\..\\games\\minimal\\mods\\wasm_chat\\add2nums.js", 5, 3)
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


minetest.register_chatcommand("sixreturn", {
    privs = {
        interact = true,
    },
    func = function(name, param)

      function stringify(Val)
        if type(Val) == "boolean" then
          if Val then
            Val = "True"
          else
            Val = "False"
          end
        end
        return Val
      end

	    a, b, c, d, e, f = wasmExecute("\\..\\..\\games\\minimal\\mods\\wasm_chat\\6return.js")
	    returnString = stringify(a) .. "\n" .. stringify(b) .. "\n" .. stringify(c) .. "\n" .. stringify(d) .. "\n" .. stringify(e) .. "\n" .. stringify(f)
      print(stringify(a))
      print(stringify(b))
	    print(stringify(c))
	    print(stringify(d))
	    print(stringify(e))
	    print(stringify(f))

        return true, returnString
    end,
})

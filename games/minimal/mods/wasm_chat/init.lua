
minetest.register_chatcommand("add5", {
    privs = {
        interact = true,
    },
    func = function(name, param)
    -- console input: /add5 param
    -- param is assumed to be a number
	     returnVal = executeJS("\\..\\..\\games\\minimal\\mods\\wasm_chat\\add5.js", param)


        return true, returnVal
    end,
})


minetest.register_chatcommand("math", {
    privs = {
        interact = true,
    },
    func = function(name, param)
       -- console input: /add param
       -- param is split into 2 numbers with lua regex
       local s1, s2 = param:match("(%d*%.?%d*) (%d*%.?%d*)")
       local n1, n2 = tonumber(s1), tonumber(s2)

	     add, sub, mul, div = executeJS("\\..\\..\\games\\minimal\\mods\\wasm_chat\\math.js", n1, n2)

       returnString = tostring(n1) .. " + " .. tostring(n2) .. " = " .. tostring(add) .. "\n"
       returnString = returnString .. tostring(n1) .. " - " .. tostring(n2) .. " = " .. tostring(sub) .. "\n"
       returnString = returnString .. tostring(n1) .. " * " .. tostring(n2) .. " = " .. tostring(mul) .. "\n"
       returnString = returnString .. tostring(n1) .. " / " .. tostring(n2) .. " = " .. tostring(div)

       return true, returnString
    end,
})


minetest.register_chatcommand("sixreturn", {
    privs = {
        interact = true,
    },
    func = function(name, param)
       -- console input: /sixreturn

      -- converts boolean to string to print on console
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

      -- gets 6 return values
      a, b, c, d, e, f = executeJS("\\..\\..\\games\\minimal\\mods\\wasm_chat\\6return.js")

      -- converts each if necessary and builds return string.   '..' is Lua concatenate
      returnString = stringify(a) .. "\n" .. stringify(b) .. "\n" .. stringify(c) .. "\n" .. stringify(d) .. "\n" .. stringify(e) .. "\n" .. stringify(f)

      return true, returnString
    end,
})

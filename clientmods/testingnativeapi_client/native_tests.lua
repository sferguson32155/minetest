local native_tests = {}

--write text, table, or custom minetest obj to console
function native_tests.write (obj)
	if type(obj) == "table" then
		native_tests.print_to_everything(minetest.serialize(obj))
	elseif type(obj) == "string" then
		native_tests.print_to_everything(obj)
	else
		native_tests.print_to_everything(dump(obj))
	end
end

--send a string to console
function native_tests.log(msg)
	minetest.log("action", msg)
end

--send a string to chat and console
function native_tests.print_to_everything(msg)
	print(msg)
end

--pcall is used to test command, stack traces are not preserved
function native_tests.test_command (class, method)

	local api = {"lua", "native", "test"}
	local hits = 0

	for v,k in pairs(api) do

		local cmd = k.."_"..class.."_"..method
		local entry = minetest.registered_chatcommands[cmd]
		native_tests.write("["..cmd.."] ")

		if entry then
			local eflag, res, msg = pcall(minetest.registered_chatcommands[cmd].func)
	
			if eflag then
				if res then
					native_tests.write("PASSED: "..msg.."\n")
					hits = hits + 1
				else
					native_tests.write("FAILED: "..msg.."\n")
				end
			else
				native_tests.write("EXCEPTION: "..res.."\n")
			end
		else
			native_tests.write("NOT FOUND\n")
		end
	end

	return hits
end

function native_tests.test_class (class, methods)

	native_tests.write("-----"..string.upper(class).." TESTS-----\n")

	local total = 0
	local hits = 0
	for k,v in pairs(methods) do
		local res = native_tests.test_command(class, v)
		hits = hits + res
		total = total + 3
	end

	native_tests.write(string.upper(class).." TESTS COMPLETED: "..hits.." PASSED, "..total-hits.." FAILED\n\n")
	
	if (total-hits) ~= 0 then return false else return true end
end

return native_tests
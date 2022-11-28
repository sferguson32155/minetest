--runs every client class; output sent to console
minetest.register_chatcommand("test_client", {
	description = "test all client classes",
	func = function()

		--fill this with all the class names to be tested
		local client_classes = {
			"camera",
			"minimap"
		}

		--test each class
		local total = 0
		local hits = 0
		for k,v in pairs(client_classes) do
			local res = minetest.registered_chatcommands["test_"..v].func()
			if res then
				hits = hits + 1
			end
			total = total + 1
		end

		--write total result to file
		native_tests.write("CLIENT TESTS COMPLETED: "..hits.." PASSED, "..total-hits.." FAILED\n\n")

		return true, "Client tests completed. See console for details."
	end
})
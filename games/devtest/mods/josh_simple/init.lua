-- LukeWasHere block (A Luke test mod)
-- A block which does absolutely nothing.
 
-- The second parameter is the block alias, which doesn't have any connection to the mod folder name.
-- The first parameter does, however, need to be IDENTICAL to your mod.conf 'name' string.
minetest.register_alias("josh", "josh:josh_block")
 
-- This block now must be registered, with the alias as it's first parameter.
minetest.register_node("josh:josh_block", {
    description = "Josh block",
    -- Make it able to be broken by hand.
    groups = {oddly_breakable_by_hand = 2},
    -- Set it's tile faces to the png that you have in the 'textures' folder.
    tiles = {"4head.png"},
    -- Make it able to be placed on the ground.
    is_ground_content = true,
    -- Make sure that the inventory image is visible too :)
    -- This step isn't COMPLETELY necessary, and you could use other minetest inventory visualization functions if you want to.
    inventory_image = minetest.inventorycube("4head.png", "4head.png", "4head.png"),
})
 
-- This step is creating a way for a user to craft this block.
minetest.register_craft({
    -- Output is just '[alias] [number of returned blocks from crafting]'
    output = 'josh:josh_block 1',
    -- Recipe is a 3x3 grid. 
    -- Note: Make sure you have the 'default:' prefix!
    recipe = {
        {'default:dirt', '', ''},
        {'default:dirt', '', ''},
        {'default:dirt', '', ''},
    }
})
minetest.register_node("mod_1:first", {
  description = "Our very first node ever!",
  tiles = {"mod_1_first.png"},
  groups = {oddly_breakable_by_hand = 2},
})

minetest.register_craft({
  output = "mod_1:first",
  recipe = {{"default:dirt", "default:dirt"}}
})

minetest.register_node("mod_1:fake_diamond", {
  description = "I can't believe this isn't diamond block",
  tiles = {"default_diamond_block.png"},
  groups = {oddly_breakable_by_hand = 2},
})

minetest.register_craft({
  output = "mod_1:fake_diamond 99",
  recipe = {
    {"mod_1:first"},
    {"mod_1:first"}
  }
})

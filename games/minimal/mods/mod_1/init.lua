minetest.register_node("mod_1:first", {
  description = "Our very first node ever!",
  tiles = {"mod_1_first.png"},
  groups = {oddly_breakable_by_hand = 2},
})

minetest.register_craft({
  output = "mod_1:first",
  recipe = {{"default:dirt", "default:dirt"}}
})

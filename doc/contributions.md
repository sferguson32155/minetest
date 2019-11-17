# Minetest Fall 2019 Senior Project Contributions #

## Samuel Whittenberger ##

* Compiled initial emscripten examples
* Found appropriate emscripten settings to compile usable wasm bytecode
* Compiled Spidermonkey from source to usable library
* Helped with linking Spidermonkey to Minetest
* Wrote WasmLoader class which uses jsapi to run js files and parse wasm data
* Wrote WasmInjector class which enables wasm files to be run from within Spidermonkey
* Established connection between wasm and Minetest engine
* Added necessary code to pass wasm data to Lua subsystem
* Added necessary functions to recognize and process wasm mods
* Created initial wasm mod

## Nick Ruspantini ##

## Luke Stumpf ##
* Project management through Trello
* Assisted other team members with initial compilation and build of Minetest
* Research into basic emscripten examples
* Researched Lua and how it interfaces with C/C++, including the following topics:
   * Lua data types
   * Lua stack
   * Passing functions and parameters between Lua and C
   * Tables, Metatables, and Metamethods
   * Started research on object orientation
* Researched how Lua works within the Minetest engine
   * Mapped out File System and contextual modding files in Minetest
   * Wrote a sample mod that loads in custom texture data and represents it in-game
* Documented and shared Lua research and diagrams from our work to this repo
## Gabriel Guzman ##

## Miranda Craghead ##
* At the very begining of the project I helped
    * research emscripten
    * with the initial install of minetest, before just cloning the GitHub account
* Got a local instance of Spidermonkey running
    * helped with the initial system setup necesssary before installing Spidermonkey 
    * error handling during installation 
* Documented meetings throughout the semester, and booked study rooms for said meetings
* General error handling
    * helped brainstorm with Luke about an emscripten compiler error
    * fixed several path name errors due to the presence of spaces
    * brainstormed with teammates and resolved several errors
* Helped add on to Samuel's mod example, by changing the mod info and recompiling to show the changes
    * got help from Luke when an emscripten compiler error was generated
* Wrote Minetest setup and error resolution documentation


# Beta Build for Minetest
## Usability:
**Interface**
Testing functions should have an intuitive naming convention, i.e l_object.cpp function name l_set_pos should be called through “/lua_object_set_pos”. Outputs from the testing data will output to the console command.

**Navigation**
When testing, error messages will be created based on unexpected results being fed to the testing functions. Using logs, such as “minetest.logs(“output error message here”..variable)” should be used where ever possible.

**Perception**
Final product should interact with the player as seamlessly and easily as possible. Testing should be intuitive and the game should operate similarly to Minetest if not exactly the same.

**Responsiveness**
When rendering the game, any noticeable FPS drops should be noted and fixed as soon as possible. The game should handle operations that involve significant input/output (I/O) operations efficiently, without causing the CPU to wait idly.

## Build Quality:
**Robustness**
Crashes should not occur during regular, unexceptional use of the application. Major or noticeable glitches should be absent from the regular user experience within the master build. Any noticeable bugs should be noted in logs and fixed as soon as possible, or noted in the work in progress functions.

**Consistency**
The application should consistently produce the same result for the same input and use cases. Any deviations from predictability should have clear and justified reasons.

**Aethsteic Rigor**
All ingame assets should be reused from the original source code. Aesthetic issues, if present, should not render the game unplayable, and all assets such as images and sounds should be functional.
## Vertical Features:
**External Interface *(Console/Chat)***
Mods are called in game and logs of actions in the game are output to a console where full crash reports, mod outputs, and chatlogs are referenced.

**Persistant State *(Mod Code)***
Each Lua function must incorporate three test functions in the final product. When interfacing the game, one of these three test functions will be referenced and the other two and compared to their pushed lua dumps.

**Internal Systems *(Source Code)***
All Lua systems in the game will be swapped with our Native functions. The testing will ensure seemless and lossless transition between the old and new game engines. 

# Beta Build for Minetest

## Week 1 (9/15 - 9/22)
Consolidated GitHubs, including MinetestLogs and Minetest-Summer-Logs, to sean-test-branch (current GitHub) to ensure legibility and easier navigation for grading.
Tried fixing issues occurring in the native tests. For example, pathing for the libraries was not linking, the native cpp was not linked with the Minetest project, and the function names for the Lua native functions were not established.
Object testing functions are now being written and tested by all members. 
### Sean - Added Functions:
* lua_object #
* lua_object_right_click
* lua_object_get_hp
* lua_object_get_inventory
* lua_object_get_wield_list
* lua_object_move_to

### Chris - Added Functions:
* lua_object_get_breath
* lua_object_set_breath
* lua_object_get_meta

## Week 2 (9/22 - 9/29)
Laid out template testing rules. For example, naming conventions (lua_object, native_object), output to_string() if available. Brought up errors within the native class with the entire team, fixed multiple errors brought up with native testing, and discussed multiple solutions to fixing native compatibility. Debug test functions, addressing missing CMakeLists.txt includes and mod inclusions. Overall, the week involved significant progress in implementing various Lua commands and resolving technical issues, along with collaboration efforts to streamline development and testing processes.

### Sean - Added Functions:
* lua_object_set_hp

### Chris - Added Functions:
* lua_object_get_attribute
* lua_object_set_attribute
* lua_object_get_fov
* lua_object_set_fov
* lua_object_get_look_dir

## Week 3 (9/29 - 10/6)
Created a comprehensive checklist for all Lua, native, and comparison tests. Added percentage functionality through AppScripts, which calculates checkbox completion percentages. A weekly meeting was held to address native testing and linker issues, and work continued on resolving related problems. Collaboration efforts included assisting a team member with debugging and fixing build errors. Throughout the week, there was a focus on developing and testing various Lua commands and functions, as well as collaborating with team members to address technical issues and documentation needs.

### Sean - Added Functions:
* lua_object_get_wield_list
* lua_object_set_wield_index
* lua_object_get_wielded_item
* lua_object_set_wielded_item
* lua_object_set_wielded_item
* lua_object_get_armor_groups
* lua_object_get_eye_offset
* lua_object_set_eye_offset
* lua_object_send_mapblock
* lua_object_get_animation
* lua_object_get_local_animation

### Chris - Added Functions:
* lua_object_get_look_pitch
* lua_object_get_look_yaw
* lua_object_get_look_horizontal
* lua_object_get_look_vertical
* lua_object_set_look_pitch
* lua_object_set_look_yaw
* lua_object_set_look_horizontal
* lua_object_set_look_vertical
* lua_object_set_sky
* lua_object_get_sky
* lua_object_get_sky_color
* lua_object_get_sun
* lua_object_get_moon
* lua_object_set_sun
* lua_object_set_moon

## Important Links:
- Minetest Native API Github: https://github.com/cacticouncil/minetest
- Minetest Native Installation Guide and Files: https://github.com/Lisa-Touchton-DEV/MinetestDocs
- Design 2 Object's Class Checklist: https://docs.google.com/spreadsheets/d/1PM4jhVm7i4OwgGq1aDPfn8IWj7l7l0uh8i5fXMeRUhU/edit?usp=sharing
- Sean Ferguson - Working Branch: https://github.com/sferguson32155/minetest/tree/sean-test-branch
- Songyuhao Shi - Work Log: https://github.com/sf1440/CEN3907Logs
- Songyuhao Shi - Working Branch: https://github.com/sf1440/Minetest

// Contents of mod.cpp
// This file is what I imagine a mod would look like for Minetest. Because of how we're ending the
// semester (moving everything to a text file), this file will define a mod class and simply have
// multiple getters. The plan is for index.js in NodeJS to call each of these and console.log them.
// The goal is to imitate all the attributes of Minetest's ItemDefinition.
// Written by Bryan Rooke - 4/7/19
// Last modified - 4/12/19
// Senior Project

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <emscripten/emscripten.h>
/*
#ifdef __cplusplus
extern "C" {
#endif
*/

EMSCRIPTEN_KEEPALIVE
void getName() { puts("default:gator_block_test"); }

EMSCRIPTEN_KEEPALIVE
void getItemType() { puts("ITEM_NODE"); }

EMSCRIPTEN_KEEPALIVE
void getDesc() { puts("Gator Block"); }

EMSCRIPTEN_KEEPALIVE
void getInventoryImage() { puts("default_gator_blue.png"); }

EMSCRIPTEN_KEEPALIVE
void getWieldImage() { puts("default_gator_blue.png"); }
/*
#ifdef __cplusplus
}
#endif
*/

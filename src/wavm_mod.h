// Contents of wavm_mod.h
// Simple header file that only has one method declaration
// Written by Bryan Rooke and Eric Daff - 2/6/19
// Last modified - 4/10/19
// Senior Project

#ifndef WAVM_MOD_H
#define WAVM_MOD_H
std::string wasm_mod(std::string message, IWritableItemDefManager *idef, LocalPlayer *player);
#endif
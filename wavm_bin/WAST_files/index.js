"use strict";

const Mod_Index = require('./mod.js');
const Wasm_Binary = Mod_Index({wasmBinaryFile: 'mod.wasm'});

Wasm_Binary.onRuntimeInitialized = function() {
    console.log(Wasm_Binary._getName());
    console.log(Wasm_Binary._getItemType());
    console.log(Wasm_Binary._getDesc());
    console.log(Wasm_Binary._getInventoryImage());
    console.log(Wasm_Binary._getWieldImage());
};

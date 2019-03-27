"use strict";

const Node_Example_Module = require('./node_example.js');
const Wasm_Binary = Node_Example_Module({wasmBinaryFile: 'node_example.wasm'});

Wasm_Binary.onRuntimeInitialized = function() {
    let mem = Wasm_Binary._create_array(2);
    console.log(Wasm_Binary._multiply_values_in_array(mem, 2457, 2));
    Wasm_Binary._destroy_array(mem);
};

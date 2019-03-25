"use strict";
const Module = require('./test.js');
const wasm = Module({wasmBinaryFile: 'test.wasm'});
wasm.onRuntimeInitialized = function() {
    console.log(wasm._add(40, 40));
    let mem = wasm._create(100, 100);
    wasm._destroy(mem);
    console.log("Done");
};

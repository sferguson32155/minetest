function utf8ToString(mem, pos) {    let s = "";    for (i = pos; mem[i]; i++) {        s += String.fromCharCode(mem[i]);    }    return s;} var buffer = new Uint8Array([0,97,115,109,1,0,0,0,1,8,2,96,0,1,127,96,0,0,3,6,5,1,0,0,0,0,5,6,1,1,128,2,128,2,7,73,6,6,109,101,109,111,114,121,2,0,7,103,101,116,78,97,109,101,0,4,14,103,101,116,68,101,115,99,114,105,112,116,105,111,110,0,3,10,103,101,116,84,101,120,116,117,114,101,0,2,11,103,101,116,77,97,116,101,114,105,97,108,0,1,6,95,115,116,97,114,116,0,0,10,29,5,3,0,1,11,5,0,65,180,8,11,5,0,65,163,8,11,5,0,65,142,8,11,5,0,65,128,8,11,11,80,2,0,65,128,8,11,64,108,117,107,101,95,109,111,100,95,119,97,115,109,0,83,105,109,112,108,101,32,76,117,107,101,32,87,97,115,109,32,77,111,100,0,76,117,107,101,87,97,115,109,72,101,114,101,46,112,110,103,0,100,101,102,97,117,108,116,58,119,111,111,100,0,65,192,12,11,3,224,6,80]);
var m = new WebAssembly.Instance(new WebAssembly.Module(buffer));var memArray = new Uint8Array(m.exports.memory.buffer);var ex = m.exports; var modInfo = {    name: utf8ToString(memArray, ex.getName()),    description: utf8ToString(memArray, ex.getDescription()),    texture: utf8ToString(memArray, ex.getTexture()),    material: utf8ToString(memArray, ex.getMaterial()),}; function getMod(mod) {    return mod;}; getMod(modInfo);
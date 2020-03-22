function calc(num) {
  WebAssembly.instantiateStreaming(fetch('calc.wasm')).then(obj =>
    obj.instance.exports.plusOne(num)
  ).then(res =>
    document.getElementById('out').innerHTML = res
  );
}

calc(9);

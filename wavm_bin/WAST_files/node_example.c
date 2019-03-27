#include <emscripten/emscripten.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

EMSCRIPTEN_KEEPALIVE
int* create_array(int length) {
        return malloc(length * sizeof(int));
}

EMSCRIPTEN_KEEPALIVE
void destroy_array(int* p){
        free(p);
}


EMSCRIPTEN_KEEPALIVE
int multiply_values_in_array(int* arr, int x, int y){
	arr[0] = x;
	arr[1] = y;

	return (int)(arr[0] * arr[1]);
}

#ifdef __cplusplus
}
#endif

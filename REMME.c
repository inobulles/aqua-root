#include "root.h"
typedef struct {        // 64 + 8 + 64 = 136 bits
	var  element1 : 64; // 64 bits
	char element2 :  8; // 8 bits
	var  element3 : 64; // 64 bits
} some_struct_t __attribute__((packed)); /* the "packed" attribute denotes
                                            that the structure will have the
                                            smallest size possible, and the
                                            compiler will try and fit all the
                                            elements nicely together */
local void some_function(var array[arraymin 5]) {
	#warning "second warning" // compiler throws warning if array length < 5
}
global var main(void) {
	some_struct_t this __attribute__((unused)); // tells the compiler to not carea
	memset(&this, 0, sizeof(this));
	
	this.element2 = 0xDE;
	print("0x%x %s\n", this.element2, STRINGIZE(HORIZONTAL));
	
	var array[3];
	some_function(array);
	
	return false;
}
 
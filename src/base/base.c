#include "../cefau3.h"

#include "include/capi/cef_base_capi.h"

#define DEBUG_REFERENCE_COUNTING 0

#define DEBUG_CALLBACK() { \
    static int first_call = 1; \
    if (first_call == 1) { \
        first_call = 0; \
    } \
}

void CEF_CALLBACK add_ref(cef_base_ref_counted_t* self) {
	DEBUG_CALLBACK();
}

int CEF_CALLBACK release(cef_base_ref_counted_t* self) {
	DEBUG_CALLBACK();
	return 1;
}

int CEF_CALLBACK has_one_ref(cef_base_ref_counted_t* self) {
	DEBUG_CALLBACK();
	return 1;
}

void initialize_cef_base_ref_counted(cef_base_ref_counted_t* base)
{
	size_t size = base->size;
	if (size <= 0) {
		_exit(1);
	}
	base->add_ref = add_ref;
	base->release = release;
	base->has_one_ref = has_one_ref;
}
#include "../cefau3.h"

CEFAU3API void IntPtr_Set(int *self, int value)
{
	*self = value;
}

CEFAU3API int IntPtr_Get(int *self)
{
	return *self;
}

CEFAU3API void LongPtr_Set(long *self, long value)
{
	*self = value;
}

CEFAU3API long LongPtr_Get(long *self)
{
	return *self;
}

CEFAU3API void DoublePtr_Set(double *self, double value)
{
	*self = value;
}

CEFAU3API double DoublePtr_Get(double *self)
{
	return *self;
}
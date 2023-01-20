/* 
 * Filename: Assn1_main.c
 *
 * Description: Test driver for Assn1_Q3.c
 *
 * Auhtors: AL + Duc Manh To
 * Student number: 301425895
 */
 
#include <stdio.h>
#include <stdlib.h>

typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer, size_t);
void show_bytes_2(byte_pointer, size_t);
void show_bits(int);
void show_int(int);
void show_float(float);
void show_pointer(void *);
int  mask_LSbits(int);

int main() {
    int ival = 12345;
    float fval = (float) ival;
    int *pval = &ival;

    show_int(ival);
    show_float(fval);
    show_pointer(pval);

    //Test for Q3 a,b, and c
    int test = 54321;
    int* testone = &test;
    show_pointer(testone);

    //Test for Q3 d
    int a = 5678,b = -3271,c = -10;
    show_bits(a);
    show_bits(b);
    show_bits(c);

    //Test for Q3 e
    show_int(mask_LSbits(5));
    show_int(mask_LSbits(987654));
    show_int(mask_LSbits(-2));

    return 0;

}
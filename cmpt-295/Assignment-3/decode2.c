/* 
 * Filename: decode2.c
 *
 * Description: Translation C code for assembly code in question 3.58
 *
 * Auhtors: Duc Manh To
 * Student number: 301425895
 * Modification date: Feb, 2023
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * Prototype assembly code:
 *
 *  1   subq    %rdx, %rsi
 *  2   imulq   %rsi, %rdi
 *  3   movq    %rsi, %rax
 *  4   salq    $63, %rax
 *  5   sarq    $63, %rax
 *  6   xorq    %rdi, %rax
 *  7   ret
*/

long decode2(long x, long y, long z){

    long answer;

    //Line 1: y - z -> y
    y -= z;
    //Line 2: x * y -> x
    x *= y;
    //Line 3 -> 6: y -> answer
    //             Shift answer left 63 bits
    //             Arithmetically shift answer right 63 bits
    //             answer ^ x -> answer
    answer = ((y << 63) >> 63) ^ x;

    //Line 7: ret
    return answer;
}

int main(int argc,char* argv[]){

    long x, y, z;

    if (argc == 4) {
        //Convert the arguments into long 
        x = strtol(argv[1], NULL, 10);
        y = strtol(argv[2], NULL, 10);
        z = strtol(argv[3], NULL, 10);

        long answer = decode2(x, y, z);
        printf("The result of the function decode2 with parameter %ld, %ld, %ld is %ld.\n", x, y, z, answer);
    }
    else {
        printf("Wrong argument format.\n");
    }
        

    return 0;
}

//End of C file
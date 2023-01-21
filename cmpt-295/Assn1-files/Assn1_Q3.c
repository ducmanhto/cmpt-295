/* 
 * Filename: Assn1_Q3.c
 *
 * Description: Code for Assignment 1 Q3 
 *
 * Auhtors: AL + Duc Manh To
 * Student number: 301425895
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char *byte_pointer;

// Question 3 a.
void show_bytes(byte_pointer start, size_t len) {
  size_t i;
  for (i = 0; i < len; i++)
    printf(" %p 0x%.2x \n", start + i, start[i]); 	
  printf("\n");
  return;	
}

// Question 3 b.
// Put your answer to Question 3 b) here as a comment
// The target machine is a little endian computer as the LSB is stored at the lowest numbered memory address.
// Based on the data of two test cases:
// pval = 0x7ffe8604c864
// 0x7ffe8604c848 0x64 
// 0x7ffe8604c849 0xc8 
// 0x7ffe8604c84a 0x04 
// 0x7ffe8604c84b 0x86 
// 0x7ffe8604c84c 0xfe 
// 0x7ffe8604c84d 0x7f 
// 0x7ffe8604c84e 0x00 
// 0x7ffe8604c84f 0x00

// pval = 0x7ffe8604c860
// 0x7ffe8604c848 0x60 
// 0x7ffe8604c849 0xc8 
// 0x7ffe8604c84a 0x04 
// 0x7ffe8604c84b 0x86 
// 0x7ffe8604c84c 0xfe 
// 0x7ffe8604c84d 0x7f 
// 0x7ffe8604c84e 0x00 
// 0x7ffe8604c84f 0x00

// Question 3 c.
void show_bytes_2(byte_pointer start, size_t len) {
  size_t i;
  byte_pointer p = start;
  for (i = 0; i < len; i++)
    printf(" %p 0x%.2x \n",start + i , *(start + i)); 	
  printf("\n");
  return;		
}

// Question 3 d.
void show_bits(int decimal) {
	
  // Fill up an array for the bit pattern
  const int SIZE = sizeof(int)*8;
  int binary[SIZE];
  memset(binary, 0, sizeof(binary));

  //Covert the decimal into positive bit pattern
  int i, clone = decimal;
  for(i = SIZE - 1; i >= 0; i--) {
    binary[i] = clone % 2;
    if (binary[i] < 0)
      binary[i] *= -1; 
    clone = clone / 2;
  }

  //If the decimal is negative then convert into two's complement negative
  //bit pattern 
  if(decimal < 0) {

    //Invert the bit pattern
    for(i = 0; i < SIZE; i++) {
      if(binary[i] == 0) 
        binary[i] = 1;
      else
        binary[i] = 0;
      }
    
    //Add 1 to the bit pattern
    for(i = SIZE - 1; i >= 0; i--) {
      if(binary[i] == 0) {
        binary[i] = 1;
        break;
      } 
      else
        binary[i] = 0;
      }
  }

  //Print the bit pattern
  printf("Binary: ");
  for(i = 0; i < SIZE; i++) {
    printf("%d", binary[i]);
  }
  printf("\n");

  return; 
}	


// Question 3 e.
int mask_LSbits(int n) {
	
  //Declare size and answer
  int answer = 0;
  int size = sizeof(int)*8;
  
  if (n >= size)
    return ~answer; //Return decimal with bit pattern of all 1s
  else if (n <= 0)
    return answer;  //Return decimal with bit pattern of all 0s
  else
    return (~(unsigned)answer >> (size - n)); //Return answer after complementing 
                                              //and logically shifting right
}

void show_int(int x) {
  printf("\nival = %d\n", x); 
  show_bytes((byte_pointer) &x, sizeof(int)); 
  show_bytes_2((byte_pointer) &x, sizeof(int)); 
  return;	
}

void show_float(float x) {
  printf("fval = %f\n", x); 	
  show_bytes((byte_pointer) &x, sizeof(float));
  show_bytes_2((byte_pointer) &x, sizeof(float)); 
  return;	
}

void show_pointer(void *x) {
  printf("pval = %p\n", x); 
  show_bytes((byte_pointer) &x, sizeof(void *));
  show_bytes_2((byte_pointer) &x, sizeof(void *));
  return;	
}

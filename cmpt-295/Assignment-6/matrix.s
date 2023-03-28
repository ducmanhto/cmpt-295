# matrix.s
# Description: Program to rotate a 2d matrix 90 degrees clockwise
# Name: Duc Manh To, Van Khai Nguyen
# Student number: 301425895, 301538378
# Date modified: March 2023

    .globl    copy
# ***** Version 2 *****
copy:
# A in %rdi, C in %rsi, N in %edx

# Using A and C as pointers

# This function is not a "caller", i.e., it does not call functions. 
# It is a leaf function (a callee). 
# Hence it does not have the responsibility of saving "caller-saved" registers 
# such as %rax, %rdi, %rsi, %rdx, %rcx, %r8 and %r9.
# This signifies that it can use these registers without 
# first saving their content if it needs to use registers.

# Set up registers
    xorl %eax, %eax            # set %eax to 0
    xorl %ecx, %ecx            # i = 0 (row index i is in %ecx)

# For each row
rowLoop:
    xorl %r8d, %r8d            # j = 0 (column index j in %r8d)
    cmpl %edx, %ecx            # while i < N (i - N < 0)
    jge doneWithRows

# For each cell of this row
colLoop:
    cmpl %edx, %r8d            # while j < N (j - N < 0)
    jge doneWithCells

# Copy the element A points to (%rdi) to the cell C points to (%rsi)
    movb (%rdi), %r9b          # temp = element A points to
    movb %r9b, (%rsi)          # cell C points to = temp

# Update A and C so they now point to their next element 
    incq %rdi
    incq %rsi

    incl %r8d                  # j++ (column index in %r8d)
    jmp colLoop                # go to next cell

# Go to next row
doneWithCells:
    incl %ecx                  # i++ (row index in %ecx)
    jmp rowLoop                # go to next row

doneWithRows:                  # bye! bye!
    ret


#####################
	.globl	transpose
transpose:
# A in %rdi, N in %esi

# Set up registers
    xorl %eax, %eax            # set %eax to 0
    xorl %edx, %edx            # i = 0 (row index i is in %edx)

# Loop for each row
loopRow:
    xorl %ecx, %ecx            # j = 0 (column index j in %ecx)
    cmpl %esi, %edx            # while i < N (i - N < 0)
    jge rowsDone

# Loop for each cell in the row
loopCol:
    cmpl %esi, %ecx            # while j < N (j - N < 0)
    jge cellsDone    

# Swap element A[i][j] with elements A[j][i]
# Memory computation: A[j][i] = A + (j-i)*(N-1)

    movl %ecx, %r10d           # r10d = j
    subl %edx, %r10d           # r10d = j - i
    movl %esi, %r11d           # r11d = N 
    decl %r11d                 # r11d = N - 1
    imull %r11d, %r10d         # r10d = (j-i)*(N-1)
    addq %rdi, %r10            # r10 = A + (j-i)*(N-1)

    cmpl %edx, %ecx            # Only swap if j > i
    jl update

    movb (%rdi), %r8b          # temp1 = A[i][j]
    movb (%r10), %r9b          # temp2 = A[j][i]
    movb %r9b, (%rdi)          # A[i][j] = temp2
    movb %r8b, (%r10)          # A[j][i] = temp1

# Update A so it points to the next element
update:
    incq %rdi

    incl %ecx                  # j++
    jmp loopCol                # go to next cell

cellsDone:
    incl %edx                  # i++ (row index in %edx)
    jmp loopRow                # go to next row

rowsDone:
    ret

#####################
	.globl	reverseColumns
reverseColumns:
# A in %rdi, n in %esi

# Set up registers
    xorl %eax, %eax            # set %eax to 0
    xorl %edx, %edx            # i = 0 (row index i is in %edx)

# Loop for each row
loopRows:
    xorl %ecx, %ecx            # j = 0 (column index j in %ecx)
    cmpl %esi, %edx            # while i < n (i - n < 0)
    jge doneRows
 
# Loop for each cell in the row up to cell (n/2) - 1
loopCols:
    movl %esi, %r10d           # temp = n
    shrl $1, %r10d             # temp = n/2
    cmpl %r10d, %ecx           # while j < (n/2) (j - (n/2) < 0)
    jge doneCells    

# Swap element A[i][j] with elements A[i][n-1-j]
# Memory computation: A[j][i] = A + n - 1 - 2j

    movl %ecx, %r11d           # r11d = j
    imull $2, %r11d            # r11d = 2j
    negl %r11d                 # r11d = -2j 
    decl %r11d                 # r11d = -2j - 1
    addl %esi, %r11d           # r11d = n - 1 - 2j
    addq %rdi, %r11            # r10 = A + n - 1 - 2j

    movb (%rdi), %r8b          # temp1 = A[i][j]
    movb (%r11), %r9b          # temp2 = A[i][n-1-j]
    movb %r9b, (%rdi)          # A[i][j] = temp2
    movb %r8b, (%r11)          # A[i][n-1-j] = temp

# Update A so it points to the next element
    incq %rdi

    incl %ecx                  # j++
    jmp loopCols               # go to next cell

doneCells:
    incl %edx                  # i++ (row index in %edx)
# Update A so it points to the first element of the next line
    movl %esi, %r10d           # temp4 = n
    subl %ecx, %r10d           # temp4 = n - j
    addq %r10, %rdi            # A += (n-j)
    
    jmp loopRows               # go to next row

doneRows:
    ret

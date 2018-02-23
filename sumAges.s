# Add the ages of a bunch of people.

# %edi - holds the current position
# %ebx - hold the current sum of ages so far
# %eax - holds the current element being examined
# %ecx - holds the length of data_items

# Last element in the list will have a value of 0.

.section .data

data_items:
 .long 6,6,7,7,6,7,5,6,6,6,7,6,6,7,7,6,7,5,6,6,6,7,6,7,6

data_sentinel:
 .long 0			        # item after the array, so we know when to stop

.section .text

.globl _start
 _start:
 movl $0, %edi			    # Move 0 into the index register - first item
 movl data_sentinel, %ecx	# Set %ecx to the value after data_items
 movl data_items(,%edi,4), %ebx	# Load the first bytes of data, make that the current sum
 
start_loop:
 cmpl data_items(,%edi,4), %ecx	# Check if next item is the address that follows all the data
 je loop_exit			    # Jump to loop_exit
 incl %edi			        # increment the loop index
 addl data_items(,%edi,4), %ebx		    # Add the value in eax to the value in ebx
 jmp start_loop			    # Jump to loop beginning

loop_exit:
 # the value on %ebx is normally the return code.  It's our sum, so just return that on exit.
 movl $1, %eax			    # 1 is the exit() syscall
 int $0x80                  # interrupt 80 means make the syscall (this tells the OS to exit the application).

# Build:
# as sumAges.s -o sumAges.o; ld sumAges.o -o sumAges
# Run and then echo the return code:
# ./sumAges; echo $?

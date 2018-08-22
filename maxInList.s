# Search a list to find the largets number.

# %edi - holds the current position
# %ebx - hold the current highest value
# %eax - holds the current element being examined
# %ecx - holds the length of data_items

# Last element in the list will have a value of 0.

.section .data

data_items:
 .long 3,67,34,222,45,75,54,34,44,250,33,22,11,251

data_sentinel:
 .long 0			# item after the array, so we know when to stop

.section .text

.globl _start
 _start:
 movl $0, %edi			# Move 0 into the index register - first item
 movl data_items(,%edi,4), %eax	# Load the first bytes of data
 movl %eax, %ebx		# Since this is the first item, it's the biggest
 movl data_sentinel, %ecx	# Set %ecx to the address after data_items

start_loop:
 cmpl data_items(,%edi,4), %ecx	# Check if next item is at the sentinel address
 je loop_exit			# Jump to loop_exit
 incl %edi			# increment the loop index
 movl data_items(,%edi,4), %eax	# load next number
 cmpl %ebx, %eax		# Compare the two to see which is bigger
 jle start_loop			# Jump to start_loop if new one isn't bigger
 movl %eax, %ebx		# If new one is bigger, store it in %ebx
 jmp start_loop			# Jump to loop beginning

loop_exit:
 movl $1, %eax			# 1 is the exit() syscall
 int $0x80

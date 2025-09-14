;; Definition of the data section. Comments in asm start with the ; symbol.
;; The data section is used to declare static data with lifetime equal to 
;; the program's lifetime. 
section .data
	;; String variable with the value 'hello, world!'
	msg db "hello, world!"

;; Definition of the text section.
;; The text section contains instructions for the program.
;; We specify the entry point in the text section of the program so that 
;; the linker can find it. Thus, the entry point symbol must be defined as 
;; global so that the symbol _start is visible to the linker.
section .text
	;; Reference to the entry point of the program
	global _start

;; Definition of the program entry point
_start:
	;; Specify the number of the system call (1 is 'sys_write').
	;; ssize_t write(int fd, const void buf[.count], size_t count)
	;; fd - The file descriptor that specifies where to write data
	;; buf - The pointer to the buffer from which data will be written to the file specified by fd
	;; count - The number of bytes that will be written from the buffer to the file specified by fd
	mov rax, 1
	;; Set the first argument of 'sys_write' to 1 (stdout).
	mov rdi, 1
	;; Set the second argument of 'sys_write' to the reference of the 'msg' variable.
	mov rsi, msg
	;; Set the third argument of 'sys_write' to the length of the 'msg' variable's value (13 bytes).
	mov rdx, 13
	;; Call the 'sys_write' system call.
	syscall

	;; Specify the number of the system call (60 is 'sys_exit').
	;; We must add sys_exit, as building and running only the above lines would produce a segmentation fault.
	;; We need to exit properly from the program.
	mov rax, 60
	;; Set the first argument of 'sys_exit' to 0. The 0 status code is success.
	mov rdi, 0
	;; Call the 'sys_exit' system call.
	syscall



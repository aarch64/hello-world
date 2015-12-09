.text 			// code section
.globl _start
_start:
	mov x0, 0 	// stdout has file descriptor 0
	ldr x1, =msg 	// buffer to write
	mov x2, msg_len	// size of buffer
	mov x8, 64 	// sys_write() is at index 64 in kernel functions table
	svc #0 		// generate kernel call sys_write(stdout, msg, len);

	mov x0, 123 	// exit code
	mov x8, 93 	// sys_exit() is at index 93 in kernel functions table
	svc #0 		// generate kernel call sys_exit(123);

.data			// data section
msg: 
	.ascii "\nHello from Docker.\n\
\b\bThis message shows that your installation appears to be working correctly.\n\n\
\b\bTo generate this message, Docker took the following steps:\n\
\b\b 1. The Docker client contacted the Docker daemon.\n\
\b\b 2. The Docker daemon pulled the \"hello-world\" image from the Docker Hub.\n\
\b\b 3. The Docker daemon created a new container from that image which runs the\n\
\b\b    executable that produces the output you are currently reading.\n\
\b\b 4. The Docker daemon streamed that output to the Docker client, which sent it\n\
\b\b    to your terminal.\n\n\
\b\bTo try something more ambitious, you can run an Ubuntu container with:\n\
\b\b $ docker run -it ubuntu bash\n\n\
\b\bShare images, automate workflows, and more with a free Docker Hub account:\n\
\b\b https://hub.docker.com\n\n\
\b\bFor more examples and ideas, visit:\n\
\b\b https://docs.docker.com/userguide/\n\n"

msg_len = . - msg 

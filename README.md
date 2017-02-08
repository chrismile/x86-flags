## x86-flags
Assembler program for testing the behavior of x86 flags (using 32-bit assembly code).

To compile this program, you need to install the following packages on 64-bit x86 Ubuntu:

`sudo apt-get install gcc-multilib nasm`

Then launch "make" in the directory of the project.


## Usage

The program prints the carry, zero, sign and overflow flag set by the assembly code at the section "PUT CODE TO TEST HERE".

Change the code there, and then recompile the program using make.



## License

Copyright (c) 2017, Christoph Neuhauser

BSD 3-Clause License (for more details see LICENSE file)

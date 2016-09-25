// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R0
D = M
@A
M = D	// A = R0

@R1
D = M
@B
M = D	// B = R1

@R2
M = 0	// Initialize product to zero

//We will add A to itself B times, to calculate A*B.
//	i = 0,sum = 0;
//	while(i < B)
//  {
//		sum = sum + A;
//		i++;
//	}
//	product = sum;

@i
M = 0  //	i = 0
@sum
M = 0  //	sum = 0

(LOOP)
@B
D = M
@i
D = M - D	//	D = i - B
@LOOPEND
D;JEQ		
@A
D = M
@sum
M = M + D	//	sum = sum + A
@i
M = M + 1	//	i++
@LOOP
0;JMP

(LOOPEND)
@sum
D = M
@R2
M = D

(END)
@END
0;JMP
// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(INFINITELOOP)
@KBD
D = M

@KEYNOTPRESSED
D;JEQ

@8192
D = A
@n
M = D //n=8192
@i
M = 1     // i=1

@SCREEN   //16384
D = A
@addr
M = D  // addr = SCREEN = 16384

(LOOP)
@addr
A = M
M = -1
@addr
M = M + 1  //addr = addr+1
@i
M = M + 1  //i=i+1
@i
D = M
@n
D = D - M  //i = i - n
@INFINITELOOP
D;JGT
@LOOP
0;JMP

@INFINITELOOP
D;JMP

(KEYNOTPRESSED)
@i
M = 1     // i=1

@SCREEN   //16384
D = A
@addr
M = D  // addr = SCREEN = 16384

(LOOP1)
@addr
A = M
M = 0
@addr
M = M + 1  //addr = addr+1
@i
M = M + 1  //i=i+1
@i
D = M
@n
D = D - M  //i = i - n
@INFINITELOOP
D;JGT
@LOOP1
0;JMP

@INFINITELOOP
D;JMP

@INFINITELOOP
D;JMP




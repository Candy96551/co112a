// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// 初始化屏幕地址到 R0 寄存器
@SCREEN
D=A
@R0
M=D

(LOOP)
// 檢查是否有按鍵被按下
@KBD
D=M
@NO_KEY_PRESSED
D;JEQ // 如果沒有按鍵被按下，跳轉到 NO_KEY_PRESSED

// 按鍵被按下，將所有像素設為黑色
@R0
A=M
D=-1 // 設置像素為黑色

@LOOP
0;JMP // 跳回迴圈的開頭

(NO_KEY_PRESSED)
// 沒有按鍵被按下，將所有像素設為白色
@R0
A=M
D=0 // 設置像素為白色

@LOOP
0;JMP // 跳回迴圈的開頭

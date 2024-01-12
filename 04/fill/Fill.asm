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

(FOREVER)
    @KBD     // 檢查鍵盤是否被按下
    D=M      // D = *KBD
    @NO_KEY_PRESSED
    D;JEQ   // 如果 *KDB==0，跳轉到 NO_KEY_PRESSED

    // 鍵盤被按下，將整個屏幕設為黑色
    @SCREEN
    D=A
    @R0
    M=D        // 將屏幕地址存入 R0

    @4096      // 設置迴圈計數器（螢幕大小）
    D=A
    @BLACK_LOOP
    M=D

(BLACK_LOOP)
    @R0    // 取得屏幕地址
    D=M    // 使用 D 寄存器中的屏幕地址作為目標地址
    A=D    // 使用 A 寄存器中的屏幕地址作為目標地址
    M=-1   // 設置像素為黑色
    @BLACK_LOOP
    M=M-1  // 迭代次数减1
    D=M
    @BLACK_LOOP
    D;JGT  // 如果还有迭代次数，继续循环

    @FOREVER  // 回到 FOREVER，持續檢查鍵盤狀態
    0;JMP

(NO_KEY_PRESSED)
    // 沒有按下鍵盤，將整個屏幕設為白色
    @SCREEN
    D=A
    @R0
    M=D        // 將屏幕地址存入 R0

    @8192      // 設置迴圈計數器（螢幕大小）
    D=A
    @WHITE_LOOP
    M=D

(WHITE_LOOP)
    @R0    // 取得屏幕地址
    D=M    // 使用 D 寄存器中的屏幕地址作為目標地址
    A=D    // 使用 A 寄存器中的屏幕地址作為目標地址
    M=0    // 設置像素為白色
    @WHITE_LOOP
    M=M-1  // 迭代次数减1
    D=M
    @WHITE_LOOP
    D;JGT  // 如果还有迭代次数，继续循环

    @FOREVER  // 回到 FOREVER，持續檢查鍵盤狀態
    0;JMP


/**
*
* @ HANGMAN GAME
* @ author IONUT BOSTAN
*
**/

/***************************
* displays the win message *
****************************/


win_message:
	push {r0-r3, lr}
	ldr r0, =you_won1
	bl puts
	ldr r0, =you_won2
	bl puts
	ldr r0, =you_won3
	bl puts
	ldr r0, =you_won4
	bl puts
	ldr r0, =you_won5
	bl puts
	ldr r0, =you_won6
	bl puts
	ldr r0, =you_won7
	bl puts
	ldr r0, =you_won8
	bl puts

	pop {r0-r3, lr}
	bx lr

/***************************
* displays the welcome message *
****************************/

welcome_message:
	push {r0-r3, lr}
	ldr r0,=hangman1
	bl puts
	ldr r0,=hangman2
	bl puts
	ldr r0,=hangman3
	bl puts
	ldr r0,=hangman4
	bl puts
	ldr r0,=hangman5
	bl puts
	ldr r0,=hangman6
	bl puts
	ldr r0,=creator
	bl puts
	ldr r0,=wel_message
	bl puts
	ldr r0,=wel_messagey
	bl puts
	ldr r0,=start_message
	bl puts
	pop {r0-r3, lr}
	bx lr

/***********************************
* displays the start game  message *
************************************/

start_game_message:
	push {r0-r3, lr}
	ldr r0, =ask_message @ print message 2 on terminal
	bl puts
	ldr r0, =blanks
	bl puts
	pop {r0-r3, lr}
	bx lr

/*********************************
* displays the guesed characters *
**********************************/

good:
	push {r0-r3, lr}
	ldr r0,=space
	bl puts	
	ldr r0,=blanks
	bl puts
	pop {r0-r3, lr}
	bx lr

/*****************************
* displays the first hangman *
******************************/

wrong_guess1:
	push {r0-r3, lr}
	ldr r0, =wrong_message1
	bl puts
	ldr r0, =try_again
	bl puts
	ldr r0,=space
	bl puts
	@ldr r0,=blanks
	@bl puts
	pop {r0-r3, lr}
	bx lr

/****************************
* displays the 2'nd hangman *
*****************************/
	
wrong_guess2:
	push {r0-r3, lr}
	ldr r0, =wrong_message2
	bl puts
	ldr r0, =try_again
	bl puts
	ldr r0,=space
	bl puts
	@ldr r0,=blanks
	@bl puts
	pop {r0-r3, lr}
	bx lr

/****************************
* displays the 3'rd hangman *
*****************************/

wrong_guess3:
	push {r0-r3, lr}
	ldr r0, =wrong_message3
	bl puts
	ldr r0, =try_again
	bl puts
	ldr r0,=space
	bl puts
	@ldr r0,=blanks
	@bl puts
	pop {r0-r3, lr}
	bx lr

/****************************
* displays the 4'th hangman *
*****************************/

wrong_guess4:
	push {r0-r3, lr}
	ldr r0, =wrong_message4
	bl puts
	ldr r0, =try_again
	bl puts
	ldr r0,=space
	bl puts
	@ldr r0,=blanks
	@bl puts
	pop {r0-r3, lr}
	bx lr

/****************************
* displays the 5'th hangman *
*****************************/

wrong_guess5:
	push {r0-r3, lr}
	ldr r0, =wrong_message5
	bl puts
	ldr r0, =try_again
	bl puts
	ldr r0,=space
	bl puts
	@ldr r0,=blanks
	@bl puts
	pop {r0-r3, lr}
	bx lr

/****************************
* displays the 6'th hangman *
*****************************/

wrong_guess6:
	push {r0-r3, lr}
	ldr r0,=wrong_message6
	bl puts
	ldr r0,=try_again
	bl puts
	ldr r0,=space
	bl puts
	@ldr r0,=blanks
	@bl puts
	pop {r0-r3, lr}
	bx lr

/****************************
* displays the 7'th hangman *
*****************************/

wrong_guess7:
	push {r0-r3, lr}
	ldr r0,=wrong_message7
	bl puts
	ldr r0,=game_over_msg
	bl puts
	ldr r0,=space
	bl puts
	ldr r0,=secretWord
	bl puts
	@ldr r0,=blanks
	@bl puts
	pop {r0-r3, lr}
	bx lr

/***********************************
* displays the not allowed message *
************************************/

not_allowedx:
	push {r0-r3, lr}
	ldr r0,=not_allowed
	bl puts
	pop {r0-r3, lr}
	bx lr

/************************ 
* selects a random word *
*************************/

random_word:
	push {r0-r2,r4-r10,lr}
	mov r0, #0
	bl time
	bl srand
	bl rand
	and r0, r0, #0x0F

	mov r7, #9	
	udiv r5, r0, r7		
	mul r8, r5, r7		
	sub r6, r0, r8		

	ldr	r0, =secretMessage0
	mov r4, #11	
	mul r5, r6, r4		
	add r0, r0, r5	
	
	// here I am tying to copy the string from r0 to r3 //
	mov r10,#0
	l1:
	ldrb r3, [r0]
	cmp r0,#0
	beq l2
	add r10,#1
	b l1
	l2:

	pop	{r0-r2,r4-r10,lr}
	bx lr



/*****************************************************************
*  compares the secret word with the updated blanks for equality *
******************************************************************/

compare_for_equality:
	push {r0-r8, lr}	
	ldr r1, =secretWord		@ r1 points to secret word
	ldr r0,=blanks			@ r0 points to blanks
	mov r2,#0				@ set r0 to 0
	mov r4,#0				@ set r4 to 0
	mov r8,#0				@ set r8 to 0
county:
	add r5, r2, r1				
	ldrb r3, [r5]			@ loads into r3  char from r1 
	add r6, r4, r0
	ldrb r7, [r6]			@ loads into r7 char from r0


	cmp r3, r7				@ compares for equality
	addeq r8,#1				@ increments r8 by 1 if equal

	cmp r3, #0				@ check for end of secretWord string
	beq skip
	cmp r7, #0				@ check for end of blanks string
	beq skip

	add r4, #1				@ increments r4, r2 by 1
	add r2, #1
	b county
	
	skip:
		sub r8, #1			@ sub 1 from r8 because it has added 1 when the strings are both 0
		cmp r8, r2			@ if equal means that we have a match
		bne skipy			
		cmp r8, r2				
		bleq win_message	@ if matches display the win message
		cmp r8, r2
		beq quit_game
	skipy:
	pop {r0-r8, lr}
	bx lr

/******************************************************************************************** 
*  searches through all good and bad guesse to identify if a character has been used before *
*********************************************************************************************/

see_if_exists:
	push {r0-r8,lr}
	ldr r1, =secretWord		@ r1 points to secret word
	ldr r0,=track			@ r0 points to track
	mov r2,#0				@ set r0 to 0
	mov r4,#0				@ set r4 to 0
	mov r8,#0				@ set r8 to 0
comp1:
	add r5, r2, r1				
	ldrb r3, [r5]			@ loads into r3  char from r1 
	add r6, r4, r0
	ldrb r7, [r6]			@ loads into r7 char from r0
	
	cmp r3, r7
	ldreq r0,=already_guest
	bl printf
	cmp r3, r7
	beq jump
	
	add r4,#1
	add r2,#1
	b comp1

jump:
	pop {r0-r8, lr}
	bx lr

		
/*******
* main *
********/

.global main
main:

	mov r11, #1			@ sets count for wrong guesses
	bl welcome_message
	b start_game	

/***********************************************************************************************************
* if r10 is greater than 0 it means that we have at least one correct guess and we skip back to start_game *
* if r10 is 0 we have no correct guesses, therfore add 1 to r11 and display the relevant hangman           *
************************************************************************************************************/

count:

	cmp r10,#0			@ if 1 it means that we have 0 guess 
	bne  start_game
		
	add r11, #1
	
	cmp r11, #2
	beq wrong_guess1   @ if equal display the first hangman

	cmp r11, #3
	beq wrong_guess2   @ if equal display next hangman

	cmp r11, #4
	beq wrong_guess3   

	cmp r11, #5
	beq wrong_guess4

	cmp r11, #6
	beq wrong_guess5
	
	cmp r11, #7
	beq wrong_guess6

	cmp r11, #8
	beq wrong_guess7
	
	cmp r11,#9
	bleq game_over	@ if equal we have run out of guesses, display game over ascii

	cmp r11, #9
	beq quit_game   @ quit game

	b start_game

/********************************
*  displays the game over ascii *
*********************************/

game_over:
push {r0-r3, lr}	
	ldr r0,=game_over1
	bl puts
	ldr r0,=game_over2
	bl puts
	ldr r0,=game_over3
	bl puts
	ldr r0,=game_over4
	bl puts
	ldr r0,=game_over5
	bl puts
	ldr r0,=game_over6
	bl puts
pop {r0-r3, lr}
bx lr

/*********************************************
* start_game used to:						 *
* read a character from keyboard,			 *
* convert to uppercase if needed,			 *			 
* compare the character with the secret word *
* validate the character					 *
**********************************************/

start_game:
	bl start_game_message
	mov r0, #0					@ input from keyboard
	ldr r1, =letter_read		@ load input in r1
	mov r2, #1					@ read one char
	mov r7, #3					@ system call to read from keyboard
	svc 0

/************************************	
* converts the input into uppercase *
*************************************/									

	ldr r1, =letter_read	@ copy address to char
	ldrb r0, [r1]			@ load char in r0
	cmp r0, #48				@ if user input is 0 go to quit_game
	beq quit_game

	bic r0, r0, #32			@ converts to uppercase
	str r0, [r1]			@ store char in r0

/**************************************
* writes converted letter to terminal *
***************************************/
	mov r0, #1				@ output to monitor
	ldr r1, =letter_read	@ print char in char
	mov r2, #1				@ number of char to write
	mov r7, #4				@ sys call to output on screen
	svc 0

/************************************************************
* searches through the secret word for the converted letter *
*************************************************************/

	ldr r3, =secretWord		@ r3 point to the beggining of the secretWord
@	bl random_word			@ selects a random word fom the array (not working)
@	bl secret_word			@ grab the secret word from an external file called secret_word (not working :(, it goes into an infinite loop if used)
	mov r4, #0				@ keeps the count for the loop
	mov r10, #0				@ sets good guess count to 0
loop:
	add r5, r4, r3
	ldrb r6, [r5]			@ load the character from address r5 into r6
	ldrb r0, [r1]			@ load the value from the memory location into register r0
@	b keep_track			@ function to keep track of all guesses
@loopzx:	
	cmp r0, r6
	addeq r10,#1			@ if there are any corect guesses add 1 to r10

	cmp r0, #48
	beq quit_game			@ if player selects 0, quits the game

	cmp r0, #65
	bllt not_allowedx		@ cheks for valid input
	cmp r0, #65
	blt start_game			@ if invalid go back to start_game
				
	cmp r0, r6				@ check if r0 and r6 are equal
	beq good_guess			@ if equal  go to good_guess
		
loopy:
	cmp r6, #0				@ check for the end of string
	beq count				@ if we reach the end of the string go to count

loopz:
	add r4, #1				@ increments the count by 1
	b loop

/******************************************* 
 * if guess is  correct, update the blanks *
 *******************************************/

good_guess:

	ldr r9,=blanks			@ r9 points to blanks
	add r9, r4				
	strb r0, [r9]			@ stores character at the correct index
	bl compare_for_equality	@ 
	bl good		
	b loopy


/*********************************
*  keeps track of all the guesses *
**********************************/

@keep_track:
@	ldr r8,=track
@	add r8,#1
@	strb r0, [r8]
@	bl see_if_exists
@	b loopzx

/******************************************
* function to quit or to restart the game *
*******************************************/

quit_game:
	push {r0-r3,lr}
	ldr r0, =quit_message		@ displays message
	bl printf

	ldr r0, =format
	ldr r1, =number
	bl scanf

	ldr r1, =number
	ldr r1, [r1]
	cmp r1, #0
	beq end
	b main

	pop {r0-r3, lr}
	bx lr

end:
	mov r7, #1
	svc 0

.data
.align 2
secretWord: .asciz "TESTS"
space: .asciz "\n "
creator: .asciz "BY IONUT BOSTAN"

good_guess_message: .asciz "\n GOOD GUESS"
try_again: .asciz "\n WRONG GUESS, TRY AGAIN!"
.align 2
track: .asciz "__________"
already_guest: .asciz "YOU ALREADY GUESS THIS CHARACTER, TRY ANOTHER"
not_allowed: .asciz " "
@not_allowed: .asciz "NOT ALLOWED, PLEASE ENTER A CHARACTER FROM A TO Z"
wel_message: .asciz "WELCOME TO THE HANG GAME"
wel_messagey: .asciz "YOU CAN PRESS 0 TO QUIT THE GAME AT ANY TIME"
ask_message: .asciz "ENTER A CHARACTER FROM A TO Z"
.align 2

/********************* 
* HANG MAN ASCII ART *
**********************/

start_message: .asciz "\n|--------|\n|        |\n|\n|\n|\n|\n|\n|\n___________ \n" 
wrong_message1: .asciz "\n|--------|\n|        |\n|        0\n|\n|\n|\n|\n|\n___________ \n"
wrong_message2: .asciz "\n|--------|\n|        |\n|        0\n|        |\n|\n|\n|\n|\n___________ \n"
wrong_message3: .asciz "\n|--------|\n|        |\n|        0\n|       \\|\n|\n|\n|\n|\n___________ \n"
wrong_message4: .asciz "\n|--------|\n|        |\n|        0\n|       \\|/\n|\n|\n|\n|\n___________ \n"
wrong_message5: .asciz "\n|--------|\n|        |\n|        0\n|       \\|/\n|        |\n|\n|\n|\n___________ \n"
wrong_message6: .asciz "\n|--------|\n|        |\n|        0\n|       \\|/\n|        |\n|       /\n|\n|\n___________ \n"
wrong_message7: .asciz "\n|--------|\n|        |\n|        0\n|       \\|/\n|        |\n|       / \\\n|\n|\n___________ \n"


/** LEAVE GAME MESSAGES**/
quit_message: .asciz "PLEASE ENTER 1 TO PLAY AGAIN OR 0 TO QUIT: \n"

game_over_msg: .asciz "\n THE SECRET WORD WAS: "

/**DATA FOR BLANKS**/
.align 2
blanks: .asciz "_____"
format: .asciz "%d"
.align 2
letter_read: .byte 0
@letter_read: .asciz "\n "
number: .word 0

/******************************************************************
* ASCII GENERATED USING AUTO ASCII GENERATOR:  http://patorjk.com *
*******************************************************************/

you_won1: .asciz "\n                              _ "      
you_won2: .asciz "                             (_)"      
you_won3: .asciz " _   _  ___  _   _  __      ___ _ __"  
you_won4: .asciz "| | | |/ _ \\| | | | \\ \\ /\\ / / | '_ \\" 
you_won5: .asciz "| |_| | (_) | |_| |  \\ V  V /| | | | |"
you_won6: .asciz " \\__, |\\___/ \\__,_|   \\_/\\_/ |_|_| |_|"
you_won7: .asciz "  __/ |"                               
you_won8: .asciz " |___/"                           

game_over1: .asciz "\n / _` |/ _` | '_ ` _ \\ / _ \\  / _ \\ \\ / / _ \\ '__|"
game_over2: .asciz "| (_| | (_| | | | | | |  __/ | (_) \\ V /  __/ |"   
game_over3: .asciz " \\__, |\\__,_|_| |_| |_|\\___|  \\___/ \\_/ \\___|_|"   
game_over4: .asciz "  __/ |"                                           
game_over5: .asciz " |___/"       
game_over6: .asciz " "

hangman1: .asciz "\n _   _  ___  _   _ ________  ___ ___  _   _"
hangman2: .asciz "| | | |/ _ \\| \\ | |  __ \\  \\/  |/ _ \\| \\ | |"
hangman3: .asciz "| |_| / /_\\ \\  \\| | |  \\/ .  . / /_\\ \\  \\| |"
hangman4: .asciz "|  _  |  _  | . ` | | __| |\\/| |  _  | . ` |"
hangman5: .asciz "| | | | | | | |\\  | |_\\ \\ |  | | | | | |\\  |"
hangman6: .asciz "\\_| |_|_| |_|_| \\_/\\____|_|  |_|_| |_|_| \\_/"
                                            
.align 2
secretMessage0: .asciz "TESTS             "
secretMessage1: .asciz "CHALLENGE         "
secretMessage2: .asciz "UNIVERSITY        "
secretMessage3: .asciz "STUDENTS          "
secretMessage4: .asciz "BALANCE           "
secretMessage5: .asciz "FEEDBACK          "
secretMessage6: .asciz "BINARY            "
secretMessage7: .asciz "INTELLIGENCE      "
secretMessage8: .asciz "CARTOGRAPHERS     "
secretMessage9: .asciz "CHARACTERISTICALLY"






















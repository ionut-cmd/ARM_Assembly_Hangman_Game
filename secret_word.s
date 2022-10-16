.global secret_word

.data
secretWord: .asciz "TESTS
"
secret_word:
	ldr r3,=secretWord
	bx lr

	.end

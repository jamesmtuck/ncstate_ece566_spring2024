
words: words.lex
	flex -owords.c words.lex
	gcc -o words words.c -lfl

words2: words2.lex
	flex -owords2.c words2.lex
	gcc -o words2 words2.c -lfl

clean:
	@rm -Rf words words.c words2 words2.c

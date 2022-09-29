CC=gcc
FLEX=flex
BISON=bison
splc:
	@mkdir bin
	$(BISON) -d syntax.y
	$(FLEX) lex.l
	$(CC) syntax.tab.c -lfl -ly -o bin/splc
	@chmod +x bin/splc
clean:
	@rm -rf bin/
.PHONY: splc
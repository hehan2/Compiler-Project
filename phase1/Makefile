CC=gcc
FLEX=flex
BISON=bison
splc:
	@mkdir bin
	$(BISON) -d -v -t syntax.y
	$(FLEX) lex.l
	$(CC) syntax.tab.c -lfl -ly -o bin/splc
	@chmod +x bin/splc
flex:
	$(FLEX) lex1.l
	$(CC) lex.yy.c -lfl -o bin/flex.out
clean:
	@rm -rf bin/
.PHONY: splc
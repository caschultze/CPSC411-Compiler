all: flex main

main: lex.yy.cc main.cpp
	g++ -Wall -o main lex.yy.cc main.cpp

flex: scanner.l
	flex --c++ scanner.l

clean:
	@rm -rf lex.yy.cc main
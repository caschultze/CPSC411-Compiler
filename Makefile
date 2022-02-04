all: flex scanner

flex: scanner.flex
	flex --c++ scanner.flex

scanner: scanner.hpp lex.yy.cc main.cpp
	g++ -Wall -o main lex.yy.cc main.cpp

clean:
	rm -rf main lex.yy.cc
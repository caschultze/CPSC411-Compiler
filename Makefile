all: flex scanner

flex: scanner.l
	flex --c++ scanner.l

scanner: scanner.hpp lex.yy.cc main.cpp
	g++ -Wall -o main lex.yy.cc main.cpp

clean:
	rm -rf main lex.yy.cc
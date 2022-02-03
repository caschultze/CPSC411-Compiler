all: flex scanner

flex: scanner.l
	flex --c++ myscanner.l

scanner: scanner.hpp lex.yy.cc main.cpp
	g++ -Wall -std=c++14 -o main lex.yy.cc main.cpp

clean:
	rm -rf *.yy.cc main
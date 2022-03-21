# This file is based on the file Makefile of example-cpp shared in the tutorials.
# Credits: Ali Jamadi / Shankar Ganesh

CC := g++
CXXFLAGS := -Wall
objs := traversal.o semantic_checker.o parser.o scanner.o driver.o main.o ast.o 

all: main

%.cc %.hh: %.yy
	bison -o $*.cc $<

%.cc: %.l
	flex --c++ -o $@ $<

-include $(OBJ:.o=.d)

%.o: %.cc
	$(CC) $(CXXFLAGS) -c $< -MMD -MF $*.d

%.o: %.cpp
	$(CC) $(CXXFLAGS) -c $< -MMD -MF $*.d

tools: parser.cc scanner.l
	bison -o parser.cc parser.yy
	flex -c++ -o scanner.cc scanner.l
	
main: $(objs)
	$(CC) $(CXXFLAGS) -o $@ $^

clean:
	rm -f *.o *.hh *.cc main *.d
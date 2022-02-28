CC := g++
CXXFLAGS := -Wall
objs := parser.o scanner.o driver.o main.o ast.o

all: parser

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
	
parser: $(objs)
	$(CC) $(CXXFLAGS) -o $@ $^

clean:
	rm -f *.o *.hh *.cc parser *.d
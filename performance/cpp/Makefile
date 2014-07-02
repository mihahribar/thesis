CC = g++

OBJECTS = fibonacci.o

all : run

%.o : %.cpp
	$(CC) -c $< -o $@

run: $(OBJECTS)
	$(CC) $(OBJECTS) run.cpp -o $@
	./$@

clean:
	rm -rf $(OBJECTS) run
.PHONY: clean
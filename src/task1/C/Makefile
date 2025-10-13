CC=gcc
CFLAGS=-I.
DEP_OBJ = adder.o
OBJ = main.o $(DEP_OBJ)
EVAL_OBJ = eval.o $(DEP_OBJ)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

main: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

run: main
	./main

clean:
	rm -f $(OBJ) $(EVAL_OBJ) main eval

eval: $(EVAL_OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

run-eval: eval
	./eval

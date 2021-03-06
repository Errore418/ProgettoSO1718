SRC=./src
BIN=./bin
OPTIMIZATION=-o3
PROGRAMS=$(BIN)/ertms $(BIN)/train $(BIN)/rbc

all: $(PROGRAMS)
	@echo The executables are in the $(BIN) folder

ertms: $(BIN)/ertms
	
train: $(BIN)/train

rbc: $(BIN)/rbc
	
$(BIN)/ertms: $(BIN)/ertms.o $(BIN)/common.o $(BIN)/route.o
	gcc $(OPTIMIZATION) $(BIN)/ertms.o $(BIN)/common.o $(BIN)/route.o -o $(BIN)/ertms -lrt -lpthread 

$(BIN)/ertms.o: $(SRC)/ertms.c $(SRC)/ertms.h
	gcc $(OPTIMIZATION) -c $(SRC)/ertms.c -o $(BIN)/ertms.o

$(BIN)/train: $(BIN)/train.o $(BIN)/route.o $(BIN)/log.o $(BIN)/common.o
	gcc $(OPTIMIZATION) $(BIN)/train.o $(BIN)/route.o $(BIN)/log.o $(BIN)/common.o -o $(BIN)/train -lrt -lpthread 

$(BIN)/train.o: $(SRC)/train.c $(SRC)/train.h
	gcc $(OPTIMIZATION) -c $(SRC)/train.c -o $(BIN)/train.o

$(BIN)/rbc: $(BIN)/rbc.o $(BIN)/route.o $(BIN)/log.o $(BIN)/common.o
	gcc $(OPTIMIZATION) $(BIN)/rbc.o $(BIN)/route.o $(BIN)/log.o $(BIN)/common.o -o $(BIN)/rbc -lrt -lpthread 

$(BIN)/rbc.o: $(SRC)/rbc.c $(SRC)/rbc.h
	gcc $(OPTIMIZATION) -c $(SRC)/rbc.c -o $(BIN)/rbc.o

$(BIN)/route.o: $(SRC)/route.c $(SRC)/route.h
	gcc $(OPTIMIZATION) -c $(SRC)/route.c -o $(BIN)/route.o

$(BIN)/log.o: $(SRC)/log.c $(SRC)/log.h
	gcc $(OPTIMIZATION) -c $(SRC)/log.c -o $(BIN)/log.o

$(BIN)/common.o: $(SRC)/common.c $(SRC)/common.h
	gcc $(OPTIMIZATION) -c $(SRC)/common.c -o $(BIN)/common.o

clean:
	rm -f $(BIN)/core $(BIN)/*.o $(PROGRAMS)
IDIR =/home/kevin/Code/SFML/include
LDIR =/home/kevin/Code/SFML/lib
CC=g++
CFLAGS=-I$(IDIR) -L$(LDIR) -L/usr/lib64 -std=c++14

ODIR=obj
BIN=bin

LIBS=-lsfml-graphics -lsfml-window -lsfml-system -lGL -lGLU -lGLEW

_OBJ = sfml.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.cc | $(ODIR) 
		$(CC) -c -o $@ $< $(CFLAGS)

sfml: $(OBJ) | $(BIN)
		$(CC) -o $(BIN)/$@ $^ $(CFLAGS) $(LIBS)

$(ODIR):
	    mkdir -p $@

$(BIN):
	    mkdir -p $@

.PHONY: clean

clean:
		rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ $(BIN)/*

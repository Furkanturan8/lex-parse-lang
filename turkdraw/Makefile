CC = gcc
CFLAGS = -Wall -g
SRCDIR = src
BUILDDIR = build

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    LDFLAGS = -ll
else
    LDFLAGS = -ly -lfl
endif

all: $(BUILDDIR)/turkdraw

$(BUILDDIR)/turkdraw: $(BUILDDIR)/lex.yy.c $(BUILDDIR)/parser.tab.c $(SRCDIR)/main.c
	$(CC) $(CFLAGS) -o $@ $(SRCDIR)/main.c $(BUILDDIR)/lex.yy.c $(BUILDDIR)/parser.tab.c $(LDFLAGS)

$(BUILDDIR)/parser.tab.c $(BUILDDIR)/parser.tab.h: $(SRCDIR)/parser.y
	bison -d $(SRCDIR)/parser.y
	mv parser.tab.c parser.tab.h $(BUILDDIR)/

$(BUILDDIR)/lex.yy.c: $(SRCDIR)/lexer.l $(BUILDDIR)/parser.tab.h
	flex -o $(BUILDDIR)/lex.yy.c $(SRCDIR)/lexer.l

clean:
	rm -f $(BUILDDIR)/* *~

.PHONY: all clean 
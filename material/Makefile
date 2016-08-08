.PHONY: all

SRC_EXT=md
TRGT_EXT=pdf

SRC=$(patsubst %.$(SRC_EXT),%.$(TRGT_EXT),$(wildcard *.$(SRC_EXT)))

all: $(SRC)

%.$(TRGT_EXT): %.$(SRC_EXT)
	pandoc --toc --toc-depth=2 -S -o $*.$(TRGT_EXT) $*.$(SRC_EXT)

clean:
	rm *.$(TRGT_EXT)

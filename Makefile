.PHONY: all clean

all: mar.csv

mar.csv: MAR.TXT
	ruby bin/transcode MAR.TXT mar.csv

clean:
	rm -f mar.csv

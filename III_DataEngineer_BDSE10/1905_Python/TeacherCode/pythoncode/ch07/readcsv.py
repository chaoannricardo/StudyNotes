# count fields in csv file
import csv
import sys

if len(sys.argv) != 2:
    print('Usage:',sys.argv[0],'<csv file>');
    sys.exit(2)

with open(sys.argv[1]) as f:
    reader=csv.reader(f)
    for row in reader:
        print(row)

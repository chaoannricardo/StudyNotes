# count fields in csv file
import csv
import sys

if len(sys.argv) != 2:
    print('Usage:',sys.argv[0],'<csv file>');
    sys.exit(2)

fname=sys.argv[1]
fnum=0  # number of fileds
nr=0    # number of records

with open(fname) as f:
    reader=csv.reader(f)
    for row in reader:
        if len(row)!=fnum:
            fnum=len(row)
            print('\nFields:',fnum)
    
        nr+=1
        not nr%100000 and print('.',end=' ',flush=True)

    print('\n')

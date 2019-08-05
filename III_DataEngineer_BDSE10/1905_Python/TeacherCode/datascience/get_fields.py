# get fields and sav to csv file
import csv
import operator

# source csv file
sname='data2.csv'

# target csv file
tname='flightdata.csv'

nr=0    # number of records

with open(sname,'r') as sf, open(tname,'w') as tf:
    reader=csv.reader(sf)
    writer=csv.writer(tf)

    fld=operator.itemgetter(1,3,4,5,11,30,31,32,37,
        40,41,42,43,51,52,53,55,57,58,59,60,61)
    for row in reader:
        data=fld(row)
        writer.writerow(data)
        nr+=1
        not nr%100000 and print('.',end=' ',flush=True)

    print('\n')

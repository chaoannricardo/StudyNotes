import csv
import json
import pymysql

def toSQL(info):
    db = pymysql.connect(host="localhost", user="root", password="hua0202", database="DEMO_DB")
    mycursor = db.cursor();
    sql = "Create Table "+dbname+"(No int,Id varchar(255), Name varchar(255), Address char(10), Command char(10), Quantity char(4), Type varchar(255), multiple varchar(255), Data_Change varchar(255), Data varchar(255))";
    mycursor.execute(sql);
    for row in info:
        No = row['No']
        Id = row['Id']
        Name = row['Name']
        Address = row['Address']
        Command = row['Command']
        Quantity = row['Quantity']
        Type = row['Type']
        multiple = row['multiple']
        Data_Change = row['Data_Change']
        sql = ("Insert Into "+dbname+"(`No`, `Id`, `Name`, `Address`, `Command`, `Quantity`, `Type`, `multiple`, `Data_Change`) Values('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')"%(No, Id, Name, Address, Command, Quantity, Type, multiple, Data_Change));
        mycursor.execute(sql)
        db.commit()
    db.close();
if __name__=='__main__':
    data_info = [];
    path = 'D:/筆電備份/PLC/點位表/MC_3E_sensor.csv'
    dbname = 'MC_3E_sensor_1'
    with open(path, newline='') as csvfile:
        rows = csv.DictReader(csvfile)
        toSQL(rows)
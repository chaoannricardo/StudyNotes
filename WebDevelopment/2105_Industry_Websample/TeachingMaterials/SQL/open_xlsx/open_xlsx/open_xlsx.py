from argparse import ArgumentParser 
from openpyxl import load_workbook
import json
import pymysql

def toSQL(info):
    db = pymysql.connect(host="localhost", user="root", password="hua0202", database="Demo_DB")
    mycursor = db.cursor();
    sql = "Create Table "+dbname+"(No int,Id varchar(255), Name varchar(255), Address char(10), Command char(10), Quantity char(4), Type varchar(255), multiple varchar(255), Data_Change varchar(255), Data varchar(255))";
    mycursor.execute(sql);
    for j in range(int(data_num)):
        No = info[0]['No'][j];
        Id = info[1]['Id'][j];
        Name = info[2]['Name'][j];
        Address = info[3]['Address'][j];
        Command = info[4]['Command'][j];
        Quantity = info[5]['Quantity'][j];
        Type = info[6]['Type'][j];
        multiple = info[7]['multiple'][j];
        Data_Change = info[8]['Data_Change'][j];
        sql = ("Insert Into "+dbname+"(`No`, `Id`, `Name`, `Address`, `Command`, `Quantity`, `Type`, `multiple`, `Data_Change`) Values('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')"%(No, Id, Name, Address, Command, Quantity, Type, multiple, Data_Change));
        mycursor.execute(sql)
        db.commit()
    db.close();

if __name__=='__main__':
    '''
    parser = ArgumentParser();
    parser.add_argument("DBname", help="machine_id", type=str);
    parser.add_argument("-xls", "--xls_path", dest="xls_path");
    parser.add_argument("-n", "--num", dest="num");
    args = parser.parse_args();
    '''

    dbname = 'FX5U';
    data_num = 3;
    data_info = [];
    Error_flag = 0;
    wb = load_workbook("D:/筆電備份/PLC/點位表/MC_3E_sensor.xlsx");
    data_sheet = wb.get_sheet_names();
    sheet = wb[data_sheet[0]];
    data = sheet.values;
    info = [];
    for i in data:
        info.append(i);
    wb.close();
    if (len(info)-1) == int(data_num):
        for m in range(9):
            data_content = [];
            for n in range(len(info)-1):
                result = info[n+1][m];
                data_content.append(result);
            d = {info[0][m]:data_content};
            data_info.append(d);
        data_info = json.dumps(data_info);
        data_1 = json.loads(data_info);
        for i in range(len(info)-1):
            if data_1[1]['Id'][i] == None:
                print("Error_Id");
                Error_flag = 1;
            if data_1[2]['Name'][i] == None:
                print("Error_Name");
                Error_flag = 1;
            if data_1[3]['Address'][i] == None:
                print("Error_Address");
                Error_flag = 1;
            if data_1[4]['Command'][i] == None:
                print("Error_Quantity");
                Error_flag = 1;
            if data_1[5]['Quantity'][i] == None:
                print("Error_Quantity");
                Error_flag = 1;
            if data_1[6]['Type'][i] == None:
                print("Error_Type");
                Error_flag = 1;
            if Error_flag == 1:
                break;
        #db = pymysql.connect("localhost:3306", "root","hua0202", "PLC")
        toSQL(data_1); 
        #print(data_1) 
    else:
        print("Data Error");


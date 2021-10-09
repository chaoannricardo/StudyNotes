import pymysql

#連線至資料庫
conn = pymysql.connect(host="localhost", user="root", password="hua0202", database="Demo_DB");
print("Succesfully Connect to Database using pyMySQL");

#建立資料庫操作指標
mycursor = conn.cursor();
#執行語法
mycursor.execute("Create Database Demo_DB");
#mycursor.execute("Show databases");
#mycursor.execute("""Create Table demo_table(No int, Name varchar(255), Sex char, 
                       # HomeTown varchar(255), Department varchar(255))""");
#mycursor.execute("Describe demo_table");
#mycursor.execute("""Insert Into demo_table(No, Name, Sex, HomeTown, Department) 
                        #Values('27', 'Jack', 'M', 'Taipei', 'Personnel')""");
#sql = ("""Insert Into demo_table(No, Name, Sex, HomeTown, Department) 
                       # Values(%s, %s, %s, %s, %s)""");
#val = [('28', 'Fred', 'M', 'Chiayi', 'Management'),
       #('29', 'Tom', 'M', 'Yunlin', 'Planning'),
       #('30', 'Mary', 'F', 'New Taipei', 'Marketing')];
#mycursor.executemany(sql, val);
#mycursor.execute("Update demo_table Set HomeTown = 'Taoyuan' Where Name = 'Jack'");
#確認寫入資料表
#conn.commit();
#執行語法
#mycursor.execute("Select * from demo_table where No = '27'");
#mycursor.execute("Select HomeTown from demo_table where No = '27'");
#mycursor.execute("Select * from demo_table Order By No desc");
#mycursor.execute("Delete from demo_table where No = '27'");
#mycursor.execute("Drop Table demo_table");
#mycursor.execute("Select * from demo_table");
#print(mycursor.fetchall());
#連線關閉
conn.close();

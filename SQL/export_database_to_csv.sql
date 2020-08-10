/* 
sql script to export data from databases, 
to execute the scripts, use mysql shell to execute the script with oughted code

To execute the code, enter mysql shell and execute following command:
    mysql> source path_to_the_mysql_script
	
	
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
 [mysqld] 
secure-file-priv = "/"   #(“/”表示不限定位置)

Reference: 
    https://stackoverflow.com/questions/467452/dump-a-mysql-database-to-a-plaintext-csv-backup-from-the-command-line
	https://stackoverflow.com/questions/32737478/how-should-i-tackle-secure-file-priv-in-mysql
	https://ithelp.ithome.com.tw/articles/10197804?sc=rss.qu
	
	

*/


/* sql scripyt when database is not too large*/

USE linebot

drop procedure if exists test;
delimiter #

create procedure test ()
begin
    WHILE(TRUE) DO
        SELECT * INTO OUTFILE '~/test_output.csv'
        FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
        LINES TERMINATED BY '\n'
        FROM Answers;
    END WHILE;
end#

delimiter ;
call test();
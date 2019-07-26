using System;
using System.Collections;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;

namespace LogExtract
{
    class Program
    {
        static void Main(string[] args)
        {

            // 刪除過去程序所存取的"C:\Users\1907075\Desktop\Temp.txt"檔案
            if (System.IO.File.Exists(@"C:\Users\1907075\Desktop\Temp.txt"))
            {
                try
                {
                    System.IO.File.Delete(@"C:\Users\1907075\Desktop\Temp.txt");
                }
                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                    return;
                }
            }

            // 刪除過去程序所存取的"C:\Users\1907075\Desktop\Temp2.txt"檔案
            if (System.IO.File.Exists(@"C:\Users\1907075\Desktop\Temp2.txt"))
            {
                try
                {
                    System.IO.File.Delete(@"C:\Users\1907075\Desktop\Temp2.txt");
                }
                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                    return;
                }
            }


            string websiteAddress = "http://10.31.141.17/AIP04_LOG/20190124/GA28GCAA40P03.txt";
            string htmlBody;
            WebClient w = new WebClient();
            htmlBody = w.DownloadString(websiteAddress);

            // 將網頁內容存取成txt檔
            File.WriteAllText(@"C:\Users\1907075\Desktop\Temp.txt", htmlBody);

            // 將網頁內容txt檔讀入成為array形式
            System.Collections.Generic.IEnumerable<String> lines = File.ReadLines(@"C:\Users\1907075\Desktop\Temp.txt");

            // 抓取檔案中 "002"、"814"開頭的資料列
            string sheetID;
            string modelID;
            using (System.IO.StreamWriter file =
                    new System.IO.StreamWriter(@"C:\Users\1907075\Desktop\Temp2.txt", true))
            {
                foreach (string line in lines)
                {
                    // If the line doesn't contain the word, write the line to the file.
                    Regex rgx = new Regex(@"^002");
                    if (rgx.IsMatch(line))
                    {
                        sheetID = line.Substring(4, 13);
                        modelID = line.Substring(54, 13);
                    }
                    //Regex rgx1 = new Regex(@"^814");
                    Regex rgx1 = new Regex(@"^814");
                    if (rgx1.IsMatch(line))
                    {
                        file.WriteLine(line);
                    }
                }
            }

            // 讀入整理好檔案，並抓取各項欄位
            System.Collections.Generic.IEnumerable<String> datalines = File.ReadLines(@"C:\Users\1907075\Desktop\Temp2.txt");

            foreach (string line in datalines)
            {
                char[] delimiterChars = { ',' };
                string[] dataWordSets = line.Split(delimiterChars);
                string chipNo = dataWordSets[0]; // ChipNo
                chipNo = chipNo.Substring(4);
                string winNo = dataWordSets[1]; // WinNo
                string parallel = dataWordSets[2]; // 水平垂直
                string offset_um = dataWordSets[3]; // "偏移量_um"
                string offset_pixel = dataWordSets[4]; // "偏移量_pixel"
                string decision = dataWordSets[5]; // "判定"
                string ROI_leftTopX_um = dataWordSets[6]; // "ROI左上角x座標um"
                string ROI_leftBotX_um = dataWordSets[7]; // "ROI左上角y座標um"
                string ROI_rightTopX_um = dataWordSets[8]; // "ROI右下角x座標um"
                string ROI_rightBotX_um = dataWordSets[9]; // "ROI右下角y座標um"
                string caption = dataWordSets[10]; // "caption"
                string PI_TopLimit_um = dataWordSets[11]; // "PI偏移上限_um"
                string PI_BotLimit_um = dataWordSets[12]; // "PI偏移下限"

                string clicktime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                // connect to MySQL database
                string dbHost = "10.30.10.64";
                string dbUser = "Tableau";
                string dbPass = "l6b$cell";
                string dbName = "commondata";
                string dbPort = "3306";

                string connStr = "server=" + dbHost + ";port=" + dbPort + ";uid=" + dbUser + ";pwd=" + dbPass + ";database=" + dbName + "; charSet=utf8; Pooling=False";
                MySqlConnection conn = new MySqlConnection(connStr);

                //
                string insertedCommand = "INSERT INTO h_hr_mental_health_assessment VALUES( \"" + MFGday.Text + "\", \"" + WNUM.Text + "\", \"" + NAME.Text + "\", \"" + OVERTIME.Text + "\" , \"NG\" , \"" + NG_NOTE.Text + "\", \"" + Session["User_Name"] + "\", \"" + Session["W_ID"] + "\", \"" + clicktime + "\")";

                MySqlCommand myCommand = new MySqlCommand(insertedCommand, conn);
                myCommand.Connection.Open();
                myCommand.ExecuteNonQuery();

                conn.Close();


            }









        }
    }
}

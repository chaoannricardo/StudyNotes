using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.Common;
using MySql.Data.MySqlClient;
using System.Text;
using System.Xml;


public partial class Pages_Report_Test_RicardoWeb : System.Web.UI.Page
{

    public DataTable dataTable = new DataTable();
    public clsLogin ClsLogin = new clsLogin();

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            // 只有首次執行才會執行的程式
            // AUO Login in 
            ClsLogin.auth();

            // connect to MySQL database
            string dbHost = "10.30.10.64";
            string dbUser = "Tableau";
            string dbPass = "l6b$cell";
            string dbName = "commondata";
            string dbPort = "3306";

            string connStr = "server=" + dbHost + ";port=" + dbPort + ";uid=" + dbUser + ";pwd=" + dbPass + ";database=" + dbName + "; charSet=utf8; Pooling=False";
            MySqlConnection conn = new MySqlConnection(connStr);

            conn.Open();

            // catch system time
            int currentHour = DateTime.Now.Hour; // SystemTime.Hour
            int currentMinute = DateTime.Now.Minute; // SystemTime.Minute
            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");
            string currentShift = "";
            // decide whether the time belongs to the day shift or the night shift
            if (currentHour < 7)
            {
                currentShift = "N";
            }
            else if (currentHour > 7)
            {
                if (currentHour < 19)
                {
                    currentShift = "D";
                }
                else if (currentHour > 19)
                {
                    currentShift = "N";
                }
                else if (currentHour == 19)
                {
                    if (currentMinute <= 30)
                    {
                        currentShift = "D";
                    }
                    else
                    {
                        currentShift = "N";
                    }
                }
            }
            else if (currentHour == 7)
            {
                if (currentMinute <= 30)
                {
                    currentShift = "N";
                }
                else
                {
                    currentShift = "D";
                }
            }

            // 測試用日期
            currentDate = "2019-07-12";

            // SELECT data from MySQL database
            string SQL = "SELECT h.MFGday, h.OVERTIME, h.DN, p.WNUM ,h.NAME FROM h_hr_manpower_daily_actual_name h LEFT OUTER JOIN personal_data p ON(h.NAME = p.NAME) WHERE h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";
            MySqlCommand cmd = new MySqlCommand(SQL, conn);

            // 利用sqlDataAdapter 填入
            DataTable dataTable = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dataTable);
            GridView1.DataSource = dataTable; //告訴GridView資料來源為誰
            GridView1.DataBind();//綁定

            conn.Close();

            ClsLogin.Right("PC|領班|大領班", "抱歉您沒有權限!", "'0230221'");
        }


        if (Session["W_ID"] == null)
        {
            ClsLogin.auth();
        }




    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        // TimeNow
        string clicktime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

        // connect to MySQL database
        string dbHost = "10.30.10.64";
        string dbUser = "Tableau";
        string dbPass = "l6b$cell";
        string dbName = "commondata";
        string dbPort = "3306";

        string connStr = "server=" + dbHost + ";port=" + dbPort + ";uid=" + dbUser + ";pwd=" + dbPass + ";database=" + dbName + "; charSet=utf8; Pooling=False";
        MySqlConnection conn = new MySqlConnection(connStr);

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox checkBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
            //Label MFGday = (Label)GridView1.Rows[i].FindControl("Label2"); // abandoned,  applying currentDateForInsert instead
            Label OVERTIME = (Label)GridView1.Rows[i].FindControl("Label3");
            Label DN = (Label)GridView1.Rows[i].FindControl("Label4");
            Label WNUM = (Label)GridView1.Rows[i].FindControl("Label5");
            Label NAME = (Label)GridView1.Rows[i].FindControl("Label6");
            TextBox NG_NOTE = (TextBox)GridView1.Rows[i].FindControl("TextBox1");
            string currentDateForInsert = DateTime.Now.ToString("yyyy-MM-dd");

            string insertedCommand = "INSERT INTO h_hr_mental_health_assessment VALUES( \"" + currentDateForInsert + "\", \"" + WNUM.Text + "\", \"" + NAME.Text + "\", \"" + OVERTIME.Text + "\" , \"NG\" , \"" + NG_NOTE.Text + "\", \"" + Session["User_Name"] + "\", \"" + Session["W_ID"] + "\", \"" + clicktime + "\", \"" + DN.Text + "\")";

            // ricardo 測試用
            //string insertedCommand = "INSERT INTO h_hr_mental_health_assessment VALUES( \"" + currentDateForInsert + "\", \"" + WNUM.Text + "\", \"" + NAME.Text + "\", \"" + OVERTIME.Text + "\" , \"NG\" , \"" + NG_NOTE.Text + "\", \"" + "開發測試可刪除" + "\", \"" + "開發測試可刪除" + "\", \"" + clicktime + "\", \"" + DN.Text + "\")";


            if (checkBox.Checked == true)
            {
                MySqlCommand myCommand = new MySqlCommand(insertedCommand, conn);
                myCommand.Connection.Open();
                myCommand.ExecuteNonQuery();

                conn.Close();
            }
        }

    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox checkBox = e.Row.FindControl("CheckBox1") as CheckBox;
            Label MFGday = e.Row.FindControl("Label2") as Label;
            Label OVERTIME = e.Row.FindControl("Label3") as Label;
            Label DN = e.Row.FindControl("Label4") as Label;
            Label WNUM = e.Row.FindControl("Label5") as Label;
            Label NAME = e.Row.FindControl("Label6") as Label;
            TextBox textBox = e.Row.FindControl("TextBox1") as TextBox;
            

            if (checkBox.Checked == true)
            {
                textBox.ReadOnly = false;
            }
            else
            {
                textBox.ReadOnly = true;
                textBox.Style.Add("background", "#f5ffe8");
            }


        }

    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        // 查詢區顯示資訊

        // From Date, To Date
        string fromDate = DropDownList1.SelectedItem.Value.ToString() + "-" + DropDownList2.SelectedItem.Value.ToString() + "-" + DropDownList3.SelectedItem.Value.ToString();
        string toDate = DropDownList4.SelectedItem.Value.ToString() + "-" + DropDownList5.SelectedItem.Value.ToString() + "-" + DropDownList6.SelectedItem.Value.ToString();

        // connect to MySQL database
        string dbHost_inquiry = "10.30.10.64";
        string dbUser_inquiry = "Tableau";
        string dbPass_inquiry = "l6b$cell";
        string dbName_inquiry = "commondata";
        string dbPort_inquiry = "3306";

        string connStr_inquiry = "server=" + dbHost_inquiry + ";port=" + dbPort_inquiry + ";uid=" + dbUser_inquiry + ";pwd=" + dbPass_inquiry + ";database=" + dbName_inquiry + "; charSet=utf8; Pooling=False";
        MySqlConnection conn_inquiry = new MySqlConnection(connStr_inquiry);

        conn_inquiry.Open();

        // SELECT data from MySQL database
        string SQL_inquiry = "SELECT NAME,NOTE FROM h_hr_mental_health_assessment WHERE MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\" ORDER BY NAME";
        MySqlCommand cmd_inquiry = new MySqlCommand(SQL_inquiry, conn_inquiry);

        // 利用sqlDataAdapter 填入
        DataTable dataTable_inquiry = new DataTable();
        MySqlDataAdapter da_inquiry = new MySqlDataAdapter(cmd_inquiry);
        da_inquiry.Fill(dataTable_inquiry);
        GridView2.DataSource = dataTable_inquiry; //告訴GridView資料來源為誰
        GridView2.DataBind();//綁定

        conn_inquiry.Close();

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void CheckChanged(object sender, EventArgs e)
    {
        //locate the row in which the dropdown value has been changed
        GridViewRow gr = (GridViewRow)((DataControlFieldCell)((CheckBox)sender).Parent).Parent;
        //find the control in that
        TextBox d1 = (TextBox)gr.FindControl("TextBox1");
        CheckBox c1 = (CheckBox)gr.FindControl("CheckBox1");
        if (c1.Checked == true)
        {
            d1.ReadOnly = false;
            d1.Style.Add("background", "white");
        }
        else
        {
            d1.ReadOnly = true;
        }



    }

}



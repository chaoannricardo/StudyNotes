using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Text;
using System.Xml;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.Common;
using MySql.Data.MySqlClient;
using System.Drawing;

public partial class Pages_Report_Test_RicardoWeb : System.Web.UI.Page
{
    public DataTable dataTable = new DataTable();
    public clsLogin ClsLogin = new clsLogin();
    public MySqlConnection conn = new MySqlConnection();
    int currentHour;
    int currentMinute; // SystemTime.Minute
    string currentDate;
    string currentShift = "";
    string SQL;

    protected void InquiryMySQLData()
    {
        // connect to MySQL database
        string dbHost = ""; // Host IP
        string dbUser = ""; // User_Name
        string dbPass = ""; // Password
        string dbName = ""; // Database Name
        string dbPort = ""; // Port Numebr
        string connStr = "server=" + dbHost + ";port=" + dbPort + ";uid=" + dbUser + ";pwd=" + dbPass + ";database=" + dbName + "; charSet=utf8; Pooling=False";
        MySqlConnection conn = new MySqlConnection(connStr);
        conn.Open();
        MySqlCommand cmd = new MySqlCommand(SQL, conn);
        // 利用sqlDataAdapter 填入
        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
        da.Fill(dataTable);
    }

    protected void InsertMySQL()
    {
        // connect to MySQL database
        string dbHost = "10.30.10.64";
        string dbUser = "Tableau";
        string dbPass = "l6b$cell";
        string dbName = "commondata";
        string dbPort = "3306";
        string connStr = "server=" + dbHost + ";port=" + dbPort + ";uid=" + dbUser + ";pwd=" + dbPass + ";database=" + dbName + "; charSet=utf8; Pooling=False";
        MySqlConnection conn = new MySqlConnection(connStr);
        MySqlCommand cmd = new MySqlCommand(SQL, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
    }

    protected void DisconnectMySQL()
    {
        conn.Close();
    }

    protected void CatchSystemTime()
    {
        currentHour = DateTime.Now.Hour; // SystemTime.Hour
        currentMinute = DateTime.Now.Minute; // SystemTime.Minute
        currentDate = DateTime.Now.ToString("yyyy-MM-dd");
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
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // 只有首次執行才會執行的程式
            // AUO Login in 
            ClsLogin.auth();

            CatchSystemTime();
            
            Label9.Text = "歡迎您的登入！今天日期為 " + currentDate + "，祝您有個愉快的一天！";

            // 測試用日期
            //currentDate = "2019-07-12";

            // SELECT data from MySQL database
            SQL = "SELECT h.MFGday, h.OVERTIME, h.DN, p.WNUM ,h.NAME FROM h_hr_manpower_daily_actual_name h LEFT OUTER JOIN personal_data p ON(h.NAME = p.NAME) WHERE h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";

            InquiryMySQLData();

            GridView1.DataSource = dataTable; //告訴GridView資料來源為誰
            GridView1.DataBind();//綁定

            DisconnectMySQL();

            //ClsLogin.Right("PC|領班|大領班", "抱歉您沒有權限!", "'0230221'");
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

            SQL = "INSERT INTO h_hr_mental_health_assessment VALUES( \"" + currentDateForInsert + "\", \"" + WNUM.Text + "\", \"" + NAME.Text + "\", \"" + OVERTIME.Text + "\" , \"NG\" , \"" + NG_NOTE.Text + "\", \"" + Session["User_Name"] + "\", \"" + Session["W_ID"] + "\", \"" + clicktime + "\", \"" + DN.Text + "\")";

            // ricardo 測試用
            //string insertedCommand = "INSERT INTO h_hr_mental_health_assessment VALUES( \"" + currentDateForInsert + "\", \"" + WNUM.Text + "\", \"" + NAME.Text + "\", \"" + OVERTIME.Text + "\" , \"NG\" , \"" + NG_NOTE.Text + "\", \"" + "開發測試可刪除" + "\", \"" + "開發測試可刪除" + "\", \"" + clicktime + "\", \"" + DN.Text + "\")";

            if (checkBox.Checked == true)
            {
                InsertMySQL();
                DisconnectMySQL();
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
        string fromYear = DropDownList1.SelectedItem.Value.ToString();
        string fromMonth = DropDownList2.SelectedItem.Value.ToString();
        string fromDay = DropDownList3.SelectedItem.Value.ToString();
        string toYear = DropDownList4.SelectedItem.Value.ToString();
        string toMonth = DropDownList5.SelectedItem.Value.ToString();
        string toDay = DropDownList6.SelectedItem.Value.ToString();
        string caution = Label7.Text;
        DateTime FromDatetime = Convert.ToDateTime(fromDate);    // Covert fromDate into Datatime format
        DateTime ToDatetime = Convert.ToDateTime(toDate);    // //Covert toDate into Datatime format
        TimeSpan ts = ToDatetime.Subtract(FromDatetime);  // Calculate the time span
        double dayCount = ts.Days;    // Time span in days

        // Create SQL Command
        string inquirySQL = "SELECT p.SHIFT, h.NAME,"; // Initialize SQL command

        if (dayCount >= 0)
        {
            Label7.Text = "";
            for (int i = 0; i <= dayCount; i++)
            {
                if (i != dayCount)
                {
                    string inquiryDate = FromDatetime.AddDays(i).ToString("yyyy-MM-dd");
                    string columnDate = inquiryDate.Substring(5);
                    string caseString = "GROUP_CONCAT(DISTINCT CASE WHEN h.MFGday = \"" + inquiryDate + "\" THEN NOTE else \"\" END SEPARATOR '') AS \"" + columnDate + "\",";
                    inquirySQL = inquirySQL + caseString;
                }
                else
                {
                    string inquiryDate = FromDatetime.AddDays(i).ToString("yyyy-MM-dd");
                    string columnDate = inquiryDate.Substring(5);
                    string caseString = "GROUP_CONCAT(DISTINCT CASE WHEN h.MFGday = \"" + inquiryDate + "\" THEN NOTE else \"\" END SEPARATOR '') AS \"" + columnDate + "\"";
                    inquirySQL = inquirySQL + caseString;
                }
            }
            string whereString = " WHERE h.MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\"";
            inquirySQL = inquirySQL + "FROM h_hr_mental_health_assessment h LEFT JOIN h_hr_manpower_daily_actual_name p ON(h.NAME = p.NAME)" + whereString + "GROUP BY NAME ORDER BY p.SHIFT";
            SQL = inquirySQL;

            InquiryMySQLData();

            GridView2.DataSource = dataTable; //告訴GridView資料來源為誰
            GridView2.DataBind();//綁定

            DisconnectMySQL();
        }
        else
        {
            Label7.Text = "日期設定錯誤！結束日期小於起始日期！";
            Label7.ForeColor = Color.Red;
            GridView2.DataSource = null;
            GridView2.DataBind();
        }


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        CatchSystemTime();

        // 測試用日期
        //currentDate = "2019-07-12";

        string depNo;
        string stage;
        string actualShift;
        // When DropDownList.Value is "請選擇" or null, return string value ""
        // If depNo's selected value is "請選擇"
        if (DropDownList8.SelectedItem.Value.ToString() == "請選擇")
        {
            depNo = "";
        }
        else
        {
            depNo = DropDownList8.SelectedItem.Value.ToString();
        }
        // If stage's selected value is "請選擇"
        if (DropDownList7.SelectedItem == null)
        {
            stage = "";
        }
        else
        {
            stage = DropDownList7.SelectedItem.Value.ToString();
        }
        // If actualShift's selected value is "請選擇"
        if (DropDownList9.SelectedItem.Value.ToString() == "請選擇")
        {
            actualShift = "";
        }
        else
        {
            actualShift = DropDownList9.SelectedItem.Value.ToString();
        }

        // Create SQL where clause
        string inquiryString = "SELECT h.MFGday, h.OVERTIME, h.DN, p.WNUM ,h.NAME FROM h_hr_manpower_daily_actual_name h LEFT OUTER JOIN personal_data p ON(h.NAME = p.NAME) ";
        string whereString = "";
        // No filter is selected
        if (stage == "" && depNo == "" && actualShift == "")
        {
            Label8.Text = "【篩選條件二】未選擇任何條件！顯示僅篩選日期資料";
            Label8.ForeColor = Color.Red;
            whereString = "WHERE h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";
        }
        // Only depNo filter is selected
        else if (stage == "" && actualShift == "")
        {
            whereString = "WHERE p.DEPTNO = \"" + depNo + "\" AND h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";
        }
        // Only actualShift filter is selected
        else if (stage == "" && depNo == "")
        {
            whereString = "WHERE p.SHIFT = \"" + actualShift + "\" AND h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";
        }
        // when stage is not selected
        else if (stage == "")
        {
            whereString = "WHERE p.DEPTNO = \"" + depNo + "\" AND p.SHIFT =\"" + actualShift + "\" AND h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";
        }
        // when actualShift is not selected
        else if (actualShift == "")
        {
            whereString = "WHERE p.DEPTNO = \"" + depNo + "\" AND p.STAGE2 =\"" + stage + "\" AND h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";
        }
        // all filters are selected
        else
        {
            whereString = "WHERE p.SHIFT =\"" + actualShift + "\" AND p.DEPTNO = \"" + depNo + "\" AND p.STAGE2 =\"" + stage + "\" AND h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";
        }
        SQL = inquiryString + whereString;

        InquiryMySQLData();

        GridView1.DataSource = dataTable; //告訴GridView資料來源為誰
        GridView1.DataBind();//綁定

        DisconnectMySQL();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {

        CatchSystemTime();

        // 測試用日期
        //currentDate = "2019-07-12";

        // SELECT data from MySQL database
        SQL = "SELECT h.MFGday, h.OVERTIME, h.DN, p.WNUM ,h.NAME FROM h_hr_manpower_daily_actual_name h LEFT OUTER JOIN personal_data p ON(h.NAME = p.NAME) WHERE h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";

        InquiryMySQLData();

        GridView1.DataSource = dataTable; //告訴GridView資料來源為誰
        GridView1.DataBind();//綁定

        DisconnectMySQL();
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
            d1.Style.Add("background", "#f5ffe8");
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {

        CatchSystemTime();

        string inquiryName = TextBox2.Text;

        // 測試用日期
        //currentDate = "2019-07-12";

        // SELECT data from MySQL database
        //string SQL = "SELECT h.MFGday, h.OVERTIME, h.DN, p.WNUM ,h.NAME FROM h_hr_manpower_daily_actual_name h LEFT OUTER JOIN personal_data p ON(h.NAME = p.NAME) WHERE h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\") AND ( h.STAGE =\"" + group + "\")";
        SQL = "SELECT h.MFGday, h.OVERTIME, h.DN, p.WNUM ,h.NAME FROM h_hr_manpower_daily_actual_name h LEFT OUTER JOIN personal_data p ON(h.NAME = p.NAME) WHERE h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\") AND ( h.NAME =\"" + inquiryName + "\")";

        InquiryMySQLData();

        GridView1.DataSource = dataTable; //告訴GridView資料來源為誰
        GridView1.DataBind();//綁定

        DisconnectMySQL();
    }

    protected void Button6_Click(object sender, EventArgs e)
    {

        CatchSystemTime();

        // 測試用日期
        //currentDate = "2019-07-12";

        // SELECT data from MySQL database
        SQL = "SELECT h.MFGday, h.OVERTIME, h.DN, p.WNUM ,h.NAME FROM h_hr_manpower_daily_actual_name h LEFT OUTER JOIN personal_data p ON(h.NAME = p.NAME) WHERE h.MFGday = \"" + currentDate + "\" AND ( h.OVERTIME = \"當班\" OR h.OVERTIME = \"加班\" ) AND (h.DN = \"" + currentShift + "\")";

        InquiryMySQLData();

        GridView1.DataSource = dataTable; //告訴GridView資料來源為誰
        GridView1.DataBind();//綁定

        DisconnectMySQL();
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        // 查詢區顯示資訊
        // From Date, To Date
        string fromDate = DropDownList1.SelectedItem.Value.ToString() + "-" + DropDownList2.SelectedItem.Value.ToString() + "-" + DropDownList3.SelectedItem.Value.ToString();
        string toDate = DropDownList4.SelectedItem.Value.ToString() + "-" + DropDownList5.SelectedItem.Value.ToString() + "-" + DropDownList6.SelectedItem.Value.ToString();
        string fromYear = DropDownList1.SelectedItem.Value.ToString();
        string fromMonth = DropDownList2.SelectedItem.Value.ToString();
        string fromDay = DropDownList3.SelectedItem.Value.ToString();
        string toYear = DropDownList4.SelectedItem.Value.ToString();
        string toMonth = DropDownList5.SelectedItem.Value.ToString();
        string toDay = DropDownList6.SelectedItem.Value.ToString();
        string caution = Label7.Text;
        string name = TextBox3.Text;
        DateTime FromDatetime = Convert.ToDateTime(fromDate);    // Covert fromDate into Datatime format
        DateTime ToDatetime = Convert.ToDateTime(toDate);    // //Covert toDate into Datatime format
        TimeSpan ts = ToDatetime.Subtract(FromDatetime);  // Calculate the time span
        double dayCount = ts.Days;    // Time span in days

        // Create SQL Command
        string inquirySQL = "SELECT p.SHIFT, h.NAME,"; // Initialize SQL command

        if (dayCount >= 0)
        {
            Label7.Text = "";
            for (int i = 0; i <= dayCount; i++)
            {
                if (i != dayCount)
                {
                    string inquiryDate = FromDatetime.AddDays(i).ToString("yyyy-MM-dd");
                    string columnDate = inquiryDate.Substring(5);
                    string caseString = "GROUP_CONCAT(DISTINCT CASE WHEN h.MFGday = \"" + inquiryDate + "\" THEN NOTE else \"\" END SEPARATOR '') AS \"" + columnDate + "\",";
                    inquirySQL = inquirySQL + caseString;
                }
                else
                {
                    string inquiryDate = FromDatetime.AddDays(i).ToString("yyyy-MM-dd");
                    string columnDate = inquiryDate.Substring(5);
                    string caseString = "GROUP_CONCAT(DISTINCT CASE WHEN h.MFGday = \"" + inquiryDate + "\" THEN NOTE else \"\" END SEPARATOR '') AS \"" + columnDate + "\"";
                    inquirySQL = inquirySQL + caseString;
                }
            }
            string whereString = " WHERE h.NAME = \"" + name + "\" AND h.MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\"";
            SQL = inquirySQL + "FROM h_hr_mental_health_assessment h LEFT JOIN h_hr_manpower_daily_actual_name p ON(h.NAME = p.NAME)" + whereString + "GROUP BY NAME ORDER BY p.SHIFT";

            InquiryMySQLData();

            GridView2.DataSource = dataTable; //告訴GridView資料來源為誰
            GridView2.DataBind();//綁定

            DisconnectMySQL();
        }
        else
        {
            Label7.Text = "日期設定錯誤！結束日期小於起始日期！";
            Label7.ForeColor = Color.Red;
            GridView2.DataSource = null;
            GridView2.DataBind();
        }
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        // 查詢區顯示資訊

        // From Date, To Date
        string fromDate = DropDownList1.SelectedItem.Value.ToString() + "-" + DropDownList2.SelectedItem.Value.ToString() + "-" + DropDownList3.SelectedItem.Value.ToString();
        string toDate = DropDownList4.SelectedItem.Value.ToString() + "-" + DropDownList5.SelectedItem.Value.ToString() + "-" + DropDownList6.SelectedItem.Value.ToString();
        string fromYear = DropDownList1.SelectedItem.Value.ToString();
        string fromMonth = DropDownList2.SelectedItem.Value.ToString();
        string fromDay = DropDownList3.SelectedItem.Value.ToString();
        string toYear = DropDownList4.SelectedItem.Value.ToString();
        string toMonth = DropDownList5.SelectedItem.Value.ToString();
        string toDay = DropDownList6.SelectedItem.Value.ToString();
        string caution = Label7.Text;
        DateTime FromDatetime = Convert.ToDateTime(fromDate);    // Covert fromDate into Datatime format
        DateTime ToDatetime = Convert.ToDateTime(toDate);    // //Covert toDate into Datatime format
        TimeSpan ts = ToDatetime.Subtract(FromDatetime);  // Calculate the time span
        double dayCount = ts.Days;    // Time span in days
        string depNo;
        string stage;
        string actualShift;

        // Create SQL Command
        string inquirySQL = "SELECT p.SHIFT, h.NAME,"; // Initialize SQL command

        if (dayCount >= 0)
        {
            Label7.Text = "";
            for (int i = 0; i <= dayCount; i++)
            {
                if (i != dayCount)
                {
                    string inquiryDate = FromDatetime.AddDays(i).ToString("yyyy-MM-dd");
                    string columnDate = inquiryDate.Substring(5);
                    string caseString = "GROUP_CONCAT(DISTINCT CASE WHEN h.MFGday = \"" + inquiryDate + "\" THEN h.NOTE else \"\" END SEPARATOR '') AS \"" + columnDate + "\",";
                    inquirySQL = inquirySQL + caseString;
                }
                else
                {
                    string inquiryDate = FromDatetime.AddDays(i).ToString("yyyy-MM-dd");
                    string columnDate = inquiryDate.Substring(5);
                    string caseString = "GROUP_CONCAT(DISTINCT CASE WHEN h.MFGday = \"" + inquiryDate + "\" THEN h.NOTE else \"\" END SEPARATOR '') AS \"" + columnDate + "\"";
                    inquirySQL = inquirySQL + caseString;
                }
            }

            // When DropDownList.Value is "請選擇" or null, return string value ""
            // If depNo's selected value is "請選擇"
            if (DropDownList10.SelectedItem.Value.ToString() == "請選擇")
            {
                depNo = "";
            }
            else
            {
                depNo = DropDownList10.SelectedItem.Value.ToString();
            }
            // If stage's selected value is "請選擇"
            if (DropDownList11.SelectedItem == null)
            {
                stage = "";
            }
            else
            {
                stage = DropDownList11.SelectedItem.Value.ToString();
            }
            // If actualShift's selected value is "請選擇"
            if (DropDownList12.SelectedItem.Value.ToString() == "請選擇")
            {
                actualShift = "";
            }
            else
            {
                actualShift = DropDownList12.SelectedItem.Value.ToString();
            }

            // create where SQL clause
            string whereString = "";
            // No filter is selected
            if (stage == "" && depNo == "" && actualShift == "")
            {
                Label7.Text = "【篩選條件二】未選擇任何條件！顯示僅篩選日期資料";
                Label7.ForeColor = Color.Red;
                whereString = " WHERE h.MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\"";
            }
            // Only depNo filter is selected
            else if (stage == "" && actualShift == "")
            {
                whereString = " WHERE p.DEPID = \"" + depNo + "\" AND  h.MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\"";
            }
            // Only actualShift filter is selected
            else if (stage == "" && depNo == "")
            {
                whereString = " WHERE p.SHIFT = \"" + actualShift + "\" AND  h.MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\"";
            }
            // when stage is not selected
            else if (stage == "")
            {
                whereString = " WHERE p.DEPID = \"" + depNo + "\" AND p.SHIFT = \"" + actualShift + "\" AND  h.MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\"";
            }
            // when actualShift is not selected
            else if (actualShift == "")
            {
                whereString = " WHERE p.DEPID = \"" + depNo + "\" AND p.STAGE = \"" + stage + "\" AND  h.MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\"";
            }
            // all filters are selected
            else
            {
                whereString = " WHERE p.DEPID = \"" + depNo + "\" AND p.STAGE = \"" + stage + "\" AND p.SHIFT = \"" + actualShift + "\" AND  h.MFGday BETWEEN \"" + fromDate + "\" AND \"" + toDate + "\"";
            }
            inquirySQL = inquirySQL + "FROM h_hr_mental_health_assessment h LEFT JOIN h_hr_manpower_daily_actual_name p ON(h.NAME = p.NAME) " + whereString + "GROUP BY NAME ORDER BY p.SHIFT";
            SQL = inquirySQL;

            InquiryMySQLData();

            GridView2.DataSource = dataTable; //告訴GridView資料來源為誰
            GridView2.DataBind();//綁定

            DisconnectMySQL();
        }
        else
        {
            Label7.Text = "日期設定錯誤！結束日期小於起始日期！";
            Label7.ForeColor = Color.Red;
            GridView2.DataSource = null;
            GridView2.DataBind();
        }
    }


    protected void DropDownList10_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList11.Items.Clear();
        string selectedValue = DropDownList10.SelectedItem.Value.ToString();
        SQL = "SELECT DISTINCT STAGE2 FROM personal_data WHERE DEPTNO  = \"" + selectedValue + "\"";

        InquiryMySQLData();

        //設定下拉選單的顯示文字與值，根據 duty_station datatable
        DropDownList11.DataValueField = "STAGE2";//值
        DropDownList11.DataTextField = "STAGE2";//顯示文字

        //設定 DropDownList1 的 datasource來源與綁定
        DropDownList11.DataSource = dataTable;
        DropDownList11.DataBind();
        DropDownList11.Items.Insert(0, new ListItem("請選擇", ""));

        DisconnectMySQL();
    }

    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList7.Items.Clear();
        string selectedValue = DropDownList8.SelectedItem.Value.ToString();
        SQL = "SELECT DISTINCT STAGE2 FROM personal_data WHERE DEPTNO  = \"" + selectedValue + "\"";

        InquiryMySQLData();

        //設定下拉選單的顯示文字與值，根據 duty_station datatable
        DropDownList7.DataValueField = "STAGE2";//值
        DropDownList7.DataTextField = "STAGE2";//顯示文字

        //設定 DropDownList1 的 datasource來源與綁定
        DropDownList7.DataSource = dataTable;
        DropDownList7.DataBind();
        DropDownList7.Items.Insert(0, new ListItem("請選擇", ""));

        DisconnectMySQL();
    }

}


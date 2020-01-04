using System;
using System.Collections;
using System.Diagnostics;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web.UI;

public partial class Pages_Report_Test_TC_Balance : System.Web.UI.Page
{
    // Initiate excel path string.
    string excelPath;
    // Initiate excel objects.
    Microsoft.Office.Interop.Excel.Application exApp;
    Microsoft.Office.Interop.Excel.Workbook exWbk;
    Microsoft.Office.Interop.Excel.Worksheet exWks;
    // Initiate datetime object to calculate time span
    DateTime startTime;
    DateTime endTime;
    // For excel killing process
    Process[] AllProcesses;
    Hashtable myHashtable = new Hashtable();
    // Initiate timer object
    TimerCallback callback = new TimerCallback(KillProcess);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
        }

        Label1.Text = "";
        Label2.Text = "";

        // Set the path of xlsm file you would like to execute.
        excelPath = @"C:\Users\1907075\Desktop\TC Balance_2.xlsm";

        Execute();

        // Close the window after the program is finished.
        ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.open('close.html', '_self', null);", true);
    }

    public void Execute()
    {

        // Check if the xlsm document exist.
        if (System.IO.File.Exists(excelPath))
        {
            Regex rgx = new Regex(@"xlsm$");
            // check if the file is a xlsm file.
            if (rgx.IsMatch(excelPath)) // is a xslm file.
            {
                Label1.Text = " >> " + DateTime.Now.ToLongTimeString() + ": XLSM file found. <br> >> ";
                Label1.Text = Label1.Text + DateTime.Now.ToLongTimeString() + ": Executing XLSM file..... <br> >> ";

                // document the time
                startTime = DateTime.Now;

                // Get all process id of excel begfore the program starts.
                CheckExcellProcesses();

                //  Execute Xslm file
                ExecuteXslm();

                // If the process id of excel before the program was executed, terminate it. 
                KillExcel();
            }
            else   // the file is not a xslm file.
            {
                Label1.Text = " >> " + DateTime.Now.ToLongTimeString() + ": The file is not a xlsm file, please check your file path again. <br>";
                EndStamp();
            }

        }
        else  // the file does not exist
        {
            Label1.Text = " >> " + DateTime.Now.ToLongTimeString() + ": The file does not exist, please check the path again. <br>";
            EndStamp();
        }

    }

    public void CheckExcellProcesses()
    {
        Process[] AllProcesses = Process.GetProcessesByName("excel");
        int iCount = 0;

        foreach (Process ExcelProcess in AllProcesses)
        {
            myHashtable.Add(ExcelProcess.Id, iCount);
            iCount = iCount + 1;
        }
    }

    public void ExecuteXslm()
    {
        exApp = new Microsoft.Office.Interop.Excel.Application();

        // Configure Visible=true to check the executing process. 
        exApp.Visible = false;

        exWbk = exApp.Workbooks.Open(excelPath);

        // Timer starts
        // 建立Timer物件，第一個參數為TimerCallback，第二個參數表示要傳給callback的物件
        // 第三個參數代表要多久之後執行(延遲啟動)，第四個參數代表每隔多久執行一次(延遲時間)
        // 該物件一旦產生就立刻計時了！
        // Reference: http://oblivious9.pixnet.net/blog/post/204243484-c%23-%E7%B0%A1%E6%98%93%E8%A8%88%E6%99%82%E5%99%A8
        System.Threading.Timer timer = new System.Threading.Timer(callback, null, 300000, 0);


        try  // If the program does not exceed timer's limit, execute the macro
        {
            // Run macro "auto_open"
            exApp.Run("auto_open");
            Label1.Text = Label1.Text + DateTime.Now.ToLongTimeString() + ": XLSM file has been executed. <br> >> ";
            // Document the time
            endTime = DateTime.Now;
            string timeSpan = new TimeSpan(endTime.Ticks - startTime.Ticks).TotalSeconds.ToString();
            Label1.Text = Label1.Text + DateTime.Now.ToLongTimeString() + ": " + timeSpan + " seconds taken to execute the file. <br> >> ";
        }
        catch (System.Runtime.InteropServices.COMException e)  // Exceed timer's limit, throw time-excession messsage.
        {
            try
            {
                Label1.Text = Label1.Text + DateTime.Now.ToLongTimeString() + ": Exceeded 300 seconds limit, process would be terminated forcibly. <br> >> ";
            }
            catch (System.NullReferenceException k)
            { }
        }

    }

    public void KillExcel()   // Kill excel's process method
    {
        // Quit the Excel Application
        //exApp.Quit();

        Process[] AllProcesses = Process.GetProcessesByName("excel");

        // check to kill the right process
        foreach (Process ExcelProcess in AllProcesses)
        {
            if (myHashtable.ContainsKey(ExcelProcess.Id) == false)
            {
                ExcelProcess.Kill();
            }
        }

        AllProcesses = null;

        EndStamp();

    }

    protected static void KillProcess(object obj) // Kill excel method when timer reach its limit.
    {
        Pages_Report_Test_TC_Balance RestartMethod = new Pages_Report_Test_TC_Balance();

        RestartMethod.KillExcel();
    }

    protected void EndStamp()
    {

        try
        {
            Label1.Text = Label1.Text + DateTime.Now.ToLongTimeString() + ": Process terminated, program ended. <br>";
            Label2.Text = "------------------------------------------------------------------&nbsp; End Stamp&nbsp; ------------------------------------------------------------------";
        }
        catch (System.NullReferenceException e)
        { }

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



}
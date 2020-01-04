<%@ Page Language="C#" AutoEventWireup="true" CodeFile="XlSMExecutorPageLoad.aspx.cs" Inherits="Pages_Report_Test_TC_Balance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>XLSM Executor</title>
    <style>
        p {
            text-align: center;
            font-size: larger;
            font-family: Arial;
            margin-left: 0px;
        }

        .Title {
            padding-top: 330px;
            padding-left: 40px;
            padding-bottom: 0px;
            text-align: left;
            font-size: 40px;
            margin: 0px;
            font-family: 'Times New Roman';
            color: white;
        }

        .DropDownList {
            width: 200px;
            font-size: large;
            font-family: Arial;
        }

        .Button {
            height: 27px;
            width: 100px;
            font-size: 20px;
            font-family: Arial;
        }

        .cover {
            background-image: url("F10000215.jpg");
            height: 400px;
            background-position: bottom center;
            /* Make the background image cover the area of the <div>, and clip the excess */
            background-size: cover;
        }

        .Log {
            text-align: left;
            color: white;
        }
    </style>
</head>



<body style="background-color: #d6f5f5; font-family: '微軟正黑體'; font-weight: 400">
    <form id="form1" runat="server" style="padding-bottom: 200px; padding-top: 0px">

        <div style="width: 1100px; margin: 0 auto; border: 0px; text-align: center;" class="cover">
            <p class="Title">XLSM Executor</p>
        </div>


        <div style="width: 1000px; margin: 0px auto; padding: 20px 50px; border: 0px; background-color: #FFFFFF; text-align: center; border-color: #FFFFFF;">
            <p style="font-weight: bolder">
                The XLSM File now executing is:</p>
            <p>
                TC Balance_2.xlsm</p>
            <p>
                &nbsp;
                (&quot;C:\Users\1907075\Desktop\TC Balance_2.xlsm&quot;)
            </p>
            <p>&nbsp;</p>
        </div>

        <div style="width: 1000px; margin: 0px auto; padding: 20px 50px; border: 0px; background-color: #051515;">

            <p style="text-align: center; height: 21px; width: 1000px; color: white;">------------------------------------------------------------------&nbsp; System Log&nbsp; ------------------------------------------------------------------</p>
            <p class="Log">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </p>
            <p class="Log" style="text-align: center">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
            <p>
                &nbsp;
            </p>
        </div>
    </form>
</body>




<script>



</script>


</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MentalAssessmentWebform.aspx.cs" Inherits="Pages_Report_Test_RicardoWeb" ValidateRequest="False" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        h3 {
            margin: 0px auto;
            padding: 10px;
            border: 0px;
            font-weight:400;
        }

        .cover {
            background-image: url("F10000214.jpg");
            height: 400px;
            background-position: bottom center;
            /* Make the background image cover the area of the <div>, and clip the excess */
            background-size: cover;
        }

        .cover_text {
            padding-top:300px;
            padding-left: 20px;
            padding-bottom: 0px;
            text-align: left;
            font-size: 60px;
            margin:0px;
            font-family: '微軟正黑體';
            color: white;
        }

        .time_stamp{
            padding-bottom:30px;
            padding-right:20px;
            text-align:right;
            color:white;
            font-family:'微軟正黑體';
            font-size:15px;
        }
    </style>

    

</head>
<body style="background-color: #f4bebe;font-family:'微軟正黑體';font-weight:400">
    <form id="form1" runat="server" style="padding-bottom:200px;padding-top:0px">

        
        <div style="width: 1100px;margin: 0 auto;border: 0px;text-align: center;" class="cover">
            <p class="cover_text">人員關懷系統</p>
            <div class="time_stamp"><asp:Label ID="Label9" runat="server"></asp:Label>
            </div>
        </div>
        

        <div style="width: 1000px; margin: 0px auto; padding: 20px 50px; border: 0px; background-color: #FFFFFF; text-align: center; border-color: #FFFFFF;">

            <h3 style="text-align: center;font-weight:bolder;font-size:30px">系統資料庫查詢</h3>
            <h3 style="text-align: center;"><asp:Label ID="Label7" runat="server"></asp:Label>
            </h3>
            <h3 style="text-align: left;">查詢日期：&nbsp;&nbsp; 從&nbsp;&nbsp;&nbsp; 
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="2019"></asp:ListItem>
                    <asp:ListItem Value="2020"></asp:ListItem>
                    <asp:ListItem Value="2021"></asp:ListItem>
                    <asp:ListItem Value="2022"></asp:ListItem>
                    <asp:ListItem Value="2023"></asp:ListItem>
                    <asp:ListItem Value="2024"></asp:ListItem>
                    <asp:ListItem Value="2025"></asp:ListItem>
                    <asp:ListItem Value="2026"></asp:ListItem>
                    <asp:ListItem>2027</asp:ListItem>
                    <asp:ListItem>2028</asp:ListItem>
                    <asp:ListItem>2029</asp:ListItem>
                </asp:DropDownList>
                年<asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem Value="04"></asp:ListItem>
                    <asp:ListItem Value="05"></asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem Value="08"></asp:ListItem>
                    <asp:ListItem Value="09"></asp:ListItem>
                    <asp:ListItem Value="10"></asp:ListItem>
                    <asp:ListItem Value="11"></asp:ListItem>
                    <asp:ListItem Value="12"></asp:ListItem>
                </asp:DropDownList>
                月<asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem Value="07"></asp:ListItem>
                    <asp:ListItem Value="08"></asp:ListItem>
                    <asp:ListItem Value="09"></asp:ListItem>
                    <asp:ListItem Value="10"></asp:ListItem>
                    <asp:ListItem Value="11"></asp:ListItem>
                    <asp:ListItem Value="12"></asp:ListItem>
                    <asp:ListItem Value="13"></asp:ListItem>
                    <asp:ListItem Value="14"></asp:ListItem>
                    <asp:ListItem Value="15"></asp:ListItem>
                    <asp:ListItem Value="16"></asp:ListItem>
                    <asp:ListItem Value="17"></asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem Value="19"></asp:ListItem>
                    <asp:ListItem Value="20"></asp:ListItem>
                    <asp:ListItem Value="21"></asp:ListItem>
                    <asp:ListItem Value="22"></asp:ListItem>
                    <asp:ListItem Value="23"></asp:ListItem>
                    <asp:ListItem Value="24"></asp:ListItem>
                    <asp:ListItem Value="25"></asp:ListItem>
                    <asp:ListItem Value="26"></asp:ListItem>
                    <asp:ListItem Value="27"></asp:ListItem>
                    <asp:ListItem Value="28"></asp:ListItem>
                    <asp:ListItem Value="29"></asp:ListItem>
                    <asp:ListItem Value="30"></asp:ListItem>
                    <asp:ListItem Value="31"></asp:ListItem>
                </asp:DropDownList>
                日&nbsp;&nbsp;&nbsp; 至&nbsp;&nbsp; 
                <asp:DropDownList ID="DropDownList4" runat="server">
                    <asp:ListItem Value="2019"></asp:ListItem>
                    <asp:ListItem Value="2020"></asp:ListItem>
                    <asp:ListItem Value="2021"></asp:ListItem>
                    <asp:ListItem Value="2022"></asp:ListItem>
                    <asp:ListItem Value="2023"></asp:ListItem>
                    <asp:ListItem Value="2024"></asp:ListItem>
                    <asp:ListItem Value="2025"></asp:ListItem>
                    <asp:ListItem Value="2026"></asp:ListItem>
                    <asp:ListItem>2027</asp:ListItem>
                    <asp:ListItem>2028</asp:ListItem>
                    <asp:ListItem>2029</asp:ListItem>
                </asp:DropDownList>
                年<asp:DropDownList ID="DropDownList5" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem Value="04"></asp:ListItem>
                    <asp:ListItem Value="05"></asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem Value="08"></asp:ListItem>
                    <asp:ListItem Value="09"></asp:ListItem>
                    <asp:ListItem Value="10"></asp:ListItem>
                    <asp:ListItem Value="11"></asp:ListItem>
                    <asp:ListItem Value="12"></asp:ListItem>
                </asp:DropDownList>
                月<asp:DropDownList ID="DropDownList6" runat="server">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem Value="07"></asp:ListItem>
                    <asp:ListItem Value="08"></asp:ListItem>
                    <asp:ListItem Value="09"></asp:ListItem>
                    <asp:ListItem Value="10"></asp:ListItem>
                    <asp:ListItem Value="11"></asp:ListItem>
                    <asp:ListItem Value="12"></asp:ListItem>
                    <asp:ListItem Value="13"></asp:ListItem>
                    <asp:ListItem Value="14"></asp:ListItem>
                    <asp:ListItem Value="15"></asp:ListItem>
                    <asp:ListItem Value="16"></asp:ListItem>
                    <asp:ListItem Value="17"></asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem Value="19"></asp:ListItem>
                    <asp:ListItem Value="20"></asp:ListItem>
                    <asp:ListItem Value="21"></asp:ListItem>
                    <asp:ListItem Value="22"></asp:ListItem>
                    <asp:ListItem Value="23"></asp:ListItem>
                    <asp:ListItem Value="24"></asp:ListItem>
                    <asp:ListItem Value="25"></asp:ListItem>
                    <asp:ListItem Value="26"></asp:ListItem>
                    <asp:ListItem Value="27"></asp:ListItem>
                    <asp:ListItem Value="28"></asp:ListItem>
                    <asp:ListItem Value="29"></asp:ListItem>
                    <asp:ListItem Value="30"></asp:ListItem>
                    <asp:ListItem Value="31"></asp:ListItem>
                </asp:DropDownList>
                日&nbsp;&nbsp;&nbsp; 
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="送出查詢" Style="height: 21px" />
                &nbsp;</h3>
            <h3 style="text-align: left;font-weight:bolder">額外篩選
            </h3>
            <h3 style="text-align: left;">人名：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="送出查詢" />
            </h3>
            <h3 style="text-align: left;">部門：<asp:DropDownList ID="DropDownList10" runat="server" OnSelectedIndexChanged="DropDownList10_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem>請選擇</asp:ListItem>
                <asp:ListItem>L6BL0</asp:ListItem>
                <asp:ListItem>L6BL1</asp:ListItem>
                <asp:ListItem>L6BL2</asp:ListItem>
            </asp:DropDownList>

                &nbsp;&nbsp;&nbsp; Stage：<asp:DropDownList ID="DropDownList11" runat="server">
                </asp:DropDownList>

                &nbsp;&nbsp;&nbsp; Shift：<asp:DropDownList ID="DropDownList12" runat="server">
                    <asp:ListItem>請選擇</asp:ListItem>
                    <asp:ListItem>DA</asp:ListItem>
                    <asp:ListItem>DB</asp:ListItem>
                    <asp:ListItem>DF</asp:ListItem>
                    <asp:ListItem>DX</asp:ListItem>
                    <asp:ListItem>DY</asp:ListItem>
                    <asp:ListItem>DZ</asp:ListItem>
                    <asp:ListItem>NA</asp:ListItem>
                    <asp:ListItem>NB</asp:ListItem>
                    <asp:ListItem>NX</asp:ListItem>
                    <asp:ListItem>NY</asp:ListItem>
                    <asp:ListItem>NZ</asp:ListItem>
                    <asp:ListItem>GD</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="送出查詢" style="height: 21px" />
            </h3>
            <div style="overflow: scroll">
                <asp:GridView ID="GridView2" runat="server" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CssClass="offset-1 justify-content-around table-hover table-borderd " CellPadding="2" CellSpacing="1" Width="100%">
                </asp:GridView>
            </div>

            <h3 style="text-align: center;">...............................................................................................................................................................................................</h3>
            <h3 style="text-align: center;font-weight:bolder;font-size:30px">當班人員列表</h3><asp:Label ID="Label8" runat="server"></asp:Label>
            <h3 style="text-align: left;font-weight:bolder">加入篩選
            </h3>
            <h3 style="text-align: left;">人名：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="送出查詢" Style="height: 21px" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="重新整理" />
            </h3>
            <h3 style="text-align: left;">部門：<asp:DropDownList ID="DropDownList8" runat="server" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem>請選擇</asp:ListItem>
                <asp:ListItem>L6BL0</asp:ListItem>
                <asp:ListItem>L6BL1</asp:ListItem>
                <asp:ListItem>L6BL2</asp:ListItem>
            </asp:DropDownList>

                &nbsp;&nbsp;&nbsp;
 Stage：
                <asp:DropDownList ID="DropDownList7" runat="server">
                </asp:DropDownList>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shift： 
                <asp:DropDownList ID="DropDownList9" runat="server">
                    <asp:ListItem>請選擇</asp:ListItem>
                    <asp:ListItem>DA</asp:ListItem>
                    <asp:ListItem>DB</asp:ListItem>
                    <asp:ListItem>DF</asp:ListItem>
                    <asp:ListItem>DX</asp:ListItem>
                    <asp:ListItem>DY</asp:ListItem>
                    <asp:ListItem>DZ</asp:ListItem>
                    <asp:ListItem>NA</asp:ListItem>
                    <asp:ListItem>NB</asp:ListItem>
                    <asp:ListItem>NX</asp:ListItem>
                    <asp:ListItem>NY</asp:ListItem>
                    <asp:ListItem>NZ</asp:ListItem>
                    <asp:ListItem>GD</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="送出查詢" Style="height: 21px" />
                &nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="重新整理" />
            </h3>
            <p style="text-align: center;">.....................................................................................</p>
            <p style="text-align: center;">
                <asp:Button ID="Button1" runat="server" Text="填寫完成，送出資料" Height="30px" Width="150px" OnClick="Button1_Click1" />
                &nbsp;
            </p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"
                    CssClass="offset-1 justify-content-around table-hover table-borderd " CellPadding="2" CellSpacing="1" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>

                        <asp:TemplateField HeaderText="NG">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckChanged" AutoPostBack="true" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="MFGday">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("MFGday") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("MFGday") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="OVERTIME">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("OVERTIME") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("OVERTIME") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="DN">
                            <EditItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("DN") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("DN") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="WNUM">
                            <EditItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("WNUM") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("WNUM") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="NAME">
                            <EditItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="NG_Note">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NG_Note") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </p>
        </div>
    </form>





</body>
</html>

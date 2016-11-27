<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form2.aspx.cs" Inherits="Demo.Form2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 48%;
            height: 0px;
        }
        .style2
        {
            width: 421px;
        }
        .style3
        {
            width: 434px;
            height: 87px;
        }
        .style4
        {
            height: 87px;
        }
    </style>
    <script src="pikaday.js" type="text/javascript"></script>
    <link href="css/pikaday.css" rel="stylesheet" type="text/css" />
    <link href="css/site.css" rel="stylesheet" type="text/css" />
    <link href="css/theme.css" rel="stylesheet" type="text/css" />
<%--        <script src="jquery.js" type="text/javascript"></script>
    <script src="jquery-ui.js" type="text/javascript"></script>
    <link href="jquery-ui.css" rel="stylesheet" type="text/css" />--%>

    <script type="text/javascript"> 
        var picker = new Pikaday({ field: document.getElementById('datepicker') });
        $(document).ready(function () {
            $('#TextBox2').datepicker({
                appendText: 'mm/dd/yyyy',
                showOn: 'both',
                bottonText: 'Calendar'
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox2" runat="server" Height="44px" 
            ontextchanged="TextBox2_TextChanged" Width="381px"></asp:TextBox>

      <%--  <script type="text/javascript">
            var picker = new Pikaday(
        {
        
            format: ' dd/mmm/yyyy',
            field: document.getElementById('TextBox2'),
            firstDay: 1,
            minDate: new Date('1940-01-01'),
            maxDate: new Date('2050-12-31'),
            yearRange: [20194, 2050],
            numberOfMonths: 1
//            $('.datepicker').pickadate({
  // Escape any “rule” characters with an exclamation mark (!).

//  formatSubmit: 'yyyy/mm/dd',
//  hiddenPrefix: 'prefix__',
//  hiddenSuffix: '__suffix'
//})            
        });
        picker.toString('dd/mmm/yyyy')
    
    </script>--%>

    <p>Format options:<br />
	<select id="format">
		<option value="mm/dd/yy">Default - mm/dd/yy</option>
		<option value="yy-mm-dd">ISO 8601 - yy-mm-dd</option>
		<option value="d M, y">Short - d M, y</option>
		<option value="d MM, y">Medium - d MM, y</option>
		<option value="DD, d MM, yy">Full - DD, d MM, yy</option>
		<option value="'day' d 'of' MM 'in the year' yy">With text - 'day' d 'of' MM 'in the year' yy</option>
	</select>
</p>
        <asp:Image ID="img1" runat="server" Height="264px" Width="272px" />
    &nbsp;
        <br />
        <table class="style1">
            <tr>
                <td class="style2" align="left">
                    <table class="style1">
                        <tr>
                            <td>
                                <table class="style1">
                                    <tr>
                                        <td class="style3">
                                            <br />
                                            <br />
                    <asp:TextBox ID="TextBox1" runat="server" Width="170px" 
                        ontextchanged="TextBox1_TextChanged" Height="30px"></asp:TextBox>
                                        </td>
                                        <td align="char" class="style4">
                    <asp:Calendar ID="cal1" runat="server" BackColor="White" BorderColor="White" 
                        Font-Names="Verdana" Font-Size="9pt" 
                        ForeColor="#0066FF" Height="16px" NextPrevFormat="FullMonth" 
                        onselectionchanged="cal1_SelectionChanged" SelectedDate="2016-01-15" 
                        VisibleDate="2016-01-15" Width="414px" BorderWidth="1px" 
                        FirstDayOfWeek="Sunday">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="34px" 
                        ImageUrl="~/Resources/key.png" onclick="ImageButton1_Click" Width="43px" 
                                                style="margin-left: 40px" />
                                        </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" align="left">
                    <br />
                    <table class="style1">
                        <tr>
                            <td>
                                <asp:Table ID="Table1" runat="server">
                                </asp:Table>
                                cvnvbnvnb</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table class="style1">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <asp:Login ID="Login1" runat="server">
        </asp:Login>

        <asp:AdRotator ID="AdRotator1" runat="server" DataSourceID="SqlDataSource1" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:INSTITUTOConnectionString %>" 
            SelectCommand="SELECT * FROM [ES]"></asp:SqlDataSource>

    </div>
    </form>
</body>
</html>

<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FiverModule._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .Space label
        {
          margin-left: 5px;
        }
    </style>
    <div class="row">
        <div class="col-md-5 col-lg-5">
            <h4 style="font-weight:bold;margin-top:15px">Select Date: </h4>
            <asp:Calendar CssClass="cal" ID="Calendar1" runat="server" SelectionMode="Day" Height="275px" Width="355px" 
                BackColor="White" BorderColor="White" BorderStyle="Solid" CellSpacing="1" 
                Font-Bold="True" Font-Overline="False" Font-Strikeout="False" ForeColor="Black" ShowGridLines="True" 
                ondayrender="Calendar1_DayRender" Font-Underline="False" OnSelectionChanged="Calendar1_SelectionChanged">
                <DayHeaderStyle BackColor="White" BorderColor="White" BorderStyle="Solid" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Top" />
                <DayStyle BackColor="#01BEC8" BorderColor="White" ForeColor="Black" HorizontalAlign="Center" />
                <NextPrevStyle BackColor="White" BorderColor="White" Font-Size="22px" ForeColor="Black" />
                <OtherMonthDayStyle BackColor="White" BorderColor="White" ForeColor="Black" />
                <SelectedDayStyle BackColor="#006666" Font-Bold="True" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="White" Font-Bold="True" Font-Size="18px" />
                <TodayDayStyle BackColor="#339966" ForeColor="White" />
                <WeekendDayStyle BackColor="White" BorderColor="White" />
            </asp:Calendar>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" OnClick="Button2_Click" Text="Confirm" Width="187px" />
            <br />
        </div>
        <div class="col-md-5 col-lg-6">
          <h4 style="font-weight:bold;margin-top:15px"">Select Time On : 
           <asp:Label ID="Label1" runat="server"  Text='<%# Eval("Date", "{MMM dd yyyy}") %>'></asp:Label>
            </h4>
          <h4 style="font-style: italic;font-family: 'Times New Roman';font-weight: bold">Your Timezone America/New York</h4>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="time" DataValueField="time">
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" OnClick="Button1_Click" Text="Confirm" Width="184px" />
     
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Calander_appConnectionString %>" SelectCommand="SELECT * FROM [Available]"></asp:SqlDataSource>
     
            <br />
     
        </div>
          
    </div>

</asp:Content>

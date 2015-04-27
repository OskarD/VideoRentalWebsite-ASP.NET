<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">

    <asp:Label ID="lblSearchResult" runat="server"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="SearchResultDataSource" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" ReadOnly="True" />
            <asp:BoundField DataField="Director" HeaderText="Director" SortExpression="Director" />
            <asp:BoundField DataField="Editor" HeaderText="Editor" SortExpression="Editor" />
            <asp:CommandField ShowSelectButton="True" SelectText="<p class='btn btn-small'>Reserve</p>" ControlStyle-Font-Underline="false"/>
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#ff2929" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SearchResultDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>" SelectCommand="SELECT title AS Title, REPLACE(company, '\r\n', ',') AS Company, director AS Director, editor AS Editor FROM allmovies WHERE (title LIKE '%' + @search + '%') OR (company LIKE '%' + @search + '%') OR (director LIKE '%' + @search + '%') OR (editor LIKE '%' + @search + '%')">
        <SelectParameters>
            <asp:QueryStringParameter Name="search" QueryStringField="search" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>


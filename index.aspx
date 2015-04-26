<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="PageContent" Runat="Server">
    <h1>Welcome</h1>
    <p>We provide all homes with rental movies! Even though no homes want any!</p>

    <div class="toplist">
        <h2>Movie toplist</h2>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" ShowFooter="False" ShowHeader="False">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <ItemStyle BackColor="#DEDFDE" ForeColor="Black" />
            <ItemTemplate>
                Title:
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>" SelectCommand="SELECT title AS Title FROM movies WHERE (times_reserved &gt; 0) ORDER BY times_reserved DESC"></asp:SqlDataSource>
    </div>
</asp:Content>


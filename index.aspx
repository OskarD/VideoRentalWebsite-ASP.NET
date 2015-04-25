<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="PageContent" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="toplist">
        <h2>Movie toplist</h2>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>" SelectCommand="SELECT title AS Title FROM movies WHERE (times_reserved &gt; 0) ORDER BY times_reserved DESC"></asp:SqlDataSource>
    </div>
</asp:Content>


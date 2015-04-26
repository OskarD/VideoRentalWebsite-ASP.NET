<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="movies.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <h1>Movies</h1>
    <p>Please select a movie below:</p>
    <p>
        <asp:DropDownList ID="ddlMovies" runat="server" AutoPostBack="True" DataSourceID="MovieListDataSource" DataTextField="title" DataValueField="title">
        </asp:DropDownList>
        <asp:SqlDataSource ID="MovieListDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>" SelectCommand="SELECT [title] FROM [allmovies]"></asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="MovieDetailsDataSource" GridLines="None" Height="50px" Width="125px">
            <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="director" HeaderText="director" SortExpression="director" />
                <asp:BoundField DataField="company" HeaderText="company" SortExpression="company" />
                <asp:BoundField DataField="editor" HeaderText="editor" SortExpression="editor" />
                <asp:BoundField DataField="summary" HeaderText="summary" SortExpression="summary" />
            </Fields>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        </asp:DetailsView>
    </p>



   
<asp:SqlDataSource ID="MovieDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>" SelectCommand="SELECT allmovies.title, allmovies.director, allmovies.company, allmovies.editor, summaries.summary FROM allmovies LEFT OUTER JOIN summaries ON allmovies.id = summaries.id WHERE ([title] = @title)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlMovies" Name="title" PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


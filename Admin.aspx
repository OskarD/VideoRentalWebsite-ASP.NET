<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <h1>Customers</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="CustomersDataSource" GridLines="None" DataKeyNames="customer_id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
            <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
            <asp:BoundField DataField="address1" HeaderText="address1" SortExpression="address1" />
            <asp:BoundField DataField="address2" HeaderText="address2" SortExpression="address2" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="province" HeaderText="province" SortExpression="province" />
            <asp:BoundField DataField="pcode" HeaderText="pcode" SortExpression="pcode" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="customer_id" HeaderText="customer_id" InsertVisible="False" ReadOnly="True" SortExpression="customer_id" />
            <asp:BoundField DataField="admin" HeaderText="admin" SortExpression="admin" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:SqlDataSource ID="CustomersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>"  DeleteCommand="DELETE FROM [customer] WHERE [customer_id] = @customer_id" InsertCommand="INSERT INTO [customer] ([first_name], [last_name], [address1], [address2], [city], [province], [pcode], [phone], [login], [password], [email], [admin]) VALUES (@first_name, @last_name, @address1, @address2, @city, @province, @pcode, @phone, @login, @password, @email, @admin)" SelectCommand="SELECT * FROM [customer]" UpdateCommand="UPDATE [customer] SET [first_name] = @first_name, [last_name] = @last_name, [address1] = @address1, [address2] = @address2, [city] = @city, [province] = @province, [pcode] = @pcode, [phone] = @phone, [login] = @login, [password] = @password, [email] = @email, [admin] = @admin WHERE [customer_id] = @customer_id">
        <DeleteParameters>
            <asp:Parameter Name="customer_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="first_name" Type="String" />
            <asp:Parameter Name="last_name" Type="String" />
            <asp:Parameter Name="address1" Type="String" />
            <asp:Parameter Name="address2" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="province" Type="String" />
            <asp:Parameter Name="pcode" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="login" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="admin" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="first_name" Type="String" />
            <asp:Parameter Name="last_name" Type="String" />
            <asp:Parameter Name="address1" Type="String" />
            <asp:Parameter Name="address2" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="province" Type="String" />
            <asp:Parameter Name="pcode" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="login" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="admin" Type="Int32" />
            <asp:Parameter Name="customer_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h1>Movies</h1>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="id" DataSourceID="MoviesDataSource" GridLines="None">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="company" HeaderText="company" SortExpression="company" />
            <asp:BoundField DataField="director" HeaderText="director" SortExpression="director" />
            <asp:BoundField DataField="editor" HeaderText="editor" SortExpression="editor" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:SqlDataSource ID="MoviesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>" DeleteCommand="DELETE FROM [allmovies] WHERE [id] = @id" InsertCommand="INSERT INTO [allmovies] ([id], [title], [company], [director], [editor]) VALUES (@id, @title, @company, @director, @editor)" SelectCommand="SELECT * FROM [allmovies]" UpdateCommand="UPDATE [allmovies] SET [title] = @title, [company] = @company, [director] = @director, [editor] = @editor WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="company" Type="String" />
            <asp:Parameter Name="director" Type="String" />
            <asp:Parameter Name="editor" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="company" Type="String" />
            <asp:Parameter Name="director" Type="String" />
            <asp:Parameter Name="editor" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h1>Reservations</h1><asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataSourceID="ReservationsDataSource" GridLines="None">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Customer" HeaderText="Customer" ReadOnly="True" SortExpression="Customer" />
            <asp:BoundField DataField="Movie" HeaderText="Movie" SortExpression="Movie" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:SqlDataSource ID="ReservationsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>" DeleteCommand="DELETE FROM [allmovies] WHERE [id] = @id" InsertCommand="INSERT INTO [allmovies] ([id], [title], [company], [director], [editor]) VALUES (@id, @title, @company, @director, @editor)" SelectCommand="SELECT customer.first_name + ' ' + customer.last_name AS Customer, allmovies.title AS Movie FROM reservations INNER JOIN customer ON reservations.customer_id = customer.customer_id INNER JOIN allmovies ON reservations.movie_id = allmovies.id" UpdateCommand="UPDATE [allmovies] SET [title] = @title, [company] = @company, [director] = @director, [editor] = @editor WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="company" Type="String" />
            <asp:Parameter Name="director" Type="String" />
            <asp:Parameter Name="editor" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="company" Type="String" />
            <asp:Parameter Name="director" Type="String" />
            <asp:Parameter Name="editor" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>


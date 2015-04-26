<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div id="logged_in_area" Runat="Server">
        <asp:Label ID="lblLoggedInInfo" runat="server" Text="You are logged in!"></asp:Label>
        <asp:Label ID="lblLoggedIn" runat="server"></asp:Label>
    </div>
    <div id="not_logged_in_area" Runat="Server">
        <asp:Label ID="lblNotLoggedInInfo" runat="server" Text="You are not logged in."></asp:Label>
        <br />
        <br />
        Email<br />
        <asp:TextBox ID="txtEmail" runat="server" Width="119px"></asp:TextBox>
        <br />
        Password<br />
        <asp:TextBox ID="txtPassword" type="password" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnLogIn" runat="server" Text="Log In" class="btn" OnClick="btnLogIn_Click"/>
        <br />
        <br />
        <asp:Label ID="lblLoginResult" runat="server"></asp:Label>
    </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div id="logged_in_area" Runat="Server">
        <asp:Label ID="lblLoggedIn" runat="server"></asp:Label>
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="ReservationsDataList">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="Reserved_MoviesLabel" runat="server" Text='<%# Eval("[Reserved Movies]") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="Reserved_MoviesTextBox" runat="server" Text='<%# Bind("[Reserved Movies]") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="Reserved_MoviesTextBox" runat="server" Text='<%# Bind("[Reserved Movies]") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="Reserved_MoviesLabel" runat="server" Text='<%# Eval("[Reserved Movies]") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">Reserved Movies</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="Reserved_MoviesLabel" runat="server" Text='<%# Eval("[Reserved Movies]") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="ReservationsDataList" runat="server" ConnectionString="<%$ ConnectionStrings:aspConnectionString %>" OnSelecting="ReservationsDataList_Selecting" SelectCommand="SELECT allmovies.title AS [Reserved Movies] FROM reservations INNER JOIN allmovies ON reservations.movie_id = allmovies.id WHERE (reservations.customer_id = @customer_id) ORDER BY reservations.id DESC">
            <SelectParameters>
                <asp:SessionParameter Name="customer_id" SessionField="customer" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnLogOut" runat="server" Text="Log Out" OnClick="btnLogOut_Click" CssClass="btn btn-small" />
    </div>
    <div id="not_logged_in_area" Runat="Server">
        <h2>Login</h2>
        Email<br />
        <asp:TextBox ID="txtEmail" runat="server" Width="119px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter an email address" ValidationGroup="login"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^\w[^@]*@\w[^@.]+.\w[^.]{2,4}$" ErrorMessage="Must be a valid email" ValidationGroup="login"></asp:RegularExpressionValidator>
        <br />
        Password<br />
        <asp:TextBox ID="txtPassword" type="password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter a password" ValidationGroup="login"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnLogIn" runat="server" Text="Log In" OnClick="btnLogIn_Click" CssClass="btn" ValidationGroup="login" />
        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn" />
        <br />
        <asp:Label ID="lblLoginInfo" runat="server"></asp:Label>
    </div>
    <div id="register_area" runat="server">
        <h2>Register</h2>
        <strong>Personal Details</strong><br />
        First Name<br />
        <asp:TextBox ID="txtRegisterFirstName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterFirstName" runat="server" ControlToValidate="txtRegisterFirstName" ErrorMessage="Enter a first name" ValidationGroup="register"></asp:RequiredFieldValidator>
        <br />
        Last Name<br />
        <asp:TextBox ID="txtRegisterLastName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterLastName" runat="server" ControlToValidate="txtRegisterLastName" ErrorMessage="Enter a last name" ValidationGroup="register"></asp:RequiredFieldValidator>
        <br />
        Address 1<br />
        <asp:TextBox ID="txtRegisterAddress1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterAddress1" runat="server" ControlToValidate="txtRegisterAddress1" ErrorMessage="Enter an address" ValidationGroup="register"></asp:RequiredFieldValidator>
        <br />
        Address 2<br />
        <asp:TextBox ID="txtRegisterAddress2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterAddress2" runat="server" ControlToValidate="txtRegisterAddress2" ErrorMessage="Enter an address" ValidationGroup="register"></asp:RequiredFieldValidator>
        <br />
        City<br />
        <asp:TextBox ID="txtRegisterCity" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterCity" runat="server" ControlToValidate="txtRegisterCity" ErrorMessage="Enter a city" ValidationGroup="register"></asp:RequiredFieldValidator>
        <br />
        Province<br />
        <asp:TextBox ID="txtRegisterProvince" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterProvince" runat="server" ControlToValidate="txtRegisterProvince" ErrorMessage="Enter a province (Two letters)" ValidationGroup="register"></asp:RequiredFieldValidator>
        <br />
        Postal Code<br />
        <asp:TextBox ID="txtRegisterPostalCode" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterPostalCode" runat="server" ControlToValidate="txtRegisterPostalCode" ErrorMessage="Enter a postal code" ValidationGroup="register"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="revRegisterPostalCode" runat="server" ControlToValidate="txtRegisterPostalCode" ValidationExpression="([A-Z]\d){3}" ErrorMessage="Must be a valid postal code" ValidationGroup="register"></asp:RegularExpressionValidator>
            
        <br />
        Phone<br />
        <asp:TextBox ID="txtRegisterPhone" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterPhone" runat="server" ControlToValidate="txtRegisterPhone" ErrorMessage="Enter a phone number" ValidationGroup="register"></asp:RequiredFieldValidator>
        <br />
        <br />
        
        <strong>Account Access</strong><br />
        Email<br />
        <asp:TextBox ID="txtRegisterEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterEmail" runat="server" ControlToValidate="txtRegisterEmail" ErrorMessage="Enter an email" ValidationGroup="register"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revRegisterEmail" runat="server" ControlToValidate="txtRegisterEmail" ValidationExpression="^\w[^@]*@\w[^@.]+.\w[^.]{2,4}$" ErrorMessage="Must be a valid email" ValidationGroup="register"></asp:RegularExpressionValidator>
        <br />
        Password<br />
        <asp:TextBox ID="txtRegisterPassword" type="password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRegisterPassword" runat="server" ControlToValidate="txtRegisterPassword" ErrorMessage="Enter a password" ValidationGroup="register"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnRegisterPerform" runat="server" Text="Register" OnClick="btnRegisterPerform_Click" CssClass="btn" ValidationGroup="register" />
        <br />
    </div>
</asp:Content>


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

public partial class Account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] == null) // Not logged in
        {
            logged_in_area.Attributes.Add("hidden", "true");
        }
        else
        {
            not_logged_in_area.Attributes.Add("hidden", "true");
            Customer customer = (Customer) Session["Customer"];

            lblLoggedIn.Text = customer.ToHTML();
        }
    }
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        Customer customer = Customer.LogIn(txtEmail.Text, txtPassword.Text);

        if (customer == null)
        {
            lblLoginResult.Text = "Error: Username or password was not correct.";
        }
        else
        {
            lblLoginResult.Text = "Success! You have logged in.";
            Session.Add("Customer", customer);
            Server.Transfer("Account.aspx");
        }
    }
}
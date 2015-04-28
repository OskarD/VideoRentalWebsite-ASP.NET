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
        register_area.Attributes.Add("hidden", "true");
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
            lblLoggedIn.Text = "Error: Username or password was not correct.";
        }
        else
        {
            Session.Add("Customer", customer);
            Response.Redirect("Account.aspx");
        }
    }
    protected void ReservationsDataList_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (Session["customer"] != null)
        {
            e.Command.Parameters[0].Value = ((Customer)Session["customer"]).Id;
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        not_logged_in_area.Attributes.Add("hidden", "true");
        register_area.Attributes.Remove("hidden");
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Account.aspx");
    }
    protected void btnRegisterPerform_Click(object sender, EventArgs e)
    {
        Customer customer = new Customer();
        customer.FirstName = txtRegisterFirstName.Text;
        customer.LastName = txtRegisterLastName.Text;
        customer.Address1 = txtRegisterAddress1.Text;
        customer.Address2 = txtRegisterAddress2.Text;
        customer.City = txtRegisterCity.Text;
        customer.Province = txtRegisterProvince.Text;
        customer.PostalCode = txtRegisterPostalCode.Text;
        customer.PhoneNumber = txtRegisterPhone.Text;
        customer.Email = txtRegisterEmail.Text;
        customer.Password = txtRegisterPassword.Text;

        customer.Register();

        lblLoginInfo.Text = "You have registered. Please log in.";
        not_logged_in_area.Attributes.Remove("hidden");
        register_area.Attributes.Add("hidden", "true");

    }
}
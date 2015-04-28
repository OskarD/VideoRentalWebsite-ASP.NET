using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer customer = (Customer)Session["Customer"];

        if (customer == null || customer.Admin != 1)
            Response.Redirect("Account.aspx");
    }
}
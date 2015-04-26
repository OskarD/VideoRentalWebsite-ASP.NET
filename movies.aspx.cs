using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["Customer"] == null) // Not logged in
        {
            lblResult.Text = "You need to log in before you can reserve any movies.";
        }
        else
        {
            string movieTitle = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;

            Reservation reservation = new Reservation();
            Customer customer = (Customer)Session["Customer"];
            reservation.CustomerId = customer.Id;
            reservation.Reserve(movieTitle);

            lblResult.Text = "You have reserved the movie " + movieTitle;
        }
    }
}
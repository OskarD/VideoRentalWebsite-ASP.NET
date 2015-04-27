using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["search"] == null)
            lblSearchResult.Text = "Please use the Search bar at the top of the page to perform a search.";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["Customer"] == null) // Not logged in
        {
            lblSearchResult.Text = "You need to log in before you can reserve any movies.";
        }
        else
        {
            string movieTitle = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;

            Reservation reservation = new Reservation();
            Customer customer = (Customer)Session["Customer"];
            reservation.CustomerId = customer.Id;
            reservation.Reserve(movieTitle);

            lblSearchResult.Text = "You have reserved the movie " + movieTitle;
        }
    }
}
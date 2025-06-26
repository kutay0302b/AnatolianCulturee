using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isAuthenticated"] == null || !(bool)Session["isAuthenticated"])
        {
            Response.Redirect("~/Admin/Login.aspx");
        }
        if (!IsPostBack)
        {
            LoadTours();

        }
    }

    private void LoadTours()
    {
        var tours = TourProvider.GetTours();
        rptTours.DataSource = tours;
        rptTours.DataBind();
    }



    protected void btnDelete_Click(object sender, EventArgs e)
    {
        var btn = (System.Web.UI.WebControls.Button)sender;
        int tourId = Convert.ToInt32(btn.CommandArgument);

        try
        {
            TourProvider.DeleteTour(tourId);
            LoadTours(); // Yeniden listele
        }
        catch (Exception ex)
        {
            // Gerekirse logla ya da mesaj göster
            // örn: lblHata.Text = ex.Message;
        }
    }

}
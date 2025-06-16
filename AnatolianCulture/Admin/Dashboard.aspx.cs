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

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        var btn = (System.Web.UI.WebControls.Button)sender;
        int tourId = Convert.ToInt32(btn.CommandArgument);

        // TODO: Yönlendirme veya popup ile düzenleme
        //Response.Redirect("EditTour.aspx?id=" + tourId);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        var btn = (System.Web.UI.WebControls.Button)sender;
        int tourId = Convert.ToInt32(btn.CommandArgument);

        // TODO: Silme işlemini TourProvider üzerinden uygula
        // örnek: TourProvider.DeleteTour(tourId);

        // Yeniden listele
        LoadTours();
    }
}
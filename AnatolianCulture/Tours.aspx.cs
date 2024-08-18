using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Tours : System.Web.UI.Page
{
    protected List<Tour> FilteredTours { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int tourType = 0;
            if (int.TryParse(Request.QueryString["tourType"], out tourType))
            {
                var tours = TourProvider.GetTours();
                FilteredTours = tours.FindAll(t => t.TurType == tourType);
            }
        }

    }
    protected string GetPhotoPath(string photoName)
    {
        return "/Images/" + photoName;
    }


}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _TourDetails : System.Web.UI.Page
{
    protected List<TourContent> FilteredContents { get; set; }
    protected List<TourDetail> FilteredDetails { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int turID = 0;
            if (int.TryParse(Request.QueryString["tour"], out turID))
            {
                var tourContents = TourContentProvider.GetTourContents();
                FilteredContents = tourContents.FindAll(t => t.TurID == turID);

                var tourDetails = TourContentProvider.GetTourDetails();
                FilteredDetails = tourDetails.FindAll(t => t.TurID == turID);
            }
        }
    }
}
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
        //if (!IsPostBack)
        //{
        //    int tourType = 0;
        //    int child = 0;
        //    int nature = 0;
        //    int cultural = 0;
        //    int enjoy = 0;

        //    var tours = TourProvider.GetTours();
        //    if (int.TryParse(Request.QueryString["tourType"], out tourType))
        //    {
        //        FilteredTours = tours.FindAll(t => t.TurType == tourType);
        //    }
        //    else if (int.TryParse(Request.QueryString["child"], out child))
        //    {
        //        FilteredTours = tours.FindAll(t => t.TurAciklama.Contains("Çocuk"));
        //    }
        //    else if (int.TryParse(Request.QueryString["nature"], out nature))
        //    {
        //        FilteredTours = tours.FindAll(t => t.TurAciklama.Contains("Doğa"));

        //    }
        //    else if (int.TryParse(Request.QueryString["cultural"], out cultural))
        //    {
        //        FilteredTours = tours.FindAll(t => t.TurAciklama.Contains("Kültürel"));

        //    }
        //    else if (int.TryParse(Request.QueryString["enjoy"], out enjoy))
        //    {
        //        FilteredTours = tours.FindAll(t => t.TurAciklama.Contains("Eğlence"));

        //    }
        //}
        if (!IsPostBack)
        {
            var tours = TourProvider.GetTours();
            int tourType, child, nature, cultural, enjoy;

            FilteredTours = tours.FindAll(t =>
                (int.TryParse(Request.QueryString["tourType"], out tourType) && t.TurType == tourType) ||
                (int.TryParse(Request.QueryString["child"], out child) && t.TurAciklama.Contains("Çocuk")) ||
                (int.TryParse(Request.QueryString["nature"], out nature) && t.TurAciklama.Contains("Doğa")) ||
                (int.TryParse(Request.QueryString["cultural"], out cultural) && t.TurAciklama.Contains("Kültürel")) ||
                (int.TryParse(Request.QueryString["enjoy"], out enjoy) && t.TurAciklama.Contains("Eğlence"))
            );
        }


    }
    protected string GetPhotoPath(string photoName)
    {
        return "Images/" + photoName;
    }


}
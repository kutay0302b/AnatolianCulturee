using Ganss.Xss;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_AddTour : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isAuthenticated"] == null || !(bool)Session["isAuthenticated"])
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        try
        {
            // 1. TurType (tüm tablolarda ortak)
            int turType = int.Parse(ddlContentType.SelectedValue);

            // 2. Fotoğraf işlemi
            string photoName = "";
            if (fuTurPhoto.HasFile)
            {
                string folder = Server.MapPath("~/Images/");
                photoName = Path.GetFileName(fuTurPhoto.FileName);
                string path = Path.Combine(folder, photoName);
                fuTurPhoto.SaveAs(path);
            }

            // 3. T_Tur insert
            var tour = new Tour
            {
                TurName = txtTurName.Text.Trim(),
                TurFiyat = txtTurFiyat.Text.Trim(),
                TurType = turType,
                TurAciklama = txtTurAciklama.Text.Trim(),
                TurPhoto = photoName,
                TurBasTarih = DateTime.Parse(txtBasTarih.Text),
                TurBitTarih = DateTime.Parse(txtBitTarih.Text)
            };
            int turId = TourProvider.InsertTour(tour);

            // 4. T_TurDetails insert
            var details = new TourDetail
            {
                TurID = turId,
                TurIn = hfTurIn.Value,
                TurOut = hfTurOut.Value,
                TurType = turType,
                GenelFiyat = txtGenelFiyat.Text.Trim(),
                TekKisi = txtTekKisi.Text.Trim(),
                CiftKisi = txtCiftKisi.Text.Trim()
            };
            TourContentProvider.InsertDetails(details);

            // 5. T_TurDetailsContent insert (JSON parse)
            string json = hfContentList.Value;
            if (!string.IsNullOrEmpty(json))
            {
                var contents = Newtonsoft.Json.JsonConvert.DeserializeObject<List<TourContentFromClient>>(json);
                foreach (var item in contents)
                {
                    var content = new TourContent
                    {
                        TurID = turId,
                        TurContentBaslik = item.baslik,
                        TurContent = CleanHtmlContent(item.icerik),
                        TurType = turType
                    };
                    TourContentProvider.InsertContent(content);
                }
            }

            // 6. Bilgi
            Response.Redirect("Dashboard.aspx");
        }
        catch (Exception ex)
        {

            Response.Write(ex);
        }
    }

    public static string CleanHtmlContent(string html)
    {
        if (string.IsNullOrWhiteSpace(html))
            return "";

        var sanitizer = new HtmlSanitizer();

        sanitizer.AllowedTags.Add("p");
        sanitizer.AllowedTags.Add("br");
        sanitizer.AllowedTags.Add("b");
        sanitizer.AllowedTags.Add("i");
        sanitizer.AllowedTags.Add("u");
        sanitizer.AllowedTags.Add("ul");
        sanitizer.AllowedTags.Add("ol");
        sanitizer.AllowedTags.Add("li");
        sanitizer.AllowedTags.Add("table");
        sanitizer.AllowedTags.Add("tr");
        sanitizer.AllowedTags.Add("td");
        sanitizer.AllowedTags.Add("strong");
        sanitizer.AllowedTags.Add("em");
        sanitizer.AllowedTags.Add("a");
        sanitizer.AllowedTags.Add("img");

        sanitizer.AllowedAttributes.Add("href");
        sanitizer.AllowedAttributes.Add("src");
        sanitizer.AllowedAttributes.Add("alt");
        sanitizer.AllowedAttributes.Add("style");

        return sanitizer.Sanitize(html);
    }

    public class TourContentFromClient
    {
        public int gun { get; set; }
        public string baslik { get; set; }
        public string icerik { get; set; }
        public int turType { get; set; }
    }
}
using Ganss.Xss;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EditTour : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string turIdParam = Request.QueryString["turID"];
            int turID;

            if (!string.IsNullOrEmpty(turIdParam) && int.TryParse(turIdParam, out turID))
            {
                LoadTourData(turID);
            }
            else
            {
                Response.Redirect("Dashboard.aspx");
            }
        }
    }

    private void LoadTourData(int turID)
    {
        // Ana tur bilgileri
        Tour tour = TourProvider.GetTourById(turID);
        if (tour != null)
        {
            txtTurName.Text = tour.TurName;
            txtTurFiyat.Text = tour.TurFiyat;
            ddlContentType.SelectedValue = tour.TurType.ToString();
            txtBasTarih.Text = tour.TurBasTarih.HasValue ? tour.TurBasTarih.Value.ToString("yyyy-MM-dd") : "";
            txtBitTarih.Text = tour.TurBitTarih.HasValue ? tour.TurBitTarih.Value.ToString("yyyy-MM-dd") : "";
            txtTurAciklama.Text = tour.TurAciklama;
        }

        // Detay fiyat ve servis bilgileri
        TourDetail detail = TourContentProvider.GetDetailsByTourId(turID);

        string turInJson = "[]";
        string turOutJson = "[]";
        if (detail != null)
        {
            txtGenelFiyat.Text = detail.GenelFiyat;
            txtTekKisi.Text = detail.TekKisi;
            txtCiftKisi.Text = detail.CiftKisi;
            hfTurIn.Value = detail.TurIn;
            hfTurOut.Value = detail.TurOut;

            var turInList = (detail.TurIn ?? "").Split('|').Where(x => !string.IsNullOrWhiteSpace(x)).ToList();
            var turOutList = (detail.TurOut ?? "").Split('|').Where(x => !string.IsNullOrWhiteSpace(x)).ToList();
            turInJson = new JavaScriptSerializer().Serialize(turInList);
            turOutJson = new JavaScriptSerializer().Serialize(turOutList);
        }

        // İçerik bilgileri
        var contents = TourContentProvider.GetTourContentsByTourId(turID);
        var contentList = contents.Select((c, index) => new
        {
            gun = index + 1,
            baslik = c.TurContentBaslik,
            icerik = c.TurContent,
            turType = c.TurType
        }).ToList();

        string contentJson = new JavaScriptSerializer().Serialize(contentList);

        // Eğer hiç veri yoksa boş dizi stringlerini gönder (JS otomatik ilk satırı oluşturacak)
        if (string.IsNullOrWhiteSpace(contentJson) || contentList.Count == 0)
            contentJson = "[]";
        if (string.IsNullOrWhiteSpace(turInJson) || turInJson == null)
            turInJson = "[]";
        if (string.IsNullOrWhiteSpace(turOutJson) || turOutJson == null)
            turOutJson = "[]";

        // JS'ye global olarak contentList, turInList, turOutList ver
        string fullScript =
            "var contentList = " + contentJson + ";\n" +
            "var turInList = " + turInJson + ";\n" +
            "var turOutList = " + turOutJson + ";\n" +
            "renderDynamicInputs();";

        ClientScript.RegisterStartupScript(this.GetType(), "loadData", fullScript, true);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int turID;
        if (!int.TryParse(Request.QueryString["turID"], out turID))
            return;

        DateTime basTarih, bitTarih;
        if (!DateTime.TryParse(txtBasTarih.Text, out basTarih) || !DateTime.TryParse(txtBitTarih.Text, out bitTarih))
            return;

        Tour updatedTour = new Tour
        {
            ID = turID,
            TurName = txtTurName.Text.Trim(),
            TurFiyat = txtTurFiyat.Text.Trim(),
            TurType = int.Parse(ddlContentType.SelectedValue),
            TurBasTarih = basTarih,
            TurBitTarih = bitTarih,
            TurAciklama = txtTurAciklama.Text.Trim()
        };

        TourDetail detail = new TourDetail
        {
            TurID = turID,
            GenelFiyat = txtGenelFiyat.Text.Trim(),
            TurType = int.Parse(ddlContentType.SelectedValue),

            TekKisi = txtTekKisi.Text.Trim(),
            CiftKisi = txtCiftKisi.Text.Trim(),
            TurIn = hfTurIn.Value,
            TurOut = hfTurOut.Value
        };

        string rawJson = hfContentList.Value;
        var serializer = new JavaScriptSerializer();
        List<TourContent> contents = new List<TourContent>();

        try
        {
            var parsedList = serializer.Deserialize<List<ContentItem>>(rawJson);
            foreach (var item in parsedList)
            {
                contents.Add(new TourContent
                {
                    TurID = turID,
                    TurContentBaslik = item.baslik,
                    TurContent = CleanHtmlContent(item.icerik),
                    TurType = updatedTour.TurType,
                });
            }
        }
        catch
        {
            // Eğer hiç içerik yoksa (kullanıcı sıfırdan başlatıp kaydetmemişse) boş kalsın
        }

        TourProvider.UpdateTourAll(updatedTour, detail, contents);
    }

    public class ContentItem
    {
        public string baslik { get; set; }
        public string icerik { get; set; }
        public int turType { get; set; }
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
}

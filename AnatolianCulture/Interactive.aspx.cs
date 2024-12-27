using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Interactive : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Veritabanından verileri al
            var interactiveList = InteractiveProvider.GetAllInteractive();

            var groupedData = interactiveList
              .GroupBy(i => string.Format("{0} {1}", i.Month, i.Year))
              .Select(g => new
              {
                  MonthYear = g.Key,
                  Contents = g.Select(item => new
                  {
                      item.Day,
                      item.Month,
                      item.Weekday,
                      item.Title,
                      item.Details,
                      Price = string.IsNullOrEmpty(item.Price) ? "Bilgi için " + item.ContactInfo : item.Price,
                      item.ImageUrl
                  }).ToList()
              }).ToList();

            repeaterMonths.DataSource = groupedData;
            repeaterMonths.DataBind();

     


        }
    }
}
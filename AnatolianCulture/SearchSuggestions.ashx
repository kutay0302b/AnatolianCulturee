<%@ WebHandler Language="C#" Class="SearchSuggestions" %>

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;

public class SearchSuggestions : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string term = context.Request.QueryString["term"];
        List<Tour> tours = TourProvider.SearchTours(term);

        var suggestions = new List<object>();
        foreach (var tour in tours)
        {
            suggestions.Add(new
            {
                label = tour.TurName,
                value = tour.ID,
                type = tour.TurType
            });
        }

        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.ContentType = "application/json";
        context.Response.Write(js.Serialize(suggestions));
    }

    public bool IsReusable
    {
        get { return false; }
    }
}
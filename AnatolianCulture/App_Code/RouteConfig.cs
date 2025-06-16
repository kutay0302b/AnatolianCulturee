using System.Web.Routing;
using System.Web;

public class RouteConfig
{
    public static void RegisterRoutes(RouteCollection routes)
    {
        routes.RouteExistingFiles = true;

        /*routes.MapPageRoute("HomeRoute", "home", "~/Default.aspx");
        routes.MapPageRoute("ToursRoute", "tours", "~/Tours.aspx");
        routes.MapPageRoute("TourDetailsRoute", "tour/{id}", "~/TourDetails.aspx");
        routes.MapPageRoute("SearchRoute", "search", "~/Search.aspx");
        routes.MapPageRoute("AboutRoute", "about", "~/About.aspx");*/

    }
}

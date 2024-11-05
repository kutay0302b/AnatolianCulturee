using System.Web.Routing;
using System.Web;

public class RouteConfig
{
    public static void RegisterRoutes(RouteCollection routes)
    {
        // .aspx uzantısını kaldırmak için RouteDefaults ekleme
        routes.RouteExistingFiles = true;

        // Ana sayfa yönlendirmesi
        routes.MapPageRoute("HomeRoute", "home", "~/Default.aspx");

        // Tur sayfası yönlendirmesi - Örneğin: /tours
        routes.MapPageRoute("ToursRoute", "tours", "~/Tours.aspx");

        // Detay sayfası yönlendirmesi - Örneğin: /tour/5
        routes.MapPageRoute("TourDetailsRoute", "tour/{id}", "~/TourDetails.aspx");

        // Arama sayfası yönlendirmesi - Örneğin: /search?query=turizm
        routes.MapPageRoute("SearchRoute", "search", "~/Search.aspx");

        // Diğer yönlendirmeler
        // Örneğin bir 'about' sayfası için:
        routes.MapPageRoute("AboutRoute", "about", "~/About.aspx");

        // İhtiyaca göre daha fazla rota ekleyin
    }
}

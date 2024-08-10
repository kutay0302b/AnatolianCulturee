using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TourProvider
/// </summary>
public class TourProvider
{
    public static List<Tour> GetTours()
    {
        var tourList = new List<Tour>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM anatolianculture.t_tur;", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tour = new Tour();
                    tour.ID = reader.GetInt32("ID");
                    tour.TurName = reader.GetString("TurName");
                    tour.TurFiyat = reader.GetInt32("TurFiyat");
                    tour.TurType = reader.GetInt32("TurType");
                    //tour.TurAcıklama = reader.GetString("TurAcıklama");
                    tour.TurPhoto = reader.GetString("TurPhoto");


                    tourList.Add(tour);
                }
            }
        }
        return tourList;
    }
}
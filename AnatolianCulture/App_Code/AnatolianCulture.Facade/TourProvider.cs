﻿using MySql.Data.MySqlClient;
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
                    tour.TurAciklama = reader.GetString("TurAciklama");
                    tour.TurPhoto = reader.GetString("TurPhoto");


                    tourList.Add(tour);
                }
            }
        }
        return tourList;
    }

    public static List<Tour> GetToursByDate()
    {
        var tourList = new List<Tour>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM anatolianculture.t_tur WHERE TurBasTarih >= CURDATE() AND TurBitTarih >= CURDATE();", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tour = new Tour();
                    tour.ID = reader.GetInt32("ID");
                    tour.TurName = reader.GetString("TurName");
                    tour.TurFiyat = reader.GetInt32("TurFiyat");
                    tour.TurType = reader.GetInt32("TurType");
                    tour.TurAciklama = reader.GetString("TurAciklama");
                    tour.TurPhoto = reader.GetString("TurPhoto");
                    tour.TurBasTarih = reader.GetDateTime("TurBasTarih");
                    tour.TurBitTarih = reader.GetDateTime("TurBitTarih");


                    tourList.Add(tour);
                }
            }
        }
        return tourList;
    }


    public static List<Tour> SearchTours(string searchTerm)
    {
        var tourList = new List<Tour>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM anatolianculture.t_tur WHERE TurName LIKE @SearchTerm;", conn);
            cmd.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tour = new Tour();
                    tour.ID = reader.GetInt32("ID");
                    tour.TurName = reader.GetString("TurName");
                    tour.TurFiyat = reader.GetInt32("TurFiyat");
                    tour.TurType = reader.GetInt32("TurType");
                    tour.TurAciklama = reader.GetString("TurAciklama");
                    tour.TurPhoto = reader.GetString("TurPhoto");

                    tourList.Add(tour);
                }
            }
        }
        return tourList;
    }
}
﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TourContentProvider
/// </summary>
public class TourContentProvider
{
    public static List<TourContent> GetTourContents()
    {
        var tourContentList = new List<TourContent>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM anatolianculture.t_turcontent;", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tourContent = new TourContent();
                    tourContent.ID = reader.GetInt32("ID");
                    tourContent.TurID = reader.GetInt32("TurID");
                    tourContent.TurContentBaslik = reader.GetString("TurContentBaslik");
                    tourContent.TurContent = reader.GetString("TurContent");          

                    tourContentList.Add(tourContent);
                }
            }
        }
        return tourContentList;
    }


    public static List<TourDetail> GetTourDetails()
    {
        var tourDetailsList = new List<TourDetail>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM anatolianculture.t_turdetails;", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tourDetails = new TourDetail();
                    tourDetails.ID = reader.GetInt32("ID");
                    tourDetails.TurID = reader.GetInt32("TurID");
                    tourDetails.TurIn = reader.GetString("TurIn");
                    tourDetails.TurOut = reader.GetString("TurOut");

                    tourDetailsList.Add(tourDetails);
                }
            }
        }
        return tourDetailsList;
    }
}
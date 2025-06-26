using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TourContentProvider
/// </summary>
public class TourContentProvider
{
    //tur kontent
    public static List<TourContent> GetTourContents()
    {
        var tourContentList = new List<TourContent>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM t_turcontent;", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tourContent = new TourContent();
                    tourContent.ID = reader.GetInt32("ID");
                    tourContent.TurID = reader.GetInt32("TurID");
                    tourContent.TurContentBaslik = reader.GetString("TurContentBaslik");
                    tourContent.TurContent = reader.GetString("TurContent");
                    tourContent.TurType = reader.GetInt32("TurType");


                    tourContentList.Add(tourContent);
                }
            }
        }
        return tourContentList;
    }

    public static List<TourContent> GetTourContentsByTourId(int turId)
    {
        var list = new List<TourContent>();

        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            string query = "SELECT * FROM t_turcontent WHERE TurID = @TurID ORDER BY ID ASC";
            using (MySqlCommand cmd = new MySqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@TurID", turId);
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        list.Add(new TourContent
                        {
                            TurID = reader.GetInt32("TurID"),
                            TurContentBaslik = reader["TurContentBaslik"].ToString(),
                            TurContent = reader["TurContent"].ToString(),
                            TurType = Convert.ToInt32(reader["TurType"])
                        });
                    }
                }
            }
        }

        return list;
    }


    public static void InsertContent(TourContent content)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand(@"
            INSERT INTO t_turcontent (TurID, TurContentBaslik, TurContent, TurType)
            VALUES (@TurID, @Baslik, @Content, @TurType);", conn);

            cmd.Parameters.AddWithValue("@TurID", content.TurID);
            cmd.Parameters.AddWithValue("@Baslik", content.TurContentBaslik);
            cmd.Parameters.AddWithValue("@Content", content.TurContent);
            cmd.Parameters.AddWithValue("@TurType", content.TurType);

            cmd.ExecuteNonQuery();
        }
    }

    public static void UpdateContent(TourContent content)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand(@"
            UPDATE t_turcontent
            SET TurContentBaslik = @Baslik,
                TurContent = @Content,
                TurType = @TurType
            WHERE ID = @ID", conn);

            cmd.Parameters.AddWithValue("@Baslik", content.TurContentBaslik);
            cmd.Parameters.AddWithValue("@Content", content.TurContent);
            cmd.Parameters.AddWithValue("@TurType", content.TurType);
            cmd.Parameters.AddWithValue("@ID", content.ID);

            cmd.ExecuteNonQuery();
        }
    }

    public static void DeleteContent(int id)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("DELETE FROM t_turcontent WHERE ID = @ID", conn);
            cmd.Parameters.AddWithValue("@ID", id);
            cmd.ExecuteNonQuery();
        }
    }

    //tur details
    public static List<TourDetail> GetTourDetails()
    {
        var tourDetailsList = new List<TourDetail>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM t_turdetails;", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tourDetails = new TourDetail();
                    tourDetails.ID = reader.GetInt32("ID");
                    tourDetails.TurID = reader.GetInt32("TurID");
                    tourDetails.TurIn = reader.GetString("TurIn");
                    tourDetails.TurOut = reader.GetString("TurOut");
                    tourDetails.TurType = reader.GetInt32("TurType");
                    tourDetails.GenelFiyat = reader.IsDBNull(reader.GetOrdinal("GenelFiyat")) ? null : reader.GetString("GenelFiyat");
                    tourDetails.TekKisi = reader.IsDBNull(reader.GetOrdinal("TekKisi")) ? null : reader.GetString("TekKisi");
                    tourDetails.CiftKisi = reader.IsDBNull(reader.GetOrdinal("CiftKisi")) ? null : reader.GetString("CiftKisi");
                    tourDetails.Photo = reader.IsDBNull(reader.GetOrdinal("Photo")) ? null : reader.GetString("Photo");


                    tourDetailsList.Add(tourDetails);
                }
            }
        }
        return tourDetailsList;
    }

    public static TourDetail GetDetailsByTourId(int turId)
    {
        TourDetail detail = null;

        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            string query = "SELECT * FROM t_turdetails WHERE TurID = @TurID";
            using (MySqlCommand cmd = new MySqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@TurID", turId);
                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        detail = new TourDetail
                        {
                            TurID = reader.GetInt32("TurID"),
                            GenelFiyat = reader["GenelFiyat"].ToString(),
                            TekKisi = reader["TekKisi"].ToString(),
                            CiftKisi = reader["CiftKisi"].ToString(),
                            TurIn = reader["TurIn"].ToString(),
                            TurOut = reader["TurOut"].ToString()
                        };
                    }
                }
            }
        }

        return detail;
    }


    public static void InsertDetails(TourDetail details)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand(@"
            INSERT INTO t_turdetails (TurID, TurIn, TurOut, TurType, GenelFiyat, TekKisi, CiftKisi)
            VALUES (@TurID, @TurIn, @TurOut, @TurType, @GenelFiyat, @TekKisi, @CiftKisi);", conn);

            cmd.Parameters.AddWithValue("@TurID", details.TurID);
            cmd.Parameters.AddWithValue("@TurIn", details.TurIn);
            cmd.Parameters.AddWithValue("@TurOut", details.TurOut);
            cmd.Parameters.AddWithValue("@TurType", details.TurType);
            cmd.Parameters.AddWithValue("@GenelFiyat", details.GenelFiyat);
            cmd.Parameters.AddWithValue("@TekKisi", details.TekKisi);
            cmd.Parameters.AddWithValue("@CiftKisi", details.CiftKisi);

            cmd.ExecuteNonQuery();
        }
    }

    public static void UpdateDetails(TourDetail details)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand(@"
            UPDATE t_turdetails
            SET TurIn = @TurIn,
                TurOut = @TurOut,
                GenelFiyat = @GenelFiyat,
                TekKisi = @TekKisi,
                CiftKisi = @CiftKisi
            WHERE TurID = @TurID", conn); // TurID unique olarak kabul edildi (1:1 iliþki)

            cmd.Parameters.AddWithValue("@TurIn", details.TurIn);
            cmd.Parameters.AddWithValue("@TurOut", details.TurOut);
            cmd.Parameters.AddWithValue("@GenelFiyat", details.GenelFiyat);
            cmd.Parameters.AddWithValue("@TekKisi", details.TekKisi);
            cmd.Parameters.AddWithValue("@CiftKisi", details.CiftKisi);
            cmd.Parameters.AddWithValue("@TurID", details.TurID);

            cmd.ExecuteNonQuery();
        }
    }

    public static void DeleteDetailsByTurID(int turId)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("DELETE FROM t_turdetails WHERE TurID = @TurID", conn);
            cmd.Parameters.AddWithValue("@TurID", turId);
            cmd.ExecuteNonQuery();
        }
    }

}
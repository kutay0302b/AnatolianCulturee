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
            var cmd = new MySqlCommand("SELECT * FROM t_tur;", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tour = new Tour();
                    tour.ID = reader.GetInt32("ID");
                    tour.TurName = reader.GetString("TurName");
                    tour.TurFiyat = reader.GetString("TurFiyat");
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
            var cmd = new MySqlCommand("SELECT * FROM t_tur WHERE (MONTH(CURDATE()) < MONTH(TurBasTarih) OR (MONTH(CURDATE()) = MONTH(TurBasTarih) AND DAY(CURDATE()) < DAY(TurBasTarih))) ORDER BY TurBasTarih;\r\n", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tour = new Tour();
                    tour.ID = reader.GetInt32("ID");
                    tour.TurName = reader.GetString("TurName");
                    tour.TurFiyat = reader.GetString("TurFiyat");
                    tour.TurType = reader.GetInt32("TurType");
                    tour.TurAciklama = reader.GetString("TurAciklama");
                    tour.TurPhoto = reader.GetString("TurPhoto");
                    tour.TurBasTarih = reader.IsDBNull(reader.GetOrdinal("TurBasTarih")) ? (DateTime?)null : reader.GetDateTime("TurBasTarih");
                    tour.TurBitTarih = reader.IsDBNull(reader.GetOrdinal("TurBitTarih")) ? (DateTime?)null : reader.GetDateTime("TurBitTarih");




                    tourList.Add(tour);
                }
            }
        }
        return tourList;
    }

    public static Tour GetTourById(int id)
    {
        Tour result = null;

        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            string query = "SELECT * FROM t_tur WHERE ID = @ID";
            using (MySqlCommand cmd = new MySqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@ID", id);
                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        result = new Tour
                        {
                            ID = reader.GetInt32("ID"),
                            TurName = reader["TurName"].ToString(),
                            TurFiyat = reader["TurFiyat"].ToString(),
                            TurType = Convert.ToInt32(reader["TurType"]),
                            TurAciklama = reader["TurAciklama"].ToString(),
                            // Gerekirse fotoðraf vs. eklenebilir
                        };
                    }
                }
            }
        }

        return result;
    }

    public static void UpdateTourAll(Tour tour, TourDetail detail, List<TourContent> contents)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();

            MySqlTransaction tran = conn.BeginTransaction();

            try
            {
                // 1. t_tur update
                var tourCmd = new MySqlCommand(@"UPDATE t_tur SET 
                                                TurName = @TurName,
                                                TurFiyat = @TurFiyat,
                                                TurType = @TurType,
                                                TurAciklama = @TurAciklama,
                                                TurBasTarih = @BasTarih,
                                                TurBitTarih = @BitTarih
                                                WHERE ID = @ID
                                            ", conn, tran);

                tourCmd.Parameters.AddWithValue("@ID", tour.ID);
                tourCmd.Parameters.AddWithValue("@TurName", tour.TurName);
                tourCmd.Parameters.AddWithValue("@TurFiyat", tour.TurFiyat);
                tourCmd.Parameters.AddWithValue("@TurType", tour.TurType);
                tourCmd.Parameters.AddWithValue("@TurAciklama", tour.TurAciklama);
                tourCmd.Parameters.AddWithValue("@BasTarih", tour.TurBasTarih);
                tourCmd.Parameters.AddWithValue("@BitTarih", tour.TurBitTarih);
                //tourCmd.Parameters.AddWithValue("@Photo", tour.TurPhoto);

                tourCmd.ExecuteNonQuery();

                // 2. t_turdetails update or insert
                var checkCmd = new MySqlCommand("SELECT COUNT(*) FROM t_turdetails WHERE TurID = @TurID", conn, tran);
                checkCmd.Parameters.AddWithValue("@TurID", detail.TurID);
                bool exists = Convert.ToInt32(checkCmd.ExecuteScalar()) > 0;

                MySqlCommand detailCmd;
                if (exists)
                {
                    detailCmd = new MySqlCommand(@"
                        UPDATE t_turdetails SET 
                            GenelFiyat = @GenelFiyat,
                            TekKisi = @TekKisi,
                            CiftKisi = @CiftKisi,
                            TurType = @TurType,
                            TurIn = @TurIn,
                            TurOut = @TurOut
                        WHERE TurID = @TurID
                    ", conn, tran);
                }
                else
                {
                    detailCmd = new MySqlCommand(@"
    INSERT INTO t_turdetails (TurID, GenelFiyat, TekKisi, CiftKisi, TurIn, TurOut, TurType)
    VALUES (@TurID, @GenelFiyat, @TekKisi, @CiftKisi, @TurIn, @TurOut, @TurType)
", conn, tran);
                }

                detailCmd.Parameters.AddWithValue("@TurID", detail.TurID);
                detailCmd.Parameters.AddWithValue("@GenelFiyat", detail.GenelFiyat);
                detailCmd.Parameters.AddWithValue("@TekKisi", detail.TekKisi);
                detailCmd.Parameters.AddWithValue("@CiftKisi", detail.CiftKisi);
                detailCmd.Parameters.AddWithValue("@TurIn", detail.TurIn);
                detailCmd.Parameters.AddWithValue("@TurOut", detail.TurOut);
                detailCmd.Parameters.AddWithValue("@TurType", detail.TurType);


                detailCmd.ExecuteNonQuery();

                // 3. t_turcontent temizle + yeniden ekle
                var deleteCmd = new MySqlCommand("DELETE FROM t_turcontent WHERE TurID = @TurID", conn, tran);
                deleteCmd.Parameters.AddWithValue("@TurID", tour.ID);
                deleteCmd.ExecuteNonQuery();

                foreach (var content in contents)
                {
                    var insertCmd = new MySqlCommand(@"
                        INSERT INTO t_turcontent (TurID, TurContentBaslik, TurContent, TurType)
                        VALUES (@TurID, @Baslik, @Content, @TurType)
                    ", conn, tran);

                    insertCmd.Parameters.AddWithValue("@TurID", content.TurID);
                    insertCmd.Parameters.AddWithValue("@Baslik", content.TurContentBaslik);
                    insertCmd.Parameters.AddWithValue("@Content", content.TurContent);
                    insertCmd.Parameters.AddWithValue("@TurType", content.TurType);

                    insertCmd.ExecuteNonQuery();
                }

                tran.Commit();
            }
            catch
            {
                tran.Rollback();
                throw;
            }
        }
    }

    public static List<Tour> SearchTours(string searchTerm)
    {
        var tourList = new List<Tour>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM t_tur WHERE TurName LIKE @SearchTerm;", conn);
            cmd.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var tour = new Tour();
                    tour.ID = reader.GetInt32("ID");
                    tour.TurName = reader.GetString("TurName");
                    tour.TurFiyat = reader.GetString("TurFiyat");
                    tour.TurType = reader.GetInt32("TurType");
                    tour.TurAciklama = reader.GetString("TurAciklama");
                    tour.TurPhoto = reader.GetString("TurPhoto");

                    tourList.Add(tour);
                }
            }
        }
        return tourList;
    }


    public static int InsertTour(Tour tour)
    {
        int insertedId = 0;
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand(@"
            INSERT INTO t_tur (TurName, TurFiyat, TurType, TurAciklama, TurPhoto, TurBasTarih, TurBitTarih)
            VALUES (@TurName, @TurFiyat, @TurType, @TurAciklama, @TurPhoto, @TurBasTarih, @TurBitTarih);
            SELECT LAST_INSERT_ID();", conn);

            cmd.Parameters.AddWithValue("@TurName", tour.TurName);
            cmd.Parameters.AddWithValue("@TurFiyat", tour.TurFiyat);
            cmd.Parameters.AddWithValue("@TurType", tour.TurType);
            cmd.Parameters.AddWithValue("@TurAciklama", tour.TurAciklama);
            cmd.Parameters.AddWithValue("@TurPhoto", tour.TurPhoto);
            cmd.Parameters.AddWithValue("@TurBasTarih", tour.TurBasTarih);
            cmd.Parameters.AddWithValue("@TurBitTarih", tour.TurBitTarih);

            insertedId = Convert.ToInt32(cmd.ExecuteScalar());
        }
        return insertedId;
    }

    public static void UpdateTour(Tour tour)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand(@"
            UPDATE t_tur 
            SET TurName = @TurName,
                TurFiyat = @TurFiyat,
                TurType = @TurType,
                TurAciklama = @TurAciklama,
                TurPhoto = @TurPhoto,
                TurBasTarih = @TurBasTarih,
                TurBitTarih = @TurBitTarih
            WHERE ID = @ID", conn);

            cmd.Parameters.AddWithValue("@TurName", tour.TurName);
            cmd.Parameters.AddWithValue("@TurFiyat", tour.TurFiyat);
            cmd.Parameters.AddWithValue("@TurType", tour.TurType);
            cmd.Parameters.AddWithValue("@TurAciklama", tour.TurAciklama);
            cmd.Parameters.AddWithValue("@TurPhoto", tour.TurPhoto);
            cmd.Parameters.AddWithValue("@TurBasTarih", tour.TurBasTarih);
            cmd.Parameters.AddWithValue("@TurBitTarih", tour.TurBitTarih);
            cmd.Parameters.AddWithValue("@ID", tour.ID);

            cmd.ExecuteNonQuery();
        }
    }

    public static void DeleteTour(int tourId)
    {
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();

            // Transaction baþlat
            using (MySqlTransaction transaction = conn.BeginTransaction())
            {
                try
                {
                    // Önce tur detaylarýný sil
                    var delDetails = new MySqlCommand("DELETE FROM t_turdetails WHERE TurID = @TurID", conn, transaction);
                    delDetails.Parameters.AddWithValue("@TurID", tourId);
                    delDetails.ExecuteNonQuery();

                    // Sonra tur içeriklerini sil
                    var delContents = new MySqlCommand("DELETE FROM t_turcontent WHERE TurID = @TurID", conn, transaction);
                    delContents.Parameters.AddWithValue("@TurID", tourId);
                    delContents.ExecuteNonQuery();

                    // En son tur tablosundan sil
                    var delTour = new MySqlCommand("DELETE FROM t_tur WHERE ID = @ID", conn, transaction);
                    delTour.Parameters.AddWithValue("@ID", tourId);
                    delTour.ExecuteNonQuery();

                    transaction.Commit(); // Baþarýlýysa iþlemleri tamamla
                }
                catch (Exception ex)
                {
                    transaction.Rollback(); // Hata varsa geri al
                    throw new Exception("Tur silinirken hata oluþtu: " + ex.Message);
                }
            }
        }
    }


}
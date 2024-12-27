using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InteractiveProvider
/// </summary>
public class InteractiveProvider
{
    public static List<Interactive> GetAllInteractive()
    {
        var interactiveList = new List<Interactive>();
        using (MySqlConnection conn = new MySqlConnection(Tools.GetConnStr()))
        {
            conn.Open();
            var cmd = new MySqlCommand("SELECT * FROM t_interactive;", conn);
            using (var reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    var interactive = new Interactive
                    {
                        ID = reader.GetInt32("ID"),
                        Year = reader.GetInt32("Year"),
                        Month = reader.GetString("Month"),
                        Day = reader.GetInt32("Day"),
                        Weekday = reader.GetString("Weekday"),
                        Title = reader.GetString("Title"),
                        Details = reader.IsDBNull(reader.GetOrdinal("Details")) ? null : reader.GetString("Details"),
                        Price = reader.IsDBNull(reader.GetOrdinal("Price")) ? null : reader.GetString("Price"),
                        ContactInfo = reader.IsDBNull(reader.GetOrdinal("Contact_Info")) ? null : reader.GetString("Contact_Info"),
                        ImageUrl = reader.IsDBNull(reader.GetOrdinal("Image_Url")) ? null : reader.GetString("Image_Url")
                    };

                    interactiveList.Add(interactive);
                }
            }
        }
        return interactiveList;
    }

}
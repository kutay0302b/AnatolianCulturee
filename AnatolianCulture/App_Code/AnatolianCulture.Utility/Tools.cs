using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Tool
/// </summary>
public class Tools
{
    public static string GetConnStr()
    {
        string connString = "";
        // connString = "Driver={MySQL ODBC 3.51 Driver};Server=192.168.1.10;Database=heat_manager; User=root;Password=12345;Option=3;";
        // ******* Proje yayınlandığında bu string kullanılacak connString = "server=" + BaglantiIP + ";database=heat_manager;Uid=root;pwd=12345;";
        //connString = "server=localhost; database=rsd_bghtemper_main; Uid=root;pwd=12345;";
        connString = "server=localhost; database=anatolianculture; Uid=root;pwd=12345;";
        //pooling ile
        //connString = "server=" + BaglantiIP + ";database=heat_manager;Uid=root;pwd=12345;Pooling =true;Min Pool Size =10;Max Pool Size =100
        return connString;

        //Selam

    }
}
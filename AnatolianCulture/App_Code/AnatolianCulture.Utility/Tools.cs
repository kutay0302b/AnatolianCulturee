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
        //connString = "server=mysql02.trwww.com:3306; database=anatol45_anatolianculture; Uid=AcSqlMa;pwd=11511151Sql@;";
		 connString = "server=mysql02.trwww.com;port=3306;database=anatol45_anatolianculture;Uid=AcSqlMa;pwd=11511151Sql@;";

         return connString;
    }
}
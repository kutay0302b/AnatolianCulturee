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
        //connString = "***REMOVED***:3306; database=***REMOVED***; ***REMOVED***;***REMOVED***;";
		 connString = "***REMOVED***;port=3306;database=***REMOVED***;***REMOVED***;***REMOVED***;";

         return connString;
    }
}
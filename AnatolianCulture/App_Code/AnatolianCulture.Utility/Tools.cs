﻿using System;
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
        connString = "server=localhost; database=anatolianculture; Uid=root;pwd=12345;";


        return connString;
    }
}
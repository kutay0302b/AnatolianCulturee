using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Tour
/// </summary>
public class Tour
{
    public int ID { get; set; }
    public string TurName { get; set; }
    public string TurFiyat { get; set; }
    public int TurType { get; set; }
    public string TurAciklama { get; set; }
    public string TurPhoto { get; set; }
    public DateTime? TurBasTarih { get; set; }
    public DateTime? TurBitTarih { get; set; }
}
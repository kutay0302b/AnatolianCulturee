using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        // Basit sabit kontrol (veritabanı entegrasyonu ileride eklenebilir)
        if (username == "admin" && password == "1234")
        {
            Session["isAdmin"] = true;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            lblMessage.Text = "Hatalı kullanıcı adı veya şifre!";
        }
    }

}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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

        string inputHash = GetPassword(password);

        // Web.config'ten verileri al
        string adminUser = ConfigurationManager.AppSettings["AdminUsername"];
        string adminPassHash = ConfigurationManager.AppSettings["AdminPasswordHash"];
        string secondUser = ConfigurationManager.AppSettings["SecondUsername"];
        string secondPassHash = ConfigurationManager.AppSettings["SecondPasswordHash"];

        if ((username == adminUser && inputHash == adminPassHash) ||
            (username == secondUser && inputHash == secondPassHash))
        {
            Session["isAuthenticated"] = true;
            Session["username"] = username;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            lblMessage.Text = "Hatalı kullanıcı adı veya şifre!";
        }
    }
    public static string GetPassword(string input)
    {
        using (SHA256 sha256 = SHA256.Create())
        {
            byte[] bytes = Encoding.UTF8.GetBytes(input);
            byte[] hash = sha256.ComputeHash(bytes);
            return BitConverter.ToString(hash).Replace("-", "").ToLowerInvariant();
        }
    }



}
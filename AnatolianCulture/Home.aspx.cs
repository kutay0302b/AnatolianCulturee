using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Net;
using System.ServiceModel.Activities;
using System.Web.Services;
using System.Web.UI;

public partial class Home : Page
{
  

    protected void Page_Load(object sender, EventArgs e)
    {
       


    }






    protected void sendMailBtn_Click(object sender, EventArgs e)
    {
        string emailMessage = txtMail.Value;
        SendEmail(emailMessage);
    }

    private void SendEmail(string emailMessage)
    {
        SmtpClient smtpClient = null;
        MailMessage mailMessage = null;

        try
        {
            MailAddress fromAddress = new MailAddress("info@anatolianculture.com");
            MailAddress toAddress = new MailAddress("toren.kutay@gmail.com", "Aculture");

            mailMessage = new MailMessage(fromAddress, toAddress);
            mailMessage.Subject = "Abonelik Mail adresi kaydı";
            mailMessage.Body = "Abonelik için gönderilen mail adresi:" +emailMessage;

            smtpClient = new SmtpClient("srvc184.turhost.com")
            {
                UseDefaultCredentials = false,
                EnableSsl = false,
                Port = 587,
                Credentials = new NetworkCredential("info@anatolianculture.com", "13791379Abcd@"),
                DeliveryMethod = SmtpDeliveryMethod.Network
            };

            smtpClient.Send(mailMessage);
        }
        catch (Exception ex)
        {
        }
    }

}






using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _TourDetails : System.Web.UI.Page
{
    protected List<TourContent> FilteredContents { get; set; }
    protected List<TourDetail> FilteredDetails { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int turID = 0;
            int turType = 0;

            if (int.TryParse(Request.QueryString["tour"], out turID) && int.TryParse(Request.QueryString["type"], out turType))
            {
                var tourContents = TourContentProvider.GetTourContents();
                FilteredContents = tourContents.FindAll(t => t.TurID == turID && t.TurType == turType);

                var tourDetails = TourContentProvider.GetTourDetails();
                FilteredDetails = tourDetails.FindAll(t => t.TurID == turID && t.TurType == turType);
                if (FilteredContents != null && FilteredContents.Count > 0)
                {
                    rptContents.DataSource = FilteredContents;
                    rptContents.DataBind();
                    pnlNoContent.Visible = false;
                }
                else
                {
                    pnlNoContent.Visible = true;
                }

                Repeater1.DataSource = FilteredDetails;
                Repeater1.DataBind();

            }
        }
    }




    protected void sendMailBtn_Click(object sender, EventArgs e)
    {
        string senderName = userName.Value;
        string senderEmail = userEmail.Value;
        string emailSubject = subject.Value;
        string emailMessage = messageContent.Value;

        SendEmail(senderName, senderEmail, emailSubject, emailMessage);
    }

    private void SendEmail(string senderName, string senderEmail, string emailSubject, string emailMessage)
    {
        SmtpClient smtpClient = null;
        MailMessage mailMessage = null;

        try
        {
            MailAddress fromAddress = new MailAddress(senderEmail, senderName);
            MailAddress toAddress = new MailAddress("toren.kutay@gmail.com", "Aculture");

            mailMessage = new MailMessage(fromAddress, toAddress);
            mailMessage.Subject = emailSubject;
            mailMessage.Body = emailMessage;

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
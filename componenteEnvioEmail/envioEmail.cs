using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Net.Mail;
namespace componenteEnvioEmail
{
    public class envioEmail
    {
        public bool enviarEmail(String destination, int cod, String body)
        {

            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("hadss22.09@gmail.com");
                mail.To.Add(destination);
                mail.Subject = "HADS-09";
                mail.Body = body;

                SmtpServer.Port = 587; //587
                SmtpServer.Credentials = new System.Net.NetworkCredential("hadss22.09@gmail.com", "Hads2209");
                SmtpServer.EnableSsl = true;
                
                SmtpServer.Send(mail);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

           
        }
    }
}

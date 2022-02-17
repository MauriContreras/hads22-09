using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab2
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {


        }

        protected void botonLogin_Click(object sender, EventArgs e)
        {
            DataAccess.DataAccess da = new DataAccess.DataAccess();
            da.conectar();
            int numreg;
            try
            {
                numreg = da.login(textBoxEmail.Text, textBoxPassword.Text);
                if (numreg == 0)
                {
                    ResultBD.Text = "El usuario no esta registrado";
                }
                else
                {
                    Response.Redirect("~/menu.aspx");
                }
            }
            catch (Exception ex)
            {
                ResultBD.Text = "Fatal error";
            }
            da.cerrarconexion();
        }
    }
}
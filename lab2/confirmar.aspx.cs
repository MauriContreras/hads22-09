using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Threading;

namespace lab2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String emailP = Request.QueryString["email"];
            String codP = Request.QueryString["numconfir"];

            DataAccess.DataAccess da = new DataAccess.DataAccess();
            Boolean result = da.confirmarRegistro2(emailP, int.Parse(codP));
            
            if (result)
            {
                labelResultadoConf.Visible = true;
                labelResultadoConf.Text = "Se ha registrado correctamente!" + "\n" + "Clic para loguearte: ";
                
                labelResultadoConf.ForeColor = System.Drawing.Color.Green;


            }
            else
            {
                labelResultadoConf.Visible = true;
                labelResultadoConf.Text = "Confirmación de registro incorrecta";
                labelResultadoConf.ForeColor = System.Drawing.Color.Red;


            }




        }
    }
}
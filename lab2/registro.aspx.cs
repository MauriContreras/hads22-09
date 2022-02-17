using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace lab2
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e) //Boton registrar del form registro
        {
            Random myObject = new Random();
           int numconfir =  myObject.Next(100000, 999999);

            DataAccess.DataAccess da = new DataAccess.DataAccess();
            labelTodoOK.Text = da.insertar(textBoxEmail.Text, textBoxNombre.Text, textBoxApellidos.Text, numconfir, 0, RadioButtonList1.SelectedValue, textBoxPassword.Text, 0);
            labelTodoOK.Visible = true;
            if(labelTodoOK.Text.Equals("Se ha registrado correctamente, para confirmar el registro revisa tu email. "))
            {
                componenteEnvioEmail.envioEmail em = new componenteEnvioEmail.envioEmail();

               //Boolean resultado = em.enviarEmail(textBoxEmail.Text, numconfir, "Para confirmar el registro haz clic " +
               //"en el siguiente enlace: " + "https://localhost:44366/confirmar.aspx?email=" + textBoxEmail.Text + "&numconfir=" + numconfir);

               Boolean resultado = em.enviarEmail(textBoxEmail.Text, numconfir, "Para confirmar el registro haz clic " +
              "en el siguiente enlace: " + "https://hasd22-09.azurewebsites.net/confirmar.aspx?email=" + textBoxEmail.Text + "&numconfir=" + numconfir);

                if (resultado)
                {
                    labelCodigoEnviado.Visible = true;
                    labelCodigoEnviado.Text = "Email de confirmación enviado.";

                }
                else
                {
                    labelCodigoEnviado.Text = "Error! Email de confirmación NO enviado.";
                }
            }
            

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
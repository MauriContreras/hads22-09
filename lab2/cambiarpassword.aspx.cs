using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using componenteEnvioEmail;

namespace lab2
{
    public partial class cambiarpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataAccess.DataAccess da = new DataAccess.DataAccess();
            
            Random myObject = new Random();
            int codpass = myObject.Next(100000, 999999);

           
            
            var em = new componenteEnvioEmail.envioEmail();

            if(da.verificarConfirmado(textBoxEmail.Text)){

                if (em.enviarEmail(textBoxEmail.Text, codpass, "El código para " +
                "el cambio de contraseña es el siguiente:" + codpass))
                {
                    labelEmailEnviado.Visible = true;
                    labelEmailEnviado.ForeColor = System.Drawing.Color.Green;
                    labelEmailEnviado.Text = "Código enviado";

                    labelNuevaContrasena.Visible = true;
                    labelRepetirNuevaContrasena.Visible = true;
                    labelCodigoRecibido.Visible = true;
                    textBoxCodigoRecibido.Visible = true;
                    textBoxNuevaContrasena.Visible = true;
                    textBoxRepetirNuevaContrasena.Visible = true;
                    botonModificarContrasena.Visible = true;

                    da.updateCodPass(textBoxEmail.Text, codpass);

                }
                else
                {
                    labelEmailEnviado.Visible = true;
                    labelEmailEnviado.Text = "Error al enviar el código";

                }



            }
            else
            {
                labelEmailEnviado.Visible = true;
                labelEmailEnviado.ForeColor = System.Drawing.Color.Red;
                labelEmailEnviado.Text = "Error! El usuario no está verificado";
                RequiredFieldValidator2.Visible = false;
                RequiredFieldValidator3.Visible = false;
                RequiredFieldValidator4.Visible = false;
                labelNuevaContrasena.Visible = false;
                labelRepetirNuevaContrasena.Visible = false;
                labelCodigoRecibido.Visible = false;
                textBoxCodigoRecibido.Visible = false;
                textBoxNuevaContrasena.Visible = false;
                textBoxRepetirNuevaContrasena.Visible = false;
                botonModificarContrasena.Visible = false;
            }

            
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }

        protected void botonModificarContrasena_Click(object sender, EventArgs e)
        {
            DataAccess.DataAccess da = new DataAccess.DataAccess();
            if (da.modificarPass(textBoxEmail.Text, int.Parse(textBoxCodigoRecibido.Text), textBoxNuevaContrasena.Text))
            {
                labelFunciona.Visible = true;
                labelFunciona.Text = "Contraseña modificada correctamente. Haga usted clic para iniciar sesión: ";
                hyperlinkLogin.Visible = true;


                labelEmailEnviado.Visible = false;
                labelEmailEnviado.Text = "Código enviado";

                labelNuevaContrasena.Visible = false;
                labelRepetirNuevaContrasena.Visible = false;
                labelCodigoRecibido.Visible = false;
                textBoxCodigoRecibido.Visible = false;
                textBoxNuevaContrasena.Visible = false;
                textBoxRepetirNuevaContrasena.Visible = false;
                botonModificarContrasena.Visible = false;


            }
            else
            {
                labelFunciona.Visible = true;
                labelFunciona.ForeColor = System.Drawing.Color.Red;
                labelFunciona.Text = "Error! No se ha podido modificar la contraseña";
            }





        }
    }
}
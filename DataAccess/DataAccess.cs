using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DataAccess
{
    public class DataAccess
    {
        private static SqlConnection conexion = new SqlConnection();
        private static SqlCommand comando = new SqlCommand();

        public String conectar()
        {
            try
            {
                conexion.ConnectionString = "Server=tcp:hads22-09.database.windows.net,1433;Initial Catalog=hads22-09;Persist Security Info=False;User ID=mcontreras009@ikasle.ehu.eus@hads22-09;Password=Hadsbrymau09;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
                conexion.Open();
                return "CONEXION OK";
             }
            catch (Exception e)
            {
                return "ERROR DE CONEXION" + e.Message;
            }
        } 

        public void cerrarconexion()
        {
            conexion.Close();
        }
        public String insertar(String email, String nombre, String apellidos, int numconfir, int confirmado, String tipo, String password, int codpass)
        {
            conectar();
            String st = "insert into dbo.Usuarios(email, nombre, apellidos, numconfir, confirmado, tipo, pass, codpass) values ('" + email + "', '" + nombre + "','" + apellidos + "', " + numconfir + ", " + confirmado + ", '" + tipo + "', '" + password + "', " + codpass + ")"; // confirmado 0 = no confirmado
            int numregs;
            comando = new SqlCommand(st, conexion);
            try
            {
                numregs = comando.ExecuteNonQuery();
                return "Se ha registrado correctamente, para confirmar el registro revisa tu email. ";
            }
            catch (Exception ex)
            {
                return "Error! El usuario ya existe querida.";
            }
            finally
            {
                cerrarconexion();
            }


        }

        public SqlDataReader obtenerdatos(String tabla)
        {
            conectar();
            comando = new SqlCommand("select * from Usuarios", conexion);
            SqlDataReader res = comando.ExecuteReader();
            return res;
        }


        public Boolean confirmarRegistro2 (String emailP, int codP)
        {
            conectar();

            String st = "select numconfir, confirmado from Usuarios where email=@mail";
            SqlCommand cmd = new SqlCommand(st, conexion);
            cmd.Parameters.AddWithValue("@mail", emailP);
            SqlDataReader data = cmd.ExecuteReader();
          
            int numconfirmacion=-1;
            Boolean confirmed = false;

            if (data.HasRows)
            {
                while (data.Read())
                {
                    numconfirmacion = data.GetInt32(0);
                    confirmed = data.GetBoolean(1);

                }
                if (numconfirmacion == codP & confirmed==false)
                {

                    String st2 = "update Usuarios set confirmado=1 where email=@mail";
                    SqlCommand cmd2 = new SqlCommand(st2, conexion);
                    cmd2.Parameters.AddWithValue("@mail", emailP);
                    int data2 = cmd2.ExecuteNonQuery();
                    if (data2 == 1)
                    {
                        cerrarconexion();
                        return true;
                    }
                    else
                    {
                        cerrarconexion();
                        return false;
                    }

                 
                }
                else
                {
                    cerrarconexion();
                    return false;

                }
            }
            else
            {
                cerrarconexion();
                return false;
            }
           
        }

        public Boolean confirmarRegistro(String emailP, int codP)
        {
            try
            {
                conectar();

                String st = "select * from Usuarios where email='" + emailP + "' and numconfir=" + codP + ";";
                comando = new SqlCommand(st, conexion);
                SqlDataReader res = comando.ExecuteReader();
                

                if (res.HasRows)
                {

                    try
                    {
                      
                        String st2 = "update Usuarios set confirmado=1 where email=@mail";
                        SqlCommand cmd2 = new SqlCommand(st2, conexion);
                        cmd2.Parameters.AddWithValue("@mail", emailP);
                        int data2 = cmd2.ExecuteNonQuery();
                        if (data2 ==1)
                        {
                            return true;

                        }
                        return false;
                    }
                    catch (Exception ex)   
                    {

                        return false;
                    }
                    finally
                    {

                    }

                }
                else
                {
                    return false;
                }



            }
            catch (Exception ex)
            {
                return false;   
            }

            return true;

        }





        public Boolean updateCodPass(String correo, int codigo)  // cambia el codpass del usuario pasado por parametro
        {
            conectar();
            try
            {
                String st3 = "update Usuarios set codpass=@cod where email=@mail";
                SqlCommand cmd3 = new SqlCommand(st3, conexion);
                cmd3.Parameters.AddWithValue("@cod", codigo);
                cmd3.Parameters.AddWithValue("@mail", correo);

                int data3 = cmd3.ExecuteNonQuery();
                if (data3 == 1)
                {
                    return true;

                }
                return false;

            }
            catch(Exception ex)
            {
                return false;
            }
            finally
            {
                cerrarconexion();
            }
            
        }

        public int login(String email, String pass)
        {
            String st = "select count(*) from dbo.Usuarios where email = '" + email + "' and pass = '" + pass + "' and confirmado = " + 1 + " ";
            comando = new SqlCommand(st, conexion);
            return (int)comando.ExecuteScalar();
        }
        

        public Boolean modificarPass(String correo, int codigo, String password)
        {
            try
            {
                conectar();
                String st = "select count(*) from dbo.Usuarios where email = '" + correo + "' and codpass = '" + codigo + "' and confirmado = " + 1 + " ";

                comando = new SqlCommand(st, conexion);

                int result = (int)comando.ExecuteScalar();

                if (result == 1)
                {
                    
                    String st4 = "update Usuarios set pass=@passw where email=@mail";
                    SqlCommand cmd4 = new SqlCommand(st4, conexion);
                    cmd4.Parameters.AddWithValue("@passw", password);
                    cmd4.Parameters.AddWithValue("@mail", correo);
                    int data4 = cmd4.ExecuteNonQuery();
                    if (data4 == 1)
                    {
                        return true;

                    }
                    else
                    {
                        return false;

                    }



                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                return false;
            }
            finally
            {
                cerrarconexion();
            }
            


        }


        public Boolean verificarConfirmado(String correo)
        {
            try
            {
                conectar();
                String st = "select count(*) from dbo.Usuarios where email = '" + correo + "' and confirmado = " + 1 + " ";

                comando = new SqlCommand(st, conexion);

                int result = (int)comando.ExecuteScalar();

                if (result == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                return false;
            }
            finally
            {
                cerrarconexion();
            }
           


        }



    }
}

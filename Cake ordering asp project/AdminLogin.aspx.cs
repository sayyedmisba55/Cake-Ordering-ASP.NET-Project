using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;


            if (string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(password))
            {
                Message.Text =
                    "Please enter username and password.";

                return;
            }


            try
            {
                string connectionString =
                    ConfigurationManager
                    .ConnectionStrings["CakeDb"]
                    .ConnectionString;


                using (MySqlConnection con =
                       new MySqlConnection(connectionString))
                {
                    con.Open();


                    string query = @"
                        SELECT AdminId, Username, FullName
                        FROM Admins
                        WHERE Username = @Username
                        AND Password = @Password";


                    using (MySqlCommand cmd =
                           new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Username",
                            username
                        );

                        cmd.Parameters.AddWithValue(
                            "@Password",
                            password
                        );


                        using (MySqlDataReader reader =
                               cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                Session["AdminId"] =
                                    reader["AdminId"].ToString();

                                Session["AdminUsername"] =
                                    reader["Username"].ToString();

                                Session["AdminName"] =
                                    reader["FullName"].ToString();


                                Response.Redirect(
                                    "AdminDashboard.aspx"
                                );
                            }
                            else
                            {
                                Message.Text =
                                    "Invalid admin username or password.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Message.Text =
                    "Database Error: " +
                    ex.Message;
            }
        }
    }
}
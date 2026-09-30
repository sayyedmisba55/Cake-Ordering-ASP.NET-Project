using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            // Check empty fields
            if (string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(password))
            {
                Message.Text = "Please enter username and password.";
                return;
            }

            try
            {
                // Get MySQL connection string from Web.config
                string connectionString =
                    ConfigurationManager.ConnectionStrings["CakeDb"].ConnectionString;

                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    con.Open();

                    // Check username and password in database
                    string query = @"
                        SELECT UserId, FullName, Email, Username
                        FROM Users
                        WHERE Username = @Username
                        AND Password = @Password";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Login successful
                                Session["UserId"] = reader["UserId"].ToString();
                                Session["FullName"] = reader["FullName"].ToString();
                                Session["Email"] = reader["Email"].ToString();
                                Session["Username"] = reader["Username"].ToString();

                                Response.Redirect("Products.aspx");
                            }
                            else
                            {
                                Message.Text = "Invalid username or password.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Message.Text = "Database Error: " + ex.Message;
            }
        }
    }
}
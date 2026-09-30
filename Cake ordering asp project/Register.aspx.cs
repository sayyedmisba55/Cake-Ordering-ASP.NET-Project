using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string mobile = txtMobile.Text.Trim();
            string address = txtAddress.Text.Trim();

            // Check empty fields
            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(password) ||
                string.IsNullOrWhiteSpace(confirmPassword) ||
                string.IsNullOrWhiteSpace(mobile) ||
                string.IsNullOrWhiteSpace(address))
            {
                Message.Text = "Please fill all fields.";
                return;
            }

            // Check email
            if (!email.Contains("@") || !email.Contains("."))
            {
                Message.Text = "Please enter a valid email address.";
                return;
            }

            // Check password
            if (password != confirmPassword)
            {
                Message.Text = "Passwords do not match.";
                return;
            }

            // Check password length
            if (password.Length < 6)
            {
                Message.Text = "Password must contain at least 6 characters.";
                return;
            }

            try
            {
                string connectionString =
                    ConfigurationManager.ConnectionStrings["CakeDb"].ConnectionString;

                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    con.Open();

                    // Check whether username or email already exists
                    string checkQuery = @"
                        SELECT COUNT(*)
                        FROM Users
                        WHERE Email = @Email OR Username = @Username";

                    using (MySqlCommand checkCmd = new MySqlCommand(checkQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        checkCmd.Parameters.AddWithValue("@Username", username);

                        int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (count > 0)
                        {
                            Message.Text = "Email or Username already exists.";
                            return;
                        }
                    }

                    // Insert new user
                    string insertQuery = @"
                        INSERT INTO Users
                        (FullName, Email, Username, Password, Mobile, Address)
                        VALUES
                        (@FullName, @Email, @Username, @Password, @Mobile, @Address)";

                    using (MySqlCommand cmd = new MySqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@Mobile", mobile);
                        cmd.Parameters.AddWithValue("@Address", address);

                        cmd.ExecuteNonQuery();
                    }
                }

                Message.Text = "Registration Successful! Please Login.";

                // Clear fields
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtUsername.Text = "";
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";
                txtMobile.Text = "";
                txtAddress.Text = "";
            }
            catch (Exception ex)
            {
                Message.Text = "Database Error: " + ex.Message;
            }
        }
    }
}
using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            try
            {
                string connectionString =
                    ConfigurationManager.ConnectionStrings["CakeDb"].ConnectionString;

                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    con.Open();

                    string query = @"
                        SELECT ProductId,
                               ProductName,
                               Description,
                               Price,
                               Category,
                               ImagePath
                        FROM Products
                        ORDER BY ProductId";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            ProductRepeater.DataSource = reader;
                            ProductRepeater.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Database Error: "
                    + ex.Message.Replace("'", "\\'")
                    + "');</script>");
            }
        }
    }
}
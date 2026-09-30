using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboard();
            }
        }


        private void LoadDashboard()
        {
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


                    // TOTAL CUSTOMERS

                    string customerQuery =
                        "SELECT COUNT(*) FROM Users";


                    using (MySqlCommand cmd =
                           new MySqlCommand(customerQuery, con))
                    {
                        lblCustomers.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            ).ToString();
                    }


                    // TOTAL ORDERS

                    string orderQuery =
                        "SELECT COUNT(*) FROM Orders";


                    using (MySqlCommand cmd =
                           new MySqlCommand(orderQuery, con))
                    {
                        lblOrders.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            ).ToString();
                    }


                    // TOTAL SALES

                    string salesQuery = @"
                        SELECT
                            IFNULL(SUM(TotalAmount), 0)
                        FROM Orders
                        WHERE Status <> 'Cancelled'";


                    using (MySqlCommand cmd =
                           new MySqlCommand(salesQuery, con))
                    {
                        decimal sales =
                            Convert.ToDecimal(
                                cmd.ExecuteScalar()
                            );

                        lblSales.Text =
                            sales.ToString("0.00");
                    }


                    // PENDING / PLACED ORDERS

                    string pendingQuery = @"
                        SELECT COUNT(*)
                        FROM Orders
                        WHERE Status = 'Placed'";


                    using (MySqlCommand cmd =
                           new MySqlCommand(pendingQuery, con))
                    {
                        lblPending.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            ).ToString();
                    }


                    // OUT FOR DELIVERY

                    string deliveryQuery = @"
                        SELECT COUNT(*)
                        FROM Orders
                        WHERE Status = 'Out for Delivery'";


                    using (MySqlCommand cmd =
                           new MySqlCommand(deliveryQuery, con))
                    {
                        lblDelivery.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            ).ToString();
                    }


                    // DELIVERED

                    string deliveredQuery = @"
                        SELECT COUNT(*)
                        FROM Orders
                        WHERE Status = 'Delivered'";


                    using (MySqlCommand cmd =
                           new MySqlCommand(deliveredQuery, con))
                    {
                        lblDelivered.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            ).ToString();
                    }


                    // CANCELLED

                    string cancelledQuery = @"
                        SELECT COUNT(*)
                        FROM Orders
                        WHERE Status = 'Cancelled'";


                    using (MySqlCommand cmd =
                           new MySqlCommand(cancelledQuery, con))
                    {
                        lblCancelled.Text =
                            Convert.ToInt32(
                                cmd.ExecuteScalar()
                            ).ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('Database Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');</script>"
                );
            }
        }
    }
}
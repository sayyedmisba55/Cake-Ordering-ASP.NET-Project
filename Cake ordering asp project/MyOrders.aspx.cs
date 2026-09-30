using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class MyOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            try
            {
                string connectionString =
                    ConfigurationManager
                    .ConnectionStrings["CakeDb"]
                    .ConnectionString;

                int userId =
                    Convert.ToInt32(Session["UserId"]);

                using (MySqlConnection con =
                       new MySqlConnection(connectionString))
                {
                    con.Open();

                    string query = @"
                        SELECT
                            OrderId,
                            Status,
                            OrderDate,
                            PaymentMethod,
                            Subtotal,
                            Shipping,
                            Tax,
                            TotalAmount
                        FROM Orders
                        WHERE UserId = @UserId
                        ORDER BY OrderDate DESC";

                    using (MySqlCommand cmd =
                           new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@UserId",
                            userId);

                        using (MySqlDataReader reader =
                               cmd.ExecuteReader())
                        {
                            OrdersRepeater.DataSource = reader;
                            OrdersRepeater.DataBind();
                        }
                    }
                }

                if (OrdersRepeater.Items.Count == 0)
                {
                    pnlNoOrders.Visible = true;
                }
                else
                {
                    pnlNoOrders.Visible = false;
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


        // ================================
        // CANCEL ORDER
        // ================================

        protected void OrdersRepeater_ItemCommand(
            object source,
            System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "CancelOrder")
            {
                return;
            }

            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            try
            {
                int orderId =
                    Convert.ToInt32(e.CommandArgument);

                int userId =
                    Convert.ToInt32(Session["UserId"]);

                string connectionString =
                    ConfigurationManager
                    .ConnectionStrings["CakeDb"]
                    .ConnectionString;

                using (MySqlConnection con =
                       new MySqlConnection(connectionString))
                {
                    con.Open();

                    string query = @"
                        UPDATE Orders
                        SET Status = 'Cancelled'
                        WHERE OrderId = @OrderId
                        AND UserId = @UserId
                        AND Status = 'Placed'";

                    using (MySqlCommand cmd =
                           new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@OrderId",
                            orderId);

                        cmd.Parameters.AddWithValue(
                            "@UserId",
                            userId);

                        int rows =
                            cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            Response.Write(
                                "<script>alert('Order cancelled successfully.');</script>"
                            );
                        }
                        else
                        {
                            Response.Write(
                                "<script>alert('This order cannot be cancelled.');</script>"
                            );
                        }
                    }
                }

                // Refresh orders after cancellation
                LoadOrders();
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('Error: " +
                    ex.Message.Replace("'", "\\'") +
                    "');</script>"
                );
            }
        }
    }
}
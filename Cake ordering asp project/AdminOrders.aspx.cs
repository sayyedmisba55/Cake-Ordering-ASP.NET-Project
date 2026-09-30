using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class AdminOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check whether admin is logged in
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadOrders();
            }
        }


        private void LoadOrders()
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

                    string query = @"
                        SELECT
                            OrderId,
                            FullName,
                            Email,
                            Phone,
                            Pincode,
                            City,
                            PaymentMethod,
                            TotalAmount,
                            Status,
                            OrderDate
                        FROM Orders
                        ORDER BY OrderDate DESC";


                    using (MySqlCommand cmd =
                           new MySqlCommand(query, con))
                    {
                        using (MySqlDataReader reader =
                               cmd.ExecuteReader())
                        {
                            OrdersRepeater.DataSource = reader;
                            OrdersRepeater.DataBind();

                            pnlNoOrders.Visible =
                                OrdersRepeater.Items.Count == 0;
                        }
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


        protected void OrdersRepeater_ItemCommand(
            object source,
            System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "UpdateStatus")
            {
                return;
            }


            try
            {
                int orderId =
                    Convert.ToInt32(e.CommandArgument);


                System.Web.UI.WebControls.DropDownList ddlStatus =
                    (System.Web.UI.WebControls.DropDownList)
                    e.Item.FindControl("ddlStatus");


                string newStatus =
                    ddlStatus.SelectedValue;


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
                        SET Status = @Status
                        WHERE OrderId = @OrderId";


                    using (MySqlCommand cmd =
                           new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Status",
                            newStatus
                        );

                        cmd.Parameters.AddWithValue(
                            "@OrderId",
                            orderId
                        );


                        int rows =
                            cmd.ExecuteNonQuery();


                        if (rows > 0)
                        {
                            Response.Write(
                                "<script>alert('Order status updated successfully.');</script>"
                            );
                        }
                        else
                        {
                            Response.Write(
                                "<script>alert('Order not found.');</script>"
                            );
                        }
                    }
                }


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
using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrderDetails();
            }
        }

        private void LoadOrderDetails()
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int orderId;

            if (!int.TryParse(
                Request.QueryString["OrderId"],
                out orderId))
            {
                lblMessage.Text = "Invalid Order ID.";
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

                    string orderQuery = @"
                        SELECT
                            OrderId,
                            FullName,
                            Email,
                            Phone,
                            Address,
                            City,
                            PaymentMethod,
                            Subtotal,
                            Shipping,
                            Tax,
                            TotalAmount,
                            Status,
                            OrderDate
                        FROM Orders
                        WHERE OrderId = @OrderId
                        AND UserId = @UserId";

                    using (MySqlCommand cmd =
                        new MySqlCommand(orderQuery, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@OrderId",
                            orderId);

                        cmd.Parameters.AddWithValue(
                            "@UserId",
                            userId);

                        using (MySqlDataReader reader =
                            cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lblOrderId.Text =
                                    reader["OrderId"].ToString();

                                lblOrderDate.Text =
                                    Convert.ToDateTime(
                                        reader["OrderDate"])
                                    .ToString(
                                        "dd-MM-yyyy hh:mm tt");

                                lblStatus.Text =
                                    reader["Status"].ToString();

                                lblPayment.Text =
                                    reader["PaymentMethod"].ToString();

                                lblName.Text =
                                    reader["FullName"].ToString();

                                lblEmail.Text =
                                    reader["Email"].ToString();

                                lblPhone.Text =
                                    reader["Phone"].ToString();

                                lblCity.Text =
                                    reader["City"].ToString();

                                lblAddress.Text =
                                    reader["Address"].ToString();

                                lblSubtotal.Text =
                                    Convert.ToDecimal(
                                        reader["Subtotal"])
                                    .ToString("0.00");

                                lblShipping.Text =
                                    Convert.ToDecimal(
                                        reader["Shipping"])
                                    .ToString("0.00");

                                lblTax.Text =
                                    Convert.ToDecimal(
                                        reader["Tax"])
                                    .ToString("0.00");

                                lblTotal.Text =
                                    Convert.ToDecimal(
                                        reader["TotalAmount"])
                                    .ToString("0.00");

                                pnlOrderDetails.Visible = true;
                            }
                            else
                            {
                                lblMessage.Text =
                                    "Order not found.";
                                return;
                            }
                        }
                    }


                    string itemsQuery = @"
                        SELECT
                            ProductName,
                            Qty,
                            Price,
                            (Qty * Price) AS ItemTotal
                        FROM OrderItems
                        WHERE OrderId = @OrderId";

                    using (MySqlCommand itemCmd =
                        new MySqlCommand(itemsQuery, con))
                    {
                        itemCmd.Parameters.AddWithValue(
                            "@OrderId",
                            orderId);

                        using (MySqlDataAdapter adapter =
                            new MySqlDataAdapter(itemCmd))
                        {
                            DataTable dt =
                                new DataTable();

                            adapter.Fill(dt);

                            ItemsRepeater.DataSource = dt;
                            ItemsRepeater.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Database Error: " +
                    ex.Message;
            }
        }
    }
}
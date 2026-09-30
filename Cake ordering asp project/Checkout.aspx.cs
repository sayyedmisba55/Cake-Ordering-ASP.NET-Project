using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Web.Services;
using MySql.Data.MySqlClient;

namespace Cake_ordering_asp_project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public class CartItem
        {
            public string name { get; set; }
            public decimal price { get; set; }
            public int qty { get; set; }
            public string image { get; set; }
        }

        [WebMethod(EnableSession = true)]
        public static string SaveOrder(
            string fullName,
            string email,
            string phone,
            string pincode,
            string address,
            string city,
            string paymentMethod,
            decimal subtotal,
            decimal shipping,
            decimal tax,
            decimal total,
            string cartJson)
        {
            try
            {
                string connectionString =
                    ConfigurationManager
                    .ConnectionStrings["CakeDb"]
                    .ConnectionString;

                JavaScriptSerializer serializer =
                    new JavaScriptSerializer();

                List<CartItem> items =
                    serializer.Deserialize<List<CartItem>>(cartJson);

                if (items == null || items.Count == 0)
                {
                    return "ERROR: Cart is empty.";
                }

                int? userId = null;

                if (System.Web.HttpContext.Current.Session["UserId"] != null)
                {
                    userId = Convert.ToInt32(
                        System.Web.HttpContext.Current.Session["UserId"]);
                }

                using (MySqlConnection con =
                       new MySqlConnection(connectionString))
                {
                    con.Open();

                    using (MySqlTransaction transaction =
                           con.BeginTransaction())
                    {
                        try
                        {
                            string orderQuery = @"
                                INSERT INTO Orders
                                (
                                    UserId,
                                    FullName,
                                    Email,
                                    Phone,
                                    Pincode,
                                    Address,
                                    City,
                                    PaymentMethod,
                                    Subtotal,
                                    Shipping,
                                    Tax,
                                    TotalAmount
                                )
                                VALUES
                                (
                                    @UserId,
                                    @FullName,
                                    @Email,
                                    @Phone,
                                    @Pincode,
                                    @Address,
                                    @City,
                                    @PaymentMethod,
                                    @Subtotal,
                                    @Shipping,
                                    @Tax,
                                    @TotalAmount
                                );

                                SELECT LAST_INSERT_ID();
                            ";

                            int orderId;

                            using (MySqlCommand cmd =
                                   new MySqlCommand(
                                       orderQuery,
                                       con,
                                       transaction))
                            {
                                if (userId.HasValue)
                                {
                                    cmd.Parameters.AddWithValue(
                                        "@UserId",
                                        userId.Value);
                                }
                                else
                                {
                                    cmd.Parameters.AddWithValue(
                                        "@UserId",
                                        DBNull.Value);
                                }

                                cmd.Parameters.AddWithValue(
                                    "@FullName",
                                    fullName);

                                cmd.Parameters.AddWithValue(
                                    "@Email",
                                    email);

                                cmd.Parameters.AddWithValue(
                                    "@Phone",
                                    phone);

                                cmd.Parameters.AddWithValue(
                                    "@Pincode",
                                    pincode);

                                cmd.Parameters.AddWithValue(
                                    "@Address",
                                    address);

                                cmd.Parameters.AddWithValue(
                                    "@City",
                                    city);

                                cmd.Parameters.AddWithValue(
                                    "@PaymentMethod",
                                    paymentMethod);

                                cmd.Parameters.AddWithValue(
                                    "@Subtotal",
                                    subtotal);

                                cmd.Parameters.AddWithValue(
                                    "@Shipping",
                                    shipping);

                                cmd.Parameters.AddWithValue(
                                    "@Tax",
                                    tax);

                                cmd.Parameters.AddWithValue(
                                    "@TotalAmount",
                                    total);

                                orderId =
                                    Convert.ToInt32(
                                        cmd.ExecuteScalar());
                            }

                            foreach (CartItem item in items)
                            {
                                string itemQuery = @"
                                    INSERT INTO OrderItems
                                    (
                                        OrderId,
                                        ProductName,
                                        Qty,
                                        Price
                                    )
                                    VALUES
                                    (
                                        @OrderId,
                                        @ProductName,
                                        @Qty,
                                        @Price
                                    );
                                ";

                                using (MySqlCommand itemCmd =
                                       new MySqlCommand(
                                           itemQuery,
                                           con,
                                           transaction))
                                {
                                    itemCmd.Parameters.AddWithValue(
                                        "@OrderId",
                                        orderId);

                                    itemCmd.Parameters.AddWithValue(
                                        "@ProductName",
                                        item.name);

                                    itemCmd.Parameters.AddWithValue(
                                        "@Qty",
                                        item.qty);

                                    itemCmd.Parameters.AddWithValue(
                                        "@Price",
                                        item.price);

                                    itemCmd.ExecuteNonQuery();
                                }
                            }

                            transaction.Commit();

                            return "SUCCESS:" + orderId;
                        }
                        catch
                        {
                            transaction.Rollback();
                            throw;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return "ERROR: " + ex.Message;
            }
        }
    }
}
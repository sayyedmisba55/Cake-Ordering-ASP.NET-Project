
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace Cake_ordering_asp_project
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public class CartItem
        {
            public string Name { get; set; }
            public int Qty { get; set; }

            // Added Price property to fix the error
            public decimal Price { get; set; }

            // This method saves the customer's order
            public void SaveOrder(
            string fullName,
            string email,
            string phone,
            string pincode,
            string address,
            string city,
            string paymentMethod,
            List<CartItem> items)
            {
                
                string connectionString =
                    @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Orders.mdf;Integrated Security=True";

                
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                  
                    string query = @"INSERT INTO Orders
                                (FullName, Email, Phone, Pincode, Address, City, PaymentMethod, OrderDate)
                                OUTPUT INSERTED.OrderId
                                VALUES
                                (@FullName, @Email, @Phone, @Pincode, @Address, @City, @PaymentMethod, GETDATE())";

                    SqlCommand cmd = new SqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Pincode", pincode);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@City", city);
                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);

                    
                    int orderId = Convert.ToInt32(cmd.ExecuteScalar());

                    
                    foreach (CartItem item in items)
                    {
                        string itemQuery = @"INSERT INTO OrderItems
                                        (OrderId, ProductName, Qty, Price)
                                        VALUES
                                        (@OrderId, @ProductName, @Qty, @Price)";

                        SqlCommand itemCommand = new SqlCommand(itemQuery, conn);

                        itemCommand.Parameters.AddWithValue("@OrderId", orderId);
                        itemCommand.Parameters.AddWithValue("@ProductName", item.Name);
                        itemCommand.Parameters.AddWithValue("@Qty", item.Qty);
                        itemCommand.Parameters.AddWithValue("@Price", item.Price);

                        itemCommand.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}


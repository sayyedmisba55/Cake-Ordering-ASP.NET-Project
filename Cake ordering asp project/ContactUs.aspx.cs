using System;

namespace Cake_ordering_asp_project
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load code
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Get values from textboxes

            string name = txtName.Text.Trim();

            string email = txtEmail.Text.Trim();

            string subject = txtSubject.Text.Trim();

            string message = txtMessage.Text.Trim();


            // Check if any field is empty

            if (name == "" ||
                email == "" ||
                subject == "" ||
                message == "")
            {
                lblStatus.Text = "Please fill all fields.";

                return;
            }


            // Basic email validation

            if (!email.Contains("@") ||
                !email.Contains("."))
            {
                lblStatus.Text = "Please enter a valid email address.";

                return;
            }


            // Successful submission

            lblStatus.Text =
                "Thank you! Your message has been submitted.";


            // Clear the form after successful submission

            txtName.Text = "";

            txtEmail.Text = "";

            txtSubject.Text = "";

            txtMessage.Text = "";
        }
    }
}
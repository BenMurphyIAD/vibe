using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

public partial class _Default : System.Web.UI.Page
{

     public decimal yescount = 0;
     public decimal nocount = 0;

     protected void Page_Load(object sender, EventArgs e)
    {

          if (IsPostBack) {

               string percentage;
               string result;
               string express;
               string wellDate;

               string myConnectionString = ConfigurationManager.ConnectionStrings["yesNoConnect"].ConnectionString;

               // ---------------------------- 'Happy' Query: ------------------------------
               // Define 'Yes' Query and Connection String:
               string mySelectQuery = @"SELECT Count (inputResult) FROM buttonsPressed WHERE date = @fromDateParam AND inputResult = 'yes'";
               

               // Use myConnection to define the 'Yes' SQL command:
               SqlConnection myConnection = new SqlConnection(myConnectionString);
               SqlCommand myCommand = new SqlCommand(mySelectQuery, myConnection);
               myCommand.Parameters.AddWithValue("fromDateParam", DateTime.Parse(FromDate.Text).ToString("yyyy-MM-dd"));

               // Execute 'Yes' SQL Query:
               myCommand.Connection.Open();
                    this.yescount = int.Parse( myCommand.ExecuteScalar().ToString());
               myCommand.Connection.Close();
               // ---------------------------- END 'Happy' Query: ---------------------------


               // ---------------------------- 'Not Happy' Query: ---------------------------
               // Define 'No' Query:
               string myNoSelectQuery = @"Select Count (inputResult) from buttonsPressed where date = @fromDateParam AND inputResult='no'";

               // Use myConnection (defined above) to define the 'No' SQL command:
               SqlCommand myNoCommand = new SqlCommand(myNoSelectQuery, myConnection);
               myNoCommand.Parameters.AddWithValue("fromDateParam", DateTime.Parse(FromDate.Text).ToString("yyyy-MM-dd"));

               // Execute 'No' SQL Query:
               myNoCommand.Connection.Open();
                    this.nocount = int.Parse (myNoCommand.ExecuteScalar().ToString());
               myNoCommand.Connection.Close();
               // ---------------------------- END 'Not Happy' Query: -----------------------

               if (this.yescount > this.nocount) // If more happy than not happy:
               {
                    percentage = Math.Round(((this.yescount / (this.yescount + this.nocount)) * 100)).ToString(); //Display happy percentage
                    result = "mostly happy";
                    express = "Woo! ";
               }
               else if(this.yescount < this.nocount) // If more not happy than happy:
               {
                    percentage = Math.Round(((this.nocount / (this.yescount + this.nocount)) * 100)).ToString(); //Display not happy percentage
                    result = "mostly unhappy";
                    express = "Uh oh... ";
               }
               else // If happy = not happy:
               {
                    percentage = "50"; //Display 50 percent
                    result = "completely balanced";
                    express = "";
               }

               wellDate = DateTime.Parse(FromDate.Text).ToString("dd-MM-yyyy");

               wellFeedback.Text = express + "<br />";
               wellFeedback.Text += "The workforce was <strong>" + result + "</strong><br />";
               wellFeedback.Text += "on " + wellDate + " (<strong>" + percentage + "&#37;</strong>)";
               wellFeedback.Text += "";

          }
     }
}

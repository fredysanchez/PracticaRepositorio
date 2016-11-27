using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Demo
{
    public partial class Form2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {
                cal1.Visible = false;
            }
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetImageById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter paramId = new SqlParameter()
                {
                    ParameterName = "@Id",
                    Value = Request.QueryString["Id"]
                };
                cmd.Parameters.Add(paramId); con.Open();
                byte[] bytes = (byte[])cmd.ExecuteScalar();
                string strBase64 = Convert.ToBase64String(bytes);
                img1.ImageUrl = "data:Image/png;base64," + strBase64;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (cal1.Visible == false)
            {
                cal1.Visible = true;
            }
            else
            {
                cal1.Visible = false;
            }
        }

        protected void cal1_SelectionChanged(object sender, EventArgs e)
        {
            this.TextBox1.Text = cal1.SelectedDate.ToShortDateString();
            cal1.Visible = false;
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
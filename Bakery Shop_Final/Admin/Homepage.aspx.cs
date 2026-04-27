using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Homepage : System.Web.UI.Page
{
    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    String qry = string.Empty;
    SqlDataReader Dr;

    protected void Page_Load(object sender, EventArgs e)
    {
      
            if (!IsPostBack)
            {
                Cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString.ToString();
            }

            if (Session["AdminId"] != null)
            {
                qry = "SELECT COUNT(Cat_Id) FROM Tbl_CategoryMaster WHERE Cat_Isact = 'true'";
                TotalCount(qry, lbltotCat);

                qry = "SELECT COUNT(Product_Id) FROM Tbl_Product_Master WHERE Product_Isact = 'true'";
                TotalCount(qry, lblProduct);

                qry = "SELECT COUNT(ClientId) FROM Tbl_ClientMaster WHERE Client_Isact = 'true'";
                TotalCount(qry, lblTUsers);
            }
    }

    private void TotalCount(string qry,Label lbl)
    {
        Cnn = new SqlConnection(Cnstr);
        Cnn.Open();
        Cmd = new SqlCommand(qry, Cnn);
        Dr = Cmd.ExecuteReader();
        if (Dr.Read())
        {
            lbl.Text = Dr.GetValue(0).ToString();
        }
        Dr.Dispose();
        Cmd.Dispose();
        Cnn.Close();
    }   
}
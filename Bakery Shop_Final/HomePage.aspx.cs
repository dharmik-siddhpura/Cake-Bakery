using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class HomePage : System.Web.UI.Page
{
    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    String qry = string.Empty;
    SqlDataReader Dr;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString.ToString();
            BinddDatalist_Product(); 
        }
    }

  
    public void BinddDatalist_Product()
    {
        qry = "Select * from Tbl_Product_Master Where Product_Isact = 'True' AND (Product_Id % 2 = 1)order by Product_Id";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Cmd.ExecuteNonQuery();
        dt = new DataTable();
        Da = new SqlDataAdapter(Cmd);
        Da.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();
        Cnn.Close();
    }


    protected void Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Frm_Product.aspx");
    }
}
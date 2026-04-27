using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_Frm_ContectUs : System.Web.UI.Page
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
            bindgrd();
        }
    }

    public void bindgrd()
    {
        qry = "select * from Tbl_ContectUs Where Contect_Isact='True' order by Id";
      
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Da = new SqlDataAdapter(Cmd);
        DataSet DS = new DataSet();
        Da.Fill(DS);
        Grd_inquiry.DataSource = DS.Tables[0];
        Grd_inquiry.DataBind();
    }
}
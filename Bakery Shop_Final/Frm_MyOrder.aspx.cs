using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Frm_MyOrder : System.Web.UI.Page
{
    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    String qry = string.Empty;
    SqlDataReader Dr;
    DataSet DS;
    int ClientId;

    protected void Page_Load(object sender, EventArgs e)
    {
        Cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString.ToString();
        if (Session["ClientId"] == null)
        {
            Response.Redirect("Frm_Login.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
        }
        ClientId = int.Parse(Session["ClientId"].ToString());
        if (!IsPostBack)
        {
            bindmygrd_order();
        }
    }
    public void bindmygrd_order()
    {
        qry = "select O.Date,O.Order_Id,CM.FName,O.Product_Name,O.Qty,O.Price,O.TotalAmount from Tbl_Order O,Tbl_ClientMaster CM";
        qry += " Where O.Client_Id  = "+ClientId+" AND ";
        qry += "CM.ClientId = O.Client_Id AND O.Order_Isact='TRUE'";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Da = new SqlDataAdapter(Cmd);

        DataTable dt = new DataTable();
        Da.Fill(dt);
        Dr = Cmd.ExecuteReader();
        if (Dr.Read())
        {
            Order.DataSource = dt;
            Order.DataBind();
        }
        else
        {
            lbl_error.Text = "No Recored Found...";
        }
        Cnn.Close();
    }
    protected void Date_Click(object sender, EventArgs e)
    {
        qry = "select O.Date,O.Order_Id,CM.FName,O.Product_Name,O.Qty,O.Price,O.TotalAmount from Tbl_Order O, Tbl_ClientMaster CM ";
        qry += " Where O.Client_Id  = " + ClientID + " AND ";
        qry += " CM.ClientId = O.Client_Id order by O.Date desc";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Da = new SqlDataAdapter(Cmd);
        DS = new DataSet();
        Da.Fill(DS);
        Dr = Cmd.ExecuteReader();
        if (Dr.Read())
        {
            Order.DataSource = DS.Tables[0];
            Order.DataBind();
        }
        else
        {
            lbl_error.Text = "No Recored Found...";
        }
        Cnn.Close();
    }

}
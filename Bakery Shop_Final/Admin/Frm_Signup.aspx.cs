using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class Admin_Frm_Signup : System.Web.UI.Page
{
    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    SqlDataReader Dr;
    String qry = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        Cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString.ToString();
    }
    protected void Btn_Register_Click(object sender, EventArgs e)
    {
        int SignId = 0;
        qry = "Select MAX(AdminId) + 1 from Tbl_AdminMaster";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Dr = Cmd.ExecuteReader();
        if (Dr.Read())
        {
            SignId = int.Parse(Dr.GetValue(0).ToString());
        }
        Dr.Close();
        Dr.Dispose();
        Cmd.Dispose();
         
        qry = "Insert into Tbl_AdminMaster values(" + SignId + ",'" + Txt_Fname.Text + "','"+ Txt_Lname.Text +"','"+ Txt_SignEmail.Text +"','"+ Txt_SignPass.Text +"','True')";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry,Cnn);
        Cnn.Open();
        Cmd.ExecuteNonQuery();
        Response.Write("Success....");
        Cnn.Close();
    }
}
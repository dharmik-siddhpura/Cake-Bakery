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
        qry = "Select MAX(ClientId) + 1 from Tbl_ClientMaster";
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
        if (verification())
        {
            qry = "Insert into Tbl_ClientMaster values(" + SignId + ",'" + Txt_Fname.Text + "','" + Txt_Lname.Text + "','" + Txt_Address.Text + "','" + Txt_Mobile.Text + "','" + Txt_SignEmail.Text + "','" + Txt_SignPass.Text + "','True')";
            Cnn = new SqlConnection(Cnstr);
            Cmd = new SqlCommand(qry, Cnn);
            Cnn.Open();
            Cmd.ExecuteNonQuery();
            cleardata();
            Cnn.Close();
            Response.Write("<script language=javascript>alert('Your Account Created ')</script>");
            Response.Redirect("HomePage.aspx");
        }
    }

    public void cleardata()
    {
        Txt_Fname.Text = "";
        Txt_Lname.Text = "";
        Txt_Address.Text = "";
        Txt_Mobile.Text = "";
        Txt_SignEmail.Text = "";
        Txt_SignPass.Text = "";
    }

    public bool verification()
    {
        if (Txt_Fname.Text.Trim() != string.Empty && Txt_Lname.Text.Trim() != string.Empty && Txt_Address.Text.Trim() != string.Empty && Txt_Mobile.Text.Trim() != string.Empty && Txt_Mobile.Text.Length == 10 && Txt_SignEmail.Text.Trim() != string.Empty && Txt_SignPass.Text.Trim() != string.Empty)
        {
            return true;
        }
        else
        {
            Response.Write("<script language=javascript>alert('All Fields Are Mandatory..')</script>");
        }
        return false;
    }
}
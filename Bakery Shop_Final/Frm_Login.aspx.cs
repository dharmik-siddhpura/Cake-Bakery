using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Frm_Clientlogin : System.Web.UI.Page
{
    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    String qry = string.Empty;
    SqlDataReader Dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        Cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString.ToString();

        if (Session["ClientId"] != null)
        {
            Response.Cookies["FName"].Expires = DateTime.Now.AddDays(-1);
            Session["ClientId"] = null;
            Response.Redirect("HomePage.aspx");
        }
    }
    protected void Btn_Login_Click(object sender, EventArgs e)
    {
        if ((Txt_logEmail.Text.Trim() != "") && (Txt_logpass.Text.Trim() != ""))
        {
            Session.Add("ClientId", null);
            HttpCookie UName = new HttpCookie("FName");
            UName["FName"] = string.Empty;
            string ReturnUrl = Convert.ToString(Request.QueryString["url"]);

            qry = "Select * from Tbl_ClientMaster Where EmailId='" + Txt_logEmail.Text + "' AND Password='" + Txt_logpass.Text + "'";
            Cnn = new SqlConnection(Cnstr);
            Cmd = new SqlCommand(qry, Cnn);
            Cnn.Open();
            Dr = Cmd.ExecuteReader();
            if (Dr.Read())
            {
                Session["ClientId"] = Dr.GetValue(0).ToString();
                UName["FName"] = Dr.GetValue(1).ToString();
                UName.Expires = System.DateTime.Now.AddDays(1);
                Response.Cookies.Add(UName);

                if (!string.IsNullOrEmpty(ReturnUrl))
                {
                    Response.Redirect(ReturnUrl);
                }
                else
                {
                    Response.Redirect("Homepage.aspx");
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('Email And Id Does not Exists....')</script>");
                //Response.Redirect("Frm_Login.aspx");
            }
            Cnn.Close();
        }
        else
        {
            Response.Write("<script language=javascript>alert('Please! Verify Email Or Password..')</script>");
        }
    }
}
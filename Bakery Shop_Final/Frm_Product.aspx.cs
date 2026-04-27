using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Frm_Product : System.Web.UI.Page
{
    bool user = false; 
    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    String qry = string.Empty;
    SqlDataReader Dr;
    DataTable dt;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        Cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString.ToString();

        if (Session["ClientId"] == null)
        {
            Response.Redirect("Frm_Login.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
        }

        if (!IsPostBack)
        {
            BinddDatalist_Product();
            BindCategory();
        }
    }

    protected void Btn_Search_Click(object sender, EventArgs e)
    {
        if (DDList_Select.Text == "--All--")
        {
            qry = "Select * from Tbl_Product_Master Where Product_Isact = 'True' order by Product_Id";
            //qry = "Select * from Tbl_Product_Master Where Category_Name = '" + DDList_Select.Text + "'";
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
        else
        {
            qry = "Select * from Tbl_Product_Master Where Category_Name = '"+ DDList_Select.Text +"'";
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
    }

    public void BinddDatalist_Product()
    {
        qry = "Select * from Tbl_Product_Master Where Product_Isact = 'True' order by Product_Id";
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

    public void BindCategory()
    {
        DDList_Select.Items.Clear();
        DDList_Select.Items.Add("--All--");

        qry = "Select Category_Name From Tbl_CategoryMaster Where Cat_Isact='True' Order by Cat_Id";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Dr = Cmd.ExecuteReader();
        while (Dr.Read())
        { DDList_Select.Items.Add(Dr.GetValue(0).ToString()); }
        Cnn.Dispose();
        DDList_Select.SelectedIndex = 0;
    }
    protected void Btn_AddToCart_Click(object sender, EventArgs e)
    {
        //if (Session["ClientId"] != null)
        //{
        //    //Auto Cart Id
        //    int Cart_Id = 0;
        //    qry = "Select MAX(Cart_Id) + 1 from Tbl_Cart";
        //    Cnn = new SqlConnection(Cnstr);
        //    Cmd = new SqlCommand(qry, Cnn);
        //    Cnn.Open();
        //    Dr = Cmd.ExecuteReader();
        //    if (Dr.Read())
        //    {
        //        Cart_Id = int.Parse(Dr.GetValue(0).ToString());
        //    }
        //    Dr.Close();
        //    Dr.Dispose();
        //    Cmd.Dispose();
        //    //-----------------------------
        //    int ClientId = int.Parse(Session["ClientId"].ToString());
        //    Label lbl = DataList1.FindControl("lbl_getid") as Label;
        //  //  int productId = int.Parse(Request.QueryString["ProductId"].ToString());
         
           
   
        //    qry = "insert into Tbl_Cart values(" + Cart_Id + "," + ClientId + ","+ lbl +",'True')";
        //    Cnn = new SqlConnection(Cnstr);  
        //    Cnn.Open();
        //    Cmd = new SqlCommand(qry, Cnn);
        //    Cmd.ExecuteNonQuery();
        //    Cnn.Close();
        //    //Response.Redirect("Frm_Cart.aspx");
        //}
        //else
        //{
        //    Response.Redirect("Frm_Cart.aspx");
        //}
   
      }
    
    protected void DataList1_ItemCommand(object sender, DataListCommandEventArgs e)
    {
        if (e.CommandName == "AddProduct")
        {
            if (Session["ClientId"] != null)
            {
                //Auto Cart Id
                int Cart_Id = 0;
                qry = "Select MAX(Cart_Id) + 1 from Tbl_Cart";
                Cnn = new SqlConnection(Cnstr);
                Cmd = new SqlCommand(qry, Cnn);
                Cnn.Open();
                Dr = Cmd.ExecuteReader();
                if (Dr.Read())
                {
                    Cart_Id = int.Parse(Dr.GetValue(0).ToString());
                }
                Dr.Close();
                Dr.Dispose();
                Cmd.Dispose();
                //-----------------------------
                int ClientId = int.Parse(Session["ClientId"].ToString());
                Label lbl = DataList1.FindControl("lbl_getid") as Label;


                qry = "insert into Tbl_Cart values(" + Cart_Id + "," + ClientId + "," + e.CommandArgument.ToString() + ",'1','True')";
                Cnn = new SqlConnection(Cnstr);
                Cnn.Open();
                Cmd = new SqlCommand(qry, Cnn);
                Cmd.ExecuteNonQuery();
                Cnn.Close();
                Response.Redirect("Frm_Cart.aspx");
            }
            else
            {
                Response.Redirect("Frm_Login.aspx");
            }
        }
    }

    
}
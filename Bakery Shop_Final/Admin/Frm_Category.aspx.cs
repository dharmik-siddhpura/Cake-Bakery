using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class Admin_Frm_Category : System.Web.UI.Page
{

    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    String qry = string.Empty;
    SqlDataReader Dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] == null)
        {
            Response.Redirect("Frm_Login.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
        }

        if (!IsPostBack)
        {
            Cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString.ToString();
            bindmyCatGrid();
        }
    }
     protected void Btn_AddCat_Click1(object sender, EventArgs e)
    {
       
            int CatId = 0;
            qry = "Select MAX(Cat_Id) + 1 from Tbl_CategoryMaster";
            Cnn = new SqlConnection(Cnstr);
            Cmd = new SqlCommand(qry, Cnn);
            Cnn.Open();
            Dr = Cmd.ExecuteReader();
            if (Dr.Read())
            {
                CatId = int.Parse(Dr.GetValue(0).ToString());
            }
            Dr.Close();
            Dr.Dispose();
            Cmd.Dispose();

            if (txt_Catname.Text.Length == 0)
            {
                    lbl_showerror.Visible = true;
            
            }
            else
            {
                lbl_showerror.Visible = false;
                qry = "insert into Tbl_CategoryMaster(Cat_Id,Category_Name,Cat_Isact) values(" + CatId + ",'" + txt_Catname.Text + "','True')";
                Cnn = new SqlConnection(Cnstr);
                Cmd = new SqlCommand(qry, Cnn);
                Cnn.Open();
                Cmd.ExecuteNonQuery();
                bindmyCatGrid();
                Cnn.Close();
                txt_Catname.Text = null;
                txt_Catname.Focus();
            }
    }


     public void bindmyCatGrid()
     {
        qry = "select * from Tbl_CategoryMaster Where Cat_Isact='True' order by Cat_Id desc";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Da = new SqlDataAdapter(Cmd);
        DataSet DS = new DataSet();
        Da.Fill(DS);
        Grd_Category.DataSource = DS.Tables[0];
        Grd_Category.DataBind();
     }




     protected void Grd_Category_RowDeleting(object sender, GridViewDeleteEventArgs e)
     {
         Label id = Grd_Category.Rows[e.RowIndex].FindControl("Grdlbl_catId") as Label;
         //qry = "Update Tbl_CategoryMaster set Cat_Isact = 'False 'Where Cat_Id = " + Grd_Category.Rows[e.RowIndex].Cells[0].Text.ToString() +"";
         //qry = "Delete From  Tbl_CategoryMaster Where Cat_Id = " + Grd_Category.Rows[e.RowIndex].Cells[0].Text.ToString() + "";
         qry = "Delete From  Tbl_CategoryMaster Where Cat_Id=" + Convert.ToInt32(id.Text);
         Cnn = new SqlConnection(Cnstr);
         Cmd = new SqlCommand(qry, Cnn);
         Cnn.Open();
         Cmd.ExecuteNonQuery();
         bindmyCatGrid();
         Cnn.Close();
     }

     protected void Grd_Category_RowEditing(object sender, GridViewEditEventArgs e)
     {
         //NewEditIndex property used to determine the index of the row being edited.  
         Grd_Category.EditIndex = e.NewEditIndex;
         bindmyCatGrid();
       

     }
     protected void Grd_Category_RowUpdating(object sender, GridViewUpdateEventArgs e)
     {
         Label id = Grd_Category.Rows[e.RowIndex].FindControl("Grdlbl_catId") as Label;
         TextBox name = Grd_Category.Rows[e.RowIndex].FindControl("Grdtxt_Catname") as TextBox;

         qry = "Update Tbl_CategoryMaster set Category_Name='" + name.Text + "' where Cat_Id=" + Convert.ToInt32(id.Text);
         // qry = "Update Tbl_CategoryMaster set Category_Name='" + name.Text + "' where  Cat_Id = " + Grd_Category.Rows[e.RowIndex].Cells[0].Text.ToString() + "";
         Cnn = new SqlConnection(Cnstr);
         Cnn.Open();
         Cmd = new SqlCommand(qry, Cnn);
         Cmd.ExecuteNonQuery();
         Cnn.Close();
         Grd_Category.EditIndex = -1;
         bindmyCatGrid();

     }

     protected void Grd_Category_PageIndexChanging(object sender, GridViewPageEventArgs e)
     {
         Grd_Category.PageIndex = e.NewPageIndex;
         bindmyCatGrid();
     }  

     protected void Grd_Category_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
     {
         //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
         Grd_Category.EditIndex = -1;
         bindmyCatGrid();
     }  

}
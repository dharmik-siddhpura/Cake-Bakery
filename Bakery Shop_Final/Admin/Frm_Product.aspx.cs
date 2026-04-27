using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class Admin_Frm_Product : System.Web.UI.Page
{
    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    String qry = string.Empty;
    SqlDataReader Dr;
   
    string myImgPath = "";
    string myImgName = "";
    string[] myImgExt = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        Cnstr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString.ToString();
        if (Session["AdminId"] == null)
        {
            Response.Redirect("Frm_Login.aspx?url=" + Server.UrlEncode(Request.Url.AbsoluteUri));
        }

        if (!IsPostBack)
        {
            BindCategory();
            bindmygrd_product();
        }
    }

    public void BindCategory()
    {
        Ddl_Cat.Items.Clear();
        Ddl_Cat.Items.Add("--Select--");
        
        qry = "Select Category_Name From Tbl_CategoryMaster Where Cat_Isact='True' Order by Cat_Id";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Dr = Cmd.ExecuteReader();
        while (Dr.Read())
        {
            Ddl_Cat.Items.Add(Dr.GetValue(0).ToString());
        }
        Cnn.Dispose();
        Ddl_Cat.SelectedIndex = 0;
    }

    protected void Btn_addProduct_Click(object sender, EventArgs e)
    {   
        //Auto Product id 
        int P_id = 0;
        qry = "Select MAX(Product_Id) + 1 from Tbl_Product_Master";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Dr = Cmd.ExecuteReader();
        if (Dr.Read())
        {
            P_id = int.Parse(Dr.GetValue(0).ToString());
        }
        Dr.Close();
        Dr.Dispose();
        Cmd.Dispose();

        //----------------------------------------

        if (ProductimgUpload.PostedFile.ContentLength > 0)
        {
           
            ProductimgUpload.SaveAs(Server.MapPath(@"Product_Img/").ToString() + ProductimgUpload.PostedFile.FileName.ToString());
            ProductimgUpload.SaveAs(Server.MapPath(@"..//Product_Img/").ToString() + ProductimgUpload.PostedFile.FileName.ToString());
         }

        myImgName = ProductimgUpload.FileName.ToString();

        qry = "Insert into Tbl_Product_Master values(";
        qry += "" + P_id + ",";
        qry += "'" + txt_pname.Text + "',";
        qry += "'" + Ddl_Cat.Text+ "',";
        qry += "'" + txt_price.Text + "',";
        qry += "'" + txt_discription.Text + "',";
        qry += @"'Product_Img/" + myImgName + "', "; 
        qry += "'True')";

        
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Cmd.ExecuteNonQuery();
        Cnn.Close();
        bindmygrd_product();
        cleardata();
    }

    void cleardata()
    {
        txt_pname.Text = null;
        txt_price.Text = null;
        txt_discription.Text = null;
        Ddl_Cat.SelectedIndex = 0;
    }

    public void bindmygrd_product()
    {
       qry = "select * from Tbl_Product_Master Where Product_Isact='True' order by Product_Id";
       //qry = "SELECT PM.Product_Id,";
       //qry += "PM.Product_Name,PM.Product_Price,PM.Product_Discription,PM.Product_ImgUrl,PM.Cat_Id,CM.Cat_Id,CM.Category_Name FROM ";
       //qry += "Tbl_ProductMaster PM AN";
       //qry += "Tbl_CategoryMaster CM";
       //qry += "WHERE ";
       //qry += "PM.Cat_Id = CM.Cat_Id AND ";
       //qry += "CM.Cat_Id = CM.Category_Name AND ";
       //qry += "PM.Product_Isact = 'true' AND ";
       //qry+= "CM.Cat_Isact = 'true' ";
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Da = new SqlDataAdapter(Cmd);
        DataSet DS = new DataSet();
        Da.Fill(DS);
        Grd_Product.DataSource = DS.Tables[0];
        Grd_Product.DataBind();
    }

    protected void Grd_Product_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label Grdlbl_PrdId = Grd_Product.Rows[e.RowIndex].FindControl("Grdlbl_PrdId") as Label;
        //qry = "Update Tbl_CategoryMaster set Cat_Isact = 'False 'Where Cat_Id = " + Grd_Category.Rows[e.RowIndex].Cells[0].Text.ToString() +"";
        qry = "Delete From  Tbl_Product_Master Where Product_Id = " + Convert.ToInt32(Grdlbl_PrdId.Text);
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Cmd.ExecuteNonQuery();
        bindmygrd_product();
        Cnn.Close();
    }

    protected void Grd_Product_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //NewEditIndex property used to determine the index of the row being edited.  
        Grd_Product.EditIndex = e.NewEditIndex;
        bindmygrd_product();


    }
    protected void Grd_Product_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = Grd_Product.Rows[e.RowIndex].FindControl("Grdlbl_PrdId") as Label;
        TextBox name = Grd_Product.Rows[e.RowIndex].FindControl("Grdtxt_Prdname") as TextBox;
        DropDownList Category = Grd_Product.Rows[e.RowIndex].FindControl("GrdDdl_Cat") as DropDownList;
        TextBox Price = Grd_Product.Rows[e.RowIndex].FindControl("Grdtxt_Prdprice") as TextBox;
        TextBox Discription = Grd_Product.Rows[e.RowIndex].FindControl("Grdtxt_PrdDiscription") as TextBox;
        FileUpload image = Grd_Product.Rows[e.RowIndex].FindControl("GrdProductimgUpload") as FileUpload;

        if (image.PostedFile.ContentLength > 0)
        {

            image.SaveAs(Server.MapPath(@"Product_Img/").ToString() + image.PostedFile.FileName.ToString());
            image.SaveAs(Server.MapPath(@"..//Product_Img/").ToString() + image.PostedFile.FileName.ToString());
        }
     //   qry = "Update Tbl_Product_Master set Category_Name='" + name.Text + "' where Product_Id=" + Convert.ToInt32(id.Text);
        qry = "UPDATE  Tbl_Product_Master SET Product_Name='" + name.Text + "',";
        qry += "Category_Name='" + Category.Text + "',";
        qry += "Product_Price='"+ Price.Text +"',";
        qry += "Product_Discription='"+ Discription.Text +"',";
        qry += "Product_ImgUrl='Product_Img/" + image.FileName.ToString() +"' ";
        qry += "WHERE ";
        qry += "Product_Id=" + Convert.ToInt32(id.Text)+"";
       
       // qry = "Update Tbl_CategoryMaster set Category_Name='" + name.Text + "' where  Cat_Id = " + Grd_Category.Rows[e.RowIndex].Cells[0].Text.ToString() + "";
        Cnn = new SqlConnection(Cnstr);
        Cnn.Open();
        Cmd = new SqlCommand(qry, Cnn);
        Cmd.ExecuteNonQuery();
        Cnn.Close();
        Grd_Product.EditIndex = -1;
        bindmygrd_product();


    }

    protected void Grd_Product_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grd_Product.PageIndex = e.NewPageIndex;
        bindmygrd_product();
    }

    protected void Grd_Product_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
        Grd_Product.EditIndex = -1;
        bindmygrd_product();
    }

    protected void Grd_Product_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList Category = (DropDownList)e.Row.FindControl("GrdDdl_Cat");
                Category.Items.Clear();
                Category.Items.Add("--Select--");
                qry = "Select Category_Name From Tbl_CategoryMaster Where Cat_Isact='True' Order by Cat_Id";
                Cnn = new SqlConnection(Cnstr);
                Cmd = new SqlCommand(qry, Cnn);
                Cnn.Open();
                Dr = Cmd.ExecuteReader();
                while (Dr.Read())
                { Category.Items.Add(Dr.GetValue(0).ToString()); }
                Cnn.Dispose();
                Category.SelectedIndex = 0;
            }
        }
    }

    protected void Ddl_Cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Ddl_Cat.SelectedIndex > 0)
            ProductimgUpload.Enabled = true;
        else
            ProductimgUpload.Enabled = false;
    }
}
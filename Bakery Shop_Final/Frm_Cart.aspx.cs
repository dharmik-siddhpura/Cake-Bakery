using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Frm_Cart : System.Web.UI.Page
{
    static string Cnstr;
    SqlConnection Cnn;
    SqlCommand Cmd;
    SqlDataAdapter Da;
    String qry = string.Empty;
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
            bindCart();
        }

    }

    public void bindCart()
    {
        if (Session["ClientId"] != null)
        {
            ClientId = int.Parse(Session["ClientId"].ToString());

            qry = "select TPM.Product_Id,";
            qry += " TC.Cart_Id,";
            qry += " TC.ClientId,";
            qry += " TC.Qty,";
            qry += " TPM.Product_Name,";
            qry += " TPM.Product_Price,";
            qry += " TPM.Category_Name,";
            qry += " TPM.Product_ImgUrl,";
            qry += "(TC.Qty * TPM.Product_Price)as myAmt ";
            qry += " from Tbl_Product_Master TPM ,Tbl_Cart TC ";
            qry += " where TPM.Product_Isact='True' AND TC.ClientId =" + ClientId + " AND ";
            qry += " TPM.Product_Id = TC.Product_Id order by Cart_Id";

            Cnn = new SqlConnection(Cnstr);
            Cmd = new SqlCommand(qry, Cnn);
            Da = new SqlDataAdapter(Cmd);
            Cnn.Open();
            DataTable dt = new DataTable();
            Da.Fill(dt);
            if (dt.Rows.Count > 0)
            {

                Grid_Cart.DataSource = dt;
                Grid_Cart.DataBind();
                Grid_Cart.FooterRow.Cells[3].Text = "Total Qty : ";
                Grid_Cart.FooterRow.Cells[4].Text = dt.Compute("SUM(Qty)", "").ToString();

                Grid_Cart.FooterRow.Cells[5].Text = "Final Amount : ";
                Grid_Cart.FooterRow.Cells[6].Text = dt.Compute("SUM(myAmt)", "").ToString();
                Cnn.Close();

                int Dcharge = 100;
                int famount = int.Parse(Grid_Cart.FooterRow.Cells[6].Text);
                int total = famount + Dcharge;
                lbl_Famount.Text = total.ToString() + "  Rs.";
            }
            else
            {
                Grid_Cart.DataSource = null;
                Grid_Cart.DataBind();
                lbl_Famount.Text = "";
            }
        }
        else
        {
            Response.Redirect("Frm_Login.aspx");
        }
    }

    protected void btnContinueShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("Frm_Product.aspx");
    }

    protected void Grid_Cart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Grid_Cart.EditIndex = e.NewEditIndex;
        bindCart();
    }

    protected void Grid_Cart_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {

        Grid_Cart.EditIndex = -1;
        bindCart();
    }

    protected void Grid_Cart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        Label CartId = Grid_Cart.Rows[e.RowIndex].FindControl("Grdlbl_Cartid") as Label;
        TextBox Q = Grid_Cart.Rows[e.RowIndex].FindControl("Grdtxt_qty") as TextBox;
        qry = "UPDATE Tbl_Cart SET Qty = " + Q.Text + " where Cart_Id=" + Convert.ToInt32(CartId.Text);
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Cmd.ExecuteNonQuery();
        Cnn.Close();
        Grid_Cart.EditIndex = -1;
        bindCart();
    }


    protected void Grid_Cart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label CartId = Grid_Cart.Rows[e.RowIndex].FindControl("Grdlbl_Cartid") as Label;
        qry = "Delete from Tbl_Cart where Cart_Id=" + Convert.ToInt32(CartId.Text);
        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        Cmd.ExecuteNonQuery();
        Cnn.Close();
        Grid_Cart.EditIndex = -1;
        bindCart();
        
    }

    public bool validate_order()
    {
        qry = "Select ";
        qry += " Cart_Id,";
        qry += " ClientId";
        qry += " from Tbl_Cart";
        qry += " where ClientId =" + ClientId + " AND Cart_Isact = 'True'";
        

        Cnn = new SqlConnection(Cnstr);
        Cmd = new SqlCommand(qry, Cnn);
        Cnn.Open();
        SqlDataReader Dr = Cmd.ExecuteReader();
        if (Dr.Read())
        {
           // Order_Id = int.Parse(Dr.GetValue(0).ToString());
            if ((txt_shmobile.Text.Trim() != null) && (txt_shmobile.Text.Length == 10))
            {
                if (txt_shAddress.Text.Trim() != string.Empty)
                {
                    if (txt_shname.Text.Trim() != "")
                    {
                        return true;
                    }
                    else
                    {
                        txt_shname.Focus();
                        lblError.Text = "Enter Your reciver's name";
                    }
                }
                else
                {
                    txt_shAddress.Focus();
                    lblError.Text = "Enter valid address";
                }
            }
            else
            {
                txt_shmobile.Focus();
                lblError.Text = "Mobile number must be in 10 digit.";
            }
        }
        else
            lblError.Text = "Your cart is empty";
        
        Dr.Close();
        Dr.Dispose();
        Cmd.Dispose();
        return false;
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        if (validate_order())
        {
            int Order_Id = 0;
            qry = "Select MAX(Order_Id) + 1 from Tbl_Order";
            Cnn = new SqlConnection(Cnstr);
            Cmd = new SqlCommand(qry, Cnn);
            Cnn.Open();
            SqlDataReader Dr = Cmd.ExecuteReader();
            if (Dr.Read())
            {
                Order_Id = int.Parse(Dr.GetValue(0).ToString());
            }
            Dr.Close();
            Dr.Dispose();
            Cmd.Dispose();


            int InvoiceNo = 0;
            qry = "Select MAX(InvoiceNo) + 1 from Tbl_SaleRecipet";
            Cnn = new SqlConnection(Cnstr);
            Cmd = new SqlCommand(qry, Cnn);
            Cnn.Open();
            SqlDataReader Dr1 = Cmd.ExecuteReader();
            if (Dr1.Read())
            {
                InvoiceNo = int.Parse(Dr1.GetValue(0).ToString());
            }
            Dr1.Close();
            Dr1.Dispose();
            Cmd.Dispose();

            if (Session["ClientId"] != null)
            {
                ClientId = int.Parse(Session["ClientId"].ToString());

                foreach (GridViewRow GRD in Grid_Cart.Rows)
                {
                    String qt = (GRD.FindControl("Grdlbl_qty") as Label).Text;

                    qry = "Insert into Tbl_Order Values(";
                    qry += "'" + System.DateTime.Now.Date.ToShortDateString() + "',";
                    qry += "" + Order_Id + ",";
                    qry += "" + ClientId + ",";
                    qry += "(select max(Cart_Id)+1  from Tbl_Order ),";
                    qry += "'" + GRD.Cells[3].Text + "',";
                    qry += "" + qt + ",";
                    qry += "" + GRD.Cells[5].Text + ",";
                    qry += "" + GRD.Cells[6].Text + ",";
                    qry += "'True')";

                    string qry1 = string.Empty;
                    qry1 = "Insert into Tbl_SaleRecipet Values(";
                    qry1 += "(select max(Sale_Id)+1  from Tbl_SaleRecipet ),";
                    qry1 += "" + ClientId + ",";
                    qry1 += "" + InvoiceNo + ",";
                    qry1 += "'" + System.DateTime.Now.Date.ToShortDateString() + "',";
                    qry1 += "'" + txt_shname.Text + "',";
                    qry1 += "'" + txt_shAddress.Text + "',";
                    qry1 += "'" + txt_shmobile.Text + "',";
                    qry1 += "'" + GRD.Cells[3].Text + "',";
                    qry1 += "" + qt + ",";
                    qry1 += "" + GRD.Cells[5].Text + ",";
                    qry1 += "" + GRD.Cells[6].Text + ",";
                    qry1 += "'True')";

                    Cnn = new SqlConnection(Cnstr);
                    Cmd = new SqlCommand(qry, Cnn);
                    Cnn.Open();
                    Cmd.ExecuteNonQuery();
                    Cnn.Close();

                    Cnn = new SqlConnection(Cnstr);
                    Cmd = new SqlCommand(qry1, Cnn);
                    Cnn.Open();
                    Cmd.ExecuteNonQuery();
                    Cnn.Close();
                    //Cnn = new SqlConnection(Cnstr);
                    //Cmd = new SqlCommand(qry, Cnn);
                    //Cnn.Open();
                    //Cmd.ExecuteNonQuery();
                    //SqlDataAdapter DA = new SqlDataAdapter(Cmd);
                    //DataSet DS = new DataSet();
                    //Cnn.Close();
                    //DA.Fill(DS);
                    // DS.WriteXml(@"E:\Project\Bakery Shop\Xml\SaleBill.xml");
                }
                Order_Id++;
                Response.Write("<script language=javascript>alert('Your Order Has Been Accepted....')</script>");
                qry = "DELETE FROM Tbl_Cart WHERE ClientId = " + ClientId + "";
                Cnn = new SqlConnection(Cnstr);
                Cmd = new SqlCommand(qry, Cnn);
                Cnn.Open();
                Cmd.ExecuteNonQuery();
                Cnn.Close();
                bindCart();
            }
            Response.Redirect("HomePage.aspx");
        }
        
    }
}
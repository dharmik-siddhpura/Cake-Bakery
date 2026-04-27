using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] != null)
        {
            Lable_showName.Text = Request.Cookies["FName"].Value.ToString().Split('=')[1];
            Menu1.Items[4].Text = "LogOut";
            Lable_showName.Visible = true;
        }
        else
        {
            Lable_showName.Visible = false;
            Lable_showName.Text = "";
            Menu1.Items[4].Text = "Login";
        }

    }
}

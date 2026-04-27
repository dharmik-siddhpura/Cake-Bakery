<%@ WebHandler Language="C#" Class="IMG" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class IMG : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        try
        {
            Int32 theID;
            if (context.Request.QueryString["id"] != null)
                theID = Convert.ToInt32(context.Request.QueryString["id"]);
            else
                throw new ArgumentException("No parameter specified");

            context.Response.ContentType = "image/jpeg";
            Stream strm = DisplayImage(theID);
            byte[] buffer = new byte[4096];
            int byteSeq = strm.Read(buffer, 0, 4096);

            while (byteSeq > 0)
            {
                context.Response.OutputStream.Write(buffer, 0, byteSeq);
                byteSeq = strm.Read(buffer, 0, 4096);
            }
        }
        catch
        {

        }

    }
    public Stream DisplayImage(int theID)
    {
        System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString.ToString());
        string QRY = "SELECT Product_ImgUrl FROM Tbl_Product_Master WHERE Product_Id = @ID";
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(QRY, connection);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", theID);
        connection.Open();
        object theImg = cmd.ExecuteScalar();
        try
        {
            return new MemoryStream((byte[])theImg);
        }
        catch
        {
            return null;
        }
        finally
        {
            connection.Close();
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
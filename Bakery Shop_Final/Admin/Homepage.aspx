<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/MasterPage.master" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Mp_Header">
</asp:Content>
<asp:Content ID="C1" runat="server" ContentPlaceHolderID="CPH_ContentHolder">


    <!--================Welcome Area =================-->
    <section class="welcome_bakery_area cake_feature_main p_100">
        <div class="container">
            <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="../AdRotator.xml" Target="_blank" Height="400" Width="1200"></asp:AdRotator>
        </div>
        <br />
        <br />
        <hr />
        <div>
            <center>
                     <table border="1" style="width:70%; font-size:150%; margin-top:0% auto; text-align:center">
                        <tr>
                            <td>
                                 <asp:Label ID="Label3" runat="server" Text="Total Category"></asp:Label>
                            </td>
                            <td>  
                                <asp:Label ID="lbltotCat" runat="server">-</asp:Label>  
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Label ID="Label2" runat="server" Text="Total Products"></asp:Label>
                            </td>
                            <td>   
                                <asp:Label ID="lblProduct" runat="server">-</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:50%">
                                 <asp:Label ID="Label1" runat="server" Text="Total Number Of Users"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblTUsers" runat="server">-</asp:Label>
                            </td>
                        </tr>
                    </table>
            </center>
        </div>
    </section>
    <!--================End Welcome Area =================-->
</asp:Content>

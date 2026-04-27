<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" MasterPageFile="~/MasterPage_Client.master" Inherits="HomePage" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Mp_Header" >
    
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="CPH_ContentHolder" >
     <section class="welcome_bakery_area cake_feature_main p_100">s
        	<div class="container">
                <asp:AdRotator runat = "server" AdvertisementFile="~/AdRotator.xml" Target =  "_blank" Height="400px" Width="1200px">
                </asp:AdRotator>
                <br/>
                <br/><br/><br/>
                 <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CellSpacing="5" Width="1200px" ItemStyle-HorizontalAlign="Center" >
                   
                      <ItemTemplate>
       
                              <div class="cake_feature_item">
                                  <div class="cake_img">
                                   <asp:Label ID="Lable_id" runat="server" Visible="false" Text='<%#Eval("Product_Id") %>'></asp:Label>
                                  <asp:Image ID="Image1" runat="server"  ImageUrl='<%#Eval("Product_ImgUrl") %>' Height="200px" Width="200px" />
                                  </div>
                                  <br />
                                  <div class="cake_text">
                                      <h4><%#Eval("Product_Price") %>₹</h4>                              
                                      <h3><%#Eval("Product_Name") %></h3>
                                  </div>
                                  <%--<asp:Button ID="Btn_AddToCart" runat="server" Text="Add to Cart"  OnClick="Btn_AddToCart_Click" CommandName="AddProduct" CommandArgument='<%#Eval("Product_Id") %>' />--%>
                                  </div>
                                  <br />
     
                    </ItemTemplate>
                  </asp:DataList>
                <Center>
                <asp:Button ID="Btn" OnClick="Btn_Click" runat="server" Text="View More Product" Font-Bold="true"  />
			</Center>
                    </div>
        </section>
</asp:Content>

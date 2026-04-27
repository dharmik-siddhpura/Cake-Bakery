<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_Product.aspx.cs" Inherits="Frm_Product"  MasterPageFile="~/MasterPage_Client.master" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Mp_Header" >
</asp:Content>
<asp:Content ID="C1" runat="server" ContentPlaceHolderID="CPH_ContentHolder" >
     <section class="welcome_bakery_area cake_feature_main p_100">
        	<div class="container">
                <h5>Select Category : 
                 <asp:DropDownList ID="DDList_Select" runat="server" OnDataBinding="Page_Load" Width="250px"></asp:DropDownList>
                  <asp:Button ID="Btn_Search" runat="server" Text="Search" CssClass="pest_btn" OnClick="Btn_Search_Click"/>
               </h5>
                <br />
				<div class="main_title">
					<h2>Our Bakery Product</h2>
				</div>
   

              <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CellSpacing="5" Width="1200px" ItemStyle-HorizontalAlign="Center" OnItemCommand="DataList1_ItemCommand" >
                   
                      <ItemTemplate>
       
                              <div class="cake_feature_item">
                                  <div class="cake_img">
                                   <asp:Label ID="Lable_id" runat="server" Visible="false" Text='<%#Eval("Product_Id") %>'></asp:Label>
                                  <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Product_ImgUrl") %>' Height="200px" Width="200px" />
                                  </div>
                                  <br />
                                  <div class="cake_text">
                                      <h4><%#Eval("Product_Price") %>₹</h4>                              
                                      <h3><%#Eval("Product_Name") %></h3>
                                  </div>
                                  <asp:Button ID="Btn_AddToCart" runat="server" Text="Add to Cart"  OnClick="Btn_AddToCart_Click" CommandName="AddProduct" CommandArgument='<%#Eval("Product_Id") %>' />
                                  </div>
                                  <br />
     
                    </ItemTemplate>
                  </asp:DataList>
              
   
				</div>
  
        </section>
</asp:Content>
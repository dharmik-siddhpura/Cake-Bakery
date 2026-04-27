<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_Product.aspx.cs" MasterPageFile="~/Admin/MasterPage.master" Inherits="Admin_Frm_Product" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Mp_Header" >
    <br /><br /> 
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="CPH_ContentHolder" >
    <section class="contact_form_area p_100">
        	<div class="container">
        		
                <center>
        <h1>Manage Products</h1>

               <br /><br />
                            <div>
     <table>
       
        <tr>
              <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                  <asp:Label ID="lbl_pname" runat="server" Text="Producat Name:" Font-Bold="true"></asp:Label>
              </td>
		     
             <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                  <asp:TextBox ID="txt_pname" runat="server"></asp:TextBox>
		      </td>
            <td >
                 <%--<asp:RequiredFieldValidator ID="Rfv_pname" runat="server" ErrorMessage="Fill Product name" ControlToValidate="txt_pname" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>--%>
		      </td>
           
        </tr>
        
          <tr>
             <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; "> 
                 <asp:Label ID="lbl_cat" runat="server" Text="Category :"  Font-Bold="true"></asp:Label>
             </td>
		      
             <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; "> 
                 <asp:DropDownList ID="Ddl_Cat" runat="server" AutoPostBack="true" Width="200px" OnDataBinding="Page_Load" OnSelectedIndexChanged="Ddl_Cat_SelectedIndexChanged"></asp:DropDownList>
             </td>
        </tr>
        
          <tr>
             <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                 <asp:Label ID="lbl_price" runat="server" Text="Price:"  Font-Bold="true"></asp:Label>
             </td>
		      
              <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                  <asp:TextBox ID="txt_price" runat="server" Width="200px"></asp:TextBox>
              </td>         

                <td >
                 <%--<asp:RequiredFieldValidator ID="Rfv_price" runat="server" ErrorMessage="Fill Product Price" ControlToValidate="txt_price" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>--%>
		      </td>

        </tr>
        
          <tr>
             <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                 <asp:Label ID="lbl_Discription" runat="server" Text="Discription:"  Font-Bold="true"></asp:Label>
             </td>
		      
              <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                  <asp:TextBox ID="txt_discription" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
              </td>         
              <td>
                <%--<asp:RequiredFieldValidator ID="Rfv_discription" runat="server" ErrorMessage="Fill Discription" ControlToValidate="txt_discription" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                 </td>
        </tr>
        
          <tr>
             <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                 <asp:Label ID="lbl_upload" runat="server" Text="Upload Image"  Font-Bold="true"></asp:Label>
             </td>
		      
              <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                  <asp:FileUpload ID="ProductimgUpload" runat="server"  Enabled="false" Font-Bold="true"></asp:FileUpload>
              </td>
            
              <td>
                <%--<asp:RequiredFieldValidator ID="Rfv_uploadimg" runat="server" ErrorMessage="Upload Image" ControlToValidate="ProductimgUpload" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                 </td>
        </tr>
         
         
          <tr>
               <td colspan="2" align="center" style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                   <asp:Button ID="Btn_addProduct" runat="server" Text="Add Product" Width="151px" OnClick="Btn_addProduct_Click"  Font-Bold="true">
                   </asp:Button>
               </td>
        </tr>
         
    </table>

                        <%-- <asp:GridView ID="Grd_Product" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="8" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" OnRowDeleting="Grd_Product_RowDeleting">
                         <Columns>
                            <asp:BoundField DataField="Product_Id" HeaderText="Id" />
                            <asp:BoundField DataField="Product_Name" HeaderText="Name" />
                            <asp:BoundField DataField="Cat_Id" HeaderText="Category name" />
                            <asp:BoundField DataField="Product_Price" HeaderText="Price" />
                            <asp:BoundField DataField="Product_Discription" HeaderText="Discription" />
                            <asp:ImageField DataImageUrlField="Product_ImgUrl" HeaderText="Iamage" ControlStyle-Height="100px" ControlStyle-Width="100px" />
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                         </asp:GridView>--%>

                           <asp:GridView ID="Grd_Product" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" OnRowDeleting="Grd_Product_RowDeleting" OnRowEditing="Grd_Product_RowEditing" OnPageIndexChanging="Grd_Product_PageIndexChanging" OnRowCancelingEdit="Grd_Product_RowCancelingEdit" OnRowUpdating="Grd_Product_RowUpdating" OnRowDataBound="Grd_Product_RowDataBound"  PagerSettings-Mode="Numeric" PagerSettings-PageButtonCount="3">
                               <AlternatingRowStyle BackColor="#CCCCCC" />
                         <Columns>
                              <asp:TemplateField HeaderText="Id" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_PrdId" runat="server" Width="50px" Text='<%#Eval("Product_Id") %>'></asp:Label>  
                    </ItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  
               
                       <asp:TemplateField HeaderText="Prodcut Name" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_PrdName" runat="server" Text='<%#Eval("Product_Name") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="Grdtxt_Prdname" runat="server" Text='<%#Eval("Product_Name") %>'></asp:TextBox>  
                    </EditItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                           <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                              <asp:TemplateField HeaderText="Category " HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_PrdCatName" runat="server"  Width="80px" Text='<%#Eval("Category_Name") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                           <asp:DropDownList ID="GrdDdl_Cat" runat="server" AutoPostBack="false" Width="200px" OnDataBinding="Page_Load"></asp:DropDownList>
                    </EditItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                              <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_Prdprice" runat="server" Width="80px"  Text='<%#Eval("Product_Price") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="Grdtxt_Prdprice" runat="server" Width="100px" Text='<%#Eval("Product_Price") %>'></asp:TextBox>  
                    </EditItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                 <asp:TemplateField HeaderText="Discription" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_PrdDiscription" runat="server" Width="150px" Text='<%#Eval("Product_Discription") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate >  
                        <asp:TextBox ID="Grdtxt_PrdDiscription" runat="server" TextMode="MultiLine" Width="150px" Text='<%#Eval("Product_Discription") %>'></asp:TextBox>  
                    </EditItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                     <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                     <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                          <asp:Image ID="ProductImage" runat="server" Height="150px" Width="150px" BorderStyle="Solid" ImageUrl='<%# Eval("Product_ImgUrl") %>'></asp:Image>
                    </ItemTemplate>  
                    <EditItemTemplate>  
                       <%--<asp:TextBox ID="Grdtxt_Prdimage" runat="server" Text='<%#Eval("Product_ImgUrl") %>'></asp:TextBox>--%>  
                       <asp:FileUpload ID="GrdProductimgUpload" runat="server" Width="250px" Font-Bold="true" ></asp:FileUpload>
                         <%--<asp:Image ID="ProductImage" runat="server" Height="100px" Width="100px" BorderStyle="Solid" ImageUrl="~/Admin/Product_Img/arivals-pic.jpg"></asp:Image>--%>
                    </EditItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                         <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  



             
                    <asp:TemplateField HeaderText="Isact" Visible="False">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_isact" runat="server" Text='<%#Eval("Product_Isact") %>' ></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="Grdtxt_CatIsact" runat="server" Text='<%#Eval("Product_Isact") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                      
                       <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="Grdbtn_Delete" runat="server" Text="Delete"  Width="80px" CommandName="Delete"/>  
                    </ItemTemplate> 
                           <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  
              
                               <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" Width="80px" CommandName="Edit" >   </asp:Button>
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" >   </asp:Button>
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel">   </asp:Button>
                    </EditItemTemplate>  
                                   <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                               <PagerSettings Mode="NextPrevious" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                         </asp:GridView>


                     </div>
               </center>
                </div>
        </section>
    </asp:Content>


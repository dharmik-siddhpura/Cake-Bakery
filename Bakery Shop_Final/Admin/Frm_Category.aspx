<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_Category.aspx.cs" Inherits="Admin_Frm_Category" MasterPageFile="~/Admin/MasterPage.master" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Mp_Header" >
    <br /><br /> 
</asp:Content>
<asp:Content ID="C1" runat="server" ContentPlaceHolderID="CPH_ContentHolder" >

    <section class="contact_form_area p_100">
          <div class="container">
        		
       	<center>
        <h2>Manage Category</h2>

               <table border="0" style=" height:100%;">
                   <tr>
                       <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                           <asp:Label ID="lbl_Catname" runat="server" Text="Enter Category Name:-" Font-Bold="true" Font-Size="Larger"></asp:Label>
                       </td>
                       
                       <td style="padding-top:15px; padding-left:15px; padding-right:15px; padding-bottom:15px; ">
                           <asp:TextBox ID="txt_Catname" runat="server"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                        <td colspan="3" style="text-align:center">
                           <%--<asp:RequiredFieldValidator ID="Rfv_catname" runat="server" ErrorMessage="Please Fill  Category name....." ControlToValidate="txt_Catname" Font-Bold="true" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                            <asp:Label ID="lbl_showerror" ForeColor="Red" Text="Please Fill  Category name....." runat="server" Visible="false"></asp:Label>
                       </td>
                   </tr>
                   
               </table>
           <br />
           <asp:Button ID="Btn_AddCat" runat="server" Text="Add Category" OnClick="Btn_AddCat_Click1"></asp:Button>
                  
    <br /><br />
             <%-- <asp:GridView ID="Grd_Category" runat="server" AutoGenerateColumns="False" OnRowDeleting="Grd_Category_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="10" CellSpacing="15" ForeColor="Black" GridLines="Horizontal" OnPageIndexChanging="Grd_Category_PageIndexChanging" OnRowCancelingEdit="Grd_Category_RowCancelingEdit" OnRowEditing="Grd_Category_RowEditing" OnRowUpdating="Grd_Category_RowUpdating">
                  <Columns>
                      <asp:BoundField DataField="Cat_Id" HeaderText="Category Id"  />
                      <asp:BoundField DataField="Category_Name" HeaderText="Category Name" />
                      <asp:BoundField DataField="Cat_Isact" HeaderText="Isact" Visible="False" />
                      <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                      <asp:CommandField ShowEditButton="True" ButtonType="Button" />
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

                <asp:GridView ID="Grd_Category" runat="server" AutoGenerateColumns="False" OnRowDeleting="Grd_Category_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="10" CellSpacing="15" ForeColor="Black" GridLines="Horizontal"
                    OnRowCancelingEdit="Grd_Category_RowCancelingEdit"    OnRowEditing="Grd_Category_RowEditing" OnRowUpdating="Grd_Category_RowUpdating" OnPageIndexChanging="Grd_Category_PageIndexChanging">
                  <Columns>  
               
                <asp:TemplateField HeaderText="Category Id">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_catId" runat="server" Text='<%#Eval("Cat_Id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
               
                       <asp:TemplateField HeaderText="Category Name">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_CatName" runat="server" Text='<%#Eval("Category_Name") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="Grdtxt_Catname" runat="server" Text='<%#Eval("Category_Name") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
             
                    <asp:TemplateField HeaderText="Isact" Visible="False">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_isact" runat="server" Text='<%#Eval("Cat_Isact") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="Grdtxt_CatIsact" runat="server" Text='<%#Eval("Cat_Isact") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                      
                       <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="Grdbtn_Delete" runat="server" Text="Delete" CommandName="Delete" />  
                    </ItemTemplate> 
                </asp:TemplateField>  
              
                               <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" Width="100px"/>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

            </Columns>  
                  <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                  <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                  <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F7F7F7" />
                  <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                  <SortedDescendingCellStyle BackColor="#E5E5E5" />
                  <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
                         
    </center>
       	</div>
        </section>

</asp:Content>


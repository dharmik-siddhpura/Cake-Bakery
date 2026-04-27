<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_Cart.aspx.cs" MasterPageFile="~/MasterPage_Client.master" Inherits="Frm_Cart" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Mp_Header" >
</asp:Content>
<asp:Content ID="C1" runat="server" ContentPlaceHolderID="CPH_ContentHolder">
    <section class="welcome_bakery_area cake_feature_main p_100" style="padding-top:0px;">
        <div class="container">
            <center style="margin-left: 40px;">
                  <h3>Cart</h3>
                <br />
                <div>
              <asp:GridView ID="Grid_Cart" runat="server" Width="100%" AutoGenerateColumns="False" OnRowCancelingEdit="Grid_Cart_RowCancelingEdit" OnRowDeleting="Grid_Cart_RowDeleting" OnRowEditing="Grid_Cart_RowEditing" OnRowUpdating="Grid_Cart_RowUpdating" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" ShowFooter="True">
                    <Columns>
                        <%--<asp:BoundField DataField="Cart_Id" HeaderText="Cart Id" ReadOnly="True" Visible="true" />--%>
                        <asp:TemplateField HeaderText="Id" HeaderStyle-HorizontalAlign="Center">  
                            <ItemTemplate>  
                                 <asp:Label ID="Grdlbl_Cartid" runat="server" Width="50px" Text='<%#Eval("Cart_Id") %>'></asp:Label>  
                            </ItemTemplate>  
                             <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>  

                         <asp:TemplateField HeaderText="Product_Id" HeaderStyle-HorizontalAlign="Center" Visible="False">  
                            <ItemTemplate>  
                                 <asp:Label ID="Grdlbl_Pid" runat="server" Width="50px" Text='<%#Eval("Product_Id") %>'></asp:Label>  
                            </ItemTemplate>  
                             <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>  
                        
                         <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Center">  
                            <ItemTemplate>  
                                 <asp:Image ID="ProductImage" runat="server" Height="150px" Width="150px" BorderStyle="Solid" ImageUrl='<%# Eval("Product_ImgUrl") %>'></asp:Image>
                            </ItemTemplate>  
                             <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>  
                      
                          <asp:BoundField DataField="Product_Name" HeaderText="Name" ReadOnly="True" >
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                       <%-- <asp:BoundField DataField="Qty" HeaderText="Qty">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                        </asp:BoundField>--%>

                        <asp:TemplateField HeaderText="Qty" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Grdlbl_qty" runat="server" Text='<%#Eval("Qty") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="Grdtxt_qty" width="50px" runat="server" Text='<%#Eval("Qty") %>'></asp:TextBox>  
                    </EditItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            </asp:TemplateField>
                        
                        <asp:BoundField DataField="Product_Price" HeaderText="Product_Price" ReadOnly="True" >
                         <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="myAmt" HeaderText="Amount" ReadOnly="True" >
                         <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        
                        <asp:CommandField ButtonType="Button" HeaderText="Change" ShowEditButton="True" >
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                         <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                        
                        <asp:CommandField ButtonType="Button" DeleteText="Remove Item" HeaderText="Remove" ShowDeleteButton="True" >
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                        </asp:CommandField>
                    </Columns>

                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />

                </asp:GridView>                
             </div>
               <br />
                <br />
               <div>
                   <hr />
                   <h5 align="Right">Delivery Charge : <asp:Label ID="lbl_DCharge" runat="server" Text="100 Rs." Font-Bold="True" Font-Size="Large"></asp:Label></h5>
                   <br />
                   <h5 align="Right">Final Amount : <asp:Label ID="lbl_Famount" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></h5>
               </div>

                <div>
                    <table>
                        <tr>
                            <td> <asp:Label ID="lbl_Shname" runat="server" Text="Name : "></asp:Label></td>
                           <td><asp:TextBox ID="txt_shname" runat="server" Width="338px" MaxLength="30"></asp:TextBox> </td>
                        </tr>

                         <tr>
                            <td> <asp:Label ID="lbl_Shaddress" runat="server" Text="Shipping Address :  "></asp:Label></td>
                           <td><asp:TextBox ID="txt_shAddress" runat="server" Height="100px" Width="340px" MaxLength="50"></asp:TextBox> </td>
                        </tr>

                         <tr>
                            <td> <asp:Label ID="lbl_Shmobile" runat="server" Text="Mobile No: "></asp:Label></td>
                           <td><asp:TextBox ID="txt_shmobile" runat="server" Width="338px" MaxLength="10"></asp:TextBox> </td>
                        </tr>
                    </table>
                </div>
            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red" Font-Size="X-Large"></asp:Label><br /><br />
                <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order"  Width="180" BackColor="#333333" ForeColor="White" OnClick="btnPlaceOrder_Click"/> 
                  <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" Width="180" BackColor="#333333" ForeColor="White" OnClick="btnContinueShopping_Click" />

              
        </center>
                </div>
    </section>
</asp:Content>
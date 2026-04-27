<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_MyOrder.aspx.cs" MasterPageFile="~/MasterPage_Client.master" Inherits="Frm_MyOrder" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Mp_Header" >
</asp:Content>
<asp:Content ID="C1" runat="server" ContentPlaceHolderID="CPH_ContentHolder">
    <Center>
         <h2 align="Center">My Orders</h2>
        <%--<br />
    <h5>From : <asp:TextBox ID="DateFrom" runat="server"  /> 
        &nbsp;&nbsp;
      To : <asp:TextBox ID="DateTo" runat="server"></asp:TextBox> </h5>
        <br />--%>

        <br/><br/>
     <%--<asp:GridView ID="Order" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" PagerSettings-Mode="Numeric" PagerSettings-PageButtonCount="3">
                               <AlternatingRowStyle BackColor="#CCCCCC" />
                         <Columns>
                  <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Date" runat="server" Width="150px" Text='<%#Eval("Date") %>'></asp:Label>  
                    </ItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  
               
                       <asp:TemplateField HeaderText="Order Id" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Order_Id" runat="server" Text='<%#Eval("Order_Id") %>'></asp:Label>  
                    </ItemTemplate>  
                   
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                           <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                              <asp:TemplateField HeaderText="Client Id " HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Client_Id" runat="server"  Width="80px" Text='<%#Eval("Client_Id") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                           <asp:TextBox ID="Client_Id" runat="server" Text='<%#Eval("Client_Id") %>'></asp:TextBox>
                    </EditItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                              <asp:TemplateField HeaderText="Cart Id" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Cart_Id" runat="server" Width="50px"  Text='<%#Eval("Cart_Id") %>'></asp:Label>  
                    </ItemTemplate>  
                   

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                  <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                 <asp:TemplateField HeaderText="Product Name" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Product_Name" runat="server"  Text='<%#Eval("Product_Name") %>'></asp:Label>  
                    </ItemTemplate>  
                      

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                     <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                       <asp:TemplateField HeaderText="Qty" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Qty" runat="server" Width="50px" Text='<%#Eval("Qty") %>'></asp:Label>  
                    </ItemTemplate>  
                
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                     <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="Price" runat="server" Width="50px" Text='<%#Eval("Price") %>'></asp:Label>  
                    </ItemTemplate>  


<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                     <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField> 
                             <asp:TemplateField HeaderText="TotalAmount" HeaderStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="TotalAmount" runat="server" Width="50px" Text='<%#Eval("TotalAmount") %>'></asp:Label>  
                    </ItemTemplate>  

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                     <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField> 

                    <asp:TemplateField HeaderText="Isact" Visible="False">  
                    <ItemTemplate>  
                        <asp:Label ID="Order_Isact" runat="server" Text='<%#Eval("Order_Isact") %>' ></asp:Label>  
                    </ItemTemplate>  
                    
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
                         </asp:GridView>--%>

        <asp:GridView ID="Order" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:BoundField ConvertEmptyStringToNull="False" DataField="Order_Id" HeaderText="Order Id" />
                <asp:BoundField DataField="FName" HeaderText="Client Name" />
                <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
                <asp:BoundField DataField="Qty" HeaderText="Qty" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" />
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


    <br/>
        <asp:Label ID="lbl_error" runat="server" Text=""></asp:Label>
        </Center>
</asp:Content>


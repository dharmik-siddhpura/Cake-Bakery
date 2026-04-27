<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Frm_ContectUs_inquiry.aspx.cs" MasterPageFile="~/Admin/MasterPage.master" Inherits="Admin_Frm_ContectUs" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Mp_Header" >
    <br /><br /> 
</asp:Content>
<asp:Content ID="C1" runat="server" ContentPlaceHolderID="CPH_ContentHolder" >

     <section class="contact_form_area p_100">
        	<div class="container">
        		<center>
                    <h4>Inquirys</h4>
                    <br />
                    <asp:GridView ID="Grd_inquiry" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                        <Columns>
                            <asp:BoundField HeaderText="Id" DataField="Id"/>
                            <asp:BoundField HeaderText="Name" DataField="Name"/>
                            <asp:BoundField HeaderText="EmialId" DataField="Email"/>
                            <asp:BoundField HeaderText="Mobile" DataField="Mobile"/>
                            <asp:BoundField HeaderText="Subject" DataField="Subject"/>
                            <asp:BoundField HeaderText="Message" DataField="Message" />
                            <asp:BoundField HeaderText="Isact" DataField="Contect_Isact"/>
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
        		</center>
        	</div>
        </section>

</asp:Content>

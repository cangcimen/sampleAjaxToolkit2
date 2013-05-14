<%@ Page Title="Home Page" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="sampleAjaxToolkit._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<link href="Styles/modalpopup.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!
    </h2>
<div>
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="Server" />
    <asp:Button ID="Button1" runat="server" Text="Pilih Kategori" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="Button1" PopupControlID="Panel1"
     BackgroundCssClass="modalBackground">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" BackColor="White" Height="269px" Width="400px" style="display:none">
        <table width="100%" style="border:Solid 3px #D55500; width:100%; height:100%" cellpadding="0" cellspacing="0">
        <tr style="background-color:#D55500">
        <td  style=" height:10%; color:White; font-weight:bold; font-size:larger" align="center">Pilih Kategori</td>
        </tr>
        <tr><td>
            <asp:GridView runat="server" ID="categoryGrid" DataKeyNames="CategoryID" AutoGenerateColumns="false">
            <RowStyle BackColor="#EFF3FB" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="CategoryID" HeaderText="ProductID" />
                    <asp:BoundField DataField="CategoryName" HeaderText="ProductName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:TemplateField HeaderText="Pilih">
                    <ItemTemplate>
                    <asp:ImageButton ID="imgbtn" ImageUrl="edit.png" runat="server" Width="25" Height="25" onclick="imgbtn_Click" />
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>     
        </td></tr>
        </table>   
    </asp:Panel>
    <asp:GridView runat="server" ID="ProductGrid" DataKeyNames="ProductID" AutoGenerateColumns="false">
    <RowStyle BackColor="#EFF3FB" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" />
            <asp:BoundField DataField="CompanyName" HeaderText="Supplier" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" />
        </Columns>
    </asp:GridView>
</div>
</asp:Content>

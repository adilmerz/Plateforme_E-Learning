<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="TRI.aspx.cs" Inherits="ProjetFinFormationCoteWeb.Pages.TRI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formTdi" runat="server">
        <h1 class="title text-xl-left ">Modules : Techniques des Réseaux Informatiques [ TRI ] </h1>
        <br />
        <div class="row  ">
            <asp:Repeater ID="RepeaterModuleTRI" runat="server" OnItemCommand="RepeaterModuleTRI_ItemCommand">
                <ItemTemplate>
                    <asp:Label ID="lablidM" CssClass="text-hide" runat="server" Text='<%#Eval("idM") %>'></asp:Label>
                    <asp:Panel ID="Panel1" CssClass="col-3 text-white card-text btn-primary mr-4 mb-4 p-4 has-shadow" DefaultButton="LinkModule" runat="server">

                        <asp:LinkButton ID="LinkModule" CommandName="LinkModule" CssClass="text-decoration-none" runat="server">
         
         <h1 class="h5 title text-white"><%#Eval("nom") %></h1>  
                        </asp:LinkButton>

                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
        </div>







    </form>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="TDM.aspx.cs" Inherits="ProjetFinFormationCoteWeb.Pages.TDM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="formTdi" runat="server">
   <h1 class="title text-xl-left ">Modules : Techniques de Développement Multimedia [ TDM ] </h1> 
    <br/>
   <div class="row  ">
       <asp:Repeater ID="RepeaterModuleTDM" runat="server" OnItemCommand="RepeaterModuleTDM_ItemCommand">
       <ItemTemplate>
           <asp:Label ID="lablidM" CssClass="text-hide" runat="server" Text='<%#Eval("idM") %>'></asp:Label>
           <asp:Panel ID="Panel1" CssClass="col-3 text-white card-text btn-primary mr-4 mb-4 p-4 has-shadow" DefaultButton="LinkModule" runat="server">
    
         <asp:LinkButton ID="LinkModule" CssClass="text-decoration-none" CommandName="LinkModule" runat="server">
         
         <h1 class="h5 title text-white"><%#Eval("nom") %></h1>  
            </asp:LinkButton>
     
               </asp:Panel>
    </ItemTemplate>
           </asp:Repeater>
       </div>
    
    
    
    
    
    
    
    </form>
</asp:Content>

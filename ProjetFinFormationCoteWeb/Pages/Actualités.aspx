<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Actualités.aspx.cs" Inherits="ProjetFinFormationCoteWeb.Pages.Actualités" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="RepeaterActualites" runat="server">
        <ItemTemplate>
    <br/>
   <div class="row bg-white has-shadow d-flex justify-content-start" >
       
        <div class="row ">
            <div class="col-4"><img src="../photoActualité/<%#Eval("photo") %>"  class="img-fluid"  /></div>
            <div class="col-8">
            <div class=" text-violet "> <%#Eval("date", "{0:dddd dd MMMM yyyy}")%></div><br/>
            <div class=" text-black-50 "><h4 class="text-black"><%#Eval("titre") %></h4></div><br/>
            <div class="titre text-middle"><p><%#Eval("texte") %></p></div>
        </div>
            </div>
      
   </div>
   <div class="col-xl-12 col-md-12 " style="visibility: hidden">vide</div>
            </ItemTemplate>
     </asp:Repeater>
   
   
    
    

</asp:Content>

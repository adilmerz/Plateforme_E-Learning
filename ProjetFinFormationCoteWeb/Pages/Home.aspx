<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ProjetFinFormationCoteWeb.Pages.Home" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../slideRef/thumbnail-slider.css" rel="stylesheet" type="text/css" />
    <script src="../slideRef/thumbnail-slider.js" type="text/javascript"></script>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Section Diaporama--%>
  <h1 class="title text-xl-left ">Diaporama g </h1>
    <br/>
    <div class="bg-white row">
    
    <div id="thumbnail-slider" >
            <div class="inner  col-xl-12">
                <ul>
                    
                    <asp:Repeater ID="RepeaterImage" runat="server">
                        
                            <ItemTemplate>
                              <li>
                        <a class="thumb" href="../<%#Eval("path") %>"></a>
                              </li>  
                            </ItemTemplate>
                        </asp:Repeater>                      
                </ul>
            </div>
        </div>
        </div>
    <br/>
    <%--Section Catégories--%>
    <h1 class="title text-xl-left ">Catégories de Filières</h1> 
    <br/>
   <div class="row  has-shadow bg-white">
       
     <div class=" col-xl-4 col-md-4 ">
           
               <a href="TDI.aspx" class="text-decoration-none"> 
         <div class="card text-xl-center text-bold p-lg-5 " style=" background-image: url('../Galerie/1.jpg');background-size: cover;"><h1 class="text-white shadow p-3 mb-5  rounded" style="background:  rgba(0,0,0,0.15);box-shadow: 2px 2px 2px ; ">Développement Informatiques</h1></div>
      </a>   
          
       </div>
       <div class=" col-xl-4 col-md-4 ">
           
           <a href="TRI.aspx" class="text-decoration-none">   
         <div class="card text-xl-center text-bold p-lg-5 " style=" background-image: url('../Galerie/4.jpg');background-size: cover;"><h1 class="text-white shadow p-3 mb-5  rounded" style="background: rgba(0,0,0,0.15);box-shadow: 2px 2px 2px ; ">Réseaux Informatiques</h1></div>
      
           </a> 
       </div>
        <div class="col-xl-4 col-md-4 ">
           
               <a href="TDM.aspx" class="text-decoration-none">   
         <div class="card text-xl-center text-bold p-lg-5 " style=" background-image: url('../Galerie/3.jpg');background-size: cover;"><h1 class="text-white shadow p-3 mb-5  rounded" style="background: rgba(0,0,0,0.15);box-shadow: 2px 2px 2px ; ">Développement Multimédia</h1></div>
      </a> 
           </div>
       </div>
          <br/>
       <%--Section Actualités--%>
    <h1 class="title text-xl-left ">Dernières Actualités</h1>
    <asp:Repeater ID="RepeaterActualite" runat="server">
        <ItemTemplate>
    <br/>
   <div class="row bg-white has-shadow d-flex justify-content-start" >
       
        <div class="row ">
            <div class="col-4"><img src="../photoActualité/<%#Eval("photo") %>"  class="img-fluid"  /></div>
            <div class="col-8">
            <div class=" text-violet "> <%#Eval("date", "{0:dddd dd MMMM yyyy}")%></div><br/>
            <div class=" text-black-50 "><h4 class="text-black"><%#Eval("titre") %></h4></div><br/>
            <div class="titre text-middle"><p><%#Eval("texte") %></p><p style="float: right"><a href="Actualités.aspx" >Voir Tous les Actualités</a></p></div>
        </div>
            </div>
      
   </div>
   <div class="col-xl-12 col-md-12 " style="visibility: hidden">vide</div>
            </ItemTemplate>
     </asp:Repeater>


</asp:Content>

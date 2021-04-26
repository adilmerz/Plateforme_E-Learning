<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Gérer_Utilisateurs.aspx.cs" Inherits="ProjetFinFormationCoteWeb.Pages.Gérer_Utilisateurs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .paging td table  {
        
             border-spacing: 15px;
             border-collapse: separate;
        
        }

         .paging td table tbody tr td   {
             background: #2B8FD8;
             color: white;
             text-decoration: none;
             cursor: pointer;
             padding: 10px;
             padding-left:15px ;
             padding-right:25px ;
             max-width: 20px;
             text-align: center;
             align-content: center;
             max-height: 20px;
             font-size: 15px;
             font-weight: bold;
             border-radius: 8px;
 
         }
        .paging td table tbody tr td span {
            color: white;
            text-decoration: overline;
            

        }
        .paging td table tbody tr td a  {

             color: white;
            text-decoration: none;
           
            
        }
        
         
        .paging td table tbody tr :hover  {
            background: #2176B4 ;
             
        }
    </style>
    <script>
        function scrollToDiv() {
            document.getElementById('Top').scrollIntoView();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1"  runat="server" >
            <ContentTemplate>
                
   
      
        
                
            
    <h1 id="Top" class="title text-xl-left ">Gérer Les Utilisateurs</h1> 
    <br/>
    <div  class="  bg-white card row " >
        <div class="form-group col-8">
            <asp:TextBox ID="txtID" Visible="False" CssClass=" input-group mb-4 border p-2  " runat="server" required />
           <label  class="title mb-2">Nom :</label>
            <asp:TextBox ID="txtNom"  CssClass=" input-group mb-4 border p-2  " runat="server" required />
             <label  class="title mb-2">Prenom :</label>
            <asp:TextBox ID="txtPrenom"  CssClass=" input-group mb-4 border p-2  " runat="server" required />
             <label class="title mb-2">Email :</label>
            <asp:TextBox ID="txtMail"  TextMode="Email" CssClass=" input-group mb-4 p-2 border"  runat="server" />
            <label class="title mb-2">Mot de passe :</label>
            <asp:TextBox ID="txtPw"  CssClass=" input-group mb-4 border p-2  " runat="server" required />
            <label class="title mb-2">Type Authentification :</label>
            <asp:DropDownList ID="comboType"   CssClass=" btn input-group dropdown-toggle mb-4  border p-2" runat="server" required >
            </asp:DropDownList>
           <asp:Label ID="LabelValidation" CssClass="alert-success " runat="server" Text=""></asp:Label><br/>
            <div class="border col-auto">
            <br/>
            <asp:Button ID="BtnAjouter" CssClass="btn-success  mb-4 border p-2 pl-3 pr-3 ml-3 rounded " runat="server" Width="150px" Text="Ajouter" OnClick="BtnAjouter_Click"   />
                <asp:Button ID="BtnModifier" CssClass="btn-success mb-4 border p-2 pl-3 pr-3 ml-3 rounded " runat="server" Width="150px" Text="Modifier" OnClick="BtnModifier_Click"   />
                <asp:Button ID="BtnSupprimer" CssClass="btn-success mb-4 border p-2 pl-3 pr-3 ml-3 rounded " runat="server" Width="150px" Text="Supprimer" OnClick="BtnSupprimer_Click"   />
                <asp:Button ID="ButtonVider" type="reset" CssClass="btn-success mb-4 border p-2 pl-3 pr-3 ml-3 rounded " runat="server" Width="150px" Text="Vider" OnClick="ButtonVider_Click" />
    
                </div>
        
           
        </div>
        </div>
        <br/>
        <h1 class="title text-xl-left ">Liste Des Utilisateurs</h1> 

    <br/>
    <div class="  bg-white card row " >
        <div class="form-group col-12 ">
            
           
       
                
                    

           <div class="border p-3 mt-5 input-group">
                   <label  class="title mt-2">Chercher Par Nom :</label>
                  <asp:TextBox ID="txtCherch"   CssClass=" form-control border p-1  col-3 icon-search" runat="server"  />
               <div class="input-group-append">
                  <asp:LinkButton ID="BtnChercher" ClientIDMode="AutoID"  CssClass="btn btn-primary  icon-search" runat="server" OnClick="BtnChercher_Click"></asp:LinkButton>
                  </div>
                   <label  class="title mt-2">Filtrer Par Type Authentification :</label>
              
                  <asp:DropDownList ID="comboFilter" Width="250px"  CssClass=" btn dropdown-toggle  border col-2 " runat="server" required AutoPostBack="True" OnSelectedIndexChanged="comboFilter_SelectedIndexChanged" >
                      
            </asp:DropDownList>  
                
               
                 
                </div>
                    
          
                 <asp:Label ID="LabelGrid" CssClass="alert-success  mb-4" runat="server" Text=""></asp:Label><br/>
             
        
            <asp:GridView ID="GridViewUsers" AllowPaging="True"   CssClass="table table-bordered " runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridViewUsers_SelectedIndexChanged" OnPageIndexChanging="GridViewUsers_PageIndexChanging" PageSize="5" PagerStyle-CssClass="btn-success">
                <Columns>
                    <asp:BoundField DataField="idU" HeaderText="ID" >
                    <ControlStyle CssClass="mx-auto d-block"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="nom" HeaderText="Nom" />
                    <asp:BoundField DataField="prenom" HeaderText="Prénom" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="password" HeaderText="Mot de passe" />
                    <asp:BoundField DataField="nomT" HeaderText="Type Authentification" />

                    <asp:CommandField HeaderText="Sélectionner pour afficher" SelectText="Sélectionner" ShowSelectButton="True" >
                    <ControlStyle CssClass="btn-success text-decoration-none  border p-2 pl-3 pr-3  rounded" />
                    </asp:CommandField>
                </Columns>
                <PagerStyle CssClass=" border-0 paging   " />
            </asp:GridView>
                
             </div>
             
        </div>
          
        <div class="col-xl-12 col-md-12  " style="visibility: hidden">vide</div>
       
                 </ContentTemplate>
            
        </asp:UpdatePanel>

         </form>
</asp:Content>

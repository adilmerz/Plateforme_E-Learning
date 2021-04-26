<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Rédiger_Actualité.aspx.cs" Inherits="ProjetFinFormationCoteWeb.Pages.RédigerActualité" %>
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formActualite" class="form-horizontal" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel2"  runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False" >
            <Triggers>  
  
              <asp:PostBackTrigger ControlID="BtnAjouter" />  
              
            </Triggers> 
            <ContentTemplate>
                
    <h1 class="title text-xl-left ">Rédaction  d'Une Actualité</h1> 
    <br/>
    <div class="  bg-white card row" >
        <div class="form-group col-8">
            
           <label  class="title mb-2">Titre :</label>
            <asp:TextBox ID="txtTitre"  CssClass=" input-group mb-4 border p-2  " runat="server" required />
             <label class="title mb-2">Date :</label>
            <asp:TextBox ID="txtDate"  TextMode="Date" CssClass=" input-group mb-4 p-2 border"  runat="server" />
            <label class="title mb-2">Photo :</label>
            <asp:FileUpload ID="FileUploadPhoto" runat="server" CssClass=" form-control-file  border mb-4 " required />
            <asp:Label ID="Labelupload" CssClass="alert-danger" runat="server" Text=""></asp:Label>
            <label class="title mb-2">Paragraphe :</label>
            <asp:TextBox ID="txtParagraphe"  TextMode="MultiLine" style="min-height: 100px;" CssClass=" p-2 input-group mb-4 border" runat="server" required />
            <asp:Label ID="LabelValidation" CssClass="alert-success mb-4" runat="server" Text=""></asp:Label><br/>
            <asp:Button ID="BtnAjouter" CssClass="btn-success mb-4 border p-2 pl-3 pr-3 mr-3 rounded " runat="server" Text="Ajouter" OnClick="BtnAjouter_Click1"  />
            <input type="reset" value="Vider" class="btn-success border mb-4 p-2 pl-3 pr-3 rounded "/>
        
           
        </div>
        </div>
        <br/>
        <h1 class="title text-xl-left ">Suppression  d'Une Actualité</h1> 
    <br/>
    <div class="  bg-white card row" >
        <div class="form-group col-12 ">
                 <asp:Label ID="LabelGrid" CssClass="alert-success mb-4" runat="server" Text=""></asp:Label><br/>
            <asp:GridView ID="GridViewActualite" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewActualite_RowDeleting" AllowPaging="True"  PageSize="3" OnPageIndexChanging="GridViewActualite_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" >
                    <ControlStyle CssClass="mx-auto d-block" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="titre" HeaderText="Titre" />
                    <asp:ImageField DataImageUrlField="photo" HeaderText="Photo" DataImageUrlFormatString="../photoActualité/{0}" AlternateText="ggggggggggg" DataAlternateTextField="photo" DataAlternateTextFormatString="../photoActualité/{0}">
                        <ControlStyle CssClass="rounded my-auto  d-block img-fluid " Width="300px" />
                    </asp:ImageField>
                    <asp:CommandField HeaderText="Delete Actualité" ShowCancelButton="False" ShowDeleteButton="True">
                    <ControlStyle CssClass="btn-success text-decoration-none  border p-2 pl-3 pr-3  rounded" />
                    </asp:CommandField>
                </Columns>
                <PagerStyle CssClass="border-0 paging" />
            </asp:GridView>
             </div>
        </div>
        <div class="col-xl-12 col-md-12 " style="visibility: hidden">vide</div>
                
                 </ContentTemplate>
            
        </asp:UpdatePanel>
    </form>
    
    

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Modifier_Galerie.aspx.cs" Inherits="ProjetFinFormationCoteWeb.Pages.Modifier_Galerie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formActualite" class="form-horizontal " runat="server">
    <h1 class="title text-xl-left ">Ajouter photo dans galerie</h1> 
    <br/>
    <div class="bg-white card row">
        <div class="form-group col-8">
            
           
            <label class="title mb-2">Photo :</label>
            <asp:FileUpload ID="FileUploadPhoto" runat="server" CssClass=" form-control-file  border mb-4 " required />
            
            <asp:Label ID="LabelValidation" CssClass="alert-success mb-4" runat="server" Text=""></asp:Label><br/>
            <asp:Button ID="BtnAjouter" CssClass="btn-success border mb-4 p-2 pl-3 pr-3 mr-3 rounded " runat="server" Text="Ajouter" OnClick="BtnAjouter_Click"/>
           </div>
        </div>
            
             <br/>
            <h1 class="title text-xl-left ">Supprimer photo dans galerie</h1> 
            <br/>
        <div class="bg-white card row">
        <div class="form-group col-12">
             <asp:Label ID="LabelGrid" CssClass="alert-success mb-4" runat="server" Text=""></asp:Label><br/>
            <asp:GridView ID="GridViewGalerie" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewGalerie_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" >
                    <ControlStyle CssClass="mx-auto d-block" />
                    </asp:BoundField>
                    <asp:ImageField DataImageUrlField="path" HeaderText="Photo" DataImageUrlFormatString="../{0}">
                        <ControlStyle CssClass="rounded mx-auto d-block img-fluid " Width="300px" />
                    </asp:ImageField>
                    <asp:CommandField HeaderText="Delete Photo" ShowCancelButton="False" ShowDeleteButton="True">
                    <ControlStyle CssClass="btn-success text-decoration-none mx-auto d-block border p-2 pl-3 pr-3 mr-3 rounded" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
           
        </div>
        </div>
    </form>
</asp:Content>

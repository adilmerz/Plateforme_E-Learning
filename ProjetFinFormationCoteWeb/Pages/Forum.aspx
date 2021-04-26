<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Forum.aspx.cs" Inherits="ProjetFinFormationCoteWeb.Pages.Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="formActualite" class="form-horizontal" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1"  runat="server" >
            <ContentTemplate>
        <h1 class="title text-xl-left ">Forum De Discussion</h1>
        <br />
        <%-----------Discussion---------------%>

        <div class="row ">
            <asp:Repeater ID="RepeaterDiscussion" runat="server" OnItemDataBound="ItemBound" OnItemCommand="RepeaterDiscussion_ItemCommand">
                <ItemTemplate>
                    <div class="col-2 border bg-white row has-shadow ">
                        <div class="col-12 row bg-light  ">
                            <div class="col-10 mb-2">
                                <img class="img-fluid rounded-circle" src="../Authauntification/Images/man.png" />
                            </div>
                            <div class="col-10 mb-2  "><span class="h4 card-title text-primary "><%#Eval("nomComplet") %></span><span class="badge badge-success  text-xsmall"><%#Eval("typeusers") %></span></div>
                            <div class="col-10 mb-2 "><span class="text-center text-small"><span class="icon-clock mb-2"></span><%#Eval("datePub") %></span><asp:Label ID="lblidP" CssClass="ml-4 text-center badge badge-warning" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"idP") %>' /></div>
                        </div>


                    </div>

                    <div class="col-10 border row bg-light has-shadow list-group-horizontal">
                        <div class=" col-11 mb-2 list-group-item border">
                            <p class="articles p-4 ">
                                <span class="	fa fa-quote-left mr-2"></span><%#Eval("publication") %><span class="fa fa-quote-right ml-2"></span>
                            </p>
                        </div>
                        <div class="card border col-11 list-group-item">
                            <div class="row">
                                <asp:LinkButton runat="server" CommandName="BtnViewCmt" Height="40px" class="btn btn-primary col-3 mr-3"><span class="fa fa-comment"></span> Commentaire<span class="badge text-primary badge-rounded bg-white ml-2"><%#Eval("nbrCmt") %></span></asp:LinkButton>
                                <asp:TextBox ID="txtParagraphe" Height="40px" TextMode="MultiLine" CssClass="pt-1 input-group col-7 border  " runat="server" required />
                                <asp:LinkButton ID="btnSend" runat="server" CommandName="BtnSendCmt" Height="40px" class=" btn btn-primary col-1 ml-2 "><span class="fa fa-paper-plane-o"></span></asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <%-------------------------------------%>
                    <%-----------Commentaires---------------%>
                    <asp:Repeater ID="RepeaterCommentaires" runat="server" OnItemCommand="RepeaterCommentaires_ItemCommand">
                        <ItemTemplate>
                            <div class="col-2"></div>
                            <div class="row  col-9">
                                <div class="col-3 border bg-white row has-shadow">
                                    <div class="col-12 row bg-light ">
                                        <div class="col-10 mb-2">
                                            <img class="img-fluid" src="../Authauntification/Images/communication.png" />
                                        </div>
                                        <div class="col-10 mb-2  "><span class="h4 card-title text-success text-xsmall "><%#Eval("nomc") %></span><span class="badge badge-info  text-xsmall"><%#Eval("typeusers") %></span></div>
                                        <div class="col-10 mb-2 "><span class="text-center  text-small"><span class="icon-clock mb-2"></span><%#Eval("dateCmt") %></span><asp:Label ID="lblidCmt" CssClass="ml-4 text-center badge badge-warning" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"idR") %>' /></div>
                                    </div>

                                </div>

                                <div class="col-9 border row bg-white has-shadow list-group-horizontal">
                                    <div class=" col-12 mb-2 bg-light border list-group-item">
                                        <asp:LinkButton ID="LinkButton1" CssClass="badge badge-danger badge-rounded float-right" CommandName="btn" runat="server">X</asp:LinkButton>
                                        <p class="text-small bg-white  p-4 "><%#Eval("commentaire") %></p>

                                    </div>

                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%-------------------------------------%>
                 </ContentTemplate>
            
        </asp:UpdatePanel>
        <div class="col-xl-12 col-md-12 " style="visibility: hidden">vide</div>
    </form>
</asp:Content>

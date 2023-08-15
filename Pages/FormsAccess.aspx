<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="FormsAccess.aspx.cs" Inherits="INFOTOOLSSV.Pages.FormsAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Forms Access
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="mb-4">Manage Permissions</h1>
                <asp:Repeater runat="server" ID="rptRoles" OnItemDataBound="rptRoles_ItemDataBound">
                    <ItemTemplate>
                        <div class="card mb-3">
                            <div class="card-header">
                                <h3 class="card-title"><%# Eval("RoleName") %></h3>
                            </div>
                            <div class="card-body">
                                <ul class="list-group">
                                    <asp:Repeater runat="server" ID="rptForms">
                                        <ItemTemplate>
                                            <li class="list-group-item d-flex justify-content-between align-item-center">
                                                <div class="form-check">
                                                    <asp:CheckBox runat="server" ID="chkFormPermission" CssClass="form-check-input"/>
                                                    <label class="form-check-label"><%#Eval("FormName") %></label>

                                                </div>
                                                <asp:HiddenField runat="server" ID="hdnFormId" Value='<%#Eval("FormId") %>'/>
                                                <asp:Label CssClass="form-check-label" runat="server"><%#Eval("FormPath") %></asp:Label>

                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                            <div class="card-footer">
                                <asp:Label runat="server" ID="lblRoleId" Visible="false" Text='<%#Eval("RoleId") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Button runat="server" CssClass="btn btn-danger" ID="btnSavePermissions" Text="Save Permissions" OnClick="btnSavePermissions_Click"/>
                <%--REMOVIDA LA CLASE text-dark DEL LABEL--%>
                <asp:Label runat="server" ID="lblMessage" CssClass="mt-3"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

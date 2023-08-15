<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="INFOTOOLSSV.Pages.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Admin Panel
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <h1>Bienvenido a el Panel de administrador.</h1>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2>Admin Actions</h2>
                        <%--Agregar mas acciones para el admin--%>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h2>Admin Settings</h2>
                        <%--Agregar mas acciones para el admin--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

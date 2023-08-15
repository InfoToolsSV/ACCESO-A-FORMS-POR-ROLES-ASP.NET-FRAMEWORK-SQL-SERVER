<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site1.Master" AutoEventWireup="true" CodeBehind="FormsControl.aspx.cs" Inherits="INFOTOOLSSV.Pages.FormsControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Formularios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Register New Forms</h3>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <asp:TextBox runat="server" placeholder="Form Path" id="txtFormPath" class="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:TextBox runat="server" placeholder="Form Name" id="txtFormName" class="form-control"></asp:TextBox>
                        </div>
                        <asp:Button runat="server" id="btnRegiterForm" text="Register Form" class="btn btn-primary" OnClick="btnRegisterForm_Click"/>
                    </div>
                    <div lcass="card-footer">
                        <asp:Label runat="server" id="lblMessage" class="text-muted"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

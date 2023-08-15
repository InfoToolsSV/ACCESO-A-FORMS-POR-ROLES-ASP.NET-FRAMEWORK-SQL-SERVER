<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="INFOTOOLSSV.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server" class="mt-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title text-center mb-4">Login</h4>
                            <asp:TextBox runat="server" CssClass="form-control mb-3" ID="txtUsername" placeholder="Username"></asp:TextBox>
                            <asp:TextBox runat="server" CssClass="form-control mb-3" ID="txtPassword" placeholder="********" TextMode="Password"></asp:TextBox>
                            <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-primary btn-block" Text="Login" OnClick="btnLogin_Click"/>
                            <asp:Label runat="server" id="lblErrorMessage" CssClass="text-danger mt-3"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

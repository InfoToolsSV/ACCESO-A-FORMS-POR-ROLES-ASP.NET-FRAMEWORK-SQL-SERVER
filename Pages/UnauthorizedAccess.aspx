<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnauthorizedAccess.aspx.cs" Inherits="INFOTOOLSSV.Pages.UnauthorizedAccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Unauthorized Access</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container text-center mt-4">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Unauthorized Access</h4>
                            <p class="card-text">Usted no tiene acceso permitido a esta página.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
    <title>Anatolian Culture Admin Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin-top: 100px;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
<body>
    <form id="form1" runat="server">
       <div class="container d-flex justify-content-center">
            <div class="login-container">
                <h4 class="mb-4 text-center">Admin Giriş</h4>
                <div class="mb-3">
                    <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" Text="Kullanıcı Adı"></asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Şifre"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" />
                </div>
                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary w-100" Text="Giriş Yap" OnClick="btnLogin_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block mt-3"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

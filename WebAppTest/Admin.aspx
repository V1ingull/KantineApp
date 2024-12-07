<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebAppTest.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>

        button {

            margin: 20px;

        }




    </style>

</head>
<body>
    <form id="form1" runat="server">
        <h3>Ukes meny </h3>
        <h2>Mandag </h2>
        <asp:TextBox ID="TBrettMan" runat="server" Text=""></asp:TextBox> <asp:TextBox ID="TBprisMan" runat="server" Text=""></asp:TextBox> 
        <br />
        <h2>Tirsdag </h2>
        <asp:TextBox ID="TBrettTir" runat="server" Text=""></asp:TextBox> <asp:TextBox ID="TBprisTir" runat="server" Text=""></asp:TextBox> 
        <br />
        <h2>Onsdag </h2>
        <asp:TextBox ID="TBrettOns" runat="server" Text=""></asp:TextBox> <asp:TextBox ID="TBprisOns" runat="server" Text=""></asp:TextBox> 
        <br />
        <h2>Torsdag </h2>
        <asp:TextBox ID="TBrettTor" runat="server" Text=""></asp:TextBox> <asp:TextBox ID="TBprisTor" runat="server" Text=""></asp:TextBox>  
        <br />
        <h2>Fredag </h2>
        <asp:TextBox ID="TBrettFre" runat="server" Text=""></asp:TextBox> <asp:TextBox ID="TBprisFre" runat="server" Text=""></asp:TextBox> 
        <br />
        <button> Opptater </button>

    </form>
</body>
</html>

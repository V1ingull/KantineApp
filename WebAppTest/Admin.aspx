<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebAppTest.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <nav>

        <a href="Default.aspx">Meny </a>

    </nav>

    <style>
        table {
            border-collapse: collapse;
            min-width: 350px;
            font-family: Arial, sans-serif;
            margin-left: auto;
            margin-right: auto;
            max-width: 500px;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2
        }

        th {
            background-color: #04AA6D;
            color: white;
        }

        body {
            text-align: center;
        }

        #ButtonLagre {
            margin: 20px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <h3>Ukes meny </h3>
        <h2>Mandag </h2>
        <asp:TextBox ID="TBrettMan" runat="server" Text=""></asp:TextBox>
        <asp:TextBox ID="TBprisMan" runat="server" Text=""></asp:TextBox>
        <br />
        <h2>Tirsdag </h2>
        <asp:TextBox ID="TBrettTir" runat="server" Text=""></asp:TextBox>
        <asp:TextBox ID="TBprisTir" runat="server" Text=""></asp:TextBox>
        <br />
        <h2>Onsdag </h2>
        <asp:TextBox ID="TBrettOns" runat="server" Text=""></asp:TextBox>
        <asp:TextBox ID="TBprisOns" runat="server" Text=""></asp:TextBox>
        <br />
        <h2>Torsdag </h2>
        <asp:TextBox ID="TBrettTor" runat="server" Text=""></asp:TextBox>
        <asp:TextBox ID="TBprisTor" runat="server" Text=""></asp:TextBox>
        <br />
        <h2>Fredag </h2>
        <asp:TextBox ID="TBrettFre" runat="server" Text=""></asp:TextBox>
        <asp:TextBox ID="TBprisFre" runat="server" Text=""></asp:TextBox>
        <br />

        <h3>Faste varer </h3>
        <asp:ListView ID="lvFastevarerAdmin" runat="server" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1">
            <LayoutTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <th>Name</th>
                        <th>Pris</th>
                        <th></th>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td><%# Eval("Name") %></td>
                <td><%# Eval("Pris") %></td>
                <td>Kr</td>
            </ItemTemplate>
        </asp:ListView>


        <asp:Button ID="ButtonLagre" Text="Lagre" OnClick="ButtonLagre_Click" runat="server" />


    </form>
</body>
</html>

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
        <asp:ListView ID="lvFastevarerAdmin" runat="server" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1" OnItemEditing="lvFastevarerAdmin_ItemEditing" OnItemCanceling="lvFastevarerAdmin_ItemCanceling" OnItemUpdating="lvFastevarerAdmin_RowUpdating" > 
            <LayoutTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <th></th>
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
                <td valign="top">
                    <asp:LinkButton ID="EditButton" runat="server" Text="Edit" CommandName="Edit" />
                </td>
                <td><%# Eval("Name") %></td>
                <td><%# Eval("Pris") %></td>
                <td>Kr</td>
            </ItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #ADD8E6">
                    <td valign="top">
                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td valign="top" colspan="2">
                        <asp:Label runat="server" ID="NameLabel"
                            AssociatedControlID="NameTB"
                            Text="Name" />
                        <asp:TextBox ID="NameTB" runat="server"
                            Text='<%#Bind("Name")%>' MaxLength="50" /><br />
                        <asp:Label runat="server" ID="Pris"
                            AssociatedControlID="PrisTB"
                            Text="Pris" />
                        <asp:TextBox ID="PrisTB" runat="server"
                            Text='<%#Bind("Pris")%>' MaxLength="25" /><br />
                    </td>
                  
                </tr>
            </EditItemTemplate>
        </asp:ListView>


        <asp:Button ID="ButtonLagre" Text="Lagre" OnClick="ButtonLagre_Click" runat="server" />


    </form>
</body>
</html>

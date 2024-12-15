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
            min-width: 500px;
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
        <asp:Button ID="ButtonLagre" Text="Lagre" OnClick="ButtonLagre_Click" runat="server" />

        <h3>Faste varer </h3>
        <asp:ListView ID="lvFastevarerAdmin" runat="server" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1" OnItemEditing="lvFastevarerAdmin_ItemEditing" OnItemCanceling="lvFastevarerAdmin_ItemCanceling" OnItemUpdating="lvFastevarerAdmin_ItemUpdating" OnItemDeleting="lvFastevarerAdmin_OnItemDeleting" OnItemInserting="lvFastevarerAdmin_ItemInserting" InsertItemPosition="LastItem">
            <LayoutTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <th></th>
                        <th></th>
                        <th>Name</th>
                        <th>Pris</th>
                        <th></th>
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
                <td><%# Eval("Id") %></td>
                <td valign="top">
                    <asp:LinkButton ID="EditButton" runat="server" Text="Endre" CommandName="Edit" />
                </td>
                <td><%# Eval("Name") %></td>
                <td><%# Eval("Pris") %></td>
                <td>Kr</td>
                <td valign="top">
                    <asp:LinkButton ID="DeleteButton" runat="server" Text="Slett" CommandName="Delete" />
                </td>
            </ItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #ADD8E6">
                    <td valign="top">
                        <asp:LinkButton ID="LagreButton" runat="server" CommandName="Update" Text="Lagre" />
                        
                        <asp:LinkButton ID="AvbrytButton" runat="server" CommandName="Cancel" Text="Avbryt" />
                    </td>
                    <td valign="top" colspan="2">
                        <asp:Label runat="server" ID="NameLabel"
                            AssociatedControlID="NameTB"
                            Text="Name" />
                        <asp:TextBox ID="NameTB" runat="server"
                            Text='<%#Bind("Name")%>' MaxLength="20" style="width: 80px" />
                        <asp:Label runat="server" ID="Pris"
                            AssociatedControlID="PrisTB"
                            Text="Pris" />
                        <asp:TextBox ID="PrisTB" runat="server"
                            Text='<%#Bind("Pris")%>' MaxLength="6" style="width: 40px"/>
                    </td>

                </tr>
            </EditItemTemplate>
            <InsertItemTemplate>
                <tr style="background-color: #ADD8E6">

                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Legg til" />
                    </td>

                    <td valign="top" colspan="2">
                        <asp:Label runat="server" ID="NameLabel"
                            AssociatedControlID="NameTB"
                            Text="Name" />
                        <asp:TextBox ID="NameTB" runat="server"
                            Text='<%#Bind("Name")%>' MaxLength="20" style="width: 80px"/>
                        <asp:Label runat="server" ID="Pris"
                            AssociatedControlID="PrisTB"
                            Text="Pris" />
                        <asp:TextBox ID="PrisTB" runat="server"
                            Text='<%#Bind("Pris")%>' MaxLength="6" style="width: 40px" />
                    </td>

                </tr>
            </InsertItemTemplate>
        </asp:ListView>





    </form>
</body>
</html>

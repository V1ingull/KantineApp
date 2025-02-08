<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppTest.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">






    <style>
        nav .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        nav a {
            color: black;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

            nav a:hover {
                background-color: #555;
            }

        nav .login-btn {
            background-color: #007BFF;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

            nav .login-btn:hover {
                background-color: #0056b3;
            }

        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                text-align: center;
            }

                nav a {
                    margin: 0.5rem 0;
                }
        }

        h3 {
            text-align: center;
            font-size: 25px;
        }

        h2 {
            text-align: center;
            font-size: 20px;
        }

        .gray-box {
            background-color: gray;
            width: 100%;
        }

        body {
            text-align: center;
            background-color: lightgrey;
        }

        h1 {
            font-size: 2.5rem;
            background-color: dimgray;
            color: white;
            margin: 0 auto;
            padding: 1rem;
            width: 100%;
            max-width: 1200px;
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
        }

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
    </style>

</head>

<body>
    <h1>Glemmen VGS Kantine meny  </h1>

    <nav>

        <a href="Admin.aspx">Logg inn </a>

    </nav>

    <form id="form1" runat="server">
        <h3>Ukesmeny </h3>
        <h2>Mandag </h2>
        <asp:Label ID="LabelMan" runat="server" Text=""></asp:Label>
        <br />
        <h2>Tirsdag </h2>
        <asp:Label ID="LabelTir" runat="server" Text=""></asp:Label>
        <br />
        <h2>Onsdag </h2>
        <asp:Label ID="LabelOns" runat="server" Text=""></asp:Label>
        <br />
        <h2>Torsdag </h2>
        <asp:Label ID="LabelTor" runat="server" Text=""></asp:Label>
        <br />
        <h2>Fredag </h2>
        <asp:Label ID="LabelFre" runat="server" Text=""></asp:Label>

        <h3>Faste varer </h3>



        <asp:ListView ID="lvFastevarer" runat="server" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1">
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




    </form>

    <p>
        &nbsp;
    </p>

    <p>
        &nbsp;
    </p>

</body>

</html>

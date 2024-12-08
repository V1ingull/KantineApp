<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppTest.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    



    <h1> Glemmen VGS Kantine meny  </h1>

    <nav>

        <a href="Admin.aspx">Log inn </a>

    </nav>

    <style>

        nav {
            font-family

        }
        
        p{
             text-align: center;

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
       }

        table {
           
            border-collapse: collapse;
            min-width: 350px;
            font-family: Arial, sans-serif;
            
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

    <form id="form1" runat="server">
        <h3>Ukes meny </h3>
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

        <p> 
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

      </p>
                
          
    </form>

    <p>
        &nbsp;
    </p>

    <p>
        &nbsp;
    </p>

</body>

</html>

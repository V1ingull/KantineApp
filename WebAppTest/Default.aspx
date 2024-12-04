<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppTest.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>



    <h1> Overskrift  </h1>

    <nav>

        <a href="Loginn.aspx">Log inn</a>

    </nav>

    <heder></heder>


    <style>

        h2 {

            font-size: 15px;


        }



        .gray-box {
            background-color: gray;
            width: 100%;
        }



        body {
            background-color: lightgrey;
        }

        h1 {
            font-size: 40px;
            background-color: dimgray;
            margin: 0;
            padding: 0;
            width: 100%;
        }


        table {
            border-collapse: collapse;
            width: 100%;
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
        <h2> Hællæ </h2>
        <asp:Label ID="LabelMan" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="LabelTir" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="LabelOns" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="LabelTor" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="LabelFre" runat="server" Text=""></asp:Label>


    </form>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
 
</body>
</html>

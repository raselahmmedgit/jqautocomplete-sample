<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="RnD.AutoComplete.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">

        function PrintDiv(divID) {

            //Get the HTML of div
            var divElements = document.getElementById(divID).innerHTML;

            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML =
              "<html><head><title></title></head><body>" +
              divElements + "</body>";

            //Print Page
            window.print();
            window.close();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

            return false;

        }

        function PrintDiv() {

            var divContent = $("#printZone").html();

            alert(divContent);

            //Create your new window
            var w = window.open('', 'Receipt Details', 'height=400,width=300');
            w.document.write('<html><head><title>Receipt Details</title>');
            //Include your stylesheet (optional)
            w.document.write('<link rel="stylesheet" href="print.custom.css" type="text/css" />');
            w.document.write('</head><body>');
            //Write your content
            w.document.write(divContent);
            w.document.write('</body></html>');
            w.print();
            w.close();

            return false;

        }

        $(document).ready(function () {

            PrintDiv();
            //PrintDiv('printZone');

        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="printZone">
        <h2>
            Receipt Details
        </h2>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    Name:
                </td>
                <td runat="server" id="tdName">
                </td>
            </tr>
            <tr>
                <td>
                    Qty:
                </td>
                <td runat="server" id="tdQty">
                </td>
            </tr>
            <tr>
                <td>
                    Price:
                </td>
                <td runat="server" id="tdPrice">
                </td>
            </tr>
            <tr>
                <td>
                    Amount:
                </td>
                <td runat="server" id="tdAmount">
                </td>
            </tr>
        </table>
    </div>
    <div id="printButton">
        <asp:Button runat="server" ID="btnPrint" Visible="False" />
    </div>
</asp:Content>

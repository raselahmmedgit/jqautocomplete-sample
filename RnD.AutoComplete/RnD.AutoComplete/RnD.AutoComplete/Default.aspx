<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="RnD.AutoComplete._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">


        $(document).ready(function () {

            $('#txtName').autocomplete({

                source: function (request, response) {

                    var param = { term: $('#txtName').val() };
                    $.ajax({
                        url: "Default.aspx/GetData",
                        data: JSON.stringify(param),
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataFilter: function (data) { return data; },
                        success: function (data) {

                            var jsosnData = JSON.parse(data.d);

                            response($.map(jsosnData, function (item) {
                                return {
                                    label: item,
                                    value: item
                                }
                            }))


                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });

                }
            });

            var availableTags = [
                                      "ActionScript",
                                      "AppleScript",
                                      "Asp",
                                      "BASIC",
                                      "C",
                                      "C++",
                                      "Clojure",
                                      "COBOL",
                                      "ColdFusion",
                                      "Erlang",
                                      "Fortran",
                                      "Groovy",
                                      "Haskell",
                                      "Java",
                                      "JavaScript",
                                      "Lisp",
                                      "Perl",
                                      "PHP",
                                      "Python",
                                      "Ruby",
                                      "Scala",
                                      "Scheme"
                                      ];

            $("#tags").autocomplete({
                source: availableTags
            });

        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!
    </h2>
    <div>
        <input type="text" id="txtName" name="txtName" value="" />
        <br />
        <input type="text" id="tags" name="txtName" value="" />
        <br />
        <asp:Button ID="btnPrint" runat="server" Text="Click For Print" OnClick="btnPrint_Click" />
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="mb-4">Turlar Listesi</h3>
        <div class="mb-3">
            <input type="text" id="searchBox" class="form-control" placeholder="Tur adıyla ara..." onkeyup="filterTable()" />
        </div>
        <asp:Repeater ID="rptTours" runat="server">
            <headertemplate>
                <table id="tourTable" class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th style="width: 50px;">Seç</th>
                            <th>Tur Adı</th>
                            <th style="width: 150px;">İşlemler</th>
                        </tr>
                    </thead>
                    <tbody>
            </headertemplate>
            <itemtemplate>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkSelect" runat="server" />
                    </td>
                    <td><%# Eval("TurName") %></td>
                    <td>
                        <asp:HyperLink ID="lnkEdit" runat="server"
                            NavigateUrl='<%# "EditTour.aspx?turID=" + Eval("ID") %>'
                            CssClass="btn btn-sm btn-warning">
                            Düzenle
                        </asp:HyperLink>
                        <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-sm btn-danger" Text="Sil" CommandArgument='<%# Eval("ID") %>' OnClick="btnDelete_Click" />
                    </td>
                </tr>
            </itemtemplate>
            <footertemplate>
                </tbody>
                </table>
            </footertemplate>
        </asp:Repeater>
    </div>

    <script>
        function filterTable() {
            var input = document.getElementById("searchBox");
            var filter = input.value.toLowerCase();
            var table = document.getElementById("tourTable");
            var tr = table.getElementsByTagName("tr");

            for (var i = 1; i < tr.length; i++) { // i=1: başlığı atla
                var td = tr[i].getElementsByTagName("td")[1]; // Tur Adı sütunu
                if (td) {
                    var textValue = td.textContent || td.innerText;
                    if (textValue.toLowerCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>

</asp:Content>

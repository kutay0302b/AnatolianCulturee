<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="mb-4">Turlar Listesi</h3>
        <asp:Repeater ID="rptTours" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th style="width: 50px;">Seç</th>
                            <th>Tur Adı</th>
                            <th style="width: 150px;">İşlemler</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                        <tr>
                            <td>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </td>
                            <td><%# Eval("TurName") %></td>
                            <td>
                                <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-sm btn-primary me-2" Text="Düzenle" CommandArgument='<%# Eval("ID") %>' OnClick="btnEdit_Click" />
                                <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-sm btn-danger" Text="Sil" CommandArgument='<%# Eval("ID") %>' OnClick="btnDelete_Click" />
                            </td>
                        </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

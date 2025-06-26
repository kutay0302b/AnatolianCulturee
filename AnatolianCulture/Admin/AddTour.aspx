<%@ Page Title="Yeni Tur Ekle" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddTour.aspx.cs" Inherits="Admin_AddTour" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hfContentList" runat="server" />

    <div class="container mt-4">
        <section>
            <h3 class="mb-4">Yeni Tur Ekle</h3>

            <div class="row g-3">
                <div class="col-md-6">
                    <label for="txtTurName" class="form-label">Tur Adı</label>
                    <asp:TextBox ID="txtTurName" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-6">
                    <label for="txtTurFiyat" class="form-label">Fiyat</label>
                    <asp:TextBox ID="txtTurFiyat" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-6">
                    <label class="form-label">Tur Tipi</label>
                    <asp:DropDownList ID="ddlContentType" runat="server" ClientIDMode="Static" CssClass="form-select">
                        <asp:ListItem Value="1" Text="Yurtiçi" />
                        <asp:ListItem Value="2" Text="Yurtdışı" />
                        <asp:ListItem Value="3" Text="Seminer" />
                        <asp:ListItem Value="4" Text="İstanbul" />
                        <asp:ListItem Value="5" Text="İnteraktif" />
                    </asp:DropDownList>

                </div>

                <div class="col-md-6">
                    <label for="txtTurAciklama" class="form-label">Açıklama</label>
                    <asp:TextBox ID="txtTurAciklama" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-6">
                    <label for="txtBasTarih" class="form-label">Başlangıç Tarihi</label>
                    <asp:TextBox ID="txtBasTarih" runat="server" CssClass="form-control" TextMode="Date" />
                </div>

                <div class="col-md-6">
                    <label for="txtBitTarih" class="form-label">Bitiş Tarihi</label>
                    <asp:TextBox ID="txtBitTarih" runat="server" CssClass="form-control" TextMode="Date" />
                </div>

                <div class="col-md-6">
                    <label for="fuTurPhoto" class="form-label">Fotoğraf Yükle</label>
                    <asp:FileUpload ID="fuTurPhoto" runat="server" CssClass="form-control" />
                </div>

            </div>
        </section>
        <hr />
        <section>
            <h5 class="mt-4">Tur İçeriği Ekle</h5>

            <div class="row g-3 align-items-end">
                <div class="col-md-4">
                    <label class="form-label">Başlık</label>
                    <input type="text" id="txtContentTitle" class="form-control" />
                </div>

                <div class="col-md-12">
                    <label class="form-label">İçerik</label>
                    <textarea id="txtContent" class="form-control"></textarea>
                </div>
                <div class="col-md-2 mt-2">
                    <button type="button" class="btn btn-outline-success w-100" onclick="addContentToTable()">➕ Ekle</button>
                </div>
            </div>

            <div class="mt-4">
                <h6>Eklenen İçerikler</h6>
                <table class="table table-bordered" id="contentTable">
                    <thead class="table-light">
                        <tr>
                            <th style="width: 80px;">Gün</th>
                            <th>Başlık</th>
                            <th>İçerik (Önizleme)</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </section>
        <hr />
        <section>
            <h5 class="mt-4">Tur Detay Bilgileri</h5>
            <div class="row g-3">
                <div class="col-md-4">
                    <label for="txtGenelFiyat" class="form-label">Genel Fiyat</label>
                    <asp:TextBox ID="txtGenelFiyat" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-4">
                    <label for="txtTekKisi" class="form-label">Tek Kişilik Fiyat</label>
                    <asp:TextBox ID="txtTekKisi" runat="server" CssClass="form-control" />
                </div>

                <div class="col-md-4">
                    <label for="txtCiftKisi" class="form-label">Çift Kişilik Fiyat</label>
                    <asp:TextBox ID="txtCiftKisi" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row g-3">
                <div class="col-md-6">
                    <h6>Tur Dahil</h6>
                    <div class="input-group mb-2">
                        <input type="text" id="txtTurInItem" class="form-control" placeholder="Yeni madde girin" />
                        <button type="button" class="btn btn-outline-primary" onclick="addTurIn()">➕</button>
                    </div>
                    <ul class="list-group mb-3" id="listTurIn"></ul>
                </div>

                <div class="col-md-6">
                    <h6>Tur Hariç</h6>
                    <div class="input-group mb-2">
                        <input type="text" id="txtTurOutItem" class="form-control" placeholder="Yeni madde girin" />
                        <button type="button" class="btn btn-outline-danger" onclick="addTurOut()">➕</button>
                    </div>
                    <ul class="list-group mb-3" id="listTurOut"></ul>
                </div>
            </div>
            <asp:HiddenField ID="hfTurIn" runat="server" />
            <asp:HiddenField ID="hfTurOut" runat="server" />
        </section>
        <hr />
        <div class="col-12">
            <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" CssClass="btn btn-success" OnClick="btnKaydet_Click" OnClientClick="return finalizeContentList();" />
        </div>
    </div>

    <script src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/ckeditor.js"></script>
    <script type="text/javascript">
        let gunSayisi = 1;
        let contentList = [];
        let editorInstance;

        ClassicEditor
            .create(document.querySelector('#txtContent'))
            .then(editor => {
                editorInstance = editor;
            })
            .catch(error => {
                console.error(error);
            });

        function addContentToTable() {
            const baslik = document.getElementById("txtContentTitle").value.trim();
            const turType = document.getElementById("ddlContentType").value;
            const editorContent = editorInstance.getData();

            if (!baslik || !editorContent) {
                alert("Başlık ve içerik zorunludur.");
                return;
            }

            contentList.push({
                gun: gunSayisi,
                baslik: baslik,
                turType: turType,
                icerik: editorContent
            });

            const tbody = document.getElementById("contentTable").getElementsByTagName("tbody")[0];
            const row = tbody.insertRow();
            row.insertCell(0).innerText = `${gunSayisi}. Gün`;
            row.insertCell(1).innerText = baslik;
            row.insertCell(2).innerText = stripHtml(editorContent).substring(0, 70) + "...";

            gunSayisi++;
            document.getElementById("txtContentTitle").value = "";
            editorInstance.setData("");
        }

        function stripHtml(html) {
            let tempDiv = document.createElement("div");
            tempDiv.innerHTML = html;
            return tempDiv.textContent || tempDiv.innerText || "";
        }

        function finalizeContentList() {
            document.getElementById("<%= hfContentList.ClientID %>").value = JSON.stringify(contentList);
            return true;
        }

        let turInList = [];
        let turOutList = [];

        function addTurIn() {
            const item = document.getElementById("txtTurInItem").value.trim();
            if (item) {
                turInList.push(item);
                updateList("listTurIn", turInList);
                document.getElementById("txtTurInItem").value = "";
                document.getElementById("<%= hfTurIn.ClientID %>").value = turInList.join("|");
            }
        }

        function addTurOut() {
            const item = document.getElementById("txtTurOutItem").value.trim();
            if (item) {
                turOutList.push(item);
                updateList("listTurOut", turOutList);
                document.getElementById("txtTurOutItem").value = "";
                document.getElementById("<%= hfTurOut.ClientID %>").value = turOutList.join("|");
            }
        }

        function updateList(containerId, listData) {
            const ul = document.getElementById(containerId);
            ul.innerHTML = "";
            listData.forEach((item, index) => {
                const li = document.createElement("li");
                li.className = "list-group-item d-flex justify-content-between align-items-center";
                li.innerHTML = `
                    <span>${item}</span>
                    <button type="button" class="btn-close" aria-label="Sil" onclick="removeItem('${containerId}', ${index})"></button>
                `;
                ul.appendChild(li);
            });
        }

        function removeItem(containerId, index) {
            if (containerId === "listTurIn") {
                turInList.splice(index, 1);
                updateList(containerId, turInList);
                document.getElementById("<%= hfTurIn.ClientID %>").value = turInList.join("|");
            } else {
                turOutList.splice(index, 1);
                updateList(containerId, turOutList);
                document.getElementById("<%= hfTurOut.ClientID %>").value = turOutList.join("|");
            }
        }

        document.getElementById("<%= hfContentList.ClientID %>").value = JSON.stringify(contentList);
    </script>
</asp:Content>

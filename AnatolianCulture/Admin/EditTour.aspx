<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="EditTour.aspx.cs" Inherits="Admin_EditTour" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hfContentList" runat="server" />
    <asp:HiddenField ID="hfTurIn" runat="server" />
    <asp:HiddenField ID="hfTurOut" runat="server" />

    <div class="container mt-4">
        <section>
            <h3 class="mb-4">Turu Güncelle</h3>
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Tur Adı</label>
                    <asp:TextBox ID="txtTurName" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Fiyat</label>
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
                    <label class="form-label">Açıklama</label>
                    <asp:TextBox ID="txtTurAciklama" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Başlangıç Tarihi</label>
                    <asp:TextBox ID="txtBasTarih" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Bitiş Tarihi</label>
                    <asp:TextBox ID="txtBitTarih" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Fotoğraf Yükle</label>
                    <asp:FileUpload ID="fuTurPhoto" runat="server" CssClass="form-control" />
                </div>
            </div>
        </section>

        <hr />

        <section>
            <h5 class="mt-4">Tur İçerikleri</h5>
            <div id="contentEditorWrapper">
                <!-- JS ile editör ve başlık inputları buraya eklenecek -->
            </div>
            <div class="mt-2">
                <button type="button" class="btn btn-outline-success" onclick="addContentRow()">➕ Yeni Gün Ekle</button>
            </div>
        </section>

        <hr />

        <section>
            <h5 class="mt-4">Tur Detay Bilgileri</h5>
            <div class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Genel Fiyat</label>
                    <asp:TextBox ID="txtGenelFiyat" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Tek Kişilik Fiyat</label>
                    <asp:TextBox ID="txtTekKisi" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <label class="form-label">Çift Kişilik Fiyat</label>
                    <asp:TextBox ID="txtCiftKisi" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row g-3 mt-3">
                <div class="col-md-6">
                    <h6>Tur Dahil</h6>
                    <div id="turInContainer" class="d-flex flex-column gap-2"></div>
                    <button type="button" class="btn btn-outline-primary mt-2" onclick="addTurInRow()">➕ Yeni Dahil Servis</button>
                </div>
                <div class="col-md-6">
                    <h6>Tur Hariç</h6>
                    <div id="turOutContainer" class="d-flex flex-column gap-2"></div>
                    <button type="button" class="btn btn-outline-danger mt-2" onclick="addTurOutRow()">➕ Yeni Hariç Servis</button>
                </div>
            </div>
        </section>

        <hr />
        <asp:Button ID="btnUpdate" runat="server" Text="Güncelle" CssClass="btn btn-success"
            OnClick="btnUpdate_Click"
            OnClientClick="return finalizeContentList();" />
    </div>

    <!-- CKEditor 5 CDN -->
    <script src="https://cdn.ckeditor.com/ckeditor5/41.0.0/classic/ckeditor.js"></script>

<script>
    var contentList = typeof contentList !== "undefined" ? contentList : [];
    var turInList = typeof turInList !== "undefined" ? turInList : [];
    var turOutList = typeof turOutList !== "undefined" ? turOutList : [];
    var ckeditorInstances = []; // Her editör için global dizi

    function renderDynamicInputs() {
        renderContentEditors();
        renderTurInOutInputs();
    }

    function renderContentEditors() {
        const wrapper = document.getElementById("contentEditorWrapper");
        wrapper.innerHTML = "";
        ckeditorInstances = []; // Her render'da sıfırla
        var gunSayisi = 1;

        // Eğer contentList boşsa AddTour'daki gibi ilk satırı hazırla
        if (!contentList || contentList.length === 0) {
            contentList = [{ baslik: "", icerik: "", turType: document.getElementById("ddlContentType").value }];
        }

        contentList.forEach(function (item, index) {
            const contentId = "txtContent_" + index;
            const titleId = "txtTitle_" + index;

            const div = document.createElement("div");
            div.className = "mb-4";
            div.innerHTML = `
                <label class="form-label">${gunSayisi}. Gün - Başlık</label>
                <input type="text" id="${titleId}" class="form-control mb-2" value="${item.baslik || ''}" />
                <label class="form-label">İçerik</label>
                <textarea id="${contentId}" class="form-control ckeditor"></textarea>
            `;

            wrapper.appendChild(div);
            gunSayisi++;
        });

        // Her editörü başlat ve ckeditorInstances dizisine referans ekle
        setTimeout(() => {
            document.querySelectorAll('.ckeditor').forEach((textarea, i) => {
                ClassicEditor.create(textarea)
                    .then(editor => {
                        editor.setData(contentList[i] ? contentList[i].icerik : "");
                        ckeditorInstances[i] = editor;
                    })
                    .catch(error => console.error(error));
            });
        }, 100);
    }

    function addContentRow() {
        contentList.push({ baslik: "", icerik: "", turType: document.getElementById("ddlContentType").value });
        renderContentEditors();
    }

    function renderTurInOutInputs() {
        const turInContainer = document.getElementById("turInContainer");
        const turOutContainer = document.getElementById("turOutContainer");

        turInContainer.innerHTML = "";
        turOutContainer.innerHTML = "";

        // Eğer boşsa ilk satırı oluştur
        if (!turInList || turInList.length === 0) {
            turInList = [""];
        }
        if (!turOutList || turOutList.length === 0) {
            turOutList = [""];
        }

        turInList.forEach((item, index) => {
            const input = document.createElement("input");
            input.type = "text";
            input.className = "form-control mb-2";
            input.value = item || "";
            input.name = "turInDynamic";
            turInContainer.appendChild(input);
        });

        turOutList.forEach((item, index) => {
            const input = document.createElement("input");
            input.type = "text";
            input.className = "form-control mb-2";
            input.value = item || "";
            input.name = "turOutDynamic";
            turOutContainer.appendChild(input);
        });
    }

    function addTurInRow() {
        turInList.push("");
        renderTurInOutInputs();
    }

    function addTurOutRow() {
        turOutList.push("");
        renderTurInOutInputs();
    }

    function finalizeContentList() {
        var wrapper = document.getElementById("contentEditorWrapper");
        var titleInputs = wrapper.querySelectorAll("input[id^='txtTitle_']");
        var updatedContentList = [];

        for (var i = 0; i < titleInputs.length; i++) {
            var baslik = titleInputs[i].value.trim();
            var icerik = "";
            // CKEditor instance'dan güvenli şekilde veri al
            if (ckeditorInstances[i]) {
                icerik = ckeditorInstances[i].getData();
            }

            updatedContentList.push({
                baslik: baslik,
                icerik: icerik,
                turType: document.getElementById("ddlContentType").value
            });
        }
        document.getElementById("<%= hfContentList.ClientID %>").value = JSON.stringify(updatedContentList);

        // Tur In/Out
        var turInInputs = document.getElementsByName("turInDynamic");
        var turOutInputs = document.getElementsByName("turOutDynamic");

        var inList = [];
        var outList = [];

        for (var i = 0; i < turInInputs.length; i++) {
            if (turInInputs[i].value.trim()) inList.push(turInInputs[i].value.trim());
        }
        for (var i = 0; i < turOutInputs.length; i++) {
            if (turOutInputs[i].value.trim()) outList.push(turOutInputs[i].value.trim());
        }

        document.getElementById("<%= hfTurIn.ClientID %>").value = inList.join('|');
        document.getElementById("<%= hfTurOut.ClientID %>").value = outList.join('|');

        return true;
    }
</script>

</asp:Content>

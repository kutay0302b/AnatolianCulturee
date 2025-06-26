<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TourDetails.aspx.cs" Inherits="_TourDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <style>
        h4 {
            margin-top: 20px;
            margin-bottom: 10px;
            font-size: 1.25rem;
            font-weight: bold;
        }

        /* dikey sekmeler için normal durum stilleri */
        /*     #v-pills-tab .nav-link {
            background-color: #81CFCB !important;
            border: 1px solid #29cdcd !important;
            border-radius: 0 !important;
            color: black !important;
        }

            #v-pills-tab .nav-link.active {
                background-color: #29cdcd !important;
                color: white !important;
            }*/

        #v-pills-tab .nav-link {
            padding: 0.8em 0.7em;
            border: 2px solid #17C3B2;
            position: relative;
            overflow: hidden;
            background-color: transparent;
            text-align: center;
            text-transform: uppercase;
            font-size: 15px;
            transition: .3s;
            z-index: 1;
            font-family: inherit;
            color: #000;
        }

            #v-pills-tab .nav-link::before {
                content: '';
                width: 0;
                height: 300%;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) rotate(45deg);
                background: #17C3B2;
                transition: .5s ease;
                display: block;
                z-index: -1;
            }

            #v-pills-tab .nav-link:hover::before {
                width: 105%;
            }

            #v-pills-tab .nav-link:hover {
                color: #111;
            }

        /* Yatay sekmeler için normal durum stilleri */
        #v-pills-tab-mobile .nav-link {
            gap: 5px;
            border: 1px solid #17C3B2;
            position: relative;
            overflow: hidden;
            background-color: transparent;
            text-align: center;
            z-index: 1;
            color: #000;
        }

            #v-pills-tab-mobile .nav-link.active {
                background-color: #29cdcd !important;
                color: white !important;
            }

        .tab-in-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid lightgray;
            padding: 20px;
            border-radius: .35rem;
        }


        .banner {
            width: 100%;
            max-height: 300px;
            overflow: hidden;
        }

            .banner img {
                width: 100%;
                height: auto;
                max-height: 300px;
                object-fit: cover;
            }

        .set-color {
            color: black
        }
    </style>
    <section style="height: 111px; background: #0a0a09;"></section>

    <section class="pb-5" style="background-color: #f9f9f9;">
        <div class="banner">
            <img id="randomImage" src="" alt="Banner Görseli">
        </div>

        <div class="container tour-detail-main-container" style="gap: 20px;">
            <%--TUR PANEL--%>
            <div class="detail-container ">
                <!-- Mobil Cihazlarda Görünen Yatay Sekmeler -->
                <div class="nav nav-pills d-md-none mb-3 mt-3" id="v-pills-tab-mobile" role="tablist" style="gap: 5px;">
                    <button class="custom-btn-tab nav-link active" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab"
                        aria-controls="v-pills-home" aria-selected="true">
                        Tur Programı</button>
                    <button class=" custom-btn-tab nav-link" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab"
                        aria-controls="v-pills-profile" aria-selected="false">
                        Fiyatlandırma</button>
                    <button class=" custom-btn-tab nav-link" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab"
                        aria-controls="v-pills-messages" aria-selected="false">
                        Hizmetler</button>
                </div>

                <!-- diğer Görünen Yatay Sekmeler -->

                <div class="d-flex align-items-start" style="margin-top: 30px;">
                    <div class="nav flex-column nav-pills me-3 d-none d-md-flex" style="gap: 20px;" id="v-pills-tab" role="tablist"
                        aria-orientation="vertical">
                        <button class="nav-link active btnTab" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Tur Programı</button>
                        <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Fiyatlandırma</button>
                        <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Hizmetler</button>
                    </div>
                    <div class="tab-content" id="v-pills-tabContent">
                        <%--MAİN CONTENT--%>
                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                            <div class="container tab-in-container">

                                <%--<img src="Images/MARDIN-TURU-300x300.webp" class="card-img-top" alt="tur">--%>
                                <div class="detail-container-main">
                                    <asp:Repeater ID="rptContents" runat="server">
                                        <itemtemplate>
                                            <div class="detail-content">
                                                <div>
                                                    <h6 style="margin-top: 30px"><%# Container.ItemIndex + 1 %>. gün</h6>
                                                    <h6><%# Eval("TurContentBaslik") %></h6>
                                                </div>
                                                <div>
                                                    <asp:Literal ID="litHtmlContent" runat="server" Mode="PassThrough"
                                                        Text='<%# Eval("TurContent") %>' />
                                                </div>
                                            </div>
                                        </itemtemplate>
                                    </asp:Repeater>

                                    <asp:Panel ID="pnlNoContent" runat="server" Visible="false">
                                        <h1>Mevcut tur bulunmamaktadır. Takipte kalın!</h1>
                                    </asp:Panel>
                                </div>

                            </div>

                        </div>
                        <%--ÖDEME ALANI--%>
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <div class="detail-payment tab-in-container">
                                <%--<div>
                                    <h4>NAKİT / BANKA HAVALESİ</h4>
                                </div>
                                <div style="display: flex; flex-direction: column; align-items: center;">
                                    <h4>İKİ KİŞİLİK ODADA KİŞİ BAŞI </h4>
                                    <label>14000 TL </label>
                                </div>
                                <div style="display: flex; flex-direction: column; align-items: center;">
                                    <h4>TEK KİŞİLİK ODADA KALMA FARKI </h4>
                                    <label>2000 TL</label>
                                </div>--%>

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="background-color: transparent;">Genel Fiyat</th>
                                            <th scope="col" style="background-color: transparent;">TEK KİŞİLİK ODADA KALMA FARKI</th>
                                            <th scope="col" style="background-color: transparent;">İKİ KİŞİLİK ODADA KİŞİ BAŞI FARKI</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-group-divider" style="color: teal;">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <itemtemplate>
                                                <tr>
                                                    <td><%# Eval("GenelFiyat") %></td>
                                                    <td><%# Eval("TekKisi") %></td>
                                                    <td><%# Eval("CiftKisi") %></td>
                                                </tr>
                                            </itemtemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                        <%--DAHİL OLAN İÇERİK--%>
                        <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                            <div class="tab-in-container" style="align-items: flex-start;">
                                <h4>Fiyata Dahil Olan Hizmetler</h4>
                                <ul class="services-list">
                                    <% if (FilteredDetails != null && FilteredDetails.Count > 0)
                                        {
                                            foreach (var content in FilteredDetails)
                                            {
                                                var turInServices = content.TurIn.Split('|');
                                                foreach (var service in turInServices)
                                                { %>
                                    <li class="included">
                                        <span class="icon">&#x2022;</span>
                                        <%= service %>
                                    </li>
                                    <%         }
                                            }
                                        }
                                    %>
                                </ul>

                                <h4>Gezi Fiyatına Dahil Olmayan Hizmetler</h4>
                                <ul class="services-list">
                                    <% if (FilteredDetails != null && FilteredDetails.Count > 0)
                                        {
                                            foreach (var content in FilteredDetails)
                                            {
                                                var turOutServices = content.TurOut.Split('|');
                                                foreach (var service in turOutServices)
                                                { %>
                                    <li class="excluded">
                                        <span class="icon">&#x2022;</span>
                                        <%= service %>
                                    </li>
                                    <%         }
                                            }
                                        }
                                    %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--YAN PANEL--%>
            <aside class="aside-content">
                <h5>Bizimle iletişime geçebilirsiniz</h5>
                <div>
                    <label>Adınız*</label>
                    <input type="text" class="form-control" id="userName" runat="server" required>
                </div>
                <div>
                    <label>E-posta Adresiniz*</label>
                    <input type="email" class="form-control" id="userEmail" runat="server" required>
                </div>
                <div>
                    <label>Konu</label>
                    <input type="text" class="form-control" id="subject" runat="server">
                </div>
                <div>
                    <label>İletiniz</label>
                    <textarea class="form-control" id="messageContent" runat="server" style="background-color: #f9f9f9; border-color: #17C3B2;" rows="5" cols="50"></textarea>
                </div>
                <div class="text-center">
                    <asp:Button Text="Gönder" runat="server" ID="sendMailBtn" CssClass="btn btn-success btn_teal set-color" OnClick="sendMailBtn_Click" />
                </div>
            </aside>
        </div>
    </section>

    <script>  
        // Rastgele resimleri tanımlıyoruz
        const images = [
            "Images/slider-1.jpg",
            "Images/slider-2.jpg",
            "Images/slider-3.jpg"
        ];

        // Rastgele bir resim seçmek için
        const randomIndex = Math.floor(Math.random() * images.length);
        const randomImage = images[randomIndex];

        // Resim kaynağını (src) rastgele seçilen resimle güncelle
        document.getElementById("randomImage").src = randomImage;


        document.addEventListener("DOMContentLoaded", function () {
            const tabContent = document.querySelector(".tab-content");
            const tabPanes = tabContent.querySelectorAll(".tab-pane");

            function setTabContentWidth() {
                let maxWidth = 0;

                // Tüm sekme içeriklerinin genişliğini ölç
                tabPanes.forEach(tabPane => {
                    tabPane.style.display = "block"; // Genişlik ölçümü için geçici olarak görünür yap
                    maxWidth = Math.max(maxWidth, tabPane.scrollWidth);
                    tabPane.style.display = ""; // Eski görünürlüğü geri yükle
                });

                // Maksimum genişliği tüm sekmelere uygula
                tabContent.style.width = maxWidth + "px";
            }

            // Sayfa yüklendiğinde ve sekme değiştirildiğinde çalıştır
            setTabContentWidth();
            document.querySelectorAll('[data-bs-toggle="pill"]').forEach(tab => {
                tab.addEventListener("shown.bs.tab", setTabContentWidth);
            });
        });

    </script>
</asp:Content>


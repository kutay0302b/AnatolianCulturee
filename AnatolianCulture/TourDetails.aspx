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

        #v-pills-tab .nav-link {
            background-color: #81CFCB !important; /* Arka plan rengini ayarlar */
            border: 1px solid #29cdcd !important; /* Kenarlık stilini ayarlar */
            border-radius: 0 !important; /* Kenarlık yuvarlaklığını kaldırır */
            color: black !important; /* Yazı rengini ayarlar */
        }

            #v-pills-tab .nav-link.active {
                background-color: #29cdcd !important; /* Aktif tab için arka plan rengini değiştir */
                color: white !important; /* Aktif tab için yazı rengini değiştir */
            }

        @media (max-width: 768px) {
            #v-pills-tab {
                flex-direction: row; /* Yatay düzen */
                justify-content: space-around; /* Butonlar arası boşluk ayarlama */
                gap: 0; /* Aralık sıfırlama */
            }

                #v-pills-tab .nav-link {
                    width: 30%; /* Her buton için genişlik ayarlama */
                }
        }

        .tab-in-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 1px solid;
            padding: 20px;
            border-radius: 1.5rem;
        }


        .banner {
            width: 100%; /* Ekran genişliğine göre tam genişlikte */
            max-height: 300px; /* Maksimum yüksekliği 300px */
            overflow: hidden; /* Taşan içerikleri gizlemek için */
        }

            .banner img {
                width: 100%; /* Resim genişliğini tam ekran yap */
                height: auto; /* Yüksekliği orantılı olarak ayarla */
                max-height: 300px; /* Resim yüksekliğini sınırla */
                object-fit: cover; /* Resmin boyutunu alanla eşleştir */
            }
    </style>
    <section style="height: 69px; background: #0a0a09;"></section>

    <section class="pb-5" style="background-color: #f9f9f9;">
        <div class="banner">
            <img id="randomImage" src="" alt="Banner Görseli">
        </div>

        <div class="container tour-detail-main-container" style="gap: 20px;">
            <%--TUR PANEL--%>
            <div class="detail-container ">
                <div class="d-flex align-items-start">
                    <div class="nav flex-column nav-pills me-3 custom-responsive" style="gap: 30px;" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <button class="nav-link active btnTab" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">Tur Programı</button>
                        <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">Fiyatlandırma</button>
                        <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">Hizmetler</button>
                    </div>
                    <div class="tab-content" id="v-pills-tabContent">
                        <%--MAİN CONTENT--%>
                        <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                            <div class="container tab-in-container">

                                <img src="Images/MARDIN-TURU-300x300.webp" class="card-img-top" alt="tur">
                                <div class="detail-container-main">
                                    <% if (FilteredContents != null && FilteredContents.Count > 0)
                                        {
                                            int dayCount = 1;
                                            foreach (var content in FilteredContents)
                                            { %>
                                    <div class="detail-content">
                                        <%--   <div style="width: 50%; margin-left: 320px;">--%>
                                        <div>
                                            <h6><%= dayCount %>. gün</h6>
                                            <h6><%= content.TurContentBaslik %></h6>
                                        </div>
                                        <%-- <div class="container-fluid" style="width: 50%;">--%>
                                        <div>
                                            <p>
                                                <%= content.TurContent %>
                                            </p>
                                        </div>
                                    </div>
                                    <% 
                                                dayCount++;
                                            }
                                        }
                                        else
                                        { %>
                                    <h1>Mevcut tur bulunmamaktadır. Takipte kalın!</h1>
                                    <% } %>
                                </div>
                            </div>

                        </div>
                        <%--ÖDEME ALANI--%>
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                            <div class="detail-payment tab-in-container">
                                <div>
                                    <h4>NAKİT / BANKA HAVALESİ</h4>
                                </div>
                                <div style="display: flex; flex-direction: column; align-items: center;">
                                    <h4>İKİ KİŞİLİK ODADA KİŞİ BAŞI </h4>
                                    <label>14000 TL </label>
                                </div>
                                <div style="display: flex; flex-direction: column; align-items: center;">
                                    <h4>TEK KİŞİLİK ODADA KALMA FARKI </h4>
                                    <label>2000 TL</label>
                                </div>
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
                                        <span class="icon"></span>
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
                                        <span class="icon"></span>
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
                    <textarea class="form-control" id="messageContent" runat="server" style="background-color: #f9f9f9;" rows="5" cols="50"></textarea>
                </div>
                <div class="text-center">
                    <asp:Button Text="Gönder" runat="server" ID="sendMailBtn" CssClass="btn btn-success btn_teal" OnClick="sendMailBtn_Click" />
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
    </script>
</asp:Content>


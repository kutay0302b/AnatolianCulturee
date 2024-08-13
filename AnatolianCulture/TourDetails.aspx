<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="TourDetails.aspx.cs" Inherits="_TourDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <style>
        @media only screen and (min-width : 1224px) {
            .tour-detail-main-container {
                display: flex;
                flex-wrap: wrap;
            }

            .detail-container {
                display: flex;
                justify-items: center;
                align-content: center;
                align-items: center;
                width: 65%;
                flex-direction: column;
                justify-content: space-between;
                height: auto;
                padding-top: 20px;
            }

            .detail-content {
                display: flex;
                flex-direction: column;
            }

            .aside-content {
                justify-items: center;
                height: 60vh;
                max-height: 60vh;
                position: sticky;
                top: 75px;
                margin-top: 50px;
                padding: 12px;
                width: 25%;
                border-radius: 1.5rem;
                row-gap: 10px;
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                background-color: #ffffff;
                box-shadow: 0 0 8px 0px black;
            }
        }

        .aside-content input {
            background-color: #f9f9f9;
        }



        @media only screen and (max-width : 768px) {
            .tour-detail-main-container {
                display: flex;
                flex-direction: column;
                flex-wrap: wrap;
            }

            .aside-content {
                height: 60vh;
                border: 2px solid black;
                padding: 2px;
                width: auto;
                align-content: space-evenly;
            }

                .aside-content input {
                    background-color: #f9f9f9;
                }
        }


        .services-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

            .services-list li {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                font-size: 1rem;
            }

                .services-list li .icon {
                    font-size: 1rem;
                    margin-right: 10px;
                }

                .services-list li.included .icon {
                    color: #28a745; /* Yeşil Renk (Dahil olan hizmetler) */
                }

                .services-list li.excluded .icon {
                    color: #dc3545; /* Kırmızı Renk (Dahil olmayan hizmetler) */
                }

        h4 {
            margin-top: 20px;
            margin-bottom: 10px;
            font-size: 1.25rem;
            font-weight: bold;
        }
    </style>
    <section style="height: 69px; background: #0a0a09;"></section>
    <section style="background-color: #f9f9f9;">
        <div class="container-fluid tour-detail-main-container">
            <div class="detail-container">
                <img src="Images/MARDIN-TURU-300x300.webp" class="card-img-top" alt="tur" style="width: 400px;">
                <% if (FilteredContents != null && FilteredContents.Count > 0)
                    {
                        int dayCount = 1;
                        foreach (var content in FilteredContents)
                        { %>
                <div class="detail-content">
                    <div style="width: 50%; margin-left: 320px;">
                        <h6><%= dayCount %>. gün</h6>
                        <h6><%= content.TurContentBaslik %></h6>
                    </div>
                    <div class="container-fluid" style="width: 50%;">
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

                <div style="display: flex; gap: 2.8rem; margin-left: 17rem; margin-top: 10px; font-size: 20px;">
                    <div>
                        <label>NAKİT / BANKA HAVALESİ</label>
                    </div>
                    <div style="display: flex; flex-direction: column;">
                        <label>İKİ KİŞİLİK ODADA KİŞİ BAŞI </label>
                        <label>14000 TL </label>
                    </div>
                    <div style="display: flex; flex-direction: column;">
                        <label>TEK KİŞİLİK ODADA KALMA FARKI </label>
                        <label>2000 TL</label>
                    </div>
                </div>




                <div class=" mt-5">
                    <h4>Fiyata Dahil Olan Hizmetler</h4>
                    <ul class="services-list">
                        <li class="included">
                            <span class="icon">✔</span>
                            Özel aracımızla tüm transferler
                        </li>
                        <li class="included">
                            <span class="icon">✔</span>
                            3 öğle ve 2 akşam yemeği (yöresel lezzetler)
                        </li>
                        <li class="included">
                            <span class="icon">✔</span>
                            Midyat – Mor Gabriel gezisi
                        </li>
                        <li class="included">
                            <span class="icon">✔</span>
                            Dara Antik Kenti gezisi
                        </li>
                        <li class="included">
                            <span class="icon">✔</span>
                            Mardin gezisi
                        </li>
                        <li class="included">
                            <span class="icon">✔</span>
                            Programda belirtilen tüm müze ve ören yeri giriş ücretleri
                        </li>
                        <li class="included">
                            <span class="icon">✔</span>
                            Tüm rehberlik hizmeti
                        </li>
                        <li class="included">
                            <span class="icon">✔</span>
                            Zorunlu seyahat sağlık sigortası
                        </li>
                        <li class="included">
                            <span class="icon">✔</span>
                            İzala Otel’de konaklama
                        </li>
                    </ul>

                    <h4>Gezi Fiyatına Dahil Olmayan Hizmetler</h4>
                    <ul class="services-list">
                        <li class="excluded">
                            <span class="icon">✘</span>
                            Müze Kart
                        </li>
                        <li class="excluded">
                            <span class="icon">✘</span>
                            Gidiş-Dönüş uçak biletleri
                        </li>
                        <li class="excluded">
                            <span class="icon">✘</span>
                            Yemekler sırasında alınacak tüm alkollü alkolsüz içkiler
                        </li>
                        <li class="excluded">
                            <span class="icon">✘</span>
                            Kişisel harcamalar
                        </li>
                    </ul>
                </div>
            </div>
            <aside class="aside-content">
                <h5>Bizimle iletişime geçebilirsiniz</h5>
                <div>
                    <label>Adınız*</label>
                    <input type="text" class="form-control" name="name" value="" required="">
                </div>
                <div>
                    <label>E-posta Adresiniz*</label>
                    <input type="text" class="form-control" name="name" value="" required="">
                </div>
                <div>
                    <label>Konu</label>
                    <input type="text" class="form-control" name="name" value="">
                </div>
                <div>
                    <label>İletiniz</label>
                    <textarea class="form-control" style="background-color: #f9f9f9;" rows="5" cols="50"></textarea>
                </div>

                <div class="text-center">

                    <button class="btn btn-success btn_teal">Gönder</button>
                </div>


            </aside>



        </div>
    </section>


    <div style="height: 1500px; background-color: #f9f9f9;">
    </div>
</asp:Content>


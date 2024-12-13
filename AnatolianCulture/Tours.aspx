<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Tours.aspx.cs" Inherits="_Tours" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .card-custom {
            border: 1px solid #d4d4d4;
            border-radius: 8px;
            overflow: hidden;
            width: 100%;
            max-width: 300px;
            transition: transform 0.2s ease-in-out;
            margin: 15px;
        }

            .card-custom:hover {
                transform: scale(1.04);
                z-index: 1;
            }

            .card-custom img {
                border-bottom: 1px solid #e0e0e0;
                width: 100%;
                height: 270px;
            }

            .card-custom .card-body {
                padding: 1rem;
            }

            .card-custom .card-title {
                font-size: 1.25rem;
                font-weight: bold;
            }

            .card-custom .card-subtitle {
                font-size: 1rem;
                color: #6c757d;
            }

            .card-custom .card-text {
                font-size: 0.875rem;
                color: #6c757d;
                margin-bottom: 1rem;
            }

            .card-custom .price {
                font-size: 1.5rem;
                font-weight: bold;
                margin: 0;
                color:white;
            }

            .card-custom .btn-custom {
                background-color: #28a745;
                color: white;
                font-weight: bold;
                border-radius: 50px;
            }

                .card-custom .btn-custom:hover {
                    background-color: #218838;
                }

        .tour-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        @media (max-width: 768px) {
            .card-custom {
                width: 80%;
                /* max-width: none;*/
                transform: none !important;
            }

                .card-custom:hover {
                    transform: none !important;
                }
        }

        @media (max-width: 576px) {
            .tour-container {
                flex-direction: column;
                align-items: center;
            }

            .card-custom {
                margin-bottom: 20px;
            }
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
    </style>
    <section style="height: 111px; background: #0a0a09;"></section>
    <section style="background-color: #f4f3f3; padding: 0px 0 20px 0;">
        <div class="banner">
            <img id="randomImage" src="" alt="Banner Görseli">
        </div>


        <div class="text-center">
            <h1 style="margin-top: 50px; margin-bottom: 45px; font-weight:bold">TURLARIMIZ</h1>
        </div>
        <div class="container tour-container">
            <% if (FilteredTours != null && FilteredTours.Count > 0)
                {
                    int buttonId = 1;
                    foreach (var tour in FilteredTours)
                    { %>
            <div class="card card-custom" data-aos="fade-up">
                <img src="<%= GetPhotoPath(tour.TurPhoto) %>" class="card-img-top" alt="<%= tour.TurName %>">
                <div class="card-body">
                    <div></div>
                    <h5 class="card-title"><%= tour.TurName %></h5>
                    <h6 class="card-subtitle mb-2">Yurtiçi Turlar</h6>
                    <p class="card-text"><%= tour.TurAciklama %></p>
                </div>
                <div class="card-footer" style="display: flex; align-items: center; justify-content: space-around; background-color: #33b3a6">
                    <p class="price"><%= tour.TurFiyat %></p>
                    <%--<a href="#" class="btn btn-custom" onclick="redirectToDetails(<%= tour.ID %>, <%= tour.TurType %>)">Detaylar</a>--%>
                    <a href="#" class="btn btn-outline-light" onclick="redirectToDetails(<%= tour.ID %>, <%= tour.TurType %>)">Detaylar</a>
                </div>
            </div>


            <% buttonId++;
                    }
                }
                else
                { %>
            <h2 style="height: 71vh">Mevcut tur bulunmamaktadır. Takipte kalın!</h2>
            <% } %>
        </div>
    </section>

    <script>
        function redirectToDetails(tourId, tourType) {
            window.location.href = "TourDetails.aspx?tour=" + tourId + "&type=" + tourType;
        }

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


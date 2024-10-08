﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" CodeBehind="Home.aspx.cs" EnableEventValidation="false" Inherits="Home" %>

<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Globalization" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .deneme a {
            display: flex;
            flex-direction: column;
            flex-wrap: wrap;
            align-content: center;
            justify-content: center;
            align-items: center;
            color: black;
            text-decoration: none;
        }

      
    </style>

    <%--header--%>
    <section>
        <div id="intro" class="bg-image vh-100 parallax" style="background-image: url('Images/mardin.jpg'); display: flex; justify-content: center; flex-wrap: wrap; background-attachment: fixed; position: relative;">
            <div class="mask" style="background-color: rgba(250, 182, 162, 0.15);"></div>

            <div class="header-search">
                <div style="display: grid; align-content: space-around; row-gap: 20px;">
                    <h1>Yolculuk Nereye?</h1>
                    <input class="form-control" id="nameSearch" runat="server" type="search" name="name" value="" placeholder="Nereye gitmek istersiniz?" />
                </div>
                <div class="header-serach-box">
                    <div class="deneme">
                        <a href="Tours.aspx?child=1">
                            <img src="Images/family.png" />
                            <span>Çocuk</span>
                        </a>
                    </div>
                    <div class="deneme">
                        <a href="Tours.aspx?nature=1">
                            <img src="Images/nature.png" />
                            <span>Doğa</span>
                        </a>
                    </div>
                    <div class="deneme">
                        <a href="Tours.aspx?cultural=1">
                            <img src="Images/theatre.png" />
                            <span>Kültürel</span>
                        </a>
                    </div>
                    <div class="deneme">
                        <a href="Tours.aspx?enjoy=1">
                            <img src="Images/disco.png" />
                            <span>Keyif</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>


    </section>

    <%--hizmetlerimiz--%>
    <section class="pt-5 pb-5" style="min-height: 604px;">
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <h3 class="mb-3">Hizmetlerimiz</h3>
                </div>

                <div class="col-6 text-end">
                    <a class="btn btn-outline-dark mb-3 me-1 btn_teal" href="#carouselExampleIndicators2" role="button" data-bs-slide="prev">
                        <i class="fa fa-arrow-left"></i>
                    </a>

                    <a class="btn btn-outline-dark mb-3 btn_teal" href="#carouselExampleIndicators2" role="button" data-bs-slide="next">
                        <i class="fa fa-arrow-right"></i>
                    </a>
                </div>

                <div class="col-12">
                    <div id="carouselExampleIndicators2" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="Images/kisiye_ozel_tur-scaled.webp">
                                            <div class="card-body">
                                                <h4 class="card-title">Kişiye Özel Tur Tasarımı</h4>
                                                <p class="card-text">Kişilerin ilgilerini ve tüm konforunu gözeterek planlanan tur programı demektir, bunun için destinasyon yönetimine önem veriyoruz.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="Images/bilet-scaled.webp">
                                            <div class="card-body">
                                                <h4 class="card-title">Uçak Bileti Rezervasyonları</h4>
                                                <p class="card-text">Havayolları ile yapmış olduğumuz anlaşmalar dolayısıyla seyahatiniz için en uygun uçak biletini sunuyoruz.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="Images/otel-scaled.webp">
                                            <div class="card-body">
                                                <h4 class="card-title" style="font-size: 22px;">Yurtiçi ve Yurtdışı Otel Rezervasyonları</h4>
                                                <p class="card-text">Uzun yılların vermiş olduğu birikim ile istemiş olduğunuz özelliklere uygun otellere sizin için rezervasyonunuzu yapıyoruz.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="Images/transfeler-scaled.webp">
                                            <div class="card-body">
                                                <h4 class="card-title" style="font-size: 20px">Özel Araç, Helikopter ve Tekne Trasnfer Hizmetleri</h4>
                                                <p class="card-text">Seyahatlerinizde size özel lüks ayrıcalıkları yaşamanız için , ulaşımınıza konfor katacak transfer araçları sağlıyoruz.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="Images/pasaport-scaled.webp">
                                            <div class="card-body">
                                                <h4 class="card-title">Vize İşlemleri </h4>
                                                <p class="card-text">Profesyonel Vize Danışmanlarımız ile vize başvurularınızı ve yurtdışı çıkış vergilerinizi en kısa sürede gerçekleştiriyoruz.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="Images/organizasyon-scaled.webp">
                                            <div class="card-body">
                                                <h4 class="card-title">Kurumsal Etkinlik Yönetimi</h4>
                                                <p class="card-text">Etkinlik ve toplantı projelerimizi, her kurumun farklı bir kimliği, duruşu ve yaklaşımları olduğu bilinci ile planlıyoruz.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Swiper Container -->
    <section class="section-swip">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="Images/slider-1.jpg" />
                </div>
                <div class="swiper-slide">
                    <img src="Images/slider-2.jpg" />
                </div>
                <div class="swiper-slide">
                    <img src="Images/slider-3.jpg" />
                </div>
            </div>
        </div>
    </section>

    <%--turlar--%>
    <section class="pt-5 pb-5 card-hover-section" style="background-color: #81CFCB;">
        <div class="container">
            <div class="row">
                <div class="col-md-3 mb-3">


                    <div class="card">
                        <img src="Images/tur1.webp" class="card-img-top" alt="Yurtiçi Turlar">
                        <h4 class="card-title">Yurtiçi Turlar</h4>
                        <div class="card-overlay">
                            <h4 class="card-title">Yurtiçi Turlar</h4>
                            <p>14 – 17 Kasım Ata Topraklarına Yolculuk: Balkanlara Doğru</p>
                            <a href="#" class="btn btn-light btn_teal" onclick="redirectToTour(1)">Detaylar</a>
                        </div>
                    </div>


                </div>
                <div class="col-md-3 mb-3">
                    <div class="card">
                        <img src="Images/tur2.webp" class="card-img-top" alt="Yurtdışı Turlar">
                        <h4 class="card-title">Yurtdışı Turlar</h4>
                        <div class="card-overlay">
                            <h4 class="card-title">Yurtdışı Turlar</h4>
                            <p>14 – 17 Kasım Ata Topraklarına Yolculuk: Balkanlara Doğru</p>
                            <a href="#" class="btn btn-light btn_teal" onclick="redirectToTour(2)">Detaylar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card">
                        <img src="Images/tur3.webp" class="card-img-top" alt="İstanbul Turları">
                        <h4 class="card-title">İstanbul Turları</h4>
                        <div class="card-overlay">
                            <h4 class="card-title">İstanbul Turları</h4>
                            <p>14 – 17 Kasım Ata Topraklarına Yolculuk: Balkanlara Doğru</p>
                            <a href="#" class="btn btn-light btn_teal" onclick="redirectToTour(3)">Detaylar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card">
                        <img src="Images/tur4.webp" class="card-img-top" alt="İnteraktif" style="height: 456px;">
                        <h4 class="card-title">İnteraktif</h4>
                        <div class="card-overlay">
                            <h4 class="card-title">İnteraktif</h4>
                            <p>14 – 17 Kasım Ata Topraklarına Yolculuk: Balkanlara Doğru</p>
                            <a href="#" class="btn btn-light btn_teal" onclick="redirectToTour(4)">Detaylar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>




    <button  class="Btn" onclick="openWp()">
        <div class="sign">
            <svg class="socialSvg whatsappSvg" viewBox="0 0 16 16">
                <path
                    d="M13.601 2.326A7.854 7.854 0 0 0 7.994 0C3.627 0 .068 3.558.064 7.926c0 1.399.366 2.76 1.057 3.965L0 16l4.204-1.102a7.933 7.933 0 0 0 3.79.965h.004c4.368 0 7.926-3.558 7.93-7.93A7.898 7.898 0 0 0 13.6 2.326zM7.994 14.521a6.573 6.573 0 0 1-3.356-.92l-.24-.144-2.494.654.666-2.433-.156-.251a6.56 6.56 0 0 1-1.007-3.505c0-3.626 2.957-6.584 6.591-6.584a6.56 6.56 0 0 1 4.66 1.931 6.557 6.557 0 0 1 1.928 4.66c-.004 3.639-2.961 6.592-6.592 6.592zm3.615-4.934c-.197-.099-1.17-.578-1.353-.646-.182-.065-.315-.099-.445.099-.133.197-.513.646-.627.775-.114.133-.232.148-.43.05-.197-.1-.836-.308-1.592-.985-.59-.525-.985-1.175-1.103-1.372-.114-.198-.011-.304.088-.403.087-.088.197-.232.296-.346.1-.114.133-.198.198-.33.065-.134.034-.248-.015-.347-.05-.099-.445-1.076-.612-1.47-.16-.389-.323-.335-.445-.34-.114-.007-.247-.007-.38-.007a.729.729 0 0 0-.529.247c-.182.198-.691.677-.691 1.654 0 .977.71 1.916.81 2.049.098.133 1.394 2.132 3.383 2.992.47.205.84.326 1.129.418.475.152.904.129 1.246.08.38-.058 1.171-.48 1.338-.943.164-.464.164-.86.114-.943-.049-.084-.182-.133-.38-.232z">
                </path>
            </svg>
        </div>

        <div class="text">Bizimle İletişime Geçebilirsiniz.</div>
    </button>

    <script type="text/javascript">

        function redirectToTour(buttonId) {
            window.location.href = "Tours.aspx?tourtype=" + buttonId;
        }

        function openWp() {
            const whatsappUrl = "https://wa.me/yourphonenumber?text=Merhaba";
            window.open(whatsappUrl, '_blank');
        }

        var swiper = new Swiper('.swiper-container', {
            direction: 'vertical',  // Dikey kaydırma
            loop: true,             // Sonsuz döngü
            autoplay: {
                delay: 3000,          // 3 saniyede bir kaydırma
                disableOnInteraction: false, // Kullanıcı müdahale ettiğinde durmasın
            },
        });

        $(function () {
            $("#<%= nameSearch.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%= ResolveUrl("~/SearchSuggestions.ashx") %>',
                        type: "GET",
                        dataType: "json",
                        data: { term: request.term },
                        success: function (data) {
                            response(data);
                        }
                    });
                },
                minLength: 2,
                select: function (event, ui) {
                    window.location.href = "/TourDetails.aspx?tour=" + ui.item.value + "&type=" + ui.item.type;
                }
            });
        });

        window.addEventListener('scroll', function () {
            var scrolled = window.pageYOffset;
            var parallax = document.querySelector('.parallax');
            var coords = '0% ' + -(scrolled * 0.5) + 'px';
            parallax.style.backgroundPosition = coords;
        });

    </script>
</asp:Content>

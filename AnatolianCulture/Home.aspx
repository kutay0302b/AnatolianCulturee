<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" CodeBehind="Home.aspx.cs" EnableEventValidation="false" Inherits="Home" %>

<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Globalization" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* .deneme {
            display: flex;
            justify-content: center;
            align-content: center;
            width: 190px;
            height: 140px;
            border: 1px solid black;
            background-color: #ffffff94;
            flex-wrap: wrap;
            flex-direction: column;
            transition: transform 0.3s ease;
            align-items: center;
            border-radius: 1rem;
        }

            .deneme:hover {
                transform: scale(1.3);
            }

        #intro img {
            width: 40%
        }


        .header-search {
            margin-top: 35vh;
            display: flex;
            align-items: center;
            flex-direction: column;
            row-gap: 50px;
        }*/
    </style>

    <%--header--%>
    <section>
        <div id="intro" class="bg-image vh-100" style="background-image: url('Images/mardin.jpg'); display: flex; justify-content: center; flex-wrap: wrap;">
            <div class="mask" style="background-color: rgba(250, 182, 162, 0.15);"></div>

            <div class="header-search">
                <div style="display: grid; align-content: space-around; row-gap: 20px;">
                    <h1>Yolculuk Nereye?</h1>
                    <input class="form-control" id="nameSearch" runat="server" type="search" name="name" value="" placeholder="Nereye gitmek istersiniz?" />
                </div>
                <div class="header-serach-box">
                    <div class="deneme">
                        <img src="Images/family.png" />
                        <span>Çocuk</span>
                    </div>
                    <div class="deneme">
                        <img src="Images/nature.png" />
                        <span>Doğa</span>
                    </div>
                    <div class="deneme">
                        <img src="Images/theatre.png" />
                        <span>Kültürel</span>
                    </div>
                    <div class="deneme">
                        <img src="Images/disco.png" />
                        <span>Keyif</span>
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

    <section class="ftco-section" style="height: 66vh; background-color: #292727; padding-top: 61px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="slider-hero">
                        <div class="featured-carousel owl-carousel">
                            <div class="item">
                                <div class="work">
                                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url('Images/slider-1.jpg'); height: 400px;">
                                        <div class="text text-center">
                                            <h2>Discover New Places</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="work">
                                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url('Images/slider-2.jpg'); height: 400px;">
                                        <div class="text text-center">
                                            <h2>Dream Destination</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="work">
                                    <div class="img d-flex align-items-center justify-content-center" style="background-image: url('Images/slider-3.jpg'); height: 400px;">
                                        <div class="text text-center">
                                            <h2>Travel Exploration</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="my-5 text-center">
                            <ul class="thumbnail list-unstyled d-flex justify-content-center">
                                <li class="active img me-2">
                                    <a href="#">
                                        <img src="Images/thumb-1.jpg" alt="Image" class="img-fluid rounded">
                                    </a>
                                </li>
                                <li class="me-2">
                                    <a href="#">
                                        <img src="Images/thumb-2.jpg" alt="Image" class="img-fluid rounded">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="Images/thumb-3.jpg" alt="Image" class="img-fluid rounded">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
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


    <script type="text/javascript">
        function redirectToTour(buttonId) {
            window.location.href = "Tours.aspx?tourtype=" + buttonId;
        }



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
                    window.location.href = "/TourDetails.aspx?tour=" + ui.item.value;
                }
            });
        });

        (function ($) {

            "use strict";

            var fullHeight = function () {

                $('.js-fullheight').css('height', $(window).height());
                $(window).resize(function () {
                    $('.js-fullheight').css('height', $(window).height());
                });

            };
            fullHeight();

            var owl = $('.featured-carousel');

            $('.featured-carousel').owlCarousel({
                animateOut: 'fadeOut',
                center: false,
                items: 1,
                loop: true,
                stagePadding: 0,
                margin: 0,
                smartSpeed: 1500,
                autoplay: false,
                dots: false,
                nav: false,
                navText: ['<span class="icon-keyboard_arrow_left">', '<span class="icon-keyboard_arrow_right">']
            });

            $('.thumbnail li').each(function (slide_index) {
                $(this).click(function (e) {
                    owl.trigger('to.owl.carousel', [slide_index, 1500]);
                    e.preventDefault();
                })
            })

            owl.on('changed.owl.carousel', function (event) {
                $('.thumbnail li').removeClass('active');
                $('.thumbnail li').eq(event.item.index - 2).addClass('active');
            })

        })(jQuery);
    </script>
</asp:Content>

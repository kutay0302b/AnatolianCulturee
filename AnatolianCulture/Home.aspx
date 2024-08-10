<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" CodeBehind="Home.aspx.cs" EnableEventValidation="false" Inherits="Home" %>

<%@ Import Namespace="System.Web.Services" %>
<%@ Import Namespace="System.Globalization" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .deneme {
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
    </style>

    <section>

        <div id="intro" class="bg-image vh-100" style="background-image: url('Images/mardin.jpg'); display: flex; justify-content: center; flex-wrap: wrap;">
            <div class="mask" style="background-color: rgba(250, 182, 162, 0.15);"></div>

            <div style="margin-top: 35vh; display: flex; align-items: center; flex-direction: column; row-gap: 50px;">
                <div style="display: grid; align-content: space-around; row-gap: 20px;">
                    <h1>Yolculuk Nereye?</h1>
                    <input class="form-control" type="search" name="name" value="" style="width: 300px;" placeholder="Nereye gitmek istersiniz?" />
                </div>

                <div style="margin-top: 40px; display: flex; width: auto; gap: 50px; justify-content: space-around; flex-wrap: wrap; padding: 0px 20px 0 20px;">
                    <div class="deneme">
                        <i class="bi bi-bootstrap-fill" style="font-size: 40px;"></i>
                        <span>Çocuk</span>
                    </div>
                    <div class="deneme">
                        <i class="bi bi-bootstrap-fill" style="font-size: 40px;"></i>
                        <span>Doğa</span>
                    </div>
                    <div class="deneme">
                        <i class="bi bi-bootstrap-fill" style="font-size: 40px;"></i>
                        <span>Kültürel</span>
                    </div>
                    <div class="deneme">
                        <i class="bi bi-bootstrap-fill" style="font-size: 40px;"></i>
                        <span>Keyif</span>
                    </div>
                </div>
            </div>
        </div>


    </section>

    <section class="pt-5 pb-5">
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
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532781914607-2031eca2f00d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7c625ea379640da3ef2e24f20df7ce8d">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532712938310-34cb3982ef74?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3d2e8a2039c06dd26db977fe6ac6186a">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532771098148-525cefe10c23?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3f317c1f7a16116dec454fbc267dd8e4">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532715088550-62f09305f765?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ebadb044b374504ef8e81bdec4d0e840">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=0754ab085804ae8a3b562548e6b4aa2e">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ee8417f0ea2a50d53a12665820b54e23">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532777946373-b6783242f211?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=8ac55cf3a68785643998730839663129">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="card">
                                            <img class="img-fluid" alt="100%x280" src="https://images.unsplash.com/photo-1532763303805-529d595877c5?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=5ee4fd5d19b40f93eadb21871757eda6">
                                            <div class="card-body">
                                                <h4 class="card-title">Special title treatment</h4>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
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

    <section class="pt-5 pb-5 card-hover-section" style="background-color: #81CFCB;">
        <div class="container">
            <div class="row">
                <div class="col-md-3 mb-3">


                    <div class="card">
                        <img src="/Images/tur1.webp" class="card-img-top" alt="...">
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
                        <img src="/Images/tur2.webp" class="card-img-top" alt="...">
                        <h4 class="card-title">Packages</h4>
                        <div class="card-overlay">
                            <h4 class="card-title">Packages</h4>
                            <p>14 – 17 Kasım Ata Topraklarına Yolculuk: Balkanlara Doğru</p>
                            <a href="#" class="btn btn-light btn_teal" onclick="redirectToTour(2)">Detaylar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card">
                        <img src="/Images/tur3.webp" class="card-img-top" alt="...">
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
                        <img src="/Images/tur4.webp" class="card-img-top" alt="...">
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

    <script>
        function redirectToTour(buttonId) {
            window.location.href = "Tours.aspx?tourtype=" + buttonId;
        }
    </script>
</asp:Content>

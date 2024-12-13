<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Interactive.aspx.cs" Inherits="_Interactive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
        .accordion-item {
            background-color: transparent;
            border: none;
        }

        .accordion-button {
            background-color: #ECEFF1;
            /*color: #29cdcd;
            font-weight: bold;*/
            font-size: 25px;
            border: none;
            border-bottom: 2px solid #29cdcd;
            transition: background-color 0.3s ease, border-bottom 0.3s ease;
        }

            .accordion-button:hover {
                background-color: #CFD8DC;
            }

            .accordion-button:not(.collapsed) {
                background-color: #ECEFF1;
                color: #29cdcd;
                font-size: 25px;
                border-bottom: none;
            }

        .accordion-body {
            background-color: rgba(255, 255, 255, 0);
            color: #333;
            padding: 15px;
            border-top: 2px solid #29cdcd;
            border-radius: 0;
            transition: background-color 0.3s ease;
        }

            .accordion-body:hover {
                background-color: rgba(129, 207, 203, 0.2);
            }

        .accordion-button:focus {
            box-shadow: none !important;
            outline: none !important;
        }



      

      

        .workshop-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .workshop-item img {
            width: 80px;
            height: 80px;
            border-radius: 8px;
        }

        .workshop-info {
            display: flex;
            flex-direction: column;
            margin-left: 15px;
        }

        .workshop-time {
            color: #6c757d;
            font-size: 0.9rem;
        }

        .workshop-title {
            font-weight: bold;
        }
  
    </style>
    <section style="height: 111px; background: #0a0a09;"></section>
    <section>
       <%-- <div class="container mt-5 mb-5">
            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            Accordion Item #1
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                            Accordion Item #2
                        </button>
                    </h2>
                    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                            Accordion Item #3
                        </button>
                    </h2>
                    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
                    </div>
                </div>
            </div>
        </div>--%>

    </section>

    <section>
          <div class="container my-4">
        <div class="accordion" id="accordionWorkshops">
            <!-- Aralık 2024 -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingDecember">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDecember" aria-expanded="true" aria-controls="collapseDecember">
                        Aralık 2024
                    </button>
                </h2>
                <div id="collapseDecember" class="accordion-collapse collapse show" aria-labelledby="headingDecember" data-bs-parent="#accordionWorkshops">
                    <div class="accordion-body">
                        <!-- 13 Aralık -->
                        <div class="mb-4">
                            <div class="text-muted mb-2">13 Aralık Cuma</div>
                            <div class="workshop-item">
                                <div class="d-flex">
                                    <img src="https://placehold.co/80x80" alt="Kış Kahvesi">
                                    <div class="workshop-info">
                                        <div class="workshop-title">Kış Kahvesi</div>
                                        <div class="workshop-time">10:00 - 15:00</div>
                                    </div>
                                </div>
                            </div>
                            <div class="workshop-item">
                                <div class="d-flex">
                                    <img src="https://placehold.co/80x80"" alt="Sushi">
                                    <div class="workshop-info">
                                        <div class="workshop-title">Sushi</div>
                                        <div class="workshop-time">19:00 - 23:00</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 14 Aralık -->
                        <div class="mb-4">
                            <div class="text-muted mb-2">14 Aralık Cumartesi</div>
                            <div class="workshop-item">
                                <div class="d-flex">
                                    <img src="https://placehold.co/80x80" alt="Yılbaşı Çikolataları">
                                    <div class="workshop-info">
                                        <div class="workshop-title">Yılbaşı Çikolataları</div>
                                        <div class="workshop-time">10:00 - 14:00</div>
                                    </div>
                                </div>
                            </div>
                            <div class="workshop-item">
                                <div class="d-flex">
                                    <img src="https://placehold.co/80x80" alt="Kokteyl Kahveler">
                                    <div class="workshop-info">
                                        <div class="workshop-title">Kokteyl Kahveler</div>
                                        <div class="workshop-time">10:00 - 15:00</div>
                                    </div>
                                </div>
                            </div>
                            <div class="workshop-item">
                                <div class="d-flex">
                                    <img src="https://placehold.co/80x80" alt="Artizan Ekmekler ve Sandviçler">
                                    <div class="workshop-info">
                                        <div class="workshop-title">Artizan Ekmekler ve Sandviçler</div>
                                        <div class="workshop-time">10:00 - 16:00</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Ocak 2025 -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingJanuary">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseJanuary" aria-expanded="false" aria-controls="collapseJanuary">
                        Ocak 2025
                    </button>
                </h2>
                <div id="collapseJanuary" class="accordion-collapse collapse" aria-labelledby="headingJanuary" data-bs-parent="#accordionWorkshops">
                    <div class="accordion-body">
                        <p>Ocak ayı workshop bilgileri henüz eklenmedi.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </section>

</asp:Content>


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
            background-color: #e6e6e6;
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
                background-color: #e6e6e6;
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
    <section style="min-height: 100vh;">
        <div class="container my-4">
            <div class="text-center mb-3">

            <h1>Seminer ve Etkinliklerimiz</h1>
            </div>

            <div class="accordion" id="accordionWorkshops">
                <asp:Repeater ID="repeaterMonths" runat="server">
                    <ItemTemplate>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="heading<%# Container.ItemIndex %>">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" 
                                    data-bs-target="#collapse<%# Container.ItemIndex %>" aria-expanded="true"
                                    aria-controls="collapse<%# Container.ItemIndex %>">
                                    <%# Eval("MonthYear") %>
                                </button>
                            </h2>
                            <div id="collapse<%# Container.ItemIndex %>" class="accordion-collapse collapse show" 
                                aria-labelledby="heading<%# Container.ItemIndex %>"
                                data-bs-parent="#accordionWorkshops">
                                <div class="accordion-body">
                                    <asp:Repeater ID="repeaterDays" runat="server" DataSource='<%# Eval("Contents") %>'>
                                        <ItemTemplate>
                                            <div class="mb-4">
                                                <div class="text-muted mb-2">
                                                    <%# Eval("Day") %> <%# Eval("Month") %> <%# Eval("Weekday") %>
                                                </div>
                                                <div class="workshop-item">
                                                    <div class="d-flex">
                                                        <img src="<%# Eval("ImageUrl") %>" alt="Workshop Image">
                                                        <div class="workshop-info">
                                                            <div class="workshop-title"><%# Eval("Title") %></div>
                                                            <div class="workshop-detail">
                                                                <p><%# Eval("Details") %></p>
                                                            </div>
                                                            <div class="workshop-time">
                                                                <%# Eval("Price") == DBNull.Value || string.IsNullOrEmpty(Eval("Price").ToString()) 
                                                                    ? "Bilgi için " + (Eval("ContactInfo") == DBNull.Value ? "" : Eval("ContactInfo")) 
                                                                    : Eval("Price") %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>






            <%--<div class="accordion" id="accordionWorkshops">
                <!-- Aralık 2024 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingDecember">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseDecember" aria-expanded="true" aria-controls="collapseDecember">
                            Ocak 2025
                        </button>
                    </h2>
                    <div id="collapseDecember" class="accordion-collapse collapse show" aria-labelledby="headingDecember" data-bs-parent="#accordionWorkshops">
                        <div class="accordion-body">
                            <!-- 13 Aralık -->
                            <div class="mb-4">

                                <div class="text-muted mb-2">12 OCAK PAZAR</div>
                                <div class="workshop-item">
                                    <div class="d-flex">
                                        <img src="https://placehold.co/80x80" alt="Kış Kahvesi">
                                        <div class="workshop-info">
                                            <div class="workshop-title">ARKEOLOG NEZİH BAŞGELEN İLE ARKEOLOİ MÜZESİ KÜTÜPHANESİ SEMİNERLER_1</div>
                                            <div class="workshop-detail">
                                                <p>
                                                    ARKEOLOG,YAZAR NEZİH BAŞGELEN İLE Türkiye Tarihinde Arkeoloji Tanımından, Eski Mezopotamya Tarihine kadar uzanan Seminerler dizisine başlıyoruz. 
                                                İstanbul Arkeoloji Müzesinin kütüphanesini siz değerli misafirlerimiz için özel olarak açacaktır.
                                                </p>
                                            </div>
                                            <div class="workshop-time">Bilgi için 0532 783 82 05</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <div class="text-muted mb-2">16 OCAK SALI</div>
                                <div class="workshop-item">
                                    <div class="d-flex">
                                        <img src="https://placehold.co/80x80" alt="Sushi">
                                        <div class="workshop-info">
                                            <div class="workshop-title">ÜSTAD HALUK ŞAHİN İLE RAKI ADABI</div>
                                            <div class="workshop-detail">
                                                <p>
                                                    RAKI ERBABI Haluk Şahin eşliğinde Çiçek Pasajına doğru yürürken Beyoğlu’nun eğlence tarihini , tarihi keyif mekanlarını,koltuk meyhanelerini renkli simaların öykülerini dinliyoruz. 
                                                    Çiçek Pasajında üstadın meyhanesine konuk oluyor, meze aşkını olur ve olmazlarını dinliyor eski rakı sofralarının eşsiz hikayelerini ve anılarını dinliyoruz. 
                                                </p>
                                            </div>
                                            <div class="workshop-time">3500 TL</div>
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
                            ŞUBAT 2025
                        </button>
                    </h2>
                    <div id="collapseJanuary" class="accordion-collapse collapse" aria-labelledby="headingJanuary" data-bs-parent="#accordionWorkshops">
                        <div class="accordion-body">
                            <p>Şubat ayı workshop bilgileri henüz eklenmedi.</p>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </section>

</asp:Content>


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
    </style>
    <section style="height: 69px; background: #0a0a09;"></section>
    <section style="background-color: #f9f9f9;">
        <div class="container-fluid tour-detail-main-container">
            <div class="detail-container">
                <%--MAİN CONTENT--%>
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
                <%--ÖDEME ALANI--%>
                <div class="detail-payment">
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

                <%--DAHİL OLAN İÇERİK--%>
                <div class="mt-5">
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
                            <span class="icon">✔</span>
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
                            <span class="icon">✘</span>
                            <%= service %>
                        </li>
                        <%         }
                                }
                            }
                        %>
                    </ul>
                </div>
            </div>

            <%--YAN PANEL--%>
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


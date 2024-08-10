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
                <img src="Images/MARDIN-TURU-300x300.webp" class="card-img-top" alt="asd" style="width: 400px;">
                <div class="detail-content">
                    <div style="width: 50%; margin-left: 320px;">
                        <h6>1.gün</h6>
                        <h6>İstanbul (IST) – Mardin / 20 Ekim 2023</h6>
                    </div>
                    <div class="container-fluid" style="width: 50%;">
                        <p>
                            Siz Değerli misafirlerimiz ile saat 07.00’de İstanbul Havalimanı’nda buluşuyoruz. Bagaj ve bilet işlemlerimizin sonrasında TK 2674 sefer sayılı uçuş ile saat 09:00'da Mardin’e hareket ediyoruz. 
                    Planlanan varış saati 11:00. Varışımız ardından Mardin turumuza Deyrulzafaran Manastırı’nı ziyaret ederek başlıyoruz. Manastır sonrası Kasimiye Medresesi’ne ulaşıyoruz. 
                    Sultan İsa döneminde Zinciriye Medresesi’nin ardından yapımına başlanan medresenin yapımı Timur ve Akkoyunlular arasında oluşan gergin siyaset sebebi ile yarım kalmış. 
                    Medrese Akkoyunlular tarafından 1502 yılında tamamlanmış ve Cihangir’in oğlu Kasım’ın adı verilmiştir
                    Yerel bir restoranda alacağımız öğle yemeğimizin ardından, Şehidiye Medresesi, Mardin Müzesi ve Sabancı Müzesi’ni ziyaret ediyoruz. 
                    Akşam yemeğimiz, geleneksel Mardin mutfağı eşliğinde Cercis Murat Konağı’nda. 
                    Konaklamamız İzala Hotel'de.
                   
                       
                        </p>
                    </div>
                </div>

                <div class="detail-content">
                    <div style="width: 50%; margin-left: 320px;">
                        <h6>2.gün</h6>
                        <h6>Mardin – Anıtlı - Midyat / 21 Ekim 2023</h6>
                    </div>
                    <div class="container-fluid" style="width: 50%;">
                        <p>
                            Otelde alacağımız kahvaltı sonrası, ilk durağımız Midyat'ın eski ismi ''Hah'' olan tarihi Anıtlı Köyü. Anıtlı köyünde 2000 yıllık Meryem Ana Kilisesini ziyaret ediyoruz. 
                            Midyat’ın meşhur gümüşçülerin de alışveriş imkanı bulduktan sonra “Sıla” dizisinin çekildiği Midyat Konukevi`ni gezmeye başlıyoruz. Üç katlı konağın taş işçiliği gerçekten büyüleyici. 
                            Ama gerçek güzellikler terasa çıktığınızda karşınıza çıkacak. Panoramik Midyat manzarasına doyamayacaksınız. 
                            Yerel bir restoranda alacağımız öğle yemeğinin ardından, dünyanın en eski manastırlarından biri olan Mor Gabriel Manastırı’nı ziyaret ediyoruz.
                            Manastırın temelleri Savurlu Mor Samuel ile Kartminli Mor Şemun tarafından 397 yılında atılmış 615 ve 1049'da Metropolitlik Merkezi olan manastırda, 
                            Kral Arcadius (395-408) zamanında Mor Şemun tarafından barınma ve dua yerleri yapılmıştır. Kral Theodosius (408-450) çağında lahitlerin konacağı abide evi, 
                            Meryemana Kilisesi, Resuller Kilisesi, Kırkşehit Kilisesi, Mor Smuel Mabedi, kral kızı Theodora'nın Mor Smuel tarafından iyileştirilmesi nedeniyle Theodora Kubbesi,
                            Mor Şlemun Mabedi yapılmıştır. Midyat turumuzun ardından Mardin’e dönüyoruz. Akşam yemeğimiz Bağdadi Restoran’da.
                   
                       
                        </p>
                    </div>
                </div>

                <div class="detail-content">
                    <div style="width: 50%; margin-left: 320px;">
                        <h6>3.gün</h6>
                        <h6>Mardin - İstanbul / 24 EYLÜL 2023</h6>
                    </div>
                    <div class="container-fluid" style="width: 50%;">
                        <p>
                            Otelde yapacağımız kahvaltı sonrası, Mardin’i gezmeye devam ediyoruz. İlk olarak Dara Antik Kenti’ne ulaşıyoruz. 
                            Kazıları devam eden bu antik kent için yeni Efes denilmektedir. Dara’nın yapımı Ürdün’de bulunan Petra ile benzerlik göstermektedir.
                            Yapı yekpare kayalar oyularak yapılmıştır. Ardından Mor Behnam ile kız kardeşi Saro adına yapılan ve şu anda Kırklar Kilisesi olarak
                            tanınan kilise iki ismini de erken dönem Hıristiyan efsanelerinden almıştır ve 6. yüzyılın ortalarına ait bir yapıyı ziyaret ediyoruz.Fotoğraf 
                            molamız sonrası, Mardin’de taş işçiliğinin güzelliğini ve önemini gözler önüne seren üstü kemerler ile kapatılmış sokaklarda geziyor ve fotoğraf çekiyoruz.
                            Tarih ve mimari yolculuğuna ara veriyor ve lezzet yolculuğumuz başlıyor. Öğle yemeğimizi meşhur cevizli Mardin Kebabı ile yerel bir restoranda alıyoruz. 
                            Yemek sonrası Ulu Cami’yi geziyor ve kendimizi tekrardan sokaklara bırakıyoruz. Belirli bir süre birlikte gezdikten sonra alışveriş için serbest zamanınız olacak
                            . Buluşma sonrasında Mardin havalimanına hareket ediyoruz. Varışımız ve işlemler sonrası TK2677 sefer sayılı uçuş ile saat 20:20’de İstanbul Havalimanı’na hareket ediyoruz. 
                            Planlanan iniş saati 22.20’dur. Hayat bir yolculuktur, başka bir yolculukta tekrar görüşmek dileğiyle…
                   
                       
                        </p>
                    </div>
                </div>


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


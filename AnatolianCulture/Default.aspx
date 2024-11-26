<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
            /*color: #29cdcd;*/
            font-weight: bold;
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
    </style>
    <section style="height: 111px; background: #0a0a09;"></section>
    <section>
        <div class="container mt-5 mb-5">
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
        </div>

    </section>

</asp:Content>


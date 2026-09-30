<%@ Page Title="Home"
    Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="Home.aspx.cs"
    Inherits="Cake_ordering_asp_project.WebForm5" %>

<%@ Register Src="~/Footer.ascx"
    TagName="Footer"
    TagPrefix="uc1" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================
           HOME PAGE
        ========================================= */

        .home-page {
            width: 100%;
            background-color: #fff8f2;
        }


        /* =========================================
           HERO VIDEO
        ========================================= */

        .hero-video {
            position: relative;

            width: 100%;

            /* NORMAL VIDEO HEIGHT */
            height: 500px;

            overflow: hidden;

            background-color: #000;
        }


        .hero-video video {
            width: 100%;
            height: 100%;

            object-fit: cover;

            display: block;
        }


        /* =========================================
           VIDEO OVERLAY
        ========================================= */

        .video-overlay {
            position: absolute;

            top: 0;
            left: 0;

            width: 100%;
            height: 100%;

            background: rgba(0, 0, 0, 0.30);

            display: flex;

            align-items: center;
            justify-content: center;

            text-align: center;
        }


        /* =========================================
           HERO CONTENT
        ========================================= */

        .hero-content {
            color: white;

            width: 100%;
            max-width: 850px;

            padding: 20px;
        }


        /* =========================================
           MAIN HEADING
        ========================================= */

        .hero-content h1 {
            font-family: Georgia, "Times New Roman", serif;

            font-size: 52px;

            line-height: 1.15;

            font-weight: bold;

            margin: 0 0 15px 0;

            letter-spacing: 0.5px;

            text-shadow:
                2px 3px 7px rgba(0, 0, 0, 0.75);
        }


        .hero-content h1 span {
            color: #ff4d6d;
        }


        /* =========================================
           SUBTITLE
        ========================================= */

        .hero-content p {
            font-family: Arial, sans-serif;

            font-size: 20px;

            line-height: 1.5;

            margin: 0 0 25px 0;

            color: #ffffff;

            letter-spacing: 0.3px;

            text-shadow:
                1px 2px 5px rgba(0, 0, 0, 0.8);
        }


        /* =========================================
           SHOP BUTTON
        ========================================= */

        .shop-button {
            display: inline-block;

            padding: 13px 30px;

            background-color: #8b4528;

            color: white;

            text-decoration: none;

            border-radius: 25px;

            font-family: Arial, sans-serif;

            font-size: 16px;

            font-weight: bold;

            transition: all 0.3s ease;
        }


        .shop-button:hover {
            background-color: #c93650;

            transform: translateY(-2px);
        }


        /* =========================================
           FEATURES SECTION
        ========================================= */

        .features {

            width: 100%;

            display: flex;

            flex-direction: row;

            justify-content: center;

            align-items: stretch;

            flex-wrap: nowrap;

            gap: 20px;

            padding: 35px 30px 45px 30px;

            background-color: #fff8f2;
        }


        /* =========================================
           FEATURE BOX
        ========================================= */

        .feature-box {

            width: 300px;

            height: 145px;

            flex: 0 0 300px;

            background-color: #ffffff;

            padding: 22px 20px;

            text-align: center;

            border-radius: 12px;

            box-shadow:
                0 4px 12px rgba(0, 0, 0, 0.12);

            transition: all 0.3s ease;
        }


        .feature-box:hover {

            transform: translateY(-4px);

            box-shadow:
                0 8px 18px rgba(0, 0, 0, 0.16);
        }


        /* =========================================
           FEATURE HEADING
        ========================================= */

        .feature-box h3 {

            color: #6b3520;

            font-family: Arial, sans-serif;

            font-size: 18px;

            font-weight: bold;

            margin: 0 0 10px 0;
        }


        /* =========================================
           FEATURE DESCRIPTION
        ========================================= */

        .feature-box p {

            color: #666666;

            font-family: Arial, sans-serif;

            font-size: 14px;

            line-height: 1.5;

            margin: 0;
        }


        /* =========================================
           TABLET
        ========================================= */

        @media screen and (max-width: 1000px) {

            .features {

                gap: 15px;

                padding-left: 15px;
                padding-right: 15px;
            }

            .feature-box {

                width: 30%;

                flex: 1;

                height: 150px;
            }
        }


        /* =========================================
           MOBILE
        ========================================= */

        @media screen and (max-width: 700px) {

            .hero-video {

                height: 450px;
            }


            .hero-content h1 {

                font-size: 40px;
            }


            .hero-content p {

                font-size: 17px;

                margin-bottom: 22px;
            }


            .shop-button {

                font-size: 15px;

                padding: 12px 25px;
            }


            .features {

                flex-direction: column;

                align-items: center;

                flex-wrap: nowrap;

                padding: 30px 15px;

                gap: 18px;
            }


            .feature-box {

                width: 90%;

                max-width: 320px;

                flex: none;

                height: auto;

                min-height: 140px;
            }


            .feature-box h3 {

                font-size: 18px;
            }


            .feature-box p {

                font-size: 14px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <div class="home-page">


        <!-- =========================================
             HERO VIDEO
        ========================================= -->

        <section class="hero-video">


            <video
                autoplay="autoplay"
                muted="muted"
                loop="loop"
                playsinline="playsinline"
                preload="auto">


                <source
                    src="<%= ResolveUrl("~/Videos/CakeHeaven_Home_Video.mp4") %>"
                    type="video/mp4" />


                Your browser does not support HTML5 video.


            </video>


            <!-- VIDEO TEXT -->

            <div class="video-overlay">


                <div class="hero-content">


                    <h1>

                        Welcome to
                        <br />

                        Cake<span>Heaven</span>

                    </h1>


                    <p>

                        Freshly baked, always delicious

                    </p>


                    <a href="Products.aspx"
                       class="shop-button">

                        Explore Our Products

                    </a>


                </div>


            </div>


        </section>



        <!-- =========================================
             THREE FEATURE BOXES
        ========================================= -->

        <section class="features">


            <!-- BOX 1 -->

            <div class="feature-box">

                <h3>
                    Freshly Baked
                </h3>

                <p>
                    Fresh cakes and pastries made
                    with quality ingredients.
                </p>

            </div>



            <!-- BOX 2 -->

            <div class="feature-box">

                <h3>
                    Delicious Taste
                </h3>

                <p>
                    Enjoy delicious cakes, pastries
                    and cupcakes for every occasion.
                </p>

            </div>



            <!-- BOX 3 -->

            <div class="feature-box">

                <h3>
                    Easy Ordering
                </h3>

                <p>
                    Choose your favourite product
                    and add it to your cart easily.
                </p>

            </div>


        </section>


    </div>


</asp:Content>
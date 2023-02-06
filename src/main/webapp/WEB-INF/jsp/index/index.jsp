<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>


<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookstrap</title>
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@700&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick.css">
    <link rel="stylesheet" type="text/css" href="${contextRoot}/css/slick-theme.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

    <style>
        .top_search_table {
            padding-left: 50px;
        }

        .searchBar {
            padding-left: 500px;
        }

        .w-10 {
            width: 10%;
        }

        .ms-45 {
            margin-left: 30px;
        }

        .logoFont {
            font-family: 'Noto Serif', serif;
        }

        /* body {
            font-family: 'Noto Serif', serif;
        } */

        .nav-link {
            position: relative;
        }

        .nav-link:hover {
            border-bottom: 2px solid black;
        }

        /* .nav-link::after{
           content: '';
           opacity: 0;
           transition: all 0.2s;
           height: 2px;
            width: 20%;
            background-color: black;
            position: absolute;
            border: 0;
            left: 0;
        } */

        /* .nav-link{
            opacity: 1;
        } */

        .slick-prev:before {
            color: black;
        }

        .slick-next::before {
            color: black;
        }

        body {
            font-family: 'Noto Sans TC', sans-serif;
        }
        
         .icon-text {
            text-decoration: none;
            color: black;
        }

        .icon-text:hover {
            color: black;
        }
    </style>

</head>

<body>
    <header>


        <nav class="navbar navbar-expand navbar-dark bg-dark">

            <img src="logo/logo2.png" alt="Logo" height="60" class="me-2 ms-5">

            <a class="navbar-brand logoFont" href="#">Bookstrap</a>
            <a class="navbar-brand" href="#"></a>




            <div class="container-fluid d-flex justify-content-end">

                <a href="#" class=" text-light me-2 pe-2 border-light border-end"><i
                        class="fa-regular fa-user me-1"></i>會員登入</a>

                <a href="#" class=" text-light me-5">註冊會員</a>

            </div>






            </div>
        </nav>

        <div class="container d-flex mt-2 justify-content-center">
            <div class="top_search_table">
                <ul class="nav">

                    <li class="nav-item">
                        <a class="nav-link active-2 border border-2 border-dark border-end border-top-0 border-bottom-0 border-start-0  text-dark"
                            aria-current="page" href="#"><i class="fa-solid fa-location-dot"></i>分店位置 </a>
                    </li> <br>
                    <li class="nav-item">
                        <a class="nav-link border border-2 border-dark border-end border-top-0 border-bottom-0 border-start-0  text-dark"
                            href="#">線上商城</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link border border-2 border-dark border-end border-top-0 border-bottom-0 border-start-0  text-dark text-dark"
                            href="#">優惠資訊</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link border border-2 border-dark border-end border-top-0 border-bottom-0 border-start-0  text-dark text-dark"
                            href="#">當月熱銷</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link border border-2 border-dark border-end border-top-0 border-bottom-0 border-start-0 border-end-0 text-dark text-dark"
                            href="#">部落格</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="container d-flex mt-2">
            <!-- https://getbootstrap.com/docs/5.2/utilities/spacing/#margin-and-padding -->

            <div class="input-group mb-2 mt-2">

                <select class="form-select me-10" id="inputGroupSelect01">
                    <option selected>全部</option>
                    <option value="1">書籍</option>
                    <option value="2">電子書</option>
                    <option value="3">語言</option>
                    <option value="4">somethingElse</option>

                </select>
                <input type="text" class="form-control w-75" aria-label="Text input with dropdown button">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2"><i
                        class="fa-solid fa-magnifying-glass"></i></button>
            </div>
        </div>

        <div class="container-fluid">
            <div class="bottom_search_table ms-5">
                <ul class="nav justify-content-center">
                    <li class="nav-item ">
                        <p class="nav-link active text-dark disable fs-5 me-3">書籍||</p>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fs-5 me-3" href="#">小說</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fs-5 me-3" href="#">中文</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fs-5 me-3" href="#">外文</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fs-5 me-3" href="#">電子書</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fs-5 me-3" href="#">青少年</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fs-5 me-3" href="#">孩童</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fs-5 me-3" href="#">禮品</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fs-5 me-3" href="#">音樂</a>
                    </li>
                </ul>
            </div>
        </div>


        <div class="container-fluid p-3 mb-2 bg-dark text-white" style="height: 50px;">

            <p class="text-light fs-6 lh-1 text-center">限時優惠 凡購物滿五百免運費</p>


        </div>


    </header>


    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="5000">
                <img src="sildePage/1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="5000">
                <img src="sildePage/2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="sildePage/3.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div class="container mx-auto mt-5 border border-start-0 border-end-0 border-top-0">

        <p class="text-center mt-3 mb-3">Bookstrap 滿足您在家裡也能找到最難買的書，300萬本各式書籍以及100萬件周邊商品任您選!</p>

    </div>


    <!-- 類別縮圖 -->
    <div class="container mt-3">

        <div class="second-carousel border border-end-0 border-start-0 border-top-0 mt-2">
            <div class="slider">
                <a href="#" class="icon-text"><img src="icon/medal.png" width="120px" class="mx-auto">
                    <p class="text-center">暢銷書籍</p>
                </a>
            </div>
            <div class="slider">
                <a href="#" class="icon-text"><img src="icon/book.png" width="120px" class="mx-auto">
                    <p class="text-center">
                        最新發行</p>
                </a>
            </div>
            <div class="slider">
                <a href="#" class="icon-text"><img src="icon/audiobook.png" width="120px" class="mx-auto">
                    <p class="text-center">
                        有聲書</p>
                </a>
            </div>
            <div class="slider">
                <a href="#" class="icon-text"><img src="icon/coming-soon.png" width="120px" class="mx-auto">
                    <p class="text-center">
                        即將上架</p>
                </a>
            </div>
            <div class="slider">
                <a href="#" class="icon-text"><img src="icon/coupon.png" width="120px" class="mx-auto">
                    <p class="text-center">
                        優惠資訊</p>
                </a>
            </div>
            <div class="slider">
                <a href="#" class="icon-text"><img src="icon/pen-tool.png" width="120px" class="mx-auto">
                    <p class="text-center">
                        特別精裝</p>
                </a>
            </div>
            <div class="slider">
                <a href="#" class="icon-text"><img src="icon/gift.png" width="120px" class="mx-auto">
                    <p class="text-center">
                        禮品</p>
                </a>
            </div>

        </div>
    </div>


    <!-- 分界廣告 -->

    <div class="container-fluid">

        <img src="sildePage/adv1.jpg" class="w-100 mt-5" alt="">

    </div>



    <!-- 即將上架 頭 寫死 僅供參考-->

    <div class="container mt-5">
        <nav>
            <span class="fs-2">即將上架</span> <br>
            <div class="d-flex align-items-center">
                <img src="logo/logo2.png" width="4%" alt="">
                <p>By Bookstrap</p>
            </div>
            <div class="nav nav-tabs " id="nav-tab" role="tablist">

                <!-- 要改改這裡的data-bs-target="#..." -->
                <!-- id 中間名稱 改  新書推薦t1 內附類別 i1、 i2 依此類推-->
                <button
                    class="nav-link active border border-2 border-dark rounded-0 border-top-0 border-bottom-0 text-dark"
                    id="nav-t1i1-tab" data-bs-toggle="tab" data-bs-target="#nav-t1i1" type="button" role="button"
                    aria-controls="nav-t1i1" aria-selected="true">中文</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t1i2-tab" data-bs-toggle="tab" data-bs-target="#nav-t1i2" type="button" role="tab"
                    aria-controls="nav-t1i2" aria-selected="false">外文</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t1i3-tab" data-bs-toggle="tab" data-bs-target="#nav-t1i3" type="button" role="tab"
                    aria-controls="nav-t1i3" aria-selected="false">人氣小說</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t1i4-tab" data-bs-toggle="tab" data-bs-target="#nav-t1i4" type="button" role="tab"
                    aria-controls="nav-t1i4" aria-selected="false">雜誌新刊</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t1i5-tab" data-bs-toggle="tab" data-bs-target="#nav-t1i5" type="button" role="tab"
                    aria-controls="nav-t1i5" aria-selected="false">人氣小說</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t1i6-tab" data-bs-toggle="tab" data-bs-target="#nav-t1i6" type="button" role="tab"
                    aria-controls="nav-t1i6" aria-selected="false">創意生活</button>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">

            <!-- nav-home 改此id -->
            <div class="tab-pane fade show active " id="nav-t1i1" role="tabpanel" aria-labelledby="nav-home-tab"
                tabindex="0">

                <!-- slick slider -->
                <div class="container ">
                    <div class="homeslider">
                        <div class="slider">
                            <img src="sildePage/i1.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i2.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i3.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i1.jpg">
                        </div>
                        <div class="slider">
                            <img src="sildePage/i2.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i3.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i1.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i2.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i3.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i1.jpg">
                        </div>
                        <div class="slider">
                            <img src="sildePage/i2.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i3.jpg">
                        </div>
                    </div>
                </div>

            </div>
            <div class="tab-pane fade" id="nav-t1i2" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
                <!-- slick slider -->
                <div class="container ">
                    <div class="homeslider">
                        <div class="slider">
                            <img src="sildePage/i4.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i5.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i6.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i4.jpg">
                        </div>
                        <div class="slider">
                            <img src="sildePage/i5.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i6.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i4.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i5.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i6.jpg">
                        </div>


                    </div>
                </div>





            </div>
            <div class="tab-pane fade" id="nav-t1i3" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                t1i3</div>

            <div class="tab-pane fade" id="nav-t1i4" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                t1i4</div>


            <div class="tab-pane fade" id="nav-t1i5" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">
                t1i5
            </div>

            <div class="tab-pane fade" id="nav-t1i6" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                t1i6</div>

        </div>
    </div>
    <!-- 新書推薦 尾 -->



    <!-- 本周熱銷 頭 (寫死 僅供參考)-->

    <div class="container mt-5">
        <nav>
            <span class="fs-2">新書推薦</span> <br>
            <div class="d-flex align-items-center">
                <img src="logo/logo2.png" width="4%" alt="">
                <p>By Bookstrap</p>
            </div>
            <div class="nav nav-tabs " id="nav-tab" role="tablist">

                <!-- 要改改這裡的data-bs-target="#..." -->
                <!-- id 中間名稱 改  本週熱銷t2 內附類別 i1、 i2 依此類推-->
                <button
                    class="nav-link active border border-2 border-dark rounded-0 border-top-0 border-bottom-0 text-dark"
                    id="nav-t2i1-tab" data-bs-toggle="tab" data-bs-target="#nav-t2i1" type="button" role="button"
                    aria-controls="nav-t2i1" aria-selected="true">中文</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t2i2-tab" data-bs-toggle="tab" data-bs-target="#nav-t2i2" type="button" role="tab"
                    aria-controls="nav-t2i2" aria-selected="false">外文</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t2i3-tab" data-bs-toggle="tab" data-bs-target="#nav-t2i3" type="button" role="tab"
                    aria-controls="nav-t2i3" aria-selected="false">人氣小說</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t2i4-tab" data-bs-toggle="tab" data-bs-target="#nav-t2i4" type="button" role="tab"
                    aria-controls="nav-t2i4" aria-selected="false">雜誌新刊</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t2i5-tab" data-bs-toggle="tab" data-bs-target="#nav-t2i5" type="button" role="tab"
                    aria-controls="nav-t2i5" aria-selected="false">人氣小說</button>
                <button
                    class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark"
                    id="nav-t2i6-tab" data-bs-toggle="tab" data-bs-target="#nav-t2i6" type="button" role="tab"
                    aria-controls="nav-t2i6" aria-selected="false">創意生活</button>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">

            <!-- nav-home 改此id -->
            <div class="tab-pane fade show active " id="nav-t2i1" role="tabpanel" aria-labelledby="nav-home-tab"
                tabindex="0">

                <div class="container ">
                    <div class="homeslider">
                        <div class="slider">
                            <img src="sildePage/i1.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i2.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i3.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i1.jpg">
                        </div>
                        <div class="slider">
                            <img src="sildePage/i2.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i3.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i1.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i2.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i3.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i1.jpg">
                        </div>
                        <div class="slider">
                            <img src="sildePage/i2.jpg">
                        </div>

                        <div class="slider">
                            <img src="sildePage/i3.jpg">
                        </div>
                    </div>
                </div>

            </div>
            <div class="tab-pane fade" id="nav-t2i2" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
                t2i2</div>
            <div class="tab-pane fade" id="nav-t2i3" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                t2i3</div>

            <div class="tab-pane fade" id="nav-t2i4" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                t2i4</div>


            <div class="tab-pane fade" id="nav-t2i5" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">
                t2i5
            </div>

            <div class="tab-pane fade" id="nav-t2i6" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                t2i6</div>

        </div>
    </div>

    <!-- 本周熱銷 尾 -->


    <div class="container">
        <footer class="text-muted mt-5 border border-2 border-bottom-0 border-start-0 border-end-0">

            <p class="float-right justify-content-center">
                ##########Test only############
                客戶服務專線：02-26535588 傳真：02-27885008 服務時間：週一~五 8:00~19:00，週六~日、例假日 9:00~18:00，365天全年無休

                博客來數位科技股份有限公司 統編 : 96922355 地址：臺灣 115 台北市南港區八德路四段768巷1弄18號B1之1 食品業者登陸字號：A-196922355-00000-9

                Copyright © since 1995 books.com.tw All Rights Reserved.</p>
            <div class="d-flex justify-content-center">
                <a href="">服務條款</a>
                <a href="" class="ms-2">隱私全政策</a>
            </div>
    </div>
    </footer>
    </div>


    <!-- //////////////js///////////// -->
    <script src="js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript" src="js/jquery-3.6.3.min.js"></script>
    <script type="text/javascript" src="js/slick.js"></script>

    <script>
        $('.homeslider').slick({
            centerMode: true,
            centerPadding: '60px',
            slidesToShow: 6,
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 1
                    }
                }
            ]
        });

        $('.second-carousel').slick({
            slidesToShow: 5,
            slidesToScroll: 1,


        });
    </script>
</body>
</body>
</html>
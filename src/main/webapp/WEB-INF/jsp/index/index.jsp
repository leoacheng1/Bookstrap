<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Bookstrap</title>
            <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet" />

            <link rel="stylesheet" type="text/css" href="css/slick.css" />
            <link rel="stylesheet" type="text/css" href="css/slick-theme.css" />

            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&display=swap" rel="stylesheet" />

            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@600&display=swap" rel="stylesheet" />

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
                    font-family: 'Roboto', sans-serif;
                }


                .nav-link {

                    position: relative;
                }



                .nav-link::after {
                    content: '';
                    opacity: 0;
                    transition: all 0.3s;
                    height: 3px;
                    width: 100%;
                    background-color: black;
                    position: absolute;
                    bottom: 0;
                    left: 0;
                }

                .nav-link:hover::after {
                    content: '';
                    opacity: 1;
                }

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

                .slider-title-en {
                    font-family: 'Roboto Slab', serif;
                }

                .bg-custom {
                    background-color: #5ea0cc;
                }
            </style>
        </head>

        <body>
            <jsp:include page="../layout/header.jsp"></jsp:include>

            <div class="container-fluid d-flex mt-2 mb-2 justify-content-center ">
                <div class="top_search_table">
                    <ul class="nav">

                        <li class="nav-item searchArea" id="searchArea">
                            <a class="nav-link active-2 text-dark fs-5 me-5 " aria-current="page"
                                href="${contextRoot}/books/allpage2">
                                條件搜尋
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active-2 text-dark fs-5 me-5" aria-current="page" href="#"><i
                                    class="fa-solid fa-location-dot"></i>分店位置
                            </a>
                        </li>
                        <br />
                        <li class="nav-item">
                            <a class="nav-link b text-dark text-dark fs-5 me-5" href="${contextRoot}/chatbox">優惠資訊</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark text-dark fs-5 me-5" href="#">當月熱銷</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark text-dark fs-5 me-5" href="#">部落格</a>
                        </li>
                    </ul>
                </div>
            </div>

            

            <!-- <div id="booksearch" class="container"></div> -->

            <div class="container-fluid p-3 mb-2 bg-custom text-white" style="height: 50px">
                <p class="text-light fs-6 lh-1 text-center">
                    限時優惠 凡購物滿五百免運費
                </p>
            </div>


            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="5000">
                        <img src="sildePage/1.jpg" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item" data-bs-interval="5000">
                        <img src="sildePage/2.jpg" class="d-block w-100" alt="..." />
                    </div>
                    <div class="carousel-item">
                        <img src="sildePage/3.jpg" class="d-block w-100" alt="..." />
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
                <p class="text-center mt-3 mb-3">
                    Bookstrap
                    滿足您想被書困住的需求，在家裡也能找到最難買的書，300萬本各式書籍以及100萬件周邊商品任您選!
                </p>
            </div>

            <!-- 類別縮圖 -->
            <div class="container mt-3">
                <div class="second-carousel border border-end-0 border-start-0 border-top-0 mt-2">
                    <div class="slider">
                        <a href="#" class="icon-text"><img src="icon/medal.png" width="120px" class="mx-auto" />
                            <p class="text-center">暢銷書籍</p>
                        </a>
                    </div>
                    <div class="slider">
                        <a href="#" class="icon-text"><img src="icon/book.png" width="120px" class="mx-auto" />
                            <p class="text-center">最新發行</p>
                        </a>
                    </div>
                    <div class="slider">
                        <a href="#" class="icon-text"><img src="icon/coming-soon.png" width="120px" class="mx-auto" />
                            <p class="text-center">即將上架</p>
                        </a>
                    </div>
                    <div class="slider">
                        <a href="#" class="icon-text"><img src="icon/coupon.png" width="120px" class="mx-auto" />
                            <p class="text-center">優惠資訊</p>
                        </a>
                    </div>
                    <div class="slider">
                        <a href="#" class="icon-text"><img src="icon/pen-tool.png" width="120px" class="mx-auto" />
                            <p class="text-center">特別精裝</p>
                        </a>
                    </div>
                </div>
            </div>

            <!-- 分界廣告 -->

            <div class="container-fluid">
                <!-- <img src="sildePage/adv1.jpg" class="w-100 mt-5" alt="" /> -->
            </div>

            <!-- 即將上架 頭 寫死 僅供參考-->

            <div class="container mt-5">
                <nav>
                    <!-- <span class="fs-4">即將上架</span> <br /> -->
                    <div class="d-flex align-items-center align-middle">

                        <p class="ms-2 fs-4 my-auto mb-2">新書推薦</p>
                    </div>
                    <div class="nav nav-tabs" id=" nav-tab" role="tablist">
                        <!-- 要改改這裡的data-bs-target="#..." -->
                        <!-- id 中間名稱 改  新書推薦t1 內附類別 i1、 i2 依此類推-->
                        <button class="btn btn-light rounded-0  active" id="nav-t1i1-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t1i1" type="button" role="button" aria-controls="nav-t1i1"
                            aria-selected="true">
                            中文
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t1i2-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t1i2" type="button" role="tab" aria-controls="nav-t1i2"
                            aria-selected="false">
                            外文
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t1i3-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t1i3" type="button" role="tab" aria-controls="nav-t1i3"
                            aria-selected="false">
                            人氣小說
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t1i4-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t1i4" type="button" role="tab" aria-controls="nav-t1i4"
                            aria-selected="false">
                            雜誌新刊
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t1i5-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t1i5" type="button" role="tab" aria-controls="nav-t1i5"
                            aria-selected="false">
                            人氣小說
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t1i6-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t1i6" type="button" role="tab" aria-controls="nav-t1i6"
                            aria-selected="false">
                            創意生活
                        </button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <!-- nav-home 改此id -->
                    <div class="tab-pane fade show active" id="nav-t1i1" role="tabpanel" aria-labelledby="nav-home-tab"
                        tabindex="0">
                        <!-- slick slider -->
                        <div class="container">
                            <div class="homeslider">
                                <div class="slider">
                                    <img src="sildePage/i1.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i2.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i3.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i1.jpg" />
                                </div>
                                <div class="slider">
                                    <img src="sildePage/i2.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i3.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i1.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i2.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i3.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i1.jpg" />
                                </div>
                                <div class="slider">
                                    <img src="sildePage/i2.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i3.jpg" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-t1i2" role="tabpanel" aria-labelledby="nav-profile-tab"
                        tabindex="0">
                        <!-- slick slider -->
                        <div class="container">
                            <div class="homeslider">
                                <div class="slider">
                                    <img src="sildePage/i4.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i5.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i6.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i4.jpg" />
                                </div>
                                <div class="slider">
                                    <img src="sildePage/i5.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i6.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i4.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i5.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i6.jpg" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-t1i3" role="tabpanel" aria-labelledby="nav-contact-tab"
                        tabindex="0">
                        t1i3
                    </div>

                    <div class="tab-pane fade" id="nav-t1i4" role="tabpanel" aria-labelledby="nav-contact-tab"
                        tabindex="0">
                        t1i4
                    </div>

                    <div class="tab-pane fade" id="nav-t1i5" role="tabpanel" aria-labelledby="nav-disabled-tab"
                        tabindex="0">
                        t1i5
                    </div>

                    <div class="tab-pane fade" id="nav-t1i6" role="tabpanel" aria-labelledby="nav-contact-tab"
                        tabindex="0">
                        t1i6
                    </div>
                </div>
            </div>
            <!-- 即將上架 尾 -->


            <!-- 本月熱銷 頭 (寫死 僅供參考)-->

            <div class="container mt-5 mb-5">
                <nav>

                    <div class="d-flex align-items-center">

                        <p class="ms-2 fs-4 my-auto">本月熱銷</p>
                    </div>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <!-- 要改改這裡的data-bs-target="#..." -->
                        <!-- id 中間名稱 改  本週熱銷t2 內附類別 i1、 i2 依此類推-->
                        <button class="btn btn-light rounded-0 active" id="nav-t3i1-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t3i1" type="button" role="button" aria-controls="nav-t3i1"
                            aria-selected="true">
                            中文
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t3i2-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t3i2" type="button" role="tab" aria-controls="nav-t3i2"
                            aria-selected="false">
                            外文
                        </button>
                        <button class="btn btn-light rounded-0 e" id="nav-t3i3-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t3i3" type="button" role="tab" aria-controls="nav-t3i3"
                            aria-selected="false">
                            人氣小說
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t3i4-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t3i4" type="button" role="tab" aria-controls="nav-t3i4"
                            aria-selected="false">
                            雜誌新刊
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t3i5-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t3i5" type="button" role="tab" aria-controls="nav-t3i5"
                            aria-selected="false">
                            人氣小說
                        </button>
                        <button class="btn btn-light rounded-0 " id="nav-t3i6-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-t3i6" type="button" role="tab" aria-controls="nav-t3i6"
                            aria-selected="false">
                            創意生活
                        </button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <!-- nav-home 改此id -->
                    <div class="tab-pane fade show active" id="nav-t3i1" role="tabpanel" aria-labelledby="nav-home-tab"
                        tabindex="0">
                        <div class="container">
                            <div class="homeslider">
                                <div class="slider">
                                    <img src="sildePage/i1.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i2.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i3.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i1.jpg" />
                                </div>
                                <div class="slider">
                                    <img src="sildePage/i2.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i3.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i1.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i2.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i3.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i1.jpg" />
                                </div>
                                <div class="slider">
                                    <img src="sildePage/i2.jpg" />
                                </div>

                                <div class="slider">
                                    <img src="sildePage/i3.jpg" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-t3i2" role="tabpanel" aria-labelledby="nav-profile-tab"
                        tabindex="0">
                        t3i2
                    </div>
                    <div class="tab-pane fade" id="nav-t3i3" role="tabpanel" aria-labelledby="nav-contact-tab"
                        tabindex="0">
                        t3i3
                    </div>

                    <div class="tab-pane fade" id="nav-t3i4" role="tabpanel" aria-labelledby="nav-contact-tab"
                        tabindex="0">
                        t3i4
                    </div>

                    <div class="tab-pane fade" id="nav-t3i5" role="tabpanel" aria-labelledby="nav-disabled-tab"
                        tabindex="0">
                        t3i5
                    </div>

                    <div class="tab-pane fade" id="nav-t3i6" role="tabpanel" aria-labelledby="nav-contact-tab"
                        tabindex="0">
                        t3i6
                    </div>
                </div>
            </div>

            <!-- 本月熱銷 尾 -->


            <!-- 推薦卡1 top -->
            <div class="container mt-5">
                <h4 class="mb-4">Bookstrap library</h4>
                <div class="shadow card mb-3 p-2 border border-2 border-opacity-25" style="max-width: 100%;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <a href=""><img src="ad1/9782072940897-xs.webp" class="img-fluid rounded-start"
                                    alt="..."></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body ">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural
                                    lead-in to
                                    additional content. This content is a little bit longer. Lorem, ipsum dolor sit amet
                                    consectetur adipisicing elit. Minus aperiam distinctio dolores quibusdam neque, non
                                    rerum facere harum similique autem eum vitae illum alias expedita ut reprehenderit?
                                    Optio, praesentium deserunt. Lorem ipsum dolor sit, amet consectetur adipisicing
                                    elit.
                                    Veritatis, animi. Excepturi similique magnam quae possimus explicabo aut odio qui
                                    libero
                                    illo quasi numquam, deserunt velit dolor harum facere, voluptatum debitis.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                                <button type="button" class="btn btn-success ">加入購物車 NT:500</button>
                            </div>


                        </div>
                    </div>
                </div>


                <div class="shadow card mb-3 p-2 border border-2 border-opacity-25" style="max-width: 100%;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <a href=""><img src="ad1/2.webp" class="img-fluid rounded-start" alt="..."></a>
                        </div>
                        <div class="col-md-8">
                            <div class="card-body ">
                                <h5 class="card-title">Card title</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural
                                    lead-in to
                                    additional content. This content is a little bit longer. Lorem, ipsum dolor sit amet
                                    consectetur adipisicing elit. Minus aperiam distinctio dolores quibusdam neque, non
                                    rerum facere harum similique autem eum vitae illum alias expedita ut reprehenderit?
                                    Optio, praesentium deserunt. Lorem ipsum dolor sit, amet consectetur adipisicing
                                    elit.
                                    Veritatis, animi. Excepturi similique magnam quae possimus explicabo aut odio qui
                                    libero
                                    illo quasi numquam, deserunt velit dolor harum facere, voluptatum debitis.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                            </div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                                <button type="button" class="btn btn-success ">加入購物車 NT:480</button>
                            </div>


                        </div>
                    </div>
                </div>



            </div>
            <!-- 推薦卡1 bottom -->

            <div class="container-fluid mt-5 p-5">
                <img src="sildePage/adv1.jpg" width="100%">

            </div>

            <!-- 推薦卡2 top -->
            <div class="container mt-5">
                <h4 class="mb-5 mt-5">Bookstrap library</h4>
                <div class="container ">
                    <div class="row row-cols-1 row-cols-md-2 g-4">
                        <div class="col">
                            <div class="card pb-3 pe-3 shadow border-light">
                                <img src="ad1/3.webp" class="card-img-top w-50 mx-auto" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a natural
                                        lead-in
                                        to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                                    <button type="button" class="btn btn-success ">加入購物車 NT:500</button>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card pb-3 pe-3 shadow border-light">
                                <img src="ad1/4.webp" class="card-img-top w-50 mx-auto" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a natural
                                        lead-in
                                        to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                                    <button type="button" class="btn btn-success ">加入購物車 NT:500</button>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card pb-3 pe-3 shadow border-light">
                                <img src="ad1/5.webp" class="card-img-top w-50 mx-auto" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a natural
                                        lead-in
                                        to additional content.</p>
                                </div>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                                    <button type="button" class="btn btn-success ">加入購物車 NT:500</button>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card pb-3 pe-3 shadow border-light">
                                <img src="ad1/6.webp" class="card-img-top w-50 mx-auto" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">This is a longer card with supporting text below as a natural
                                        lead-in
                                        to additional content. This content is a little bit longer.</p>
                                </div>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">

                                    <button type="button" class="btn btn-success ">加入購物車 NT:500</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 推薦卡2 bottom-->




            <footer class="text-muted mt-5 border border-2 border-bottom-0 border-start-0 border-end-0">
                <div class="container">
                    <p class="float-right justify-content-center">
                        ##########Test only############ 客戶服務專線：02-26535588
                        傳真：02-27885008 服務時間：週一~五 8:00~19:00，週六~日、例假日
                        9:00~18:00，365天全年無休 Bookstrap數位科技股份有限公司 統編 : 96922355
                        地址：臺灣 115 台北市南港區八德路四段768巷1弄18號B1之1
                        食品業者登陸字號：A-196922355-00000-9 Copyright © since 1995
                        books.com.tw All Rights Reserved.
                    </p>
                    <div class="d-flex justify-content-center">
                        <a href="">服務條款</a>
                        <a href="" class="ms-2">隱私全政策</a>
                    </div>
                </div>
            </footer>

            <!-- //////////////js///////////// -->
            <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
            <script type="text/javascript" src="js/slick.js"></script>
            <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>


            <script>
                $(".homeslider").slick({
                    centerMode: true,
                    centerPadding: "60px",
                    slidesToShow: 6,
                    responsive: [
                        {
                            breakpoint: 768,
                            settings: {
                                arrows: false,
                                centerMode: true,
                                centerPadding: "40px",
                                slidesToShow: 3,
                            },
                        },
                        {
                            breakpoint: 480,
                            settings: {
                                arrows: false,
                                centerMode: true,
                                centerPadding: "40px",
                                slidesToShow: 1,
                            },
                        },
                    ],
                });

                $(".second-carousel").slick({
                    slidesToShow: 5,
                    slidesToScroll: 1,
                });

                // var sendOutBtn = document.querySelector(`[data-btnid="sendOutBtn"]`)
                // sendOutBtn.addEventListener('click', function (e) {
                //     console.log("有抓到")
                //     let searchField = ""
                //     let searchArea = document.querySelector(`[data-search="searchArea"]`).value
                //     if (searchArea != null) {
                //         searchField += searchArea
                //     }
                //     console.log("searchField:" + searchField)

                //     axios({
                //         method: 'post',
                //         url: "http://localhost:8080/Bookstrap/books/page3",
                //         params: {
                //             p: 1,
                //             name: searchField
                //         }
                //     })
                //         .then(res => {
                //             console.log("OK")
                //             window.location.href = 'http://localhost:8080/Bookstrap/books/search';
                //         })
                //         .catch(err => {
                //             console.log("noooo")
                //         })
                // })



            </script>
        </body>

        </html>
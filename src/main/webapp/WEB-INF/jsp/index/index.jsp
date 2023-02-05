<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>


<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booktopia</title>
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@700&display=swap" rel="stylesheet">

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
        
           .nav-link{
            position: relative;
        }

        .nav-link:hover{
            border-bottom: 2px solid black;
        }
    </style>

</head>

<body>
    <header>


        <nav class="navbar navbar-expand navbar-dark bg-dark">

            <img src="logo/logo2.png" alt="Logo" height="60" class="me-2 ms-5">

            <a class="navbar-brand logoFont" href="#">Booktopia</a>
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
                        <a class="nav-link border border-2 border-dark border-end border-top-0 border-bottom-0 border-start-0  text-dark" href="#">部落格</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link border border-2 border-dark border-end border-top-0 border-bottom-0 border-start-0  text-dark text-dark" href="#">優惠資訊</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link border border-2 border-dark border-end border-top-0 border-bottom-0 border-start-0  text-dark text-dark" href="#">當月熱銷</a>
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

        <div class="bottom_search_table">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link active text-dark" aria-current="page" href="#">書籍||</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark  mb-2" href="#">小說</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">中文</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">外文</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">電子書</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">青少年</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">孩童</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">禮品</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="#">音樂</a>
                </li>
            </ul>
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


    <div class="container mt-5 border">
        <nav>
            <span class="fs-2">新書推薦</span> <br>
                <div class="d-flex align-items-center">
            <img src="logo/logo2.png" width="4%" alt=""><p >By Booktopia</p>
        </div>
            <div class="nav nav-tabs " id="nav-tab" role="tablist">
                <button class="nav-link active border border-2 border-dark rounded-0 border-top-0 border-bottom-0 text-dark" id="nav-home-tab" data-bs-toggle="tab"
                    data-bs-target="#nav-home" type="button" role="button" aria-controls="nav-home"
                    aria-selected="true">中文</button>
                <button class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark" id="nav-profile-tab" data-bs-toggle="tab"
                    data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile"
                    aria-selected="false">外文</button>
                <button class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark" id="nav-contact-tab" data-bs-toggle="tab"
                    data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact"
                    aria-selected="false">人氣小說</button>
                    <button class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark" id="nav-contact-tab" data-bs-toggle="tab"
                    data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact"
                    aria-selected="false">雜誌新刊</button>
                    <button class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark" id="nav-contact-tab" data-bs-toggle="tab"
                    data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact"
                    aria-selected="false">人氣小說</button>
                    <button class="nav-link border border-2 border-dark rounded-0 border-top-0 border-bottom-0 border-start-0 text-dark" id="nav-contact-tab" data-bs-toggle="tab"
                    data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact"
                    aria-selected="false">創意生活</button>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active " id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"
                tabindex="0">home</div>
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
                profile</div>
            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
                contact</div>
            <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab"
                tabindex="0">...disable

            </div>
        </div>

    </div>





    <script src="js/bootstrap.bundle.min.js"></script>

</body>
</html>
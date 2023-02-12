<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member main</title>

 <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
 
  <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" type="text/css" href="css/slick.css" />
    <link rel="stylesheet" type="text/css" href="css/slick-theme.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&display=swap"
      rel="stylesheet"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@600&display=swap"
      rel="stylesheet"
    />
  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }

    .b-example-divider {
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }

    .text-center {
      text-align: center;
    }
    
     .logoFont{
      text-decoration: none;
    }
  </style>
  

  <link href="${contextRoot}/css/dashboard.css" rel="stylesheet">
  <link rel="stylesheet" href="${contextRoot}/css/index.css">
</head>
<body>

  <header >
    <div class="sticky-top bg-custom d-flex pt-3 pb-3">
      <div class="container d-flex justify-content-center">
        <img
          src="${contextRoot}/logo/logo2.png"
          alt="Logo"
          height="60"
          class="my-auto"
        />
        <a
          class="logoFont fs-2 my-auto ms-3"
          style="color: white"
          href="http://localhost:8080/Bookstrap/index"
        >
          Bookstrap.com
        </a>
      </div>

      <!-- 蒐尋器 -->
      <!-- https://getbootstrap.com/docs/5.2/utilities/spacing/#margin-and-padding -->

      <div class="input-group d-flex mx-auto my-auto">
        <select class="form-select w-20 d" id="inputGroupSelect01">
          <option selected>全部</option>
          <option value="1">書籍</option>
          <option value="2">電子書</option>
          <option value="3">語言</option>
          <option value="4">somethingElse</option>
        </select>

        <input
          type="text"
          class="form-control w-50"
          aria-label="Text input with dropdown button"
        />
        <button class="btn btn-dark" type="button" id="button-addon2">
          <i class="fa-solid fa-magnifying-glass"></i>
        </button>
      </div>

      <div class="container d-flex mx-auto my-auto justify-content-end">
        <a href="${contextRoot}/shopping/cart" class="text-light me-5"
          ><i class="fa-solid fa-cart-shopping"></i>購物車
        </a>
        <a
          href="${contextRoot}/member/signin"
          class="text-light me-2 pe-2 border-light border-end"
        >
          <i class="fa-regular fa-user me-1"></i>會員登入
        </a>

        <a href="${contextRoot}/member/signup" class="text-light me-5"
          >註冊會員
        </a>
      </div>
    </div>
  </header>



<div class="container-fluid">
    <div class="row">
      <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
        <div class="position-sticky pt-3 sidebar-sticky">
          <ul class="nav flex-column">
            <li class="nav-item">
                <br>
                <br>
              <a class="nav-link " aria-current="page" href="#">
                <span data-feather="home" class="align-text-bottom"></span>
                我的帳戶
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="file" class="align-text-bottom"></span>
                訂單查詢
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="shopping-cart" class="align-text-bottom"></span>
                購物車
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="users" class="align-text-bottom"></span>
                個人資訊
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="heart" class="align-text-bottom"></span>
                追蹤商品
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="credit-card" class="align-text-bottom"></span>
                付款資訊
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="percent" class="align-text-bottom"></span>
                優惠券
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="gift" class="align-text-bottom"></span>
                禮物卡
              </a>
            </li>
          </ul>

          <h6
            class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted text-uppercase">
            <span>會員專區</span>
            <a class="link-secondary" href="#" aria-label="Add a new report">
              <span data-feather="menu" class="align-text-bottom"></span>
            </a>
          </h6>
          <ul class="nav flex-column mb-2">
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="headphones" class="align-text-bottom"></span>
                有聲書
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="book-open" class="align-text-bottom"></span>
                電子書
              </a>
            </li>

          </ul>
        </div>
      </nav>

      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div
          class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-2">
          <div class="container">
            <h3 class="text-center"> 我的帳戶 </h3>
          </div>
        </div>

        <!-- /////// -->
        <div class="container">

          <div class="row row-cols-1 row-cols-md-2 g-4">
            <div class="col">
              <div class="card">

                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card">

                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card">

                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                    additional content.</p>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card">

                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                    additional content. This content is a little bit longer.</p>
                </div>
              </div>
            </div>
          </div>

        </div>



        <!-- ///// -->

    </div>
    </main>
  </div>
  </div>




  <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
    integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
    integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
    crossorigin="anonymous"></script>
  <script src="${contextRoot}/js/dashboard.js"></script>
</html>
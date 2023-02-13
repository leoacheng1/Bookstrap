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
        
			<p>Hello ${memberName}</p>
			
			<div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="${contextRoot}/member/logout">登出</a>
    </div>
       
      </div>
    </div>
  </header>
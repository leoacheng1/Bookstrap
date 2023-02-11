<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="jstl"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${contextRoot}/css/index.css" />
  </head>
  <body>
    <header>
      <div class="bg-custom d-flex pt-3 pb-3">
        <div class="container d-flex justify-content-center">
          <img
            src="${contextRoot}/logo/logo2.png"
            alt="Logo"
            height="60"
            class="my-auto"
          />
          <a
            class="navbar-brand logoFont fs-2 my-auto ms-3"
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

    <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

    <script
      type="text/javascript"
      src="${contextRoot}/js/jquery-3.6.3.min.js"
    ></script>
  </body>
</html>

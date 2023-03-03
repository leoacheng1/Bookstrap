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
      <div class="sticky-top bg-custom d-flex pt-3 pb-3">
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
<!-- 模糊搜尋 -->
<form action="${contextRoot}/books/page3" method="post" modelAttribute="book" style="width: 800px;text-align: center;">
  <input style="display: inline;vertical-align: middle;"
         type="text" name="name" 
         class="form-control w-50 searchArea" id="searchArea" data-search="searchArea"
         aria-label="Text input with dropdown button"/>
    <button class="btn btn-dark sendOutBtn" type="submit" id="button-addon2 sendOutBtn" data-btnid="sendOutBtn" 
            style="display: inline;vertical-align: middle;">
            <i class="fa-solid fa-magnifying-glass"></i>
    </button>
</form>
        </div>


        <div class="container d-flex mx-auto my-auto justify-content-center">
          <a href="${contextRoot}/shopping/cart" class="text-light ms-2 me-5"
            ><i class="fa-solid fa-cart-shopping"></i>購物車
          </a>
          
          <jstl:set var="status" scope="session" value="${member}"/>
          <jstl:choose>
          
          <jstl:when test="${member == null}">
          <a
            href="${contextRoot}/member/signin"
            class="text-light me-2 pe-2 border-light border-end"
          >
            <i class="fa-regular fa-user me-1"></i>會員登入
          </a>

          <a href="${contextRoot}/member/signup" class="text-light me-5"
            >註冊會員
          </a>
          </jstl:when>
          
          <jstl:otherwise>
          <div class="nav-item text-nowrap ms-5"><a
            href="${contextRoot}/member/signin"
            class="text-light me-2 pe-2" style="text-decoration: none"
          >
          <i class="fa-regular fa-user me-1"></i>Hello ${memberName}</a>
          </div>
          <div class="nav-item text-nowrap ms-5">
      		<a class=" px-3" href="${contextRoot}/member/logout" style="text-decoration: none; color: white;">登出</a>
    		</div>
          </jstl:otherwise>
          
          
          </jstl:choose>
          
        </div>
      </div>
    </header>
<script>
 
</script>
    <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

    <script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>
    <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
  </body>
</html>

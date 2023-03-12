<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>結帳頁面 - Bookstrap</title>
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
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

    <link rel="stylesheet" type="text/css" href="../css/slick.css" />
    <link rel="stylesheet" type="text/css" href="../css/slick-theme.css" />

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

    <link rel="stylesheet" href="${contextRoot}/css/index.css" />
  </head>
  <body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <div class="container">
      <form id="">
        <div class="card">
          <div class="card-header">
            <h2>取貨方式</h2>
          </div>
          <div class="card-body">
            <div>便利商店取貨</div>
          </div>
        </div>
        <div class="card">
          <div class="card-header">
            <h2>付款方式</h2>
          </div>
          <div class="card-body">
            <div>超商取貨付款</div>
            <div>Line pay</div>
          </div>
        </div>
        <div class="card">
          <div class="card-header">
            <h2>收件人資訊</h2>
          </div>
          <div class="card-body">
            <h3>收件人姓名</h3>
            <input type="text" value="${sessionScope.memberFullName} " />
            <h3>手機</h3>
            <input
              type="text"
              value="${sessionScope.memberDetails.memberPhone}"
            />

            <h3>E-mail</h3>
            <input
              type="text"
              value="${sessionScope.memberDetails.memberEmail}"
            />

            <h3>地址</h3>
            <input
              type="text"
              value="${sessionScope.memberDetails.memberAddress}"
            />
          </div>
        </div>
        <input type="button" value="下一步" />
      </form>
    </div>
  </body>
</html>

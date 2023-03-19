<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>結帳成功 - Bookstrap</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <jsp:include page="../member/layout/MainHeader.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
        <jsp:include page="../member/layout/MainNav.jsp"></jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-2"
          >
          </div>
    <div class="container">
      <h2>感謝您的購買！</h2>
      <h3>按此連結可查詢訂單狀態：<a href="${contextRoot}/member/myorder">查詢訂單</a></h3>
    </div>
</body>
<footer class="text-muted mt-5 border border-2 border-bottom-0 border-start-0 border-end-0">
  <div class="container">
      <p class="float-right justify-content-center">
          客戶服務專線：02-26535588
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
<jsp:include page="../member/layout/MainJs.jsp" />
</html>
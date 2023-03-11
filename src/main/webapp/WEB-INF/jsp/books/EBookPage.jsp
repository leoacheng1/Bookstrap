<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

      <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Book Page</title>
        <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet" />

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

          figure {
            float: right;
            margin: 10px;
          }

          li {
            border-right: 1px solid silver;
            padding-right: 10px;
            /* 可选，添加一些空隙 */
          }

          li:last-child {
            border-right: none;
          }

          a:link {
            text-decoration: none;
          }

          a:hover {
            text-decoration: underline;
          }
        </style>
      </head>

      <body>
        <jsp:include page="../layout/header.jsp"></jsp:include>
        <div style="margin-left: 13%;">
          <br>
          <div style="margin-top: 20px;">
            <form action="http://localhost:8080/Bookstrap/books/oneBook" enctype="multipart/form-data"
              modelAttribute="book">
              <fieldset
                style="width: 500px;height: 520px;margin: 20px 40px 25px 120px;float: left;border: 1px solid silver">
                <figure>
                  <img src="${contextRoot}/ebook/get/photo?eBookId=${book.eBookId}" width="425px" height="500px"
                    style="margin: 7px 30px 7px 10px;">
                </figure>
              </fieldset>
              <div>
                <br>
                <p style="margin-bottom: 3px;">
                <h4>${book.eBookName}</h4>
                </p>
                <br>
                <br>
                <br>
                <div>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">作者：${book.eBookAuthor}</p>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">譯者：${book.eBookTranslator}</p>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">出版社：${book.eBookPublisher}</p>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">出版日期：${book.eBookPublishDate}</p>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">語言：${book.eBookLanguages}</p>
                  <p style="margin-bottom: 5px;font-size: large;margin-top: 5px;"></p>類別：<span
                    style="margin-bottom: 5px;font-size: large;" class="cataSelector" value="${book.eBookCategory}"
                    id="cataSelector">${book.eBookCategory}</span>
                  <p style="margin-bottom: 5px;font-size: large;margin-top: 5px;">定價：<span class="priId" id="priId"
                      class="book"><s>${book.eBookPrice}</span>元</s><br></p>
                  <p style="margin-bottom: 5px;font-size: large;">優惠價：<strong class="disId" id="disId"
                      style="color: red;font-size: larger;">${book.eBookDiscount}</strong>折,
                    <strong class="disPriId" id="disPriId" style="color: red;font-size: larger;"></strong>元
                  </p>
                </div>
              </div>
            </form>
          </div>

          <br>
          <br>
          <hr style="width: 505px;">
          <button type="button" class="btn btn-info" style="margin-right: 20px;margin-left: 30px;font-size: large;"><i
              class="fa-solid fa-cart-shopping"></i>立刻結帳</button>
          <button type="button" class="btn btn-secondary"
            style="margin-right: 20px;margin-left: 30px;font-size: large;"><i
              class="fa-solid fa-cart-shopping"></i>加入購物車</button>
          <br>
          <br>
          <br>

          <div style="width: 1050px;margin-left: 120px;">
            <form action="http://localhost:8080/Bookstrap/books/oneBook" modelAttribute="detail">
              <div>
                <p>
                <h4>內容簡介</h4>
                </p>
                <hr>
                <div>
                  <span>${detail.eBookintro}</span>
                </div>
              </div>
              <br>
              <div>
                <br>
                <h4>詳細資料</h4>
                <hr>
                <p style="margin-bottom: 5px;">尺寸：${detail.eBooksize}</p>
                <p style="margin-bottom: 5px;">頁數：${detail.eBookpages}頁</p>
                <p style="margin-bottom: 5px;">分級：${detail.eBookgrade}</p>
              </div>
            </form>
          </div>
          <br>
          <br>
          <div style="width: 1050px;margin-left: 120px;">
            <p>
            <h4>買了此商品的人，也買了...</h4>
            </p>
            <hr>
            <div class="" style="display: inline-block;height: 250px;">
              <ul class="suggestArea" id="suggestArea">

              </ul>
            </div>
          </div>
          <br>




          <br>
          <div style="width: 1050px;margin-left: 120px;">
            <p>
            <h4>會員評論</h4>
            </p>
            <hr>
            <div>
              <button type="button" id="commentBtn" class="btn btn-outline-dark"
                style="display: block;margin: 0 auto;">寫評論</button>
            </div>
            <br>
            <div id="commentArea" class="commentArea">

            </div>


            <div class="card showArea">
              <div class="card-header">
                bb
              </div>
              <div class="card-body">
                <p class="card-text">評分等級：3</p>
                <p class="card-text">內容：好書好書</p>

              </div>
            </div>

          </div>

        </div>

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
        
        <script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>
        <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>

      </body>

      </html>
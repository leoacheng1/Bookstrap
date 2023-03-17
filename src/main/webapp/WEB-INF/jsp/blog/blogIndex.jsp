<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
      <meta name="generator" content="Hugo 0.104.2">
      <title>文章首頁</title>

      <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/blog/">

      <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

      <style>
        /* body {
          background-color: #656765
        } */


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
      </style>

      <!-- Custom styles for this template -->
      <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap"
        rel="stylesheet">
      <!-- Custom styles for this template -->

      <link rel="stylesheet" href="${contextRoot}/css/blog.css" />

      <!-- <script type="text/javascript">
        fetch("${contextRoot}/blog/getAllBlogParagraph", { method: "POST" }).then(rs => rs.json()).then(function (data) {
          console.log(data)
        })
        for (let item of data) {

          let string = item.paragraphContent
          let index = string.indexOf("。"); // 查找逗號的位置
          let substring = string.substring(0, index); // 提取從開頭到逗號的子串
          console.log(substring);

          outPutString += substring
        }
        document.getElementById("weeklyPara").innerHTML = outPutString




      </script> -->
    </head>

    <body>
      <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
      <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
      <div class="container">
        <header class="blog-header lh-1 py-3">
          <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
              <a class="link-secondary" href="#"> </a>
            </div>
            <div class="col-4 text-center">
              <img src="${contextRoot}/logo/logo2.png" style="vertical-align: bottom;" width="7%" alt="©BookStraper"
                title="©BookStraper">
              <a class="blog-header-logo text-dark" href="#">BookStrapper</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
              <a class="link-secondary" href="#" aria-label="Search">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor"
                  stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
                  viewBox="0 0 24 24">
                  <title>Search</title>
                  <circle cx="10.5" cy="10.5" r="7.5" />
                  <path d="M21 21l-5.2-5.2" />
                </svg>
              </a>
              <a class="btn btn-sm btn-outline-secondary" href="${contextRoot}/backend/login">登入</a>
            </div>
          </div>
        </header>

        <div class="nav-scroller py-1 mb-2">
          <nav class="nav d-flex justify-content-between">
            <a class="p-2 link-secondary" href="#">熱門專欄</a>
            <a class="p-2 link-secondary" href="${contextRoot}/blog/blogIndex?category=新書推薦">新書推薦</a>
            <a class="p-2 link-secondary" href="${contextRoot}/blog/blogIndex?category=好書指南">好書指南</a>
            <a class="p-2 link-secondary" href="#">好設計</a>
            <a class="p-2 link-secondary" href="#">生活提案</a>
            <a class="p-2 link-secondary" href="#">每日閱讀</a>

          </nav>
        </div>
      </div>

      <main class="container">
        <div class="p-4 p-md-5 mb-4 rounded "
          style="background-image:url(${contextRoot}/imafraid/images/blogTopPic.jpg) ">

          <div class="col-md-6 px-0">
            <h1 style=color:black class="display-4 text-light fw-bold">最新文章</h1>
            <h3 style=color:black id="newParaTitle"></h3>
            <div id="box">

              <p id="newParaContent"></p>
              <p class="lead mb-0"><a href="#" class="text-white fw-bold">繼續閱讀...</a></p>
            </div>
          </div>
        </div>

        <div class="row mb-2">
          <div class="col-md-6">
          </div>
          <div class="col-md-6">
          </div>
        </div>
        </div>
        </div>

        <div class="row g-5">
          <div class="col-md-8">
            <jstl:forEach var="book" items="${Books}">
              <article class="blog-post">
                <h2 class="blog-post-title mb-1" id="pTitle01">${book.paragraphTitle}</h2>
                <p class="blog-post-meta">January 1, 2021 by <a href="#">${book.paragraphAuther}</a></p>
                <p id="${book.paragraphId}">${book.paragraphContent}</p>
              </article>
            </jstl:forEach>
            <nav class="blog-pagination" aria-label="Pagination">
              <a class="btn btn-outline-primary rounded-pill" href="#">Older</a>
              <a class="btn btn-outline-secondary rounded-pill disabled">Newer</a>
            </nav>

          </div>

          <div class="col-md-4">
            <div class="position-sticky" style="top: 2rem;">
              <div class="p-4 mb-3 bg-light rounded">
                <h4 class="fst-italic">關於</h4>
                <p class="mb-0">普通的部落格小編</p>
              </div>

              <div class="p-4">
                <h4 class="fst-italic">Archives</h4>
                <ol class="list-unstyled mb-0">
                  <li><a href="#">March 2021</a></li>
                  <li><a href="#">February 2021</a></li>
                  <li><a href="#">January 2021</a></li>
                  <li><a href="#">December 2020</a></li>
                  <li><a href="#">November 2020</a></li>
                  <li><a href="#">October 2020</a></li>
                  <li><a href="#">September 2020</a></li>
                  <li><a href="#">August 2020</a></li>
                  <li><a href="#">July 2020</a></li>
                  <li><a href="#">June 2020</a></li>
                  <li><a href="#">May 2020</a></li>
                  <li><a href="#">April 2020</a></li>
                </ol>
              </div>

              <div class="p-4">
                <h4 class="fst-italic">Elsewhere</h4>
                <ol class="list-unstyled">
                  <li><a href="#">GitHub</a></li>
                  <li><a href="#">Twitter</a></li>
                  <li><a href="#">Facebook</a></li>
                </ol>
              </div>
            </div>
          </div>
        </div>

      </main>

      <footer class="blog-footer">
        <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a
            href="https://twitter.com/mdo">@mdo</a>.</p>
        <p>
          <a href="#">Back to top</a>
        </p>
      </footer>
      <script type="text/javascript">
        // function getLatesPara() {

        axios({

          url: "http://localhost:8080/Bookstrap/blog/showLatestPara",

          method: "get",


        })
          .then(res => {
            console.log(res.data)
            var data = res.data;

            // var id = res.id;]
            // let string = item.paragraphContent
            var content = data.paragraphContent;
            var index = content.indexOf("。"); // 查找逗號的位置

            // let substring = string.substring(0, index); // 提取從開頭到逗號的子串
            var title = data.paragraphTitle
            var contentcutted = content.substring(0, index);
            document.getElementById('newParaTitle').innerHTML = title;
            document.getElementById('newParaContent').innerHTML = contentcutted;

            // window.location.href = 'http://localhost:8080/Bookstrap/blog/blogIndex'
          })
        // }



      </script>
      <script type="text/javascript">

        axios({

          url: "http://localhost:8080/Bookstrap/blog/showCatagory1Para",

          method: "get",


        })
          .then(res => {
            console.log(res.data)
            var data = res.data;
            console.log(data)


          })

      </script>

    </body>

    </html>
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
              <a class="blog-header-logo text-dark" href="${contextRoot}/blog/blogIndex">BookStrapper</a>
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

          <div class="col-md-6 px-0" var="newest">
            <h1 style=color:black class="display-4 text-light fw-bold">最新文章</h1>
            <h3 style=color:black id="newParaTitle"></h3>
            <div id="box">

              <p id="newParaContent"></p>
              <p class="lead mb-0"><a href="${contextRoot}/blog/article/${newest.paragraphId}"
                  class="text-white fw-bold">繼續閱讀...</a></p>
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
          <div id="mainposition" class="col-md-8">
            <jstl:forEach var="book" items="${Books}">
              <article class="blog-post">
                <h2 class="blog-post-title mb-1" id="pTitle01">${book.paragraphTitle}</h2>
                <p class="blog-post-meta">${book.paragraphTime} <a href="#">${book.paragraphAuther}</a> </p>
                <p id="${book.paragraphId}">${book.paragraphContent}</p>
                <p class="lead mb-0"><a href="${contextRoot}/blog/article/${book.paragraphId}"
                    class="text-black fw-bold">繼續閱讀...</a></p>
              </article>
              <p>================================================================</p>
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
                <ol id=archives sclass="list-unstyled mb-0">


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
        <p>BookStrap <a href="http://localhost:8080/Bookstrap/index">©</a>.</p>
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

          url: "http://localhost:8080/Bookstrap/blog/getAllBlogParagraphForMonthSelect",

          method: "get",


        })
          .then(res => {
            // console.log(res.data)
            const dateAr = []
            res.data.forEach(element => {
              // console.log(element.paragraphTime)
              const date = new Date(element.paragraphTime)
              const year = date.getFullYear()
              const month = (date.getMonth() + 1).toString().padStart(2, '0');

              const datearray = year + '/' + month
              console.log(datearray)
              if (dateAr.includes(datearray)) {
                // console.log('030')

              }
              else { dateAr.push(datearray) }
            });
            // console.log(dateAr)


            const ol = document.getElementById('archives');



            for (let i = 0; i < dateAr.length; i++) {
              // console.log(dateAr[i])

              // 創建新的<li>元素
              const li = document.createElement('li');
              li.className = 'list-unstyled mb-0';

              // 創建新的<a>元素
              const a = document.createElement('a');
              // a.href = '';
              a.id = dateAr[i]
              a.textContent = dateAr[i];

              // 將<a>元素加入<li>元素中
              li.appendChild(a);

              // 將新的<li>元素加入<ol>元素中
              ol.appendChild(li);

              document.getElementById(dateAr[i]).addEventListener('click', function (e) {
                console.log(this.id)
                const str = dateAr[i];
                const parts = str.split('/');
                console.log(parts[0]); // 輸出 ["2023", "02"]
                console.log(parts[1]); // 輸出 ["2023", "02"]
                let nyear = parts[0]
                let nmonth = parts[1]
                axios({

                  url: "http://localhost:8080/Bookstrap/blog/getArchive",

                  method: "post",
                  params: { year: nyear, month: nmonth }


                })
                  .then(res => {
                    console.log(res.data)
                    const mainposition = document.getElementById('mainposition'); // 取得 id 屬性為 "mainposition" 的 div 元素
                    document.getElementById('mainposition').innerHTML = ""
                    res.data.forEach(e => {
                      const newArticle = document.createElement('article'); // 建立一個新的 article 元素

                      // 設定 article 元素的內容，使用模板字串與變數進行資料綁定
                      newArticle.innerHTML = `
                       <h2 class="blog-post-title mb-1" id="pTitle01">`+ e.paragraphTitle + `</h2>
                        <p class="blog-post-meta">`+ e.paragraphTime + ` <a href="#">` + e.paragraphAuther + `</a></p>
                        <p id="`+ e.paragraphId + `">` + e.paragraphContent + `</p>
                        <p class="lead mb-0"><a href="${contextRoot}/blog/article/` + e.paragraphId + `" class="text-black fw-bold">繼續閱讀...</a></p><p>=======================================================</p>
                        `;

                      mainposition.appendChild(newArticle);
                    })
                  })






              })

            }
          })

      </script>

    </body>

    </html>
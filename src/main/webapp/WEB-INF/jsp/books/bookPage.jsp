<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
          /* li之間的中隔線 */
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
          <div style="margin-top: 20px;" id="magnifier">
            <form action="http://localhost:8080/Bookstrap/books/oneBook" enctype="multipart/form-data"
                  modelAttribute="book">
              <fieldset
                style="width: 500px;height: 520px;margin: 20px 40px 25px 120px;float: left;border: 1px solid silver">
                <figure>
                  
                  <img src="http://localhost:8080/Bookstrap/books/id?id=${book.id}" width="425px" height="500px"
                    style="margin: 7px 30px 7px 10px;" id="image">
                </figure>
              </fieldset>
              <div>
                <br>
                <p style="margin-bottom: 3px;">
                <h4>${book.name}</h4>
                </p>
                <br>
                
                <br>
                <div>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">作者：${book.author}</p>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">譯者：${book.translator}</p>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">出版社：${book.publisher}</p>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">出版日期：${book.date}</p>
                  <p style="margin-bottom: 5px;font-size: large;" class="book">語言：${book.languages}</p>
                  <p style="margin-bottom: 5px;font-size: large;margin-top: 5px;"></p>類別：<span
                    style="margin-bottom: 5px;font-size: large;" class="cataSelector" value="${book.category}"
                    id="cataSelector">${book.category}</span>
                  <p style="margin-bottom: 5px;font-size: large;margin-top: 5px;">定價：<span class="priId" id="priId"
                      class="book"><s>${book.price}</span>元</s><br></p>
                  <p style="margin-bottom: 5px;font-size: large;">優惠價：
                    <strong class="disId" id="disId"
                            style="color: red;font-size: larger;">${book.discount}</strong>折,
                    <strong class="disPriId" id="disPriId" style="color: red;font-size: larger;"></strong>元
                  </p>
                  <p style="margin-bottom: 5px;font-size: large;">運送方式：宅配、門市取貨、超商取貨</p>
                </div>
              </div>
            </form>
          </div>

          <br>
          <br>
          <hr style="width: 505px;">
          <button type="button" class="btn btn-info" style="margin-right: 20px;margin-left: 30px;font-size: large;"><i
              class="fa-solid fa-cart-shopping"></i>立刻結帳</button>
          <button type="button" class="btn btn-secondary" id="addCartBtn"
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
                  <span>${detail.intro}</span>
                </div>
              </div>
              <br>
              <div>
                <br>
                <h4>詳細資料</h4>
                <hr>
                <p style="margin-bottom: 5px;">尺寸：${detail.size}</p>
                <p style="margin-bottom: 5px;">頁數：${detail.pages}頁</p>
                <p style="margin-bottom: 5px;">分級：${detail.grade}</p>
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
<!-- ////////////// 評論按鈕 ///////////// -->
            <div>
              <button type="button" id="commentBtn" class="btn btn-outline-dark"
                      style="display: block;margin: 0 auto;">寫評論</button>
            </div>
            <br>

  <div id="commentArea" class="commentArea">

   </div>

<!-- ////////////// 所有評論 ///////////// -->
  <div id="showArea" class="showArea">
     <jstl:forEach var="comment" items="${comments}">
      <div class="card">
        <div class="card-header">${comment.member.memberDetails.memberLastName}${comment.member.memberDetails.memberFirstName} </div>
        <div class="card-body">
        <p class="card-text">評論時間：<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${comment.date}"/></p>
        <p class="card-text">評分等級：<jstl:out value="${comment.evaluation}"/>顆星</p>
        <p class="card-text">內容：<jstl:out value="${comment.content}"/></p>
        </div>
        </div>
        <br>
     </jstl:forEach>         
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
        <script>
 //////////////////// 計算原價*折扣=優惠價 ///////////////////////////////
          const priId = document.getElementsByClassName('priId');//價錢
          const disId = document.getElementsByClassName('disId');//折扣
          const disPriId = document.getElementsByClassName('disPriId');//優惠價

          for (let i = 0; i < priId.length; i++) {
            let price = priId[i].textContent;
            // console.log("price:"+price);

            let discount = disId[i].textContent;
            // console.log("discount:"+discount);

            let disPrice = Math.round(price * (discount / 100))
            // console.log("優惠價:"+disPrice)

            disPriId[i].textContent = disPrice;// 將計算結果寫回元素
          }

////////////////////  推薦(相同類別)商品  /////////////////////////////
  const cataSelector = document.getElementsByClassName('cataSelector')
  console.log(cataSelector)
  for (let i = 0; i < cataSelector.length; i++) {
    var cata = cataSelector[i].textContent;
    var bookId = `${book.id}`
    console.log("類別為" + cata)
    console.log("書籍id為"+bookId)
    likeCategory(cata,bookId)
  }
          
  function likeCategory(cata,bookId) {
    console.log("類別為2" + cata)
    axios({
      method: 'get',
      url: 'http://localhost:8080/Bookstrap/books/category',
      params: {
        category: cata,
        id:bookId
      }
    })
      .then(res => {
        console.log("cata: "+res.data)
        htmlCategory(res)
      })
      .catch(err => {
        console.log(err)
        console.log("ererre")
      })
  }


  function htmlCategory(res) {
    console.log("cata: "+  res.data.length)
    let text = "";
    res.data.forEach(element => {
      // console.log(element.id)
      text += `<li style="display:list-item;display:inline-block;width:200px;height:260px;margin-top: 5px;vertical-align: middle;position: relative;">
                 <a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+ element.id + `">
                   <img src="http://localhost:8080/Bookstrap/books/id?id=`+ element.id + `" style="width: 150px;height: 175px;margin-right:auto;margin-left:auto;display:block;margin-top:5px;vertical-align: middle;" alt="">
                 </a>
               <div style="text-align: center;margin-left:7px">
                 <a href="http://localhost:8080/Bookstrap/books/oneBook?id=`+ element.id + `">` + element.name + `</a>
               </div>
               <div style=" list-style: none;;position: absolute;bottom: 5px;left:27px">
               <div style="display: none;">原價：<span class="priId" id="priId">`+ element.price + `</span>元</div>
               <div>優惠價：<strong class="disId" id="disId" style="color: red;">`+ element.discount + `</strong>折
                            <strong class="disPriId" id="disPriId" style="color: red;"></strong>元</div>
               </div>
               </li>`
    });
    // console.log(text)

    let suggest = document.getElementById('suggestArea')

      suggest.innerHTML = text;

      const priId = document.getElementsByClassName('priId');//價錢
      const disId = document.getElementsByClassName('disId');//折扣
      const disPriId = document.getElementsByClassName('disPriId');//優惠價

      for (let i = 0; i < priId.length; i++) {
        let price = priId[i].textContent;
        // console.log("price:"+price);

        let discount = disId[i].textContent;
        // console.log("discount:"+discount);

        let disPrice = Math.round(price * (discount / 100))
        // console.log("優惠價:"+disPrice)

        disPriId[i].textContent = disPrice;// 將計算結果寫回元素
      }
    }

///////////////////// 評論區展開按鈕 ////////////////////////
          const commentBtn = document.getElementById('commentBtn')

          commentBtn.addEventListener('click', function (e) {
            const memberId = `${memberId}`
            if(memberId == ""){
              console.log("未登入")
              window.location=`http://localhost:8080/Bookstrap/guest/signin`
            }else{           
              console.log(`${sessionScope.memberName}`)
              console.log(`${memberId}`)
              console.log("有反應")

            let commentArea = document.getElementById('commentArea')
            let area = ''
            area += `<div class="card" style="position: relative;">
          <button type="button" class="btn-close" aria-label="Close" id="closeBtn" style="position: absolute;top: 0;right: 0;"></button>
          <div class="card-body">
           <div></div>
           <img src="../book/stars1.jpg" style="width:30px;height:30px" class="iImg" id="iImg1">
           <img src="../book/stars1.jpg" style="width:30px;height:30px" class="iImg" id="iImg2">
           <img src="../book/stars1.jpg" style="width:30px;height:30px" class="iImg" id="iImg3">
           <img src="../book/stars1.jpg" style="width:30px;height:30px" class="iImg" id="iImg4">
           <img src="../book/stars1.jpg" style="width:30px;height:30px" class="iImg" id="iImg5">
           <hr>
           <div>
             <textarea id="inputText" style="border: none;outline: none;width:1010px;height:200px" placeholder="請輸入評論" maxlength="120"></textarea>  
           </div>
           <div style="float: right;color:silver;"><span id="count"></span>/120</div>
           <button type="button" id="submitBtn" class="btn btn-outline-secondary submitBtn" style="display: block;margin: 0 auto;">送出</button>
          </div>
          </div><br>`
            commentArea.innerHTML = area;

////////////////// 關閉評論區按鈕 ////////////////////
            const closeBtn = document.getElementById('closeBtn')

            closeBtn.addEventListener('click', function (e) {
              console.log('關閉按鈕')
              let commentArea = document.getElementById('commentArea')
              let area = ''
              commentArea.innerHTML = area;
            })
            
//////////////////// 打星 /////////////////////
            const arrays = document.getElementsByClassName("iImg");
            var stars =''
            let YN = 0;

            for (let array of arrays) {
              array.addEventListener("mouseover", mover)
              array.addEventListener("mouseout", mout)
              array.addEventListener("click", mclick)
            }

            function mover() {
              if (YN == 0) {
                for (let i = 0; i < arrays.length; i++)
                  if (this == arrays[i]) {
                    x = i;
                    for (x; x - 1 != -2; x--)
                      if ((x - 1) != -2) {
                        arrays[x].src = "../book/stars2.jpg"

                      }
                    x = i;
                  }

              }
            }
            function mout() {
              if (YN == 0) {
                for (let i = 0; i < arrays.length; i++)
                  if (this == arrays[i]) {
                    x = i;
                    for (x; x - 1 != -2; x--)
                      if ((x - 1) != -2) {
                        arrays[x].src = "../book/stars1.jpg"

                      }

                  }

              }
            }
            function mclick() {
              for (let i = 0; i < arrays.length; i++) {
                if (this == arrays[i]) {
                  x = i;
                  for (x; x - 1 != -2; x--)
                    if ((x - 1) != -2) {
                      arrays[x].src = "../book/stars2.jpg"

                    }

                  x = i;
                  for (let x = i + 1; x < 5; x++) {
                    arrays[x].src = "../book/stars1.jpg"

                  }
                }
              }
              YN = 1;
              // console.log(x + 1)
              stars = x + 1   
            }

///////////////// 評論區字數顯示 ///////////////////////////
const textarea = document.querySelector('textarea');
const countDisplay = document.querySelector('#count');

textarea.addEventListener('input', function() {
  const text = textarea.value;
  const count = text.length;
  countDisplay.textContent = count;
});

////////////////////// 送出按鈕 //////////////////////
const submitBtn = document.getElementById('submitBtn')

submitBtn.addEventListener('click', function (e) {
  const memberId = `${memberId}`
  console.log(`${sessionScope.memberName}`)
  console.log(`${memberId}`)
  
    // console.log("有送出")
   
    const inputText = document.getElementById('inputText').value
    // console.log('評論為' + inputText)

    const bookId = `${book.id}`
    // console.log('id為' + bookId)


    axios({
      method: 'post',
      url: 'http://localhost:8080/Bookstrap/comment/post',
      params: {
        content: inputText,
        evaluation: stars,
        bookId: bookId,
        memberId: memberId,
      }
    })
      .then(res => {
        console.log(res)
        window.location=`http://localhost:8080/Bookstrap/books/oneBook?id=${book.id}`
      })
      .catch(err => {
        console.log(err)
      })
  
})
}
}
)

///////////////////// 所有評論 ///////////////////////
// console.log('id:' + bookId)
// const memberId = `${memberId}`
// console.log('memberId:'+memberId)
// axios({
//   url:'http://localhost:8080/Bookstrap/comment/bookId',
//   method:'get',
//   params:{
//     bookId:bookId
//   }
// })
// .then(res=>{
//   console.log(res)
//   showComments(res)
// })
// .catch(err=>{
//   console.log(err)
// })
// 
// function showComments(res){
//   console.log(res);
//   let showArea = document.getElementById('showArea')
//   showArea.innerHTML = ""
//   let comments = ""
//   res.data.forEach(element=>{
//     comments += `<div class="card">`
//                +`<div class="card-header">${sessionScope.memberName}</div>`
//                +`<div class="card-body">`
//                +`<p class="card-text">評論時間：<jstl:out value="`+element.date+`"/></p>`
//                +`<p class="card-text">評分等級：<jstl:out value="`+element.evaluation+`"/>顆星</p>`
//                +`<p class="card-text">內容：<jstl:out value="`+element.content+`"/></p>`
//                +`</div>`
//                +`</div>`
//                +`<br>`
//     showArea.innerHTML= comments
// })
// }
///////////// 加入購物車 /////////////
const addCartBtn = document.getElementById('addCartBtn');

addCartBtn.addEventListener('click', function (e){
  const memberId = `${memberId}`
  const bookId = `${book.id}`
  const amount = 1;
  const disprice =  Math.round(`${book.price * book.discount * 0.01}`)
  console.log("disprice" + disprice)
  console.log("memberId"+memberId)
  console.log(bookId)

  axios({
    method: 'post',
    url: 'http://localhost:8080/Bookstrap/newshopping/buy',
    params: {
      memberId: memberId,
      bookId: bookId,
      amount: amount,
      disPrice: disprice
    }
  })
  .then(res =>{
    console.log(res)
    alert('已加入購物車!')
  })
  .catch(err => {
    console.log(err)
    alert('此書籍已在購物車中!')
      })
})




        </script>
        <script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>
        <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>


      </body>

      </html>
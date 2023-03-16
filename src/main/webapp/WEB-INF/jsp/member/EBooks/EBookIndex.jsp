<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">

    

    

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

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
      
      #addToWatchlistButton.watchlist-added {
   		 background-color: green;
    	color: white;
	}

	

    </style>
<jsp:include page="../../layout/headerCss.jsp"/>


<title>Insert title here</title>
</head>
<body>

   
<jsp:include page="../../layout/header.jsp"/>


<div style="width:1300px;margin: 0 auto">
<br />
<table style="width:1255px;border: 1px solid silver;margin-left: 15px;">
 <tbody style="border: 1px solid  silver;font-size: large;padding: 15px;">
  <tr>
   <th style="text-align: center;width: 100px;background-color:#F0F0F0;border: 1px solid  silver;padding: 15px;">
    <label>語言：</label>
   </th>
   <td>
    <label>
      <input type="checkbox" name="hobby" value="中文" id="chinese">中文
    </label>
    <label>
      <input type="checkbox" name="hobby" value="外文" id="foreign">外文
    </label>
   </td>
  </tr>
  <tr style="border: 1px solid  silver;">
   <th style="text-align: center;width: 100px;background-color:#F0F0F0;border: 1px solid  silver;">
    <label>類別：</label>
   </th>
   <td>
    <label>
      <input type="checkbox" name="hobby" value="哲學" id="philosophy">哲學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="宗教" id="religion">宗教
    </label>
    <label>
      <input type="checkbox" name="hobby" value="科學" id="science">科學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="應用科學" id="appliedScience">應用科學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="社會科學" id="socialScience">社會科學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="歷史" id="history">歷史
    </label>
    <label>
      <input type="checkbox" name="hobby" value="地理" id="geography">地理
    </label>
    <label>
      <input type="checkbox" name="hobby" value="語言文學" id="foreignLan">語言文學
    </label>
    <label>
      <input type="checkbox" name="hobby" value="藝術" id="Art">藝術
    </label>
    <label>
      <input type="checkbox" name="hobby" value="其他" id="other">其他
    </label>
   </td>
  </tr>
 </tbody>
 <tbody>
  <tr style="background-color:#F0F0F0;font-size: large;">
   <td></td>
   <td style="text-align: right;padding: 10px;" colspan="2">
<div style="width:1125px;">
  <button type="button" id="clearBtnnn" class="clearBtnnn btn btn-info" 
          style="margin-right: 5px;">清除篩選</button>
  <button type="button" id="submitBtnnnn" class="submitBtnnnn btn btn-info"
          style="margin-right: 5px;">確認送出</button>
</div>
   </td>
  </tr>
 </tbody>
</table>
</div>
<br>

<main>

  

  <div class="album py-5 ">
    <div class="container">
<!--    ///// -->
    
  <div id="console1" class="container" style="position: relative;">  
    <div style="height: 13px; margin-right:30px;">
  <nav aria-label="Page navigation example" >
    <ul class="pagination justify-content-end">
<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">

<li class="page-item"><a class="page-link likeBtn" data-likeId="${pageNumber}" data-name="${sessionScope.name}">${pageNumber}</a></li>

</jstl:forEach>
    </ul>
  </nav>
</div>

<!-- 	single card top -->
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        
        
        <jstl:forEach var="eBook" items="${page.content}">
  <div class="card" style="width:240px;height:420px;margin-right:5px;margin-left:10px;margin-top:57px">
    <a href='${contextRoot}/ebook/ebookpage?eBookId=${eBook.eBookId}'>
      <img src="${contextRoot}/ebook/get/photo?eBookId=${eBook.eBookId}" class="card-img-top"
      style="width:120px;height:170px;display:block;margin-top:10px;margin-right:auto;margin-left:auto"></a>
  <div class="card-body">
    <a href="${contextRoot}/books/oneBook?id=${eBook.eBookId}" style="text-decoration: none;">
      <h5 class="card-title">${eBook.eBookName}</h5>
    </a>
    <p class="card-text" style="margin-bottom: 3px;">${eBook.eBookLanguages}書</p>
    <a id="selectAuthor" class="selectAuthor" data-auName="${eBook.eBookAuthor}" style="text-decoration: none;">
      <p class="card-text" style="margin-bottom: 3px;">${eBook.eBookAuthor}</p>
    </a>
    <p class="card-text" style="margin-bottom: 3px;display: ;">定價：<span class="priId" id="priId"
      class="book"><s>${eBook.eBookPrice}</span>元</s></p>
      <p class="card-text" style="margin-bottom: 3px;">優惠價：<strong class="disId" id="disId"
        style="color: red;font-size: large;">${eBook.eBookDiscount}</strong>折,
        <strong class="disPriId" id="disPriId" style="color: red;font-size: large;">${eBook.eBookPrice} </strong>元
      </p>
    </p>
    
    <div class="btn-group" data-eBookId="${eBook.eBookId}" data-memberId="${memberId}">
                  
                  <jstl:choose>
                  
                  	<jstl:when test="${favorite[eBook.eBookId]}">
                  		<a type="button" class="btn btn-sm btn-danger addToWatchlistButton"  >

						       移除追蹤
                    	                   	</a>
                  	</jstl:when>
                  
                  <jstl:otherwise>
                  <a type="button" class="btn btn-sm btn-outline-secondary addToWatchlistButton" >

						        追蹤商品
                    	                   	</a>
                  </jstl:otherwise>
                  
                  </jstl:choose>
                    	
                    	                   	
                    	                   	
		    <a href="#" class="btn btn-primary ms-2">加入購物車</a>
<%-- 		    <a href="${contextRoot}/test/ebook/add/shoppingcart?memberId=${memberId}&eBookId=${eBook.eBookId}" class="btn btn-primary ms-2">Test購物車</a> --%>
                  </div>
  
<%--     <a type="button" class="btn btn-primary mx-2" href="${contextRoot}/ebook/get/epub?eBookId=${eBook.eBookNumber}" >View eBook</a> --%>
                  <br>
    
  </div>
  </div>
</jstl:forEach>
 
                 
      </div>
      <!-- 	single card bottom -->
       </div>
      
      
      
      
    </div>
  </div>

</main>

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


    <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    <script src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
    <script  src="${contextRoot}/js/member/axios.min.js"></script>
    
    <script  src="${contextRoot}/js/member/watchlist.js"></script>
   
	



</body>
</html>
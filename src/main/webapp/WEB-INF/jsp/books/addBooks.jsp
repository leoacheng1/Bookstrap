<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增書籍</title>
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
<style>
  .input{
    margin-top: 10px;
    margin-bottom: 10px;
    
  }

</style>
</head>
<body class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
   <div class="wrapper">
<!--上面導覽列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %> 
<!-- 左邊導覽列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>

<div class="content-wrapper">
<div class="container">
<div class="content-header">
  <br/>
  <div style="position: absolute;top: 40px;left: 425px;">
	<h1>新增書籍</h1>
  <br/>
  <form action="${contextRoot}/books/post" method="post" enctype="multipart/form-data">
  
  書名：<input class="input" type="text"  name="name" id="nameInput" placeholder="請輸入書名"/><br/>
  作者：<input class="input" type="text" name="author" id="authorInput" placeholder="請輸入作者"/><br/>
  譯者：<input class="input" type="text" name="translator" id="translatorInput" placeholder="請輸入譯者"/><br/>
  語言：<select class="input" name="languages" id="languagesInput">
           <option selected value="中文">中文</option>
           <option value="外文">外文</option>
         </select><br/>
  類別：<select class="input" name="category" id="categoryInput">
        <option selected value="哲學">哲學</option>
        <option value="宗教">宗教</option>
        <option value="科學">科學</option>
        <option value="應用科學">應用科學</option>
        <option value="社會科學">社會科學</option>
        <option value="歷史">歷史</option>
        <option value="地理">地理</option>
        <option value="語言文學">語言文學</option>
        <option value="藝術">藝術</option>
        <option value="其他">其他</option>
      </select><br/>
  出版社：<input class="input" type="text" name="publisher" id="publisherInput" placeholder="請輸入出版社"/><br/>
  出版日期：<input class="input" type="date" name="date" id="dateInput"/><br/>
  封面圖片：<img class="input" style="width:100px;height:120px;display: none;" src="" id="previewImg">
           <input class="input" type="file" name="photo" id="photoInput"/><br/>
  折扣：<input class="input" type="text" name="discount" id="discountInput" placeholder="請輸入折扣"/><br/>
  定價：<input class="input" type="text" name="price" id="priceInput" placeholder="請輸入定價"/><br/>
  </div>
  <div style="position: absolute;top: 100px;right: 325px;">
  尺寸：<input class="input" type="text" name="size" id="sizeInput" placeholder="請輸入尺寸"/><br/>
  頁數：<input class="input" type="text" name="pages" id="pagesInput" placeholder="請輸入頁數"/><br/>
  <div style="display: flex;margin-top: 10px;">簡介：
    <textarea cols="max" rows="max" name="intro" id="introInput" placeholder="請輸入簡介" style="width:350px;height:150px;"></textarea></div><br/>
  分級：<select name="grade" id="gradeInput" style="margin-top: 0px;margin-bottom: 15px;">
         <option selected value="普通級">普通級</option>
         <option value="限制級">限制級</option>
        </select><br/>
  <button type="submit" id="myBtn" class="my-customer-data-btn btn btn-info">送出</button>
  <button type="button" id="presetBtn" class="btn btn-success" style="margin-left: 20px;">預設</button>
  </div>
</form>  
</div>
</div>
</div>
</div>
<!--右側彈跳式功能列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
<!--版型需要的js-->
<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
<script>
  //////////// 預設資料按鈕 /////////////
  const presetBtn = document.getElementById('presetBtn')

  presetBtn.addEventListener('click',function(e){

    let name = document.getElementById('nameInput')
    let author = document.getElementById('authorInput')
    let translator = document.getElementById('translatorInput')
    let languages = document.getElementById('languagesInput')
    let category = document.getElementById('categoryInput')
    let publisher = document.getElementById('publisherInput')
    let date = document.getElementById('dateInput')
    let photo = document.getElementById('photoInput')
    let discount = document.getElementById('discountInput')
    let price = document.getElementById('priceInput')
    let size = document.getElementById('sizeInput')
    let pages = document.getElementById('pagesInput')
    let intro = document.getElementById('introInput')
    let grade = document.getElementById('gradeInput')

    name.value = '和菓子絕美圖鑑'
    author.value = '青木直己'
    translator.value = '楊家昌'
    languages.value = '中文'
    category.value = '歷史'
    publisher.value = 'PCuSER電腦人文化'
    date.value = '2023-02-11'
    discount.value = '79'
    price.value = '520'
    size.value = '23 x 17 x 1.7 公分'
    pages.value = '176'
    intro.value = `<p style="font-size: large;"><strong>不只是甜點！認識和菓子，深入日本極致美學與四季風雅旬味，感受一期一會的細膩用心和典故。</strong></p>
                   <p style="font-size: large;">在3月女兒節品嚐草餅或雛霰、在5月端午節品味柏餅或粽子、在櫻花季有象徵櫻花或櫻葉的櫻餅、到了秋天則輪到紅葉造型的菓子登場…，跟隨著歲時行事而有不同風貌的和菓子，反映出與生活濃厚的季節感。</p>
                   <p style="font-size: large;">和菓子也具有療癒人心的效果，御手洗糰子象徵人的五體，是消災解厄的化身；在青森縣可見當地人扛著南部煎餅驅邪的特殊祭典；撒滿芝麻的牡丹餅竟奇蹟似地救了一位老婆婆；賞花時必吃的三色糰子竟是豐臣秀吉發明的？滿載各種和菓子的解說與由來，一探更多不為人知的故事！</p>
                   <p style="font-size: large;">本書細數與12個月節日、神社或寺廟的庇佑、古典文學、歷史人物或文豪相關的350種和菓子，揭開其神祕面紗與背後蘊含的意義，同時了解日本的歷史、自然、文化！</p>`
    grade.value = '普通級'
  })

  /////////////  預覽圖片  ///////////////
  $("#photoInput").change(function(){
            readURL(this);
            $("#previewImg").css("display", "inline-block");
          });

          function readURL(input){
            if(input.files && input.files[0]){
              var reader = new FileReader();
              reader.onload = function (e) {
                $("#previewImg").attr('src', e.target.result);
              console.log("OK")
              }
              reader.readAsDataURL(input.files[0]);
            }
          }



  

</script>
</body>
</html>
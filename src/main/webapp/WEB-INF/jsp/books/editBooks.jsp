<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改書籍</title>
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
<style>
  input,select,button{
    margin-top: 5px;
    margin-bottom: 5px;
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
  <h1>修改書籍</h1>
  <br />
  <form action="${contextRoot}/books/edit" method="put" enctype="multipart/form-data" modelAttribute="book"
    var="book">
    <input type="hidden" name="id" id="idInput" value="${book.id}"></input>
    書名:<input type="text" name="name" id="nameInput" value="${book.name}" /><br />
    作者:<input type="text" name="author" id="authorInput" value="${book.author}" /><br />
    譯者:<input type="text" name="translator" id="translatorInput" value="${book.translator}" /><br />
    語言:<select name="languages" id="languagesInput" value="${book.languages}">
      <option selected value="${book.languages}" id="languagesSelect">${book.languages}</option>
      <option value="中文">中文</option>
      <option value="外文">外文</option>
    </select><br />
    類別:<select name="category" id="categoryInput" value="${book.category}">
      <option selected value="${book.category}">${book.category}</option>
      <option value="哲學">哲學</option>
      <option value="宗教">宗教</option>
      <option value="科學">科學</option>
      <option value="應用科學">應用科學</option>
      <option value="社會科學">社會科學</option>
      <option value="歷史">歷史</option>
      <option value="地理">地理</option>
      <option value="語言文學">語言文學</option>
      <option value="藝術">藝術</option>
    </select><br />
    出版社:<input type="text" name="publisher" id="publisherInput" value="${book.publisher}" /><br />
    出版日期:<input type="date" name="date" id="dateInput" value="${book.date}" /><br />
    封面圖片:<img style="width:100px;height:120px" src="${contextRoot}/books/id?id=${book.id}" id="previewImg">
    <input type="file" name="photo" id="photoInput" /><br />
    折扣:<input type="text" name="discount" id="discountInput" value="${book.discount}" /><br />
    定價:<input type="text" name="price" id="priceInput" value="${book.price}" /><br />
  </form>

  <form action="${contextRoot}/books/edit" method="put" var="detail" modelAttribute="detail">
    <input type="hidden" name="id"></input>
    尺寸:<input type="text" name="size" id="sizeInput" value="${detail.size}" /><br />
    頁數:<input type="text" name="pages" id="pagesInput" value="${detail.pages}"/><br />
    簡介:<textarea cols="max" rows="max" name="intro" id="introInput" value="${detail.intro}"
      style="width:350px;height:150px;">${detail.intro}</textarea><br />
    分級:<select name="grade" id="gradeInput" value="${detail.grade}">
      <option selected value="${detail.grade}">${detail.grade}</option>
      <option value="普遍級">普遍級</option>
      <option value="限制級">限制級</option>
    </select><br />
    <button type="submit" id="myBtn" class="data-btn btn btn-primary">送出</button>
  </form>

  </div>

<!--右側彈跳式功能列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
<!--版型需要的js-->
<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
<script>


const languagesSelect = document.getElementById('languagesInput').value
console.log("預設為"+languagesSelect)
if(languagesSelect == languagesSelect){
  
}


/////////////// 送出鍵 ///////////////
          const mybuttom = document.getElementById('myBtn')
          mybuttom.addEventListener('click', function (e) {
            e.preventDefault();
            let id = document.getElementById('idInput').value
            let name = document.getElementById('nameInput').value
            let author = document.getElementById('authorInput').value
            let translator = document.getElementById('translatorInput').value
            let languages = document.getElementById('languagesInput').value
            let category = document.getElementById('categoryInput').value
            let publisher = document.getElementById('publisherInput').value
            let date = document.getElementById('dateInput').value
            let photo = document.getElementById('photoInput').files[0];
            let discount = document.getElementById('discountInput').value
            let price = document.getElementById('priceInput').value
            let size = document.getElementById('sizeInput').value
            let pages = document.getElementById('pagesInput').value
            let intro = document.getElementById('introInput').value
            let grade = document.getElementById('gradeInput').value

            console.log("簡介:"+intro)

            let formdata = new FormData();

            formdata.append("id", id);
            formdata.append("name", name);
            formdata.append("author", author);
            formdata.append("translator", translator);
            formdata.append("languages", languages);
            formdata.append("category", category);
            formdata.append("publisher", publisher);
            formdata.append("date", date);
            formdata.append("photo", photo);
            formdata.append("discount", discount);
            formdata.append("price", price);
            formdata.append("size", size);
            formdata.append("pages", pages);
            formdata.append("intro", intro);
            formdata.append("grade", grade);

            console.log(formdata)
            console.log("author:" + author)
            console.log("pages:" + pages)
            console.log("photo:" + photo)
            axios({
              method: 'put',
              url: 'http://localhost:8080/Bookstrap/books/update',
              data: formdata,
              headers: { "Content-Type": "multipart/form-data" }
            })
              .then(res => {
                console.log("okok")
                window.location.href = 'http://localhost:8080/Bookstrap/books/page';
              })
              .catch(err => {
                console.log(err)
              })

          })

/////////////  預覽圖片  ///////////////
          $("#photoInput").change(function(){
            readURL(this);
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

<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>

      </body>

      </html>
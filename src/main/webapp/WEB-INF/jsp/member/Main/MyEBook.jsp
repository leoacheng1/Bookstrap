<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>My eBook</title>

    </head>

    <body>

      <jsp:include page="../layout/MainHeader.jsp"></jsp:include>



      <div class="container-fluid">
        <div class="row">

          <jsp:include page="../layout/MainNav.jsp"></jsp:include>


          <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div
              class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-2">
              <div class="container">
                <h3 class="text-center"> 我的電子書 </h3>
              </div>
            </div>
	
            <!-- /////// -->
            
        
            <jstl:forEach var="eBook" items="${page.content}">
         
            
 <table class="table">
  <thead>
    <tr>
      <th scope="col">電子書ID</th>
      <th scope="col">封面</th>
      <th scope="col">書名</th>
      <th scope="col">電子書頁面</th>
      <th scope="col">觀看電子書</th>
    </tr>
  </thead>
  <tbody>
  
    <tr>
      <th scope="row">${eBook.eBook.eBookId}</th>
      <td><img src="${contextRoot}/ebook/get/photo?eBookId=${eBook.eBook.eBookId}" width = "100px"></td>
      <td>${eBook.eBook.eBookName}</td>
      <td><a href="${contextRoot}/ebook/ebookpage?eBookId=${eBook.eBook.eBookId}" type = "button"  class="btn btn-secondary">內容頁面</a></td>
      <td><a href="${contextRoot}/ebook/get/epub?eBookId=${eBook.eBook.eBookNumber}" type = "button" class="btn btn-primary">觀看</a></td>
    </tr>
    
  </tbody>
</table>
		

</jstl:forEach>



            <!-- ///// -->

          </main>
        </div>
      </div>
      </div>



      <jsp:include page="../layout/MainJs.jsp"/>

    </html>>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Orders</title>

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
                <h3 class="text-center"> 追蹤清單 </h3>
              </div>
            </div>
	
            <!-- /////// -->
            
            
            
 <table class="table">
  <thead>
    <tr>
      <th scope="col">追蹤清單ID</th>
      <th scope="col">商品名稱</th>
      <th scope="col">商品價格</th>
      <th scope="col">商品頁面</th>
    </tr>
  </thead>
  
            <jstl:forEach var="eBook" items="${page.content}">
  <tbody>
  
    <tr>
      <th scope="row">${eBook.eBook.eBookId}</th>
      <td>${eBook.eBook.eBookName}</td>
      <td>${eBook.eBook.eBookPrice}</td>
     <td><a href="${contextRoot}/ebook/ebookpage?eBookId=${eBook.eBook.eBookId}" type = "button"  class="btn btn-secondary">內容頁面</a></td>
    </tr>
    
  </tbody>
</jstl:forEach>

</table>
		

            <!-- ///// -->

          </main>
        </div>
      </div>
      </div>



      <jsp:include page="../layout/MainJs.jsp"/>

    </html>>
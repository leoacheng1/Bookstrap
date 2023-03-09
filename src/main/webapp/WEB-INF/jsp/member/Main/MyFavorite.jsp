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
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
  
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    
  </tbody>
</table>
		


            <!-- ///// -->

          </main>
        </div>
      </div>
      </div>



      <jsp:include page="../layout/MainJs.jsp"/>

    </html>>
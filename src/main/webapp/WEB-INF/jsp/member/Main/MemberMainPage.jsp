<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Member main</title>

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
                <h3 class="text-center"> 我的帳戶</h3>
              </div>
            </div>

            <!-- /////// -->
            <div class="container">

              <div class="row row-cols-1 row-cols-md-2 g-4">
                <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                        additional content. This content is a little bit longer.</p>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                        additional content. This content is a little bit longer.</p>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                        additional content.</p>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to
                        additional content. This content is a little bit longer.</p>
                    </div>
                  </div>
                </div>
              </div>

            </div>



            <!-- ///// -->

          </main>
        </div>
      </div>
      </div>



      
<jsp:include page="../layout/MainJs.jsp"/>

    </html>
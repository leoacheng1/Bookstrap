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
                      <h5 class="card-title">訂單查詢</h5>
                      <br>
                      <p class="card-text">檢視訂購清單</p>
                      <a type = "button" href = "${contextRoot}/member/myorder" class = "btn btn-secondary">進入</a>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">購物車</h5>
                      <br>
                      <p class="card-text">檢視購物車</p>
                      <a type = "button" href = "${contextRoot}/newshopping/newcart" class = "btn btn-secondary">進入</a>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">個人資訊</h5>
                      <br>
                      <p class="card-text">修改個人基本資料</p>
                      <p class="card-text">修改個人密碼</p>
                      <a type = "button" href = "${contextRoot}/member/information" class = "btn btn-secondary">進入</a>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">追蹤商品</h5>
                      <br>
                      <p class="card-text">檢視追蹤商品</p>
                      <a type = "button" href = "${contextRoot}/member/myfavorite?memberId=${memberId}" class = "btn btn-secondary">進入</a>
                    </div>
                                                   
                                  
                  </div>
                </div>
                
                 <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">我的評論</h5>
                      <br>
                      <p class="card-text">檢視商品評論</p>
                      <a type = "button" href = "${contextRoot}/comment/memberPage?p=1&memberId=${memberId}" class = "btn btn-secondary">進入</a>
                    </div>
                  </div>
                </div>
                
<!--                  <div class="col"> -->
<!--                   <div class="card"> -->

<!--                     <div class="card-body"> -->
<!--                       <h5 class="card-title">付款資訊</h5> -->
<!--                       <br> -->
<!--                       <p class="card-text">檢視付款資訊</p> -->
<!--                       <p class="card-text">更新付款資訊</p> -->
<!--                       <a type = "button" href = "" class = "btn btn-secondary">進入</a> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
                
                 <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">優惠券</h5>
                      <br>
                      <p class="card-text">檢視優惠券</p>
                      <a type = "button" href = "${contextRoot}/mycoupon" class = "btn btn-secondary">進入</a>
                    </div>
                  </div>
                </div>
                
                 <div class="col">
                  <div class="card">

                    <div class="card-body">
                      <h5 class="card-title">電子書</h5>
                      <br>
                      <p class="card-text">檢視已購買電子書</p>
                      <a type = "button" href = "${contextRoot}/member/myebook?memberId=${memberId}" class = "btn btn-secondary">進入</a>
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
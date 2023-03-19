<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>優惠券 - Bookstrap</title>
  </head>

  <body>
    <jsp:include page="../layout/MainHeader.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
        <jsp:include page="../layout/MainNav.jsp"></jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-2"
          >
            <div class="container">
              <h3 class="text-center">我的優惠券</h3>
            </div>
          </div>
          <c:forEach  var="cartItem" items="${userCouponList}" varStatus="status">
          <div class="card" style="width: 36rem; margin: auto;" >
            
              <div class="card-header bg-custom">
                <h3 style="color: white; margin: 0">${userCouponList[status.index].coupon.name}</h3>
              </div>
              <div class="card-body">
                
                <h4>金額：${userCouponList[status.index].coupon.discount} 
                  <span style="float:right">數量：${userCouponList[status.index].amount}</span>
                  <h6>使用限制：無</h6>
                </h4>
            
              </div>
            </div>
          </div>

          </c:forEach>
          
        </main>
      </div>
    </div>
  </body>
  <jsp:include page="../layout/MainJs.jsp" />
</html>
>

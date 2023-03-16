<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8" />
      <title>Orders</title>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <style>
        .table-01 {
          color: #5a5a5a;
          font-size: 15px;
          line-height: 1.5em;
          border: 1px solid #d0d0d0;
        }
        .table-01 th,
        .table-01 td {
          padding: 5px 0;
          border: 1px solid #d0d0d0;
        }
        table {
          width: 100%;
          border-collapse: collapse;
          table-layout: fixed;
          word-wrap: break-word;
          border-spacing: 0;
        }
        table th,
        table td {
          text-align: center;
          vertical-align: middle;
        }
      </style>
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
                <h3 class="text-center">我的訂單</h3>
              </div>
            </div>
            <div class="container">
              <table class="text-center table-01" style="width: 1350px">
                <colgroup>
                  <col width="13%" />
                  <col width="9%" />
                  <col width="12%" />
                  <col width="8%" />
                  <col width="31%" />
                  <col width="5%" />
                  <col width="18%" />
                </colgroup>
                <thead>
                  <tr>
                    <th>訂單編號</th>
                    <th>訂購時間</th>
                    <th>付款方式</th>
                    <th>訂單金額</th>
                    <th>商品名稱</th>
                    <th>數量</th>
                    <th>處理狀態</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${myorder}" var="myorder">
                    <tr>
                      <td>
                        <fmt:formatDate
                          pattern="yyyy-MM-dd"
                          value="${myorder.orderTime}"
                          var="formattedDate"
                        />
                        ${fn:replace(formattedDate, '-', '')}<c:out
                          value="${myorder.saleId}"
                        />
                      </td>

                      <td>
                        <c:out
                          value="${fn:substring(myorder.orderTime, 0, 10)}"
                        /><br />
                        <c:out
                          value="${fn:substring(myorder.orderTime, 11, 19)}"
                        />
                      </td>

                      <c:choose>
                        <c:when test="${myorder.payment == 'cash-on-delivery'}">
                          <td>貨到付款</td>
                        </c:when>
                        <c:when test="${myorder.payment == 'line-pay'}">
                          <td>Line Pay</td>
                        </c:when>
                        <c:otherwise>
                          <td>其他付款方式</td>
                        </c:otherwise>
                      </c:choose>

                      <td><c:out value="${myorder.totalPrice}" /></td>
                      <td>
                        <c:forEach var="item" items="${myorder.saleItems}">
                          <c:out value="${item.book.name}" /><br />
                        </c:forEach>
                      </td>
                      <td>
                        <c:forEach var="item" items="${myorder.saleItems}">
                          <c:out value="${item.amount}" /><br />
                        </c:forEach>
                      </td>

                      <td>
                        <c:choose>
                          <c:when test="${myorder.pay eq 'undone'}"
                            >未付款</c:when
                          >
                          <c:when test="${myorder.pay eq 'done'}"
                            >已付款</c:when
                          >
                          <c:otherwise>未知</c:otherwise>
                        </c:choose>
                        <br />
                        <c:choose>
                          <c:when test="${myorder.status eq 'Pending'}"
                            >處理訂單中</c:when
                          >
                          <c:when test="${myorder.status eq 'Processing'}"
                            >處理中</c:when
                          >
                          <c:when test="${myorder.status eq 'Shipped'}"
                            >運送中</c:when
                          >
                          <c:when test="${myorder.status eq 'Delivered'}"
                            >已送達</c:when
                          >
                          <c:when test="${myorder.status eq 'Completed'}"
                            >交易完成</c:when
                          >
                          <c:when test="${myorder.status eq 'Cancelled'}"
                            >已取消</c:when
                          >
                          <c:when test="${myorder.status eq 'Refunded'}"
                            >已退款</c:when
                          >
                          <c:otherwise>未知</c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                    <tbody
                      id="bbody"
                      class="${book.id} text-center"
                      style="width: 1500px"
                      body-bkid="${book.id}"
                    ></tbody>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </main>
        </div>
      </div>

      <jsp:include page="../layout/MainJs.jsp" />
    </body>
  </html>
</br%@>

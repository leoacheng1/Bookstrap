<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
prefix="fn" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>所有書籍</title>
    <!--版型需要的css -->
    <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp"%>
    <style>
      table {
        border-collapse: collapse;
        table-layout: fixed;
      }
      th,
      td {
        border: 1px solid black;
        padding: 5px;
        text-align: center;
      }
    </style>
  </head>
  <body
    class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse"
  >
    <div class="wrapper">
      <!--上面導覽列 -->
      <%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp"%>
      <!-- 左邊導覽列 -->
      <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp"%>

      <div class="content-wrapper">
        <div style="margin-left: 50px">
          <div class="content-header">
            <br />
            <h1>所有訂單</h1>
            <br />
          </div>
          <div class="container">
            <table>
              <colgroup>
                <col width="8%" />
                <col width="9%" />
                <col width="9%" />
                <col width="8%" />
                <col width="10%" />
                <col width="10%" />
                <col width="10%" />
                <col width="10%" />
                <col width="10%" />
              </colgroup>
              <thead>
                <tr>
                  <th>訂單編號</th>
                  <th>訂單時間</th>
                  <th>訂購會員</th>
                  <th>訂購會員編號</th>
                  <th>配送方式</th>
                  <th>付款方式</th>
                  <th>訂單總金額</th>
                  <th>訂單狀態</th>
                  <th>修改狀態</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="sale" items="${salesPage.content}">
                  <tr>
                    <td>${sale.saleId}</td>

                    <td>
                      <c:out
                        value="${fn:substring(sale.orderTime, 0, 10)}"
                      /><br />
                      <c:out value="${fn:substring(sale.orderTime, 11, 19)}" />
                    </td>
                    <td>
                      ${sale.member.memberDetails.memberLastName}${sale.member.memberDetails.memberFirstName}
                    </td>
                    <td>${sale.member.memberId}</td>
                    <c:choose>
                      <c:when test="${sale.delivery == 'home-delivery'}">
                        <td>宅配</td>
                      </c:when>
                      <c:when test="${sale.delivery == 'store-pickup'}">
                        <td>分店取貨</td>
                      </c:when>
                      <c:otherwise>
                        <td>其他配送方式</td>
                      </c:otherwise>
                    </c:choose>

                    <c:choose>
                      <c:when test="${sale.payment == 'cash-on-delivery'}">
                        <td>貨到付款</td>
                      </c:when>
                      <c:when test="${sale.payment == 'line-pay'}">
                        <td>Line Pay</td>
                      </c:when>
                      <c:otherwise>
                        <td>其他付款方式</td>
                      </c:otherwise>
                    </c:choose>

                    <td>${sale.totalPrice}</td>

                    <td>
                      <c:choose>
                        <c:when test="${sale.status eq 'Pending'}"
                          >處理訂單中</c:when
                        >
                        <c:when test="${sale.status eq 'Processing'}"
                          >處理中</c:when
                        >
                        <c:when test="${sale.status eq 'Shipped'}"
                          >運送中</c:when
                        >
                        <c:when test="${sale.status eq 'Delivered'}"
                          >已送達</c:when
                        >
                        <c:when test="${sale.status eq 'Completed'}"
                          >交易完成</c:when
                        >
                        <c:when test="${sale.status eq 'Cancelled'}"
                          >已取消</c:when
                        >
                        <c:when test="${sale.status eq 'Refunded'}"
                          >已退款</c:when
                        >
                        <c:otherwise>未知</c:otherwise>
                      </c:choose>
                    </td>
                    <td>
                      <button class="btn btn-info">編輯</button>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>

            <div>
              <c:forEach var="i" begin="1" end="${salesPage.totalPages}">
                <c:choose>
                  <c:when test="${i == salesPage.number}">
                    <span>${i}</span>
                    <span>|</span>
                  </c:when>
                  <c:otherwise>
                    <a href="?page=${i}">${i}</a>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <span>第</span>
              <span>${salesPage.number + 1}</span>
              <span>/</span>
              <span>${salesPage.totalPages}</span>
              <span>頁</span>
            </div>

            <div>
              <c:choose>
                <c:when
                  test="${salesPage.hasPrevious() && salesPage.previousPageable().pageNumber >= 0}"
                >
                  <a href="?page=${salesPage.previousPageable().pageNumber + 1}"
                    >上一頁</a
                  >
                </c:when>
                <c:otherwise>
                  <span>上一頁</span>
                </c:otherwise>
              </c:choose>
              <c:choose>
                <c:when test="${salesPage.hasNext()}">
                  <a href="?page=${salesPage.nextPageable().pageNumber + 1}"
                    >下一頁</a
                  >
                </c:when>
                <c:otherwise>
                  <span>下一頁</span>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--右側彈跳式功能列 -->
    <%@ include
    file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp"%>
    <!--版型需要的js-->
    <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp"%>

    <script
      src="${contextRoot}/js/book/mix-book.js"
      type="text/javascript"
    ></script>
    <script
      src="${contextRoot}/js/book/search.js"
      type="text/javascript"
    ></script>
    <script
      src="${contextRoot}/js/bootstrap.bundle.min.js"
      type="text/javascript"
    ></script>
    <script
      src="${contextRoot}/js/jquery-3.6.3.min.js"
      type="text/javascript"
    ></script>
    <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
    <!-- <script>
      $(document).ready(function () {
        var currentPage = 1; // 當前頁面編號，初始值為 1

        // 監聽搜尋框的鍵盤輸入事件
        $("#search-keyword").on("keyup", function (event) {
          var keyword = $(this).val();
          // 如果搜尋關鍵字不為空，則發送 AJAX 請求進行搜尋
          if (keyword != "") {
            search(keyword, currentPage);
          } else {
            // 如果搜尋關鍵字為空，則清空搜尋結果和分頁按鈕
            $("#search-result").empty();
            $("#page-buttons").empty();
          }
        });

        // 監聽分頁按鈕的點擊事件
        $("#page-buttons").on("click", "button", function (event) {
          var pageNumber = $(this).data("page");
          search($("#search-keyword").val(), pageNumber);
        });

        // 搜尋函數，發送 AJAX 請求並顯示搜尋結果和分頁按鈕
        function search(keyword, pageNumber) {
          $.ajax({
            url: "/api/search",
            type: "GET",
            dataType: "json",
            data: {
              keyword: keyword,
              pageNumber: pageNumber,
            },
            success: function (data) {
              // 顯示搜尋結果
              var searchResult = "";
              for (var i = 0; i < data.length; i++) {
                searchResult += "<div>" + data[i].name + "</div>";
              }
              $("#search-result").html(searchResult);

              // 顯示分頁按鈕
              var pageButtons = "";
              for (var i = 1; i <= data.totalPages; i++) {
                pageButtons +=
                  '<button data-page="' + i + '">' + i + "</button>";
              }
              $("#page-buttons").html(pageButtons);
            },
            error: function (jqXHR, textStatus, errorThrown) {
              console.error("搜尋失敗：", textStatus, errorThrown);
            },
          });
        }
      });
    </script> -->
  </body>
</html>

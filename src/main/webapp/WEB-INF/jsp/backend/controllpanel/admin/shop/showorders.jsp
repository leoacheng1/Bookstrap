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
        <div style="margin-left: 100px">
          <div class="content-header">
            <br />
            <h1>所有訂單</h1>
            <br />
          </div>
          <div class="container">
            <div class="input-group mb-3">
              <input
                type="text"
                class="form-control"
                id="memberId"
                name="memberId"
                placeholder="會員編號查詢訂單："
              />
              <div class="input-group-append">
                <button
                  class="btn btn-outline-secondary"
                  type="button"
                  onclick="searchSalesByMemberId()"
                >
                  搜尋
                </button>
              </div>
            </div>
            <table>
              <colgroup>
                <col width="8%" />
                <col width="9%" />
                <col width="9%" />
                <col width="8%" />
                <col width="8%" />
                <col width="10%" />
                <col width="10%" />
                <col width="8%" />
                <col width="10%" />
                <col width="8%" />
                <col width="10%" />
              </colgroup>
              <thead>
                <tr>
                  <th>訂單編號</th>
                  <th>訂單時間</th>
                  <th>訂購會員</th>
                  <th>會員編號</th>
                  <th>配送方式</th>
                  <th>付款方式</th>
                  <th>金額</th>
                  <th>付款狀態</th>
                  <th>修改付款狀態</th>
                  <th>訂單狀態</th>
                  <th>修改訂單狀態</th>
                </tr>
              </thead>
              <tbody id="sales-tbody">
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
                        <td>
                          <a
                            href="#"
                            onclick="showOrderNumber(${sale.linepayId})"
                            >Line Pay</a
                          >
                        </td>
                      </c:when>
                      <c:when test="${sale.payment == 'store-pickup-payment'}">
                        <td>
                          <a
                            href="#"
                            onclick="showOrderShop('${sale.shop.shopName}')"
                            >到店取貨付款</a
                          >
                        </td>
                      </c:when>
                      <c:otherwise>
                        <td>其他付款方式</td>
                      </c:otherwise>
                    </c:choose>

                    <td>${sale.totalPrice}</td>
                    <td>
                      <div id="sale-pay-${sale.saleId}">
                        <c:choose>
                          <c:when test="${sale.pay eq 'undone'}">未付款</c:when>
                          <c:when test="${sale.pay eq 'done'}">已付款</c:when>
                          <c:otherwise>未知</c:otherwise>
                        </c:choose>
                      </div>
                    </td>
                    <td>
                      <button
                        class="btn btn-info"
                        onclick="showSalePaySelect(${sale.saleId})"
                      >
                        編輯
                      </button>
                    </td>

                    <td>
                      <div id="sale-status-${sale.saleId}">
                        <c:choose>
                          <c:when test="${sale.status eq 'Pending'}"
                            >處理訂單中</c:when
                          >
                          <c:when test="${sale.status eq 'Processing'}"
                            >理貨中</c:when
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
                      </div>
                    </td>
                    <td>
                      <button
                        class="btn btn-info"
                        onclick="showSaleStatusSelect(${sale.saleId})"
                      >
                        編輯
                      </button>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>

            <div>
              <!-- <c:forEach var="i" begin="1" end="${salesPage.totalPages}">
                <c:choose>
                  <c:when test="${i == salesPage.number}">
                    <span>${i}</span>
                    <span>|</span>
                  </c:when>
                  <c:otherwise>
                    <span>|</span>
                    <a href="?page=${i}">${i}</a>
                  </c:otherwise>
                </c:choose>
              </c:forEach> -->
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
    <script>
      function showOrderNumber(orderNumber) {
        alert("訂單編號為：" + orderNumber);
      }
      function showOrderShop(shopAddress) {
        console.log(shopAddress);
        alert("分店名稱為：" + shopAddress);
      }

      function showSaleStatusSelect(saleId) {
        var saleStatusDiv = $("#sale-status-" + saleId);
        var saleStatus = saleStatusDiv.find("span").text();
        var selectHtml = '<select id="sale-status-select-' + saleId + '">';
        selectHtml +=
          '<option value="Pending" ' +
          (saleStatus === "處理訂單中" ? "selected" : "") +
          ">處理訂單中</option>";
        selectHtml +=
          '<option value="Processing" ' +
          (saleStatus === "理貨中" ? "selected" : "") +
          ">理貨中</option>";
        selectHtml +=
          '<option value="Shipped" ' +
          (saleStatus === "運送中" ? "selected" : "") +
          ">運送中</option>";
        selectHtml +=
          '<option value="Delivered" ' +
          (saleStatus === "已送達" ? "selected" : "") +
          ">已送達</option>";
        selectHtml +=
          '<option value="Completed" ' +
          (saleStatus === "交易完成" ? "selected" : "") +
          ">交易完成</option>";
        selectHtml +=
          '<option value="Cancelled" ' +
          (saleStatus === "已取消" ? "selected" : "") +
          ">已取消</option>";
        selectHtml +=
          '<option value="Refunded" ' +
          (saleStatus === "已退款" ? "selected" : "") +
          ">已退款</option>";
        selectHtml += "</select>";

        saleStatusDiv.html(selectHtml);
        var saleStatusSelect = $("#sale-status-select-" + saleId);
        saleStatusSelect.val(saleStatus);
        saleStatusSelect.on("change", function () {
          var newStatus = $(this).val();
          editSale(saleId, newStatus);
        });
      }

      /////////////// 將訂單狀態英文切換成中文 ///////////////
      function convertStatusToChinese(status) {
        switch (status) {
          case "Pending":
            return "處理訂單中";
          case "Processing":
            return "理貨中";
          case "Shipped":
            return "運送中";
          case "Delivered":
            return "已送達";
          case "Completed":
            return "交易完成";
          case "Cancelled":
            return "已取消";
          case "Refunded":
            return "已退款";
          default:
            return "未知";
        }
      }
      /////////////// 將付款狀態英文切換成中文 ///////////////
      function convertPayToChinese(pay) {
        switch (pay) {
          case "undone":
            return "未付款";
          case "done":
            return "已付款";
        }
      }

      function editSale(saleId, newStatus) {
        if (newStatus !== "") {
          if (
            confirm(
              "確定要將銷售記錄狀態設為 " +
                convertStatusToChinese(newStatus) +
                " 嗎？"
            )
          ) {
            $.ajax({
              url: "/Bookstrap/shipping/" + saleId + "/status",
              method: "PUT",
              contentType: "application/json;charset=UTF-8",
              data: JSON.stringify({ status: newStatus }),
              success: function (data, textStatus, xhr) {
                // 更新銷售記錄的狀態成功，將狀態設置回div中
                var saleStatusDiv = $("#sale-status-" + saleId);
                var html = '<div id="sale-status-' + saleId + '">';
                html += convertStatusToChinese(newStatus);
                html += "</div>";
                saleStatusDiv.html(html);
              },
              error: function (xhr, textStatus, errorThrown) {
                // 更新銷售記錄的狀態失敗，可以在這裡顯示錯誤訊息等等
              },
            });
          }
        }
      }

      function showSalePaySelect(saleId) {
        var salePayDiv = $("#sale-pay-" + saleId);
        var salePay = salePayDiv.text();

        var selectHtml = '<select id="sale-pay-select-' + saleId + '">';
        selectHtml +=
          '<option value="undone" ' +
          (salePay === "未付款" ? "selected" : "") +
          ">未付款</option>";
        selectHtml +=
          '<option value="done" ' +
          (salePay === "已付款" ? "selected" : "") +
          ">已付款</option>";
        selectHtml += "</select>";
        salePayDiv.html(selectHtml);

        var salePaySelect = $("#sale-pay-select-" + saleId);

        salePaySelect.on("change", function () {
          var newPay = $(this).val();
          editSalePay(saleId, newPay);
        });
      }

      function editSalePay(saleId, newPay) {
        if (newPay !== "") {
          if (
            confirm(
              "確定要將銷售記錄付款狀態設為 " +
                convertPayToChinese(newPay) +
                " 嗎？"
            )
          ) {
            $.ajax({
              url: "/Bookstrap/shipping/" + saleId + "/pay",
              method: "PUT",
              contentType: "application/json;charset=UTF-8",
              data: JSON.stringify({ pay: newPay }),
              success: function (data, textStatus, xhr) {
                // 更新銷售記錄的付款狀態成功，將狀態設置回div中
                var salePayDiv = $("#sale-pay-" + saleId);
                salePayDiv.text(
                  newPay === "undone"
                    ? "未付款"
                    : newPay === "done"
                    ? "已付款"
                    : "未知"
                );
              },
              error: function (xhr, textStatus, errorThrown) {
                // 更新銷售記錄的付款狀態失敗，可以在這裡顯示錯誤訊息等等
              },
            });
          }
        }
      }
      function searchSalesByMemberId() {
        var memberId = $("#memberId").val();
        $.ajax({
          url: "/Bookstrap/shipping/searchByMemberId",
          method: "GET",
          data: { memberId: memberId },
          success: function (data, textStatus, xhr) {
            // 取得銷售紀錄列表
            var salesList = data;

            // 找到要更新的 DOM 元素
            var tableBody = $("#sales-tbody");

            // 清空表格內容
            tableBody.empty();

            // 逐一產生表格的每一行
            for (var i = 0; i < salesList.length; i++) {
              var sale = salesList[i];
              var deliveryMethod = "";
              var paymentMethod = "";
              var payStatus = "";
              var saleStatus = "";

              if (sale.delivery == "home-delivery") {
                deliveryMethod = "宅配";
              } else if (sale.delivery == "store-pickup") {
                deliveryMethod = "分店取貨";
              } else {
                deliveryMethod = "其他配送方式";
              }

              if (sale.payment == "cash-on-delivery") {
                paymentMethod = "貨到付款";
              } else if (sale.payment == "line-pay") {
                paymentMethod = "Line Pay";
              } else if (sale.payment == "store-pickup-payment") {
                paymentMethod = "到店取貨付款";
              } else {
                paymentMethod = "其他付款方式";
              }

              if (sale.pay == "undone") {
                payStatus = "未付款";
              } else if (sale.pay == "done") {
                payStatus = "已付款";
              } else {
                payStatus = "未知";
              }

              if (sale.status == "Pending") {
                saleStatus = "處理訂單中";
              } else if (sale.status == "Processing") {
                saleStatus = "理貨中";
              } else if (sale.status == "Shipped") {
                saleStatus = "運送中";
              } else if (sale.status == "Delivered") {
                saleStatus = "已送達";
              } else if (sale.status == "Completed") {
                saleStatus = "交易完成";
              } else if (sale.status == "Cancelled") {
                saleStatus = "已取消";
              } else if (sale.status == "Refunded") {
                saleStatus = "已退款";
              } else {
                saleStatus = "未知";
              }

              var row =
                "<tr>" +
                "<td>" +
                sale.saleId +
                "</td>" +
                "<td>" +
                sale.orderTime.substring(0, 10) +
                "<br>" +
                sale.orderTime.substring(11, 19) +
                "</td>" +
                "<td>" +
                sale.memberLastName +
                sale.memberFirstName +
                "</td>" +
                "<td>" +
                sale.memberId +
                "</td>" +
                "<td>" +
                deliveryMethod +
                "</td>" +
                "<td><a href='#'>" +
                paymentMethod +
                "</a></td>" +
                "<td>" +
                sale.totalPrice +
                "</td>" +
                "<td><div id='sale-pay-" +
                sale.saleId +
                "'>" +
                payStatus +
                "</div></td>" +
                "<td><button class='btn btn-info' onclick='showSalePaySelect(" +
                sale.saleId +
                ")'>編輯</button></td>" +
                "<td><div id='sale-status-" +
                sale.saleId +
                "'>" +
                saleStatus +
                "</div></td>" +
                "<td><button class='btn btn-info' onclick='showSaleStatusSelect(" +
                sale.saleId +
                ")'>編輯</button></td>" +
                "</tr>";

              // 將產生的表格行插入表格中
              tableBody.append(row);
            }
          },

          error: function (xhr, textStatus, errorThrown) {
            // 顯示錯誤訊息等等
            alert("未找到此會員的訂單！");
          },
        });
      }
    </script>
  </body>
</html>

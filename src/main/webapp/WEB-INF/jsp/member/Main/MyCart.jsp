<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Carts</title>

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
                <h3 class="text-center">購物車清單 - Bookstrap</h3>
              </div>
            </div>

            <!-- /////// -->
            <div class="container">
		
			

      <table class="table table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>商品ID</th>
            <th>商品名稱</th>
            <th>數量</th>
            <th>單價</th>
            <th>小計</th>
            <th>移除商品</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="cartItem" items="${cartItemList}" varStatus="status">
            <tr>
              <td>
                <input
                  class="form-check-input form-check checkbox-lg"
                  type="checkbox"
                  name="checkbook"
                  id="checkbook"
                  checked
                />
              </td>
              <td>${cartItem.bookId}</td>
              <td>${bookList[status.index].name}</td>
              <td>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <button
                      class="btn btn-outline-secondary"
                      type="button"
                      onclick="updateCartItemAmount(${cartItem.bookId}, ${cartItem.amount - 1})"
                    >
                      -
                    </button>
                  </div>
                  <input
                    type="text"
                    class="form-control quantity"
                    data-cart-item-id="${cartItem.bookId}"
                    value="${cartItem.amount}"
                    readonly
                  />
                  <div class="input-group-append">
                    <button
                      class="btn btn-outline-secondary"
                      type="button"
                      onclick="updateCartItemAmount(${cartItem.bookId}, ${cartItem.amount + 1})"
                    >
                      +
                    </button>
                  </div>
                </div>
              </td>
              <td>${bookList[status.index].price}</td>
              <td class="total-price">
                ${cartItem.amount * bookList[status.index].price}
              </td>
              <td>
                <button
                  type="button"
                  class="delete-btn btn btn-danger"
                  data-bkid="${cartItem.bookId}"
                >
                  刪除
                </button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <!-- 刪除全部購物車商品按鈕 -->
      <button
        type="button"
        class="delete-all-btn btn btn-danger"
        onclick="clearCart(${sessionScope.memberId})"
      >
        清空購物車
      </button>

      <!-- 購物車總金額 -->
      <div class="row">
        <div class="col-sm-12">
          <h4 class="text-right">
            總金額: <span id="total-price">${totalPrice}</span>
          </h4>
        </div>
      </div>
             

            </div>



            <!-- ///// -->

          </main>
        </div>
      </div>
      </div>
</body>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script
      src="${contextRoot}/js/shoppingcarts.js"
      type="text/javascript"
    ></script>


     <jsp:include page="../layout/MainJs.jsp"/>
    </html>
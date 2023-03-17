<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>購物車 - Bookstrap</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
  <body>
    <jsp:include page="../member/layout/MainHeader.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
        <jsp:include page="../member/layout/MainNav.jsp"></jsp:include>

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-2"
          >
          </div>
        

        <div class="container">
          <div class="card">
            <div class="card-body">
              <div class="card-header bg-custom">
                <h2 style="color: white; margin: 0">購物車</h2>
              </div>
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>
                      <input
                        class="form-check-input form-check checkbox-lg book-checkbox-all"
                        type="checkbox"
                      />
                    </th>
                    <th>商品照片</th>
                    <th>商品名稱</th>
                    <th>數量</th>
                    <th>售價</th>
                    <th>小計</th>
                    <th>移除商品</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach
                    var="cartItem"
                    items="${cartItemList}"
                    varStatus="status"
                  >
                    <tr>
                      <td>
                        <input
                          class="form-check-input form-check checkbox-lg book-checkbox"
                          type="checkbox"
                          name="checkbook"
                          data-price="${cartItem.amount * bookList[status.index].price}"
                          value="${cartItem.bookId}"
                        />
                      </td>
                      <td>
                        <img
                          style="width: 100px; height: 128px"
                          src="${contextRoot}/books/id?id=${cartItem.bookId}"
                        />
                      </td>
                      <td>${bookList[status.index].name}</td>
                      <td>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <button
                              class="btn btn-outline-secondary"
                              type="button"
                              onclick="updateCartItemAmount(${cartItem.bookId}, ${cartItem.amount}, 'sub')"
                            >
                              -
                            </button>
                          </div>
                          <input
                            style="width: 16px"
                            type="text"
                            id="book-amount"
                            class="form-control quantity"
                            data-cart-item-id="${cartItem.bookId}"
                            value="${cartItem.amount}"
                            readonly
                          />
                          <div class="input-group-append">
                            <button
                              class="btn btn-outline-secondary"
                              type="button"
                              onclick="updateCartItemAmount(${cartItem.bookId}, ${cartItem.amount}, 'add')"
                            >
                              +
                            </button>
                          </div>
                        </div>
                      </td>
                      <td><del>${bookList[status.index].price}元</del><span style="color: red
                      ;">${bookList[status.index].price * bookList[status.index].discount * 0.01}</span></td>
                      <td class="total-price">
                        ${cartItem.amount * bookList[status.index].price * bookList[status.index].discount * 0.01}元
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
              <h4>總金額: <span id="total-price">0</span>元</h4>
              <!-- 刪除全部購物車商品按鈕 -->
              <button
                type="button"
                class="delete-all-btn btn btn-danger"
                onclick="clearCart(${sessionScope.memberId})"
              >
                清空購物車
              </button>
            </div>
          </div>
          <div class="card">
            <div class="card-body">
              <div class="card-header bg-custom">
                <h3 style="color: white; margin: 0">折價券</h3>
              </div>
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>使用</th>
                    <th>折價券</th>
                    <th>折扣金額</th>
                    <th>數量</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach
                    var="userCoupon"
                    items="${userCouponList}"
                    varStatus="status"
                  >
                    <tr>
                      <td>
                        <input
                          type="checkbox"
                          name="coupon"
                          class="form-check-input form-check checkbox-lg"
                          value="${coupons[status.index].discount}"
                        />
                      </td>
                      <td>${coupons[status.index].name}</td>
                      <td>${coupons[status.index].discount}</td>
                      <td>${userCoupon.amount}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <!-- 折價後總金額 -->
            </div>
          </div>
          <div class="text-right">
            <h4>折價後金額: <span id="discounted-price">0</span>元</h4>
            <button type="button" class="btn btn-info" onclick="checkout()">
              結帳
            </button>
          </div>
        </div>
      </div>
        </main>

    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script
      src="${contextRoot}/js/shoppingcarts.js"
      type="text/javascript"
    ></script>
    <jsp:include page="../member/layout/MainJs.jsp" />
  </body>
</html>

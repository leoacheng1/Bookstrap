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
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" type="text/css" href="../css/slick.css" />
    <link rel="stylesheet" type="text/css" href="../css/slick-theme.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&display=swap"
      rel="stylesheet"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@600&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="${contextRoot}/css/index.css" />
  </head>
  <body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <div class="container">
      <h1>購物車清單</h1>

      <table class="table table-bordered">
        <thead>
          <tr>
            <th></th>
            <th>商品照片</th>
            <th>商品名稱</th>
            <th>數量</th>
            <th>售價</th>
            <th>小計</th>
            <th>移除商品</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="cartItem" items="${cartItemList}" varStatus="status">
            <tr>
              <td>
                <input
                  class="form-check-input form-check checkbox-lg book-checkbox"
                  type="checkbox"
                  name="checkbook"
                  id="bookCheckbox"
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
              <td>${bookList[status.index].price}元</td>
              <td class="total-price">
                ${cartItem.amount * bookList[status.index].price}元
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

      <div class="text-right">
        <h4>總金額: <span id="total-price">0</span>元</h4>
        <button type="button" class="btn btn-info">結帳</button>
      </div>
    </div>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script
      src="${contextRoot}/js/shoppingcarts.js"
      type="text/javascript"
    ></script>
  </body>
</html>

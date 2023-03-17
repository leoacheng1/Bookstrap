<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>結帳頁面 - Bookstrap</title>
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
          ></div>
          <div class="container">
            <form action="${contextRoot}/shipping/checkout" method="post">
              <input type="hidden" value="undone" name="pay" />
              <input type="hidden" value="" name="totalPrice" id="inputPrice" />
              <input type="hidden" value="Pending" name="status" />
              <c:forEach
                var="cartItem"
                items="${cartItemList}"
                varStatus="status"
              >
                <input
                  type="hidden"
                  name="saleItems[${status.index}].bookId"
                  value="${cartItem.bookId}"
                />
                <input
                  type="hidden"
                  name="saleItems[${status.index}].amount"
                  value="${cartItem.amount}"
                />
              </c:forEach>
              <div class="card">
                <div class="card-header bg-custom">
                  <h2 style="color: white; margin: 0">購買物品</h2>
                </div>
                <div class="card-body">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>商品照片</th>
                        <th>商品名稱</th>
                        <th>數量</th>
                        <th>優惠價</th>
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
                            <img
                              style="width: 100px; height: 128px"
                              src="${contextRoot}/books/id?id=${cartItem.bookId}"
                            />
                          </td>
                          <td>${cartItem.book.name}</td>
                          <td>
                            <div class="input-group">
                              <input
                                style="width: 16px"
                                type="text"
                                id="book-amount-${cartItem.cartId}"
                                class="form-control quantity"
                                data-cart-item-id="${cartItem.bookId}"
                                value="${cartItem.amount}"
                                readonly
                              />
                            </div>
                          </td>
                          <td>
                            <span
                              style="color: red"
                              class="price"
                              value="${cartItem.amount * cartItem.book.price
                              *cartItem.book.discount * 0.01}"
                              >${cartItem.amount * cartItem.book.price
                              *cartItem.book.discount * 0.01}</span
                            >元
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <div>
                    運費：<span style="color: red">0</span>(已套用滿500免運費)
                  </div>
                  <div>總金額：<span id="totalPrice"></span></div>
                </div>
              </div>
              <div class="card">
                <div class="card-header bg-custom">
                  <h2 style="color: white; margin: 0">取貨方式</h2>
                </div>
                <div class="card-body">
                  <select name="delivery">
                    <option value="home-delivery">宅配</option>
                    <option value="store-pickup">分店取貨</option>
                    <option value="convenience-store-pickup">超商取貨</option>
                  </select>
                  <div>${sessionScope.totalPrice}</div>
                </div>
              </div>
              <div class="card">
                <div class="card-header bg-custom">
                  <h2 style="color: white; margin: 0">付款方式</h2>
                </div>
                <div class="card-body">
                  <select name="payment">
                    <option value="cash-on-delivery">到貨付款</option>
                    <option value="line-pay">Line pay</option>
                  </select>
                </div>
              </div>
              <div class="card">
                <div class="card-header bg-custom">
                  <h2 style="color: white; margin: 0">收件人資訊</h2>
                </div>
                <div class="card-body">
                  <h3>收件人姓名</h3>
                  <input type="text" value="${sessionScope.memberFullName} " />
                  <h3>手機</h3>
                  <input
                    type="text"
                    value="${sessionScope.memberDetails.memberPhone}"
                  />

                  <h3>E-mail</h3>
                  <input
                    type="text"
                    value="${sessionScope.memberDetails.memberEmail}"
                    name="email"
                  />

                  <h3>地址</h3>
                  <input
                    type="text"
                    value="${sessionScope.memberDetails.memberAddress}"
                    name="address"
                  />
                </div>
              </div>
              <button type="submit" class="btn btn-info" id="checkout">
                確認結帳
              </button>
            </form>
          </div>
        </main>
      </div>
    </div>
  </body>

  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script
    src="${contextRoot}/js/shoppingcart/order.js"
    type="text/javascript"
  ></script>
  <script>
    // const checkoutbtn = document.getElementById("checkout");
    // checkoutbtn.addEventListener("click", () => {
    //   var result = confirm("確定送出嗎?");
    //   if (result == true) {
    //     window.location.href =
    //       "http://localhost:8080/Bookstrap/shipping/checkout";
    //   } else {
    //   }
    // });

    var totalPrice = 0;
    var quantities = document.getElementsByClassName("quantity");
    var prices = document.getElementsByClassName("price");
    console.log(quantities);
    console.log(prices);

    for (var i = 0; i < quantities.length; i++) {
      var quantity = quantities[i].value;
      var price = parseInt(prices[i].textContent);

      console.log(price);
      totalPrice += price;
    }

    console.log("Total price: " + totalPrice);
    document.getElementById("totalPrice").textContent = totalPrice + "元";
    document.getElementById("inputPrice").value = totalPrice;
  </script>
  <jsp:include page="../member/layout/MainJs.jsp" />
</html>

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
              <input type="hidden" value="" name="coupon" id="inputCoupon" />

              <c:forEach
                var="cartItem"
                items="${cartItemList}"
                varStatus="status"
              >
                <input type="hidden" name="bookId" value="${cartItem.bookId}" />
                <input type="hidden" name="amount" value="${cartItem.amount}" />
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
                        <th>優惠價</th>
                        <th>數量</th>
                        <th>商品總價</th>
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
                          <td>
                            <a
                              href="${contextRoot}/books/oneBook?id=${cartItem.bookId}"
                              >${cartItem.book.name}</a
                            >
                          </td>
                          <td><span class="disPriceOne"></span></td>
                          <td>
                            <div class="input-group">
                              ${cartItem.amount}
                              <input
                                style="width: 16px"
                                type="text"
                                id="book-amount-${cartItem.cartId}"
                                class="form-control quantity"
                                data-cart-item-id="${cartItem.bookId}"
                                value="${cartItem.amount}"
                                readonly
                                hidden
                              />
                            </div>
                          </td>
                          <td>
                            <span
                              class="disPriId"
                              id="discount-price-${cartItem.cartId}"
                              style="color: red"
                            ></span
                            >元
                            <span
                              class="priId"
                              id="priId"
                              class="book"
                              value="${cartItem.book.price}"
                              hidden
                            ></span>
                            <span
                              class="disId"
                              value="${cartItem.book.discount}"
                              hidden
                            ></span>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <div>
                    運費：<span style="color: red">0</span>(已套用滿500免運費)
                  </div>
                  <div>總金額：<span id="totalPrice"></span></div>
                  <div>
                    優惠券折抵：<span id="coupon" style="color: red"></span>
                  </div>
                  <div>折扣後金額：<span id="discountPrice"></span>元</div>
                </div>
              </div>
              <div class="card">
                <div class="card-header bg-custom">
                  <h2 style="color: white; margin: 0">取貨方式</h2>
                </div>
                <div class="card-body">
                  <select class="form-select" name="delivery" id="delivery">
                    <option value="home-delivery">宅配</option>
                    <option value="store-pickup">分店取貨</option>
                    <option value="convenience-store-pickup">超商取貨</option>
                  </select>

                  <div id="shopList" style="display: none">
                    <div style="font-size: large; margin: 5px">選擇分店:</div>
                    <select name="shop" class="form-select">
                      <c:forEach items="${shopList}" var="shop">
                        <option value="${shop.id}">${shop.shopName}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header bg-custom">
                  <h2 style="color: white; margin: 0">付款方式</h2>
                </div>
                <div class="card-body">
                  <select class="form-select" name="payment" id="payment">
                    <option value="cash-on-delivery" id="pickup-payment">
                      到貨付款
                    </option>
                    <option
                      value="store-pickup-payment"
                      id="store-pickup-payment"
                      style="display: none"
                    >
                      分店取貨付款
                    </option>
                    <option value="line-pay" id="line-pay">Line pay</option>
                  </select>
                </div>
              </div>
              <div class="card">
                <div class="card-header bg-custom">
                  <h2 style="color: white; margin: 0">收件人資訊</h2>
                </div>
                <div class="card-body">
                  <h3>收件人姓名</h3>
                  <input
                    class="form-control"
                    type="text"
                    value="${sessionScope.memberFullName} "
                  />
                  <h3>手機</h3>
                  <input
                    class="form-control"
                    type="text"
                    value="${sessionScope.memberDetails.memberPhone}"
                  />

                  <h3>E-mail</h3>
                  <input
                    class="form-control"
                    type="text"
                    value="${sessionScope.memberDetails.memberEmail}"
                    name="email"
                  />

                  <h3>地址</h3>
                  <input
                    class="form-control"
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
  <footer
    class="text-muted mt-5 border border-2 border-bottom-0 border-start-0 border-end-0"
  >
    <div class="container">
      <p class="float-right justify-content-center">
        客戶服務專線：02-26535588 傳真：02-27885008 服務時間：週一~五
        8:00~19:00，週六~日、例假日 9:00~18:00，365天全年無休
        Bookstrap數位科技股份有限公司 統編 : 96922355 地址：臺灣 115
        台北市南港區八德路四段768巷1弄18號B1之1
        食品業者登陸字號：A-196922355-00000-9 Copyright © since 1995
        books.com.tw All Rights Reserved.
      </p>
      <div class="d-flex justify-content-center">
        <a href="">服務條款</a>
        <a href="" class="ms-2">隱私全政策</a>
      </div>
    </div>
  </footer>

  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script
    src="${contextRoot}/js/shoppingcart/order.js"
    type="text/javascript"
  ></script>
  <script>
    ////////// 選取分店取貨付款 /////////
    $(function () {
      $("#delivery").change(function () {
        var selected = $(this).val();
        if (selected === "store-pickup") {
          $("#shopList").show();
          $("#payment option:selected").removeAttr("selected");
          $("#store-pickup-payment").show().prop("selected", true);
          $("#pickup-payment").hide();
        } else {
          $("#shopList").hide();
          $("#store-pickup-payment").hide();
          $("#payment option:not(#store-pickup-payment)").show();
        }
      });
    });
    var couponData = JSON.parse(sessionStorage.getItem("coupon"));
    const couponId = couponData.couponId;
    const coupondiscount = couponData.discount;
    if (couponData != null) {
      const couponEl = document.getElementById("coupon");
      const inputCoupon = document.getElementById("inputCoupon");
      const discountPrice = document.getElementById("discountPrice");
      if (coupondiscount) {
        couponEl.textContent = coupondiscount + "元";
        inputCoupon.value = couponId;
      } else {
        couponEl.textContent = "未使用優惠券";
      }
    }

    ////////// 計算原價*折扣=優惠價 /////////
    const priId = document.getElementsByClassName("priId"); // 價錢
    const disId = document.getElementsByClassName("disId"); // 折扣
    const disPriId = document.getElementsByClassName("disPriId"); // 優惠價
    const amount = document.getElementsByClassName("quantity"); // 數量
    const disPriceOne = document.getElementsByClassName("disPriceOne");

    console.log(disPriceOne);
    for (let i = 0; i < priId.length; i++) {
      let price = priId[i].getAttribute("value");
      console.log("price:" + price);
      let discount = disId[i].getAttribute("value");
      console.log("discount:" + discount);
      let disPrice = Math.round(price * (discount / 100));
      console.log("disPrice:" + disPrice);

      disPriceOne[i].textContent = disPrice + "元";

      let amounta = amount[i].getAttribute("value");
      console.log("amounta:" + amounta);
      let totalPrice = price * amounta;
      let discountedPrice = disPrice * amounta;
      console.log(discountedPrice);
      disPriId[i].textContent = discountedPrice;
      console.log("優惠價" + disPriId[i].textContent);
    }

    var totalPrice = 0;
    for (var i = 0; i < disPriId.length; i++) {
      var quantity = parseInt(amount[i].getAttribute("value"));
      var price = parseInt(priId[i].getAttribute("value"));
      var discount = parseInt(disId[i].getAttribute("value"));
      var discountedPrice = Math.round((price * discount) / 100);
      var subTotal = discountedPrice * quantity;
      totalPrice += subTotal;
    }
    discountPrice.textContent = totalPrice - coupondiscount;
    console.log("Total price: " + totalPrice);
    document.getElementById("totalPrice").textContent = totalPrice + "元";
    document.getElementById("inputPrice").value = totalPrice - coupondiscount;
  </script>
  <jsp:include page="../member/layout/MainJs.jsp" />
</html>

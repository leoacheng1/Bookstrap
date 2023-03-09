////////////////////////// 更新商品數量 //////////////////////////
function updateCartItemAmount(bookId, amount, action) {
  if (action === "add") {
    amount++;
  } else if (action === "sub") {
    amount--;
  }
  if (amount < 1) {
    alert("購買商品數量不可少於1");
  } else {
    axios({
      url: "http://localhost:8080/Bookstrap/shopping/cart/api/update",
      method: "put",
      // headers: {
      //   "Content-Type": "application/x-www-form-urlencoded",
      // },
      // responseType: "text",
      params: {
        bookId: bookId,
        amount: amount,
      },
    })
      .then((res) => {
        // console.log(res.data);
        // const bookAmountInput = document.getElementById("book-amount");
        // const bookTotalInput = document.getElementsByClassName("total-price");

        // bookAmountInput.value = res.data;

        window.location.href = "http://localhost:8080/Bookstrap/shopping/cart";
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
const deleteBtn = document.getElementsByClassName("delete-btn");
const deleteAllBtn = document.getElementsByClassName("delete-all-btn");
for (i = 0; i < deleteBtn.length; i++) {
  deleteBtn[i].addEventListener("click", function (e) {
    let bkID = this.getAttribute("data-bkid");
    console.log(bkID);
    //delete ajax
    deleteCartItemAjax(bkID);
  });
}
////////////////////////// 刪除單項 //////////////////////////
function deleteCartItemAjax(bkID) {
  axios({
    url: "http://localhost:8080/Bookstrap/shopping/cart/delete",
    method: "delete",
    // get
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    responseType: "text",
    params: {
      bookId: bkID,
    },
  })
    .then((res) => {
      console.log(res.data);
    })
    .catch((err) => {
      console.log(err);
      window.location.href = "http://localhost:8080/Bookstrap/shopping/cart";
    });
}

////////////////////////// 刪除全部 //////////////////////////
function clearCart(mId) {
  if (confirm("確定要刪除所有商品?")) {
    console.log(mId);
    axios({
      url: "http://localhost:8080/Bookstrap/shopping/cart/clear",
      method: "delete",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      responseType: "text",
      params: {
        memberId: mId,
      },
    })
      .then((res) => {
        console.log(res.data);
      })
      .catch((err) => {
        console.log(err);
        window.location.href = "http://localhost:8080/Bookstrap/shopping/cart";
      });
  } else {
    // Do nothing!
    console.log("Thing was not saved to the database.");
  }
}

// // 更新購物車
// function updateCartItem(itemId, quantity) {
//   $.ajax({
//     url: "/cart/update",
//     method: "POST",
//     data: { itemId: itemId, quantity: quantity },
//     success: function (response) {
//       $("#cart_items").html(response);
//     },
//   });
// }

// function updateTotal() {
//   const checkboxes = document.querySelectorAll("#bookCheckbox:checked");
//   const bookIds = Array.from(checkboxes).map((checkbox) => checkbox.value);
//   console.log(checkboxes);
//   console.log(bookIds);
//   axios
//     .put("/cart/updateTotal", { bookIds })
//     .then((res) => {
//       const total = res.data.total;
//       // 更新總金額顯示
//       document.querySelector("#total-price").innerHTML = `${total}元`;
//     })
//     .catch((err) => {
//       console.error(err);
//     });
// }

////////////////////////// 總金額計算 //////////////////////////

// 取得全選checkbox元素
const checkall = document.getElementsByClassName("book-checkbox-all")[0];
// 取得所有checkbox元素
const checkboxes = document.querySelectorAll(".book-checkbox");
// 取得總金額元素
const totalPriceEl = document.getElementById("total-price");
// 取得所有的coupon checkbox元素
const couponCheckboxes = document.getElementsByName("coupon");
// 初始化總金額為0
let totalPrice = 0;
// 取得折扣後金額元素
const discountedPriceEl = document.getElementById("discounted-price");
// 初始化折扣後金額為0
let discountedPrice = 0;

checkall.addEventListener("change", () => {
  if (checkall.checked) {
    totalPrice = 0;
    checkboxes.forEach((checkbox) => {
      checkbox.checked = true;
      if (checkbox.checked) {
        totalPrice += parseInt(checkbox.dataset.price);
      }
    });
  } else {
    checkboxes.forEach((checkbox) => {
      checkbox.checked = false;
      couponCheckboxes.checked = false;
      totalPrice = 0;
      discountedPrice = 0;
    });
  }
  // 更新總金額的顯示
  totalPriceEl.innerText = totalPrice;
  discountedPriceEl.innerText = discountedPrice;
});

// 為每個checkbox加入事件監聽
checkboxes.forEach((checkbox) => {
  checkbox.addEventListener("change", () => {
    // 若checkbox被選取，則將其對應書籍的金額加入總金額
    if (checkbox.checked) {
      totalPrice += parseInt(checkbox.dataset.price);
    } else {
      totalPrice -= parseInt(checkbox.dataset.price);
    }

    // 檢查所有checkbox是否都被選取，若是則勾選全選checkbox，否則取消勾選全選checkbox
    const allChecked = Array.from(checkboxes).every(
      (checkbox) => checkbox.checked
    );
    checkall.checked = allChecked;

    // 更新總金額的顯示
    totalPriceEl.innerText =
      totalPrice > 0 || checkbox.checked ? totalPrice : 0;
  });
});

// 綁定事件

for (var i = 0; i < couponCheckboxes.length; i++) {
  couponCheckboxes[i].addEventListener("change", function () {
    // 取消其他checkbox的選擇狀態

    for (var j = 0; j < couponCheckboxes.length; j++) {
      if (couponCheckboxes[j] !== this) {
        couponCheckboxes[j].checked = false;
      }
    }

    // 取得被選取的折價券 checkbox 元素
    const selectedCoupon = document.querySelector(
      "input[name='coupon']:checked"
    );

    // 判斷totalPrice是否為0
    if (totalPrice === 0 && selectedCoupon) {
      // 若為0，則顯示alert並取消選取的折價券
      alert("總金額為0，無法使用折價券。");
      selectedCoupon.checked = false;
      return;
    }

    // 確認是否有被選取的折價券，若有則取得其折扣值
    let discount = 0;
    if (selectedCoupon) {
      console.log(selectedCoupon.value);
      discount = parseInt(selectedCoupon.value);
      // 將總金額扣除折扣值，得到折扣後的金額
      console.log(totalPrice);
      console.log(discount);
      const discountedPrice = totalPrice - discount;

      // 更新折扣後金額的顯示

      discountedPriceEl.innerText = discountedPrice;
    }
  });
}

function checkout() {
  // 取得已勾選的商品
  var checkedItems = $('input[name="checkbook"]:checked');
  var coupon = $('input[name="coupon"]:checked');

  // 將勾選的商品資料存成 JavaScript 物件
  var cartItems = [];
  checkedItems.each(function () {
    var bookId = $(this).val();
    var amount = $(this).closest("tr").find(".quantity").val();
    console.log("itemId" + bookId);
    console.log("itemQty" + amount);
    cartItems.push({ bookId: bookId, amount: amount, coupon: coupon });
  });

  // 發送 AJAX 請求
  $.ajax({
    type: "POST",
    url: "http://localhost:8080/Bookstrap/shopping/cart/checkout",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(cartItems),
    success: function () {
      // 成功處理後端儲存購物車商品的 Session
      alert("結帳成功！");
      window.location.href =
        "http://localhost:8080/Bookstrap/shopping/shipping";
    },
    error: function () {
      // 處理錯誤
      alert("結帳失敗！");
    },
  });
}

// // 獲取所選折價券的折扣金額
// var couponDiscount = 0;
// var selectedCoupon = document.querySelector('input[name="coupon"]:checked');
// console.log(selectedCoupon);
// if (selectedCoupon) {
//   couponDiscount = parseInt(selectedCoupon.value);
//   console.log(couponDiscount);
// }

// // 獲取消費總金額
// var totalAmount = parseInt(document.querySelector("#total-price").textContent);

// // 計算應付金額
// var payableAmount = totalAmount - couponDiscount;

// // 更新顯示的應付金額
// document.querySelector("#payable-amount").textContent =
//   payableAmount.toFixed(2);

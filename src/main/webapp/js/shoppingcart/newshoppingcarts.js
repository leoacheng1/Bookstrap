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
function deleteCartItemAjax(cId) {
  axios({
    url: "http://localhost:8080/Bookstrap/newshopping/newcart/delete",
    method: "delete",
    // get
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    responseType: "text",
    params: {
      cartId: cId,
    },
  })
    .then((res) => {
      console.log(res.data);
      window.location.href =
        "http://localhost:8080/Bookstrap/newshopping/newcart";
    })
    .catch((err) => {
      console.log(err);
      window.location.href =
        "http://localhost:8080/Bookstrap/newshopping/newcart";
    });
}

////////////////////////// 刪除全部 //////////////////////////
function clearCart(mId) {
  if (confirm("確定要刪除所有商品?")) {
    console.log(mId);
    axios({
      url: "http://localhost:8080/Bookstrap/newshopping/newcart/clear",
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
        window.location.href =
          "http://localhost:8080/Bookstrap/newshopping/newcart";
      });
  } else {
    // Do nothing!
    console.log("Thing was not saved to the database.");
  }
}

////////////////////////// 更新商品數量 //////////////////////////
function updateCartItemAmount(cartId, action) {
  let amount = document.getElementById(`book-amount-${cartId}`).value;
  console.log(amount);
  if (action === "add") {
    amount++;
  } else if (action === "sub") {
    amount--;
  }
  if (amount < 1) {
    alert("購買商品數量不可少於1");
  } else {
    axios({
      url: "http://localhost:8080/Bookstrap/newshopping/newcart/api/update",
      method: "put",
      // headers: {
      //   "Content-Type": "application/x-www-form-urlencoded",
      // },
      // responseType: "text",
      params: {
        cartId: cartId,
        amount: amount,
      },
    })
      .then((res) => {
        let amount = document.getElementById(`book-amount-${cartId}`);
        let price = document.getElementById(`total-price-single-${cartId}`);
        let disPrice = document.getElementById(
          `discount-price-${cartId}`
        ).textContent;
        console.log(price);
        console.log(amount);
        console.log("disPrice" + disPrice);
        amount.value = res.data;
        console.log(price.textContent);
        price.textContent = amount.value * disPrice;
        // window.location.href =
        //   "http://localhost:8080/Bookstrap/newshopping/newcart";
      })
      .catch((err) => {
        console.log(err);
      });
  }
}

////////// 計算原價*折扣=優惠價 /////////
const priId = document.getElementsByClassName("priId"); //價錢
const disId = document.getElementsByClassName("disId"); //折扣
const disPriId = document.getElementsByClassName("disPriId"); //優惠價
const amount = document.getElementsByClassName("quantity");
const disPriAmo = document.getElementsByClassName("disPriAmo");
const checkbox = document.getElementsByClassName("book-checkbox");

for (let i = 0; i < priId.length; i++) {
  console.log(i);
  let price = priId[i].textContent;
  console.log("price:" + price);

  let discount = disId[i].textContent;
  console.log("discount:" + discount);

  let disPrice = Math.round(price * (discount / 100));
  console.log("優惠價:" + disPrice);

  let amounta = amount[i].value;
  console.log("數量:" + amounta);

  disPriId[i].textContent = disPrice; // 將計算結果寫回元素
  disPriAmo[i].textContent = disPrice * amounta;
}

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
  var totalPrice = document.getElementById("total-price").innerText;
  console.log(totalPrice);
  sessionStorage.setItem("totalPrice", totalPrice);
  console.log(coupon);

  // 將勾選的商品資料存成 JavaScript 物件
  var cartItems = [];
  checkedItems.each(function () {
    console.log(checkedItems);
    var bookId = $(this).val();
    var amount = $(this).closest("tr").find(".quantity").val();
    console.log("itemId" + bookId);
    console.log("itemQty" + amount);
    cartItems.push({ bookId: bookId, amount: amount });
  });

  // 發送 AJAX 請求
  $.ajax({
    type: "POST",
    url: "http://localhost:8080/Bookstrap/newshopping/newcart/checkout",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(cartItems),
    success: function () {
      // 成功處理後端儲存購物車商品的 Session
      window.location.href =
        "http://localhost:8080/Bookstrap/newshopping/newcart/shipping";
    },
    error: function () {
      // 處理錯誤
      alert("結帳失敗！");
    },
  });
}

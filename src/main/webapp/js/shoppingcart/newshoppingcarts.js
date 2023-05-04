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
        alert("購物車為空！")
        window.location.href =
          "http://localhost:8080/Bookstrap/index";
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
        let checkbox = document.getElementById(`checkbox-price-single-${cartId}`)
        let disPrice = document.getElementById(
          `discount-price-${cartId}`
        ).textContent;
        console.log(price);
        console.log(amount);
        console.log("disPrice" + disPrice);
        amount.value = res.data;
        console.log(price.textContent);
        price.textContent = amount.value * disPrice;
        checkbox.value = amount.value * disPrice;
        updateTotalPrice();
        updateDiscountedPrice();
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

  let check = checkbox[i].value;
  console.log("check:" + check)

  checkbox[i].value = disPrice * parseInt(amounta);
  disPriId[i].textContent = disPrice; // 將計算結果寫回元素
  disPriAmo[i].textContent = disPrice * parseInt(amounta);

  console.log(disPrice * parseInt(amounta))
}

////////////////////////// 總金額計算 //////////////////////////

// 取得全選checkbox元素
const checkall = document.getElementById("book-checkbox-all");
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

function updateTotalPrice() {
  totalPrice = 0;
  discountedPrice = 0;
  let allChecked = true; // 先預設為全選
  checkboxes.forEach((checkbox) => {
    if (checkbox.checked) {
      totalPrice += parseInt(checkbox.value);
    } else {
      allChecked = false; // 只要有一個沒被選就代表不是全選
    }
  });
  // 更新總金額的顯示
  totalPriceEl.innerText = totalPrice;
  // 更新全選checkbox的狀態
  checkall.checked = allChecked;
}

function updateDiscountedPrice() {
  discountedPrice = totalPrice;
  couponCheckboxes.forEach((checkbox) => {
    if (checkbox.checked) {
      discountedPrice -= parseInt(checkbox.value);
    }
  });

  // 更新折扣後金額的顯示
  discountedPriceEl.innerText = discountedPrice;
}

checkall.addEventListener("change", () => {
  checkboxes.forEach((checkbox) => {
    checkbox.checked = checkall.checked;
  });
  updateTotalPrice();
  updateDiscountedPrice();

  if (!checkall.checked) {
    couponCheckboxes.forEach((checkbox) => {
      checkbox.checked = false;
      
    });
    discountedPrice = 0;
    discountedPriceEl.innerText = discountedPrice;
  }
});

checkboxes.forEach((checkbox) => {
  checkbox.addEventListener("change", () => {
    if (!checkbox.checked) {
      checkall.checked = false;
    }
    updateTotalPrice();
    updateDiscountedPrice();
  });
});

couponCheckboxes.forEach((checkbox) => {
  checkbox.addEventListener("change", () => {
    updateDiscountedPrice();
  });
});

function checkout() {
  // 取得已勾選的商品
  var checkedItems = $('input[name="checkbook"]:checked');
  var coupon = $('input[name="coupon"]:checked');
  var totalPrice = document.getElementById("total-price").innerText;
  console.log(coupon);
  sessionStorage.setItem("totalPrice", totalPrice);
  

   // 將 coupon 的 value 值存入 sessionStorage
   if (coupon.length > 0 && coupon.prop('checked')) {
    var couponId = coupon.data('couponid');
    var discount = coupon.val();
    var couponData = { couponId: couponId, discount: discount };
    sessionStorage.setItem("coupon", JSON.stringify(couponData));
  }



  // 將勾選的商品資料存成 JavaScript 物件
  var bookIds = [];
  checkedItems.each(function () {
    var bookId = $(this).data("bkid");
    bookIds.push(bookId);
    console.log(bookId)
  });

  // 發送 AJAX 請求
  $.ajax({
    type: "POST",
    url: "http://localhost:8080/Bookstrap/newshopping/newcart/checkout",
    contentType: "application/json; charset=utf-8",
    data: JSON.stringify(bookIds),
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

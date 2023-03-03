// const deleteBtn = document.getElementsByClassName("delete-btn");
// const deleteAllBtn = document.getElementsByClassName("delete-all-btn");
// for (i = 0; i < deleteBtn.length; i++) {
//   deleteBtn[i].addEventListener("click", function (e) {
//     let bkID = this.getAttribute("data-bkid");
//     console.log(bkID);
//     //delete ajax
//     deleteCartItemAjax(bkID);
//   });
// }
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
// 取得所有checkbox元素
const checkboxes = document.querySelectorAll(".book-checkbox");
// 取得總金額元素
const totalPriceEl = document.getElementById("total-price");
// 初始化總金額為0
let totalPrice = 0;

// 為每個checkbox加入事件監聽
checkboxes.forEach((checkbox) => {
  checkbox.addEventListener("change", () => {
    // 若checkbox被選取，則將其對應書籍的金額加入總金額
    if (checkbox.checked) {
      totalPrice += parseInt(checkbox.dataset.price);
    } else {
      totalPrice -= parseInt(checkbox.dataset.price);
    }
    // 更新總金額的顯示
    totalPriceEl.innerText = totalPrice;
  });
});

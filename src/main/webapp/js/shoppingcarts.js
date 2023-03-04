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
// 更新商品數量
function updateCartItemAmount(bookId, amount) {
  console.log(bookId);
  console.log(amount);
  axios({
    url: "http://localhost:8080/Bookstrap/shopping/cart/api/update",
    method: "put",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    responseType: "text",
    params: {
      bookId: bookId,
      amount: amount,
    },
  })
    .then((res) => {
      console.log(res.data);
      window.location.href = "http://localhost:8080/Bookstrap/shopping/cart";
    })
    .catch((err) => {
      console.log(err);
    });
}

// 刪除單項
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

// 刪除全部
function clearCart(mId) {
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
}

// 更新購物車
function updateCartItem(itemId, quantity) {
  $.ajax({
    url: "/cart/update",
    method: "POST",
    data: { itemId: itemId, quantity: quantity },
    success: function (response) {
      $("#cart_items").html(response);
    },
  });
}

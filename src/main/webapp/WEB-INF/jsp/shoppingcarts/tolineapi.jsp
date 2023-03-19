<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>訂單確認頁面</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
      function sendRequest() {
        const orderId = '<%=session.getAttribute("orderId")%>';
        console.log(orderId);
        const amount = '<%=session.getAttribute("amount")%>';
        console.log(amount);
        const requestData = {
          amount: amount,
          confirmUrl: "http://localhost:8080/Bookstrap/shipping/linepay",
          productName: "Bookstrap",
          orderId: orderId,
          currency: "TWD",
        };

        axios
          .post("/Bookstrap/api/line", requestData)
          .then((response) => {
            console.log(response.data);
            window.location.href = response.data;
          })
          .catch((error) => {
            console.error(error);
            alert("請求失敗！");
          });
      }
    </script>
  </head>
  <body onload="sendRequest()">
    <h1>訂單確認頁面</h1>
    <p>
      您的訂單已經提交成功，我們會盡快為您處理。請稍等片刻，頁面即將自動跳轉...
    </p>
  </body>
</html>

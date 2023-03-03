<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
 <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
</head>
<body>
<div>
    <h2>忘記密碼</h2>
</div>
     
<div th:if="${error != null}">
    <p class="text-danger">${error}</p>
</div>
<div th:if="${message != null}">
    <p class="text-warning">${message}</p>
</div>
         
<form action="${contextRoot}/forgot/password" method="post" style="max-width: 420px; margin: 0 auto;">
<div class="border border-secondary rounded p-3">
    <div>
        <p>請輸入註冊之電子郵件地址</p>
    </div>
    <div>
        <p>
            <input type="email" name="email" class="form-control" placeholder="輸入電子郵件地址" required autofocus/>
        </p>         
        <p class="text-center">
            <input type="submit" value="Send" class="btn btn-primary" />
        </p>
    </div>
</div>
</form>
</body>
</html>
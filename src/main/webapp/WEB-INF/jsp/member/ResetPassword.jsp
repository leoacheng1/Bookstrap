<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.css">
</head>
<body>
	<div>
        <h2>設定新密碼</h2>
    </div>
    <form action="${contextRoot}/reset/password" method="post" style="max-width: 350px; margin: 0 auto;">
        <input type="hidden" name="token" value="${token}" />
    <div class="border border-secondary rounded p-3">
        <div>
            <p>
                <input type="password" name="password" id="password" class="form-control"
                    placeholder="請輸入新密碼" required autofocus />
            </p>         
            <p>
                <input type="password" name="confirmPassword" class="form-control" placeholder="確認新密碼"
                    required oninput="checkPasswordMatch(this);" />
            </p>         
            <p class="text-center">
                <input type="submit" value="送出" class="btn btn-primary" />
            </p>
        </div>
    </div>
    </form>
    
    <script src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
    
     <script >
function checkPasswordMatch(fieldConfirmPassword) {
    if (fieldConfirmPassword.value != $("#password").val()) {
        fieldConfirmPassword.setCustomValidity("輸入密碼不相符");
    } else {
        fieldConfirmPassword.setCustomValidity("");
    }
}

    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>假首頁</title>
</head>
<body>
</body>

<script type="text/javascript">
fetch("${contextRoot}/getAllBlogParagraph",{method:"POST"}).then(rs=>rs.json()).then(function(data){
	
	let outPutString = "";
	for(let item of data){
		outPutString+="<div>文章標題：" + item.paragraphTitle + "</div>"
		outPutString+="<div>文章內文：" + item.paragraphContent + "</div>"
		outPutString+="===================="
	
	}
	
	document.getElementById("dataHome").innerHTML=outPutString
	
})


</script>
</html>
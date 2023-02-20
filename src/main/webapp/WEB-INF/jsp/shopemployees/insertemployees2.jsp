<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增員工資料</title>
</head>
<body>
<form action="${contextRoot}/semps/insertemployee" method="post" enctype="multipart/form-data">
	
	<label>員工分店:<select name="empShopid">
           <option selected value="1">麥當勞</option>
           <option value="2">肯德基</option>
           <option value="3">漢堡王</option>
           <option value="4">摩斯漢堡</option>
         </select><br/></label>
	<label>員工姓名:</label><input type="text" name="empName" ><br>
	<label>上傳員工照片:</label><input type="file" id="empPhotoInput" name="empPhoto" accept="image/*"><br>
	<label>員工薪資:</label><input type="text" name="empSalary" ><br>
	<label>員工職稱:</label><input type="text" name="empTitle" ><br>
	<input type="submit" value="上傳">
</form>

<div id="empPhotoPreview"></div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  $("#empPhotoInput").change(function() {
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(event) {
      $("#empPhotoPreview").html('<img src="' + event.target.result + '">');
    }
  });
});
</script>


</body>
</html>
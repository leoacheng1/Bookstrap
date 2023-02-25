<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>這是修改員工資料</title>
</head>
<body>
	<h1>拉拉拉</h1>

	<form:form action="${contextRoot}/semps/upload"
		modelAttribute="shopemployees" method="put" enctype="multipart/form-data">

		<form:input type="hidden" path="empId"></form:input><br/>
		員工分店<form:select path="shop.id">
			<jstl:forEach items="${shopid}" var="shopid">
			<option value="${shopid.id}">${shopid.shopName}</option>
			</jstl:forEach>
<%--            <option selected value="${shop.id}"></option> --%>
<!--            <option value="1">abc</option> -->
<!--            <option value="2">acb</option> -->
<!--            <option value="3">wefewf</option> -->
<!--            <option value="4">sfbgbny</option> -->
         </form:select><br/>
<%-- 		員工分店<form:input type="text" path="shop.id"></form:input><br/> --%>
		員工姓名<form:input class="form-control" path="empName" /><br/>
		員工照片<form:input type="file" class="form-control" path="empPhoto" /><br/>
		員工薪資<form:input class="form-control" path="empSalary" /><br/>
		員工職稱<form:input class="form-control" path="empTitle" /><br/>
		<button type="submit" class="btn btn-outline-primary">修改送出</button>

	</form:form>

	<div id="preview">
	</div>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('input[type=file]').change(function() {
				var file = this.files[0];
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview').html('<img src="' + e.target.result + '">');
				}
				reader.readAsDataURL(file);
			});

			
		});
	</script>

</body>
</html>
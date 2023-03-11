<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
<script>
		
		function confirmDelete(){
			
// 			event.preventDefault();
			
			let result = confirm("確定要刪除此會員資料?");
			console.log(result);
			
			if(result == true){
				document.getElementById("deleteForm").submit();
// 				window.location.replace("http://localhost:8080/Bookstrap/admin/get/allmember");
			}else{
				
			}
								}
		
	
	</script>
</head>
<body
	class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %> 
<%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>
	<div class="wrapper">

		<div class="content-wrapper">
			<div class="content-header">
				<!-- 標題位置 -->
				<h1>所有會員</h1>
				
			<div class="mt-5">
			<a class="btn btn-secondary" type="button" href="${contextRoot}/admin/post/memberpage">新增會員</a>
			</div>
			
			
			</div>
			<section class="content">
				<!-- 寫東西的地方 top-->
				<table class="table table-light table-striped">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">照片</th>
							<th scope="col">姓</th>
							<th scope="col">名</th>
							<th scope="col">檢視</th>
							<th scope="col">修改</th>
							<th scope="col">刪除</th>
						</tr>
					</thead>
					<tbody>


						<jstl:forEach var="member" items="${page.content}">
							<tr>  
								<th scope="row">${member.memberId}</th>
								<td><img src="${contextRoot}/admin/get/getphoto?memberId=${member.memberId}" width="100px"> </td>
								<td>${member.memberLastName}</td>
								<td>${member.memberFirstName}</td>
								<td><a href="#" type="button" class="btn btn-primary">詳細資料</a></td>
								<td><a href="${contextRoot}/admin/edit/member?memberId=${member.memberId}" type="button" class="btn btn-light">修改</a></td>
								
								<form id="deleteForm" action="${contextRoot}/admin/delete/member?memberId=${member.memberId}" method="post">
								<input name="_method" type="hidden" value="delete"/>
								<input name="memberId" type="hidden" value="${member.memberId}"/>
								<td><input onclick="confirmDelete()" type="" value="刪除" class="btn btn-danger"></td>
								</form>
								
							</tr>
						</jstl:forEach>


					</tbody>
				</table>

				<!-- 寫東西的地方 bottom-->

				<br>

				<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<jstl:choose>

						<jstl:when test="${page.number != pageNumber-1}">
							<a href="${contextRoot}/admin/get/allmember?p=${pageNumber}">${pageNumber}</a>
						</jstl:when>

						<jstl:otherwise>
	     				${pageNumber}
	    				</jstl:otherwise>
					</jstl:choose>

					<jstl:if test="${pageNumber != page.totalPages}">
						|
				</jstl:if>


				</jstl:forEach>


			</section>
		</div>
	</div>


	
	


	<!--右側彈跳式功能列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
<!--版型需要的js-->
<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>
</html>
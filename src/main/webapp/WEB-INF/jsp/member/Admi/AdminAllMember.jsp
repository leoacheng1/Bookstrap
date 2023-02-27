<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../layout/AdminCss.jsp" />
<title>Insert title here</title>
</head>
<body
	class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
<jsp:include page="../layout/AdminNavBar.jsp" />

<jsp:include page="../layout/AdminSideBar.jsp" />

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
				<table class="table table-dark table-striped">
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
								<td>${member.memberPhoto}</td>
								<td>${member.memberLastName}</td>
								<td>${member.memberFirstName}</td>
								<td><a href="#" type="button" class="btn btn-primary">詳細資料</a></td>
								<td><a href="#" type="button" class="btn btn-light">修改</a></td>
								<td><a href="#" type="button" class="btn btn-danger">刪除</a></td>
							</tr>
						</jstl:forEach>


					</tbody>
				</table>

				<!-- 寫東西的地方 bottom-->

				<br>

				<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<jstl:choose>

						<jstl:when test="${page.number != pageNumber-1}">
							<a href="${contextRoot}/member/admin/allmember?p=${pageNumber}">${pageNumber}</a>
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






	<jsp:include page="../layout/AdminJs.jsp" />
</body>
</html>
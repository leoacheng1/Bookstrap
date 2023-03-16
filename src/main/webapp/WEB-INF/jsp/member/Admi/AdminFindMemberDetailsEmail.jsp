<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
				<h1>查尋會員</h1>
			
				</div>
				
				
				<form action="" method="get">	
				<div class="container mt-2 mb-2">
						<div class="d-flex">
			<select class="form-select form-select-lg" aria-label=".form-select-lg example" id="category">
			  <option selected>查詢選項</option>
			  <option value="id">ID</option>
			  <option value="Lastname">姓</option>
			  <option value="Firstname">名</option>
			  <option value="email">電子信箱地址</option>
			  <option value="gender">性別</option>
			  <option value="address">地址</option>
			</select>
			
			<input type="text" class="form-control" aria-label="Text input with dropdown button" id="search">
			<button class="btn btn-secondary sendOutBtn" type="submit" id="button-addon2 sendOutBtn" data-btnid="sendOutBtn" 
            style="display: inline;vertical-align: middle;">
            <i class="fa-solid fa-magnifying-glass"></i>
    		</button>
			</div>
					</div>
			</form>	
				
			<section class="content">
				<!-- 寫東西的地方 top-->
				<table class="table table-light table-striped">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">照片</th>
							<th scope="col">姓</th>
							<th scope="col">名</th>
							<th scope="col">E-mail</th>
							<th scope="col">修改</th>
							<th scope="col">刪除</th>
						</tr>
					</thead>
					<tbody>


						<jstl:forEach var="memberDetails" items="${page.content}">
							<tr>  
								<th scope="row">${memberDetails.memberId}</th>
								<td><img src="${contextRoot}/admin/get/getphoto?memberId=${memberDetails.memberId}" width="100px"> </td>
								<td>${memberDetails.memberLastName}</td>
								<td>${memberDetails.memberFirstName}</td>
								<td>${memberDetails.memberEmail}</td>
								<td><a href="${contextRoot}/admin/edit/member?memberId=${memberDetails.memberId}" type="button" class="btn btn-light">修改</a></td>
								
								<form id="deleteForm" action="${contextRoot}/admin/delete/member?memberId=${memberDetails.memberId}" method="post">
								<input name="_method" type="hidden" value="delete"/>
								<input name="memberId" type="hidden" value="${memberDetails.memberId}"/>
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
							<a href="${contextRoot}/admin/get/memberemaillike?p=${pageNumber}&memberEmail=${memberEmail}">${pageNumber}</a>
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
<script type="text/javascript">
$('form').on('submit', function(e) {
	  e.preventDefault(); // prevent the form from submitting normally
	  let category = $('#category').val();
	  let search = $('#search').val();
	  
	  
	  
	  let url = '';
	  if (category === 'id') {
	    url = '${contextRoot}/admin/get/memberidlike?memberId=' + encodeURIComponent(search);
	  } else if (category === 'Lastname') {
	    url = '${contextRoot}/admin/get/memberlastnamellike?memberLastName=' + encodeURIComponent(search);
	  } else if (category === 'Firstname') {
		    url = '${contextRoot}/admin/get/memberfirstnamellike?memberFirstName=' + encodeURIComponent(search);
	  } else if (category === 'email') {
	    url = '${contextRoot}/admin/get/memberemaillike?memberEmail=' + encodeURIComponent(search);
	  } else if (category === 'gender') {
	    url = '${contextRoot}/admin/get/membergenderlike?memberGender=' + encodeURIComponent(search);
	  } else if (category === 'address') {
	    url = '${contextRoot}/admin/get/memberaddresslike?memberAddress=' + encodeURIComponent(search);
	  }
	  window.location.href = url;
	});

</script>

</body>
</html>
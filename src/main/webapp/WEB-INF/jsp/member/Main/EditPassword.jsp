<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>個人資訊</title>

</head>

<body>

	<jsp:include page="../layout/MainHeader.jsp"></jsp:include>



	<div class="container-fluid">
		<div class="row">

			<jsp:include page="../layout/MainNav.jsp"></jsp:include>


			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-2">
					<div class="container">
						<h3 class="text-center">更新密碼</h3>
					</div>
				</div>

				<!-- /////// -->
				<div class="container">


					<div class="card mt-5">
						<h5 class="card-header">密碼</h5>

						<form action="${contextRoot}/member/editpassword" method="post">
							<div class="card-body">

								<input type="password" readonly name="memberId" name="memberId"
									value="${memberId}" hidden>

								<h5 class="card-title">請輸入舊密碼</h5>
								<input type="password" name="oldPassword" /> <span>${errors.WrongPassword}</span>
								<br>
								<h5 class="card-title mt-5">請輸入新密碼</h5>
								<input type="password" name="newPassword" /> <span>${errors.NoPassword}</span>
								<br> <br>
								<h5>確認新密碼</h5>
								<input type="password" name="re_Password" /> <span>${errors.checkProblem}</span>
								<br>
								<button class="btn btn-primary mt-3" type="submit">更新</button>

							</div>
						</form>

					</div>




				</div>



				<!-- ///// -->

			</main>
		</div>
	</div>
	</div>



	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
	<script src="${contextRoot}/js/dashboard.js"></script>
</html>
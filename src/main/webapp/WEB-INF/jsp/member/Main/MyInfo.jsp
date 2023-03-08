<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
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
								<h3 class="text-center">個人資訊</h3>
							</div>
						</div>

						<!-- /////// -->
						<div class="container">


							<div class="card mt-5">
								<h5 class="card-header">修改密碼</h5>
								<div class="card-body">
									<h5 class="card-title">Special title treatment</h5>
									<p class="card-text">With supporting text below as a natural
										lead-in to additional content.</p>
									<a href="${contextRoot}/member/editpasswordpage?memberId=${memberId}"
										class="btn btn-primary">進入</a>

								</div>
							</div>

							<div class="card mt-5">
								<h5 class="card-header">會員資料</h5>
								<div class="card-body">
									<form action="${contextRoot}/member/editinfopage" method="post">
										<input type="text" name="memberId" value="${memberId}" hidden readonly>
									<h5 class="card-title">請輸入密碼</h5>
									<input type="password" name="memberPassword">
									<span>${errors.WrongPassword}</span>
									
									<br>
									<button type="submit" class="btn btn-primary mt-3">確認</button>
								</form>
								</div>
							</div>


						</div>



						<!-- ///// -->

					</main>
				</div>
			</div>
			</div>



			<jsp:include page="../layout/MainJs.jsp"/>

		</html>
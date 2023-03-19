<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRoot}/css/SignIn.css">

<meta charset="UTF-8">
<title>會員登入</title>
</head>
<body> 
	<section class="gradient-custom">
		
	<div class="container align-middle">
		<div class="container py-5 h-100 ">
			<div
				class=" d-flex justify-content-center align-items-center h-100 ">
				<div class="row col-12 col-md-8 col-lg-6 col-xl-5 ">
					<div class="card bg-secondary text-white"
						style="border-radius: 1rem;">
						<div class="card-body p-5 text-center">

							<div class="mb-md-5 mt-md-4 pb-5">
								
								<form action="${contextRoot}/member/checklogin" method="post">
									<h2 class="fw-bold mb-2 text-uppercase">登入</h2>
									<p class="text-white-50 mb-5">請輸入帳號以及密碼!</p>

									<div class="form-outline form-white mb-4">
										<input type="email" id="email"
											class="form-control form-control-lg" placeholder="註冊信箱"
											name="memberEmail" />
									</div>
									<div>${errors.Email}</div>


									<div class="form-outline form-white mb-4">
										<input type="password" id="password"
											class="form-control form-control-lg" placeholder="密碼"
											name="memberPassword" />

									</div>
									<div>${errors.Password}</div>
									<div>${errors.msg}</div>


									<p class="small mb-5 pb-lg-2">
										<a class="text-white-50" href="${contextRoot}/forgot/password">忘記密碼</a>
									</p>

									<button class="btn btn-outline-light btn-lg px-5" type="submit">登入</button>
								</form>
								<div class="d-flex justify-content-center text-center mt-4 pt-1">
									<a href="#!" class="text-white"><i
										class="fab fa-facebook-f fa-lg"></i></a> <a href="#!"
										class="text-white"><i
										class="fab fa-twitter fa-lg mx-4 px-2"></i></a> <a href="#!"
										class="text-white"><i class="fab fa-google fa-lg"></i></a>
								</div>

								<div class="">
									<div class="">
										<a class="btn btn-outline-dark bg-light" href="${contextRoot}/oauth2/authorization/google"
											role="button" style="text-transform: none"> <img
											width="20px" style="margin-bottom: 3px; margin-right: 5px"
											alt="Google sign-in"
											src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
											Login with Google
										</a>
									</div>
								</div>

							</div>

									<div class="row mt-3 " id="quickLogin">
								            <div class="col-4">
								              <button type="submit" class="btn btn-dark btn-block" id="member1">一般會員登入</button>
								            </div>
								            <div class="col-4">
								              <button type="submit" class="btn btn-dark btn-block" id="member4">電子書會員登入</button>
								            </div>
								            <div class="col-4">
								              <button type="submit" class="btn btn-dark btn-block" id="member2">購買會員登入</button>
								            </div>
								             <div class="col-4 mt-3">
								              <button type="submit" class="btn btn-dark btn-block" id="member3">客服會員登入</button>
								            </div>
								      </div>
										<br>
							<div>
								<p class="mb-0">
									還未註冊? <a href="${contextRoot}/guest/signup" class="text-white-50 fw-bold">註冊會員</a>
								</p>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	</section>

<script>
      const accountInfo = {
        'member1': {
          username: "bookeeit157@gmail.com",
          password: "12345"
        },
        'member2': {
          username: "abc123@gmail.com",
          password: "abc123"
        },
        'member3': {
          username: "def456@gmail.com",
          password: "def456"
        },
        'member4': {
            username: "123jkl@oulook.com",
            password: "123jkl"
          }
      }
      function quickLogin(jobLevel) {
        document.getElementById("email").value = accountInfo[jobLevel].username;
        document.getElementById("password").value = accountInfo[jobLevel].password;
        
      }

      for (let btn of document.querySelectorAll("#quickLogin > div > button")) {
        btn.addEventListener("click", () => {quickLogin(btn.getAttribute("id"))})
      }

    </script>


</body>
</html>
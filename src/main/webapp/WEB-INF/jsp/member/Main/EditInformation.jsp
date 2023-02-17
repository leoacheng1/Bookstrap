<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>個人資訊</title>
 <style>
          .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
          }
    
          @media (min-width: 768px) {
            .bd-placeholder-img-lg {
              font-size: 3.5rem;
            }
          }
    
          .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
          }
    
          .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
          }
    
          .bi {
            vertical-align: -.125em;
            fill: currentColor;
          }
    
          .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
          }
    
          .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
          }
        </style>
    
        
        <!-- Custom styles for this template -->
        <link href="${contextRoot}/css/form-validation.css" rel="stylesheet">
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
						<h3 class="text-center">更新個人資料</h3>
					</div>
				</div>

				<!-- /////// -->

				<div class="container">
      <main>
        
       
          
        <div class="row g-5">
        
          <div class="">
           
            
            <form class="needs-validation" action="${contextRoot}/member/editinfo" novalidate method="post">

           

              <div class="row g-3">
               <input type="text" value="${memberId}" readonly hidden name="memberId">
                
                <div class="col-sm-6">
                  <label for="memberName" class="form-label">電子郵件地址 <span class="text-muted">*</span></label>
                  <input type="text" class="form-control" id="email" placeholder="請輸入姓名" required value="${memberDetail.memberName}" name="memberName">
                 <div class="invalid-feedback">
                    請輸入姓名
                  </div>
                </div>
                
                <div class="col-sm-6">
                  <label for="birthday" class="form-label">出生年月日 <span class="text-muted">*</span></label>
                  <input type="date" class="form-control" id="birthday" placeholder="請輸入姓名" required value="${memberDetail.memberBirthday}" name="memberBirthday">
                 <div class="invalid-feedback">
                    請輸入出生年月日
                  </div>
                </div>
                       
                <div class="col-12">
                  <label for="email" class="form-label">電子郵件地址 <span class="text-muted">(Optional)</span></label>
                  <input type="email" class="form-control" id="email" placeholder="請輸入電子郵件地址" required value="${memberDetail.memberEmail}" name="memberEmail">
                 <div class="invalid-feedback">
                    請輸入電子郵件地址
                  </div>
                </div>
    
                <div class="col-12">
                  <label for="phone" class="form-label">聯絡電話</label>
                  <input type="text" class="form-control" id="phone" placeholder="請輸入連絡電話" required name="memberPhone" value="${memberDetail.memberPhone}" name="memberPhone">
                  <div class="invalid-feedback">
                    請輸入電話號碼
                  </div>
                </div>
    
                <div class="col-12">
                  <label for="address" class="form-label">連絡地址 <span class="text-muted">(Optional)</span></label>
                  <input type="text" class="form-control" id="address" placeholder="請輸入聯絡地址" required name="memberAddress" value="${memberDetail.memberAddress}" name="memberAddress">
                  <div class="invalid-feedback">
                    請輸入聯絡地址
                  </div>
                </div>
    
                <div class="col-md-5">
                  <label for="gender" class="form-label">性別</label>
                  <select class="form-select" id="gender"  name="memberGender" value="${memberDetail.memberSex}" required>
                    <option value="">請選擇性別</option>
                    <option value="1" >男</option>
                    <option value="2">女</option>
                    <option value="3">其他</option>

                  </select>
                  <div class="invalid-feedback">
                    Please select a valid country.
                  </div>
                </div>
              
               
             
    
             
    
              
    
              
    
              <hr class="my-4">
    
              <button class="w-50 btn btn-primary btn-lg" type="submit">更新</button>
            </form>
          </div>
        </div>
      </main>
    
      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017–2022 Company Name</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    </div>


				<!-- ///// -->

			</main>
		</div>
	</div>
	</div>



	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/js/form-validation.js"></script>
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
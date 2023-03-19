<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/"> -->
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
        <link rel="stylesheet" href="${contextRoot}/css/bootstrap.css">
	<link href="${contextRoot}/css/form-validation.css" rel="stylesheet">
</head>
<body>

<div class="container">
      <main>
        <div class="py-5 text-center">
          <img class="d-block mx-auto mb-4" src="${contextRoot}/logo/logo2.png" alt="" width="50" height="57">
          <h2>個人基本資料</h2>
          <p></p>
        </div>
    
        <div class="row g-5">
        
          <div class="">
            <h4 class="mb-3 fw-bold">請輸入以下資訊</h4>
            <br>
            
            
            <form class="needs-validation" novalidate action="${contextRoot}/member/post" method="post" enctype="multipart/form-data">
            <input type="text" value="${memberId}" readonly  name="memberId" hidden>
              <div class="row g-3">
                <div class="col-sm-6">
                  <label for="lastName" class="form-label">姓<span class="text-muted">*</span></label>
                  <input type="text" class="form-control" id="lastName" placeholder="請輸入姓氏" value="" required name="memberLastName">
                  <div class="invalid-feedback">
                    Valid lastName name is required.
                  </div>
                </div>
    
                <div class="col-sm-6">
                  <label for="firstName" class="form-label">名<span class="text-muted">*</span></label>
                  <input type="text" class="form-control" id="firstName" placeholder="請輸入名字" value="" required name="memberFirstName">
                  <div class="invalid-feedback">
                    Valid first name is required.
                  </div>
                </div>
    
                

                 
                
    
                <div class="col-12">
                  <label for="phone" class="form-label">聯絡電話<span class="text-muted">*</span></label>
                  <input type="text" class="form-control" id="phone" placeholder="請輸入連絡電話" required name="memberPhone">
                  <div class="invalid-feedback">
                    請輸入電話號碼
                  </div>
                </div>
    
                <div class="col-12">
                  <label for="address" class="form-label">連絡地址 <span class="text-muted">*</span></label>
                  <input type="text" class="form-control" id="address" placeholder="請輸入聯絡地址" required name="memberAddress">
                  <div class="invalid-feedback">
                    請輸入聯絡地址
                  </div>
                </div>
                
                <div class="col-12">
                  <label for="address" class="form-label">出生年月日 <span class="text-muted">*</span></label>
                  <input type="date" class="form-control" id="birthdy" required name="memberBirthday">
                  <div class="invalid-feedback">
                    請選擇出生年月日
                  </div>
                </div>
                <div class="col-12">
                  <label for="photo" class="form-label">大頭照 <span class="text-muted"></span></label>
                  <input type="file" class="form-control" id="photo"  name="memberPhoto">
                  
                </div>
    
                <div class="col-md-5">
                  <label for="gender" class="form-label" >性別<span class="text-muted">*</span></label>
                  <select class="form-select" id="gender" required name="memberSex">
                    <option value="">請選擇性別</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                    <option value="3">其他</option>

                  </select>
                  <div class="invalid-feedback">
                    Please select a valid country.
                  </div>
                </div>
                
    
               
              <hr class="my-4">
    
              <div class="form-check">
                <input type="checkbox" class="form-check-input" id="same-address">
                <label class="form-check-label" for="same-address">我已同意會員條款</label>
              </div>
    			
    			 
              
    
              <hr class="my-4">
    
              <button class="w-100 btn btn-primary btn-lg" type="submit">送出</button>
            </form>
          </div>
        </div>
        <div class="row mt-3" id="quickLogin">
								            <div class="col-5">
<!-- 								              <button type="submit" class="btn btn-dark btn-block" id="member1">一般會員註冊</button> -->
								            </div>
								              <div class="col-4">
								              <button type="submit" class="btn btn-dark btn-block" id="member1">會員1</button>
								              <button type="submit" class="btn btn-dark btn-block" id="member2">會員google</button>
								            </div>
								             
								            

            </div>
                     
				 


      </main>
    
    
      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017–2022 Bookstrap</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    </div>
    
    
        <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    
          <script src="${contextRoot}/js/form-validation.js"></script>

<script>
      const accountInfo = {
        'member1': {
          lastName:"張",
          firstName:"君雅",
          phone:"0988987123",
          address:" 106台北市大安區復興南路一段390號2樓"
        },
        'member2':{
        	lastName:"陳",
            firstName:"駱雯",
            phone:"0988123569",
            address:" 106台北市大安區復興南路一段200號3樓"
        }
      }
      function quickLogin(jobLevel) {
        document.getElementById("lastName").value = accountInfo[jobLevel].lastName;
        document.getElementById("firstName").value = accountInfo[jobLevel].firstName;
        document.getElementById("phone").value = accountInfo[jobLevel].phone;
        document.getElementById("address").value = accountInfo[jobLevel].address;
      }

      for (let btn of document.querySelectorAll("#quickLogin > div > button")) {
        btn.addEventListener("click", () => {quickLogin(btn.getAttribute("id"))})
      }

    </script>


</body>
</html>
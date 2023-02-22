<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
 <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">
    
        
    
        
    
    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
    
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
<div class="container">
      <main>
        <div class="py-5 text-center">
          <img class="d-block mx-auto mb-4" src="logo/logo2.png" alt="" width="50" height="57">
          <h2>更新個人基本資料</h2>
          <p></p>
        </div>
    
        <div class="row g-5">
        
          <div class="">
            <h4 class="mb-3">Billing address</h4>
            
            <form class="needs-validation" novalidate>
              <div class="row g-3">
                <div class="col-sm-6">
                  <label for="lastName" class="form-label">姓</label>
                  <input type="text" class="form-control" id="lastName" placeholder="" value="" required name="memberLastName">
                  <div class="invalid-feedback">
                    Valid lastName name is required.
                  </div>
                </div>
    
                <div class="col-sm-6">
                  <label for="firstName" class="form-label">名</label>
                  <input type="text" class="form-control" id="firstName" placeholder="" value="" required name="memberFirstName">
                  <div class="invalid-feedback">
                    Valid first name is required.
                  </div>
                </div>
    
                <div class="col-12">
                  <label for="" class="form-label">帳號</label>
                  <div class="input-group has-validation">
                    
                    <input type="text" class="form-control" id="memberAccount" placeholder="Username" readonly="readonly" name="memberAccount">
                  <div class="invalid-feedback">
                      Your account is required.
                    </div>
                  </div>
                </div>

               
    
                <div class="col-12">
                  <label for="email" class="form-label">電子郵件地址 <span class="text-muted">(Optional)</span></label>
                  <input type="email" class="form-control" id="email" placeholder="請輸入電子郵件地址" required>
                 <div class="invalid-feedback">
                    請輸入電子郵件地址
                  </div>
                </div>
    
                <div class="col-12">
                  <label for="phone" class="form-label">聯絡電話</label>
                  <input type="text" class="form-control" id="phone" placeholder="請輸入連絡電話" required name="memberPhone">
                  <div class="invalid-feedback">
                    請輸入電話號碼
                  </div>
                </div>
    
                <div class="col-12">
                  <label for="address" class="form-label">連絡地址 <span class="text-muted">(Optional)</span></label>
                  <input type="text" class="form-control" id="address" placeholder="請輸入聯絡地址" required>
                  <div class="invalid-feedback">
                    請輸入聯絡地址
                  </div>
                </div>
    
                <div class="col-md-5">
                  <label for="gender" class="form-label">性別</label>
                  <select class="form-select" id="gender" required>
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
                <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
              </div>
    
              <div class="form-check">
                <input type="checkbox" class="form-check-input" id="save-info">
                <label class="form-check-label" for="save-info">Save this information for next time</label>
              </div>
    
              <hr class="my-4">
    
              
    
              <hr class="my-4">
    
              <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
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
    
    
        <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    
          <script src="${contextRoot}/js/form-validation.js"></script>
      </body>
</html>
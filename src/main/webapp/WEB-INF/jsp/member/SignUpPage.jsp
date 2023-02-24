<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊會員</title>

<link rel="stylesheet" href="${contextRoot}/css/bootstrap.css">
<link rel="stylesheet" href="${contextRoot}/css/SignUp.css">
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css.map" type="application/octet-stream">
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.css.map" type="application/octet-stream">
</head>
<body>
  <section class="gradient-custom section-custom-hight section-custom-width">
    

    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <!-- col-lg-10可改註冊框大小 -->
        <div class="col-lg-10 col-xl-6">
          <div class="card rounded-3">
            <img src="${contextRoot}/signupbackground/bg.png" class="w-100 "
              style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;" alt="Sample photo">
            <div class="card-body p-4 p-md-5">

              <div class="d-flex mb-4">
              <img src="${contextRoot}/logo/logo2.png" width="70px" class="my-auto">
              <h3 class="my-auto ps-2 fw-bold">註冊</h3>
            </div>

              <form class="row needs-validation" action="${contextRoot}/member/registration" method="post">

                <!-- 左  頭 -->
                <div class="container  me-5">

                  <!-- md改input寬 -->
                 
                    <div class="form-outline datepicker mb-3">
                      <input type="email" class="form-control" id="memberEmail" name="memberEmail" required/>
                      <label for="exampleDatepicker1" class="form-label" required>電子郵件地址</label>
                    </div>
                        <div style="color: red;" class="accountExist">
                        
                        </div>
                        <div style="color: green;" class="accountNotExist">
                        
                        </div>
                    
                        
                        <br>
                    <div class="form-outline datepicker mb-3">
                      <input type="password" class="form-control"  name="memberPassword" required/>
                      <label for="exampleDatepicker1" class="form-label" >密碼</label>
                    </div>
                        <br>
                    <div class="form-outline datepicker mb-3">
                      <input type="password" class="form-control"  name="re_memberPassword" required/>
                      <label for="exampleDatepicker1" class="form-label">密碼確認</label>
                    </div>
                    <div style="color: red;">
                        ${errors.PasswordWrong}
                        </div>
                        <br>
                    <div class="form-outline datepicker mb-3">
                     
                    
                      <div class="form-outline datepicker mb-3">
                       
                      </div>


                    </div>

                  </div>

                  <button type="submit" class="btn btn-success btn-lg mb-1" id="submitButton">Submit</button>
                  
                </div>
               


              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <script  src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
  <script  src="${contextRoot}/js/form-validation.js"></script>
  <script  src="${contextRoot}/js/member/CheckAccount.js"></script>
  <script  src="${contextRoot}/js/member/axios.min.js"></script>

  
  
</body>
</html>
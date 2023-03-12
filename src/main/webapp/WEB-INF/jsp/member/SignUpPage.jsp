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
<%-- <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css.map" type="application/octet-stream"> --%>
<%-- <link rel="stylesheet" href="${contextRoot}/css/bootstrap.css.map" type="application/octet-stream"> --%>
</head>
<body>
  <section class="gradient-custom section-custom-hight section-custom-width">
    

    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100 ">
        <!-- col-lg-10可改註冊框大小 -->
        <div class="col-lg-10 col-xl-6">
        
<!--         body -->
          <div class="card rounded-3 ">
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
                 
                    <div class=" mb-3">
                      <input type="email" class="form-control" id="memberEmail" name="memberEmail" required/>
                      <label for="exampleDatepicker1" class="form-label" >電子郵件地址</label>
                    </div>
                        <div style="color: red;" class="accountExist">
                        
                        </div>
                        <div style="color: green;" class="accountNotExist">
                        
                        </div>
                    
                        
                        <br>
                    <div class="  mb-3">
                      <input type="password" class="form-control" id="memberPassword"  name="memberPassword" required/>
                      <label for="exampleDatepicker1" class="form-label" >密碼</label>
                    </div>
                        <br>
                    <div class="  mb-3">
                      <input type="password" class="form-control" id="memberRePassword" name="re_memberPassword" required/>
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
              
              <div class="row mt-3" id="quickLogin">
								            <div class="col-5">
<!-- 								              <button type="submit" class="btn btn-dark btn-block" id="member1">一般會員註冊</button> -->
								            </div>
								              <div class="col-4">
								              <button type="submit" class="btn btn-dark btn-block" id="member1">一般會員註冊</button>
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
          email: "12345@gmail.com",
          password: "12345",
          rePassword:"12345"
        },
        'member2': {
        	email: "1234@gmail.com",
          password: "1234",
          rePassword:"1234"
        },
        'member3': {
        	email: "employee",
          password: "1234",
          rePassword:"1234"
        }
      }
      function quickLogin(jobLevel) {
        document.getElementById("memberEmail").value = accountInfo[jobLevel].email;
        document.getElementById("memberPassword").value = accountInfo[jobLevel].password;
        document.getElementById("memberRePassword").value = accountInfo[jobLevel].rePassword;
      }

      for (let btn of document.querySelectorAll("#quickLogin > div > button")) {
        btn.addEventListener("click", () => {quickLogin(btn.getAttribute("id"))})
      }

    </script>
                 
  <script  src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<%--   <script  src="${contextRoot}/js/form-validation.js"></script> --%>
  <script  src="${contextRoot}/js/member/CheckAccount.js"></script>
  <script  src="${contextRoot}/js/member/axios.min.js"></script>

  
  
</body>
</html>
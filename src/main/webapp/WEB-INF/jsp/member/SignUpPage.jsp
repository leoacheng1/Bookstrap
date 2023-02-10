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
</head>
<body>

  <section class="vh-100 gradient-custom" style="background-color: rgb(26, 24, 28);">
    

    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <!-- col-lg-10可改註冊框大小 -->
        <div class="col-lg-10 col-xl-6">
          <div class="card rounded-3">
            <img src="${contextRoot}/signupbackground/bg.png" class="w-100 "
              style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;" alt="Sample photo">
            <div class="card-body p-4 p-md-5">

              <div class="d-flex mb-4">
              <a href="${contextRoot}/index"><img src="${contextRoot}/logo/logo2.png" width="70px" class="my-auto"></a>
              <h3 class="my-auto ps-2 ">註冊資訊</h3>
            </div>

              <form class="row ">

                <!-- 左  頭 -->
                <div class="col border-end mb-5">

                  <!-- md改input寬 -->
                  <div class="col-md-10 mb-4">
                    <div class="form-outline mb-3">
                      <input type="text" id="form3Example1q" class="form-control" name="memberName" />
                      <label class="form-label" for="form3Example1q">姓名</label>
                    </div>

                    <div class="form-outline datepicker mb-3">
                      <input type="email" class="form-control" id="exampleDatepicker1" name="memberEmail"/>
                      <label for="exampleDatepicker1" class="form-label">電子郵件地址</label>
                    </div>

                    <div class="form-outline datepicker mb-3">
                      <input type="text" class="form-control" id="exampleDatepicker1" name="memberPassword"/>
                      <label for="exampleDatepicker1" class="form-label">密碼</label>
                    </div>
                    <div class="form-outline datepicker mb-3">
                      <input type="text" class="form-control" id="exampleDatepicker1" name="re_memberPassword"/>
                      <label for="exampleDatepicker1" class="form-label">密碼確認</label>
                    </div>
                    <div class="form-outline datepicker mb-3">
                      <input type="text" class="form-control" id="exampleDatepicker1" disabled value="0" hidden name="membervalid"/>
					
					<div class="form-outline datepicker mb-3">
                      <input type="text" class="form-control" id="exampleDatepicker1" disabled value="1" hidden name="memberlevel"/>
                                        
                  </div>

                      <div class="mb-4">

                        <select class="select" name="memberSex"> 
                          <option value="selected" selected disabled>請選取性別</option>
                          <option value="male">男</option>
                          <option value="female">女</option>
                          <option value="other">其他</option>
                        </select>
                        <br>
                          <label for="exampleDatepicker1" class="form-label">性別</label>
                      </div>
                      <div class="form-outline datepicker mb-3">
                       
                      </div>


                    </div>

                  </div>

                </div>
                <!-- 左  尾 -->

                <!-- 右  頭 -->
                <div class="col ms-5">
                  <!-- md改input寬 -->
                  <div class="col-md-10 mb-4">
                    <div class="form-outline mb-3">
                      <input type="date" id="form3Example1q" class="form-control" name="memberBirthday"/>
                      <label class="form-label" for="form3Example1q">出生年月日</label>
                    </div>

                    <div class="form-outline datepicker mb-3">
                      <input type="text" class="form-control" id="exampleDatepicker1" name="memberPhone"/>
                      <label for="exampleDatepicker1" class="form-label">連絡電話</label>
                    </div>

                    <div class="form-outline datepicker mb-3">
                      <input type="text" class="form-control" id="exampleDatepicker1" name="memberCellPhone"/>
                      <label for="exampleDatepicker1" class="form-label">手機號碼</label>
                    </div>
                    <div class="form-outline datepicker mb-3">
                      <input type="text" class="form-control" id="exampleDatepicker1" name="memberAddress"/>
                      <label for="exampleDatepicker1" class="form-label">聯絡地址</label>
                    </div>
                    
                  

                  </div>

                </div>
                <!-- 右  尾 -->


                <button type="submit" class="btn btn-success btn-lg mb-1">Submit</button>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>
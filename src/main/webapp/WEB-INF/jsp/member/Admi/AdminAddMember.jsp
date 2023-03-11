<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
  <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
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

        .ps-custom{
           padding-left: 30px;
        }
    </style>

</head>
<body class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
<%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %> 
<%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>

  <div class="wrapper">
        
        <div class="container ps-custom content-wrapper">
            <h3 class="mb-4 fw-bold">新增會員</h3>
        <h5 class="mb-2 fw-bold">請輸入以下資訊:</h5>
        <br>
       <form class="needs-validation" action="${contextRoot}/admin/post/member" method="post" enctype="multipart/form-data">
                <div class="row g-3" novalidate>
                    <div class="col-sm-6">
                        <label for="lastName" class="form-label">姓<span class="">*</span></label>
                        
                        <spring:bind path="memberDetail.memberLastName">
                        <input name="memberLastName" type="text" class="form-control" id="lastName" placeholder="請輸入姓氏" required/>
                       </spring:bind>
                       
                        <div class="invalid-feedback">
                            Valid lastName name is required.
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <label for="firstName" class="form-label">名<span class="">*</span></label>
                        <spring:bind path="memberDetail.memberFirstName">
                        <input name="memberFirstName" type="text" class="form-control" id="firstName" placeholder="請輸入名字" required/>
                        </spring:bind>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>


                    <div class="col-12">
                        <label for="email" class="form-label">電子信箱<span class="">*</span></label>
                        <spring:bind path="memberDetail.memberEmail">
                        <input name="memberEmail" type="email" class="form-control bg-light" id="memberEmail" placeholder="請輸入電子信箱地址" required/>
                        </spring:bind>
                        <div class="invalid-feedback">
                            請輸入電子信箱地址
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="password" class="form-label">密碼<span class="">*</span></label>
                        <spring:bind path="member.memberPassword">
                        <input name="memberPassword" type="password" class="form-control" id="memberPassword" placeholder="請輸入密碼" required/>
                        </spring:bind>
                        <div class="invalid-feedback">
                            請輸入密碼
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="re_password" class="form-label">確認密碼<span class="">*</span></label>
                        <input  name="re_memberPassword" type="password" class="form-control" id="re_memberPassword" placeholder="確認密碼" required/>
                        <div class="invalid-feedback">
                            確認密碼
                        </div>
                    </div>

                    <div class="col-12 ">
                    	<spring:bind path="member.memberValid">
                        <input hidden type="text" class="form-control" id="memberValid" name="memberValid" value="2"/>
                    	</spring:bind>
                    </div>

                    <div class="col-12 ">
                    	<spring:bind path="member.memberLevel">    
                        	<input hidden type="text" class="form-control" id="memberLevel" name="memberLevel" value="1"/>
                    	</spring:bind>
                    </div>
                    <hr class="bg-white">

                    <div class="col-12">
                        <label for="phone" class="form-label">聯絡電話<span class="">*</span></label>
                       <spring:bind path="memberDetail.memberPhone">
                        <input type="text" class="form-control" id="phone" placeholder="請輸入連絡電話" 
                          name="memberPhone" required/>  
                          </spring:bind>
                      <div class="invalid-feedback"> 
                           請輸入電話號碼 
                         </div> 
                    </div> 

                    <div class="col-12">
                        <label for="address" class="form-label">連絡地址 <span class="">*</span></label>
                        <spring:bind path="memberDetail.memberAddress">
                        <input type="text" name="memberAddress" class="form-control" id="address" placeholder="請輸入聯絡地址" required/>
                        </spring:bind>
                        <div class="invalid-feedback">
                            請輸入聯絡地址
                        </div>
                    </div>

                    <div class="col-5">
                        <label for="birthday" class="form-label">出生年月日 <span class="">*</span></label>
                        <spring:bind path="memberDetail.memberBirthday">
                        <input type="date" class="form-control" id="birthdy" name="memberBirthday" required/>
                        </spring:bind>
                        <div class="invalid-feedback">
                            請選擇出生年月日
                        </div>
                    </div>
                    
                    <div class="col-md-2">
                        <label for="gender" class="form-label">性別<span class="">*</span></label>
                        <spring:bind path="memberDetail.memberSex">
                        <select class="form-select" id="gender" name="memberSex" required>
	                        <option value="">請選擇性別</option>
	                        <option value="1">男</option>
	                        <option value="2">女</option>
	                        <option value="3">其他</option>
                        </select>
                        </spring:bind>
                        <div class="invalid-feedback">
                            Please select a valid country.
                        </div>
                    </div>
                    
                    <div class="col-12"></div>
                    <div class="col-5">
                        <label for="photo" class="form-label">大頭照 <span class=""></span></label>
                        <spring:bind path="memberDetail.memberPhoto">
                        <input type="file" class="form-control" id="memberPhoto" name="memberPhoto"/>
                        </spring:bind>
                        <div class="invalid-feedback">
                            請選擇大頭照
                        </div>
                    </div>

                    <hr class="my-4">

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="same-address" required>
                        <label class="form-check-label" for="same-address">我已同意會員條款</label>
                    </div>




                    <hr class="my-4">

                    <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
            </form>
        </div>
    </div>
    </div>
    </main>



	<!--右側彈跳式功能列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
<!--版型需要的js-->
<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>
</html>
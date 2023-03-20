<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>




<body>
<div class="container-fluid">
    <div class="row">
      <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
        <div class="position-sticky pt-3 sidebar-sticky">
          <ul class="nav flex-column">
            <li class="nav-item">
                <br>
                <br>
              <a class="nav-link " aria-current="page" href="${contextRoot}/member/main">
                <span data-feather="home" class="align-text-bottom"></span>
                我的帳戶
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/member/myorder">
                <span data-feather="file" class="align-text-bottom"></span>
                訂單查詢
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/newshopping/newcart">
                <span data-feather="shopping-cart" class="align-text-bottom"></span>
                購物車
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/member/information">
                <span data-feather="users" class="align-text-bottom"></span>
                個人資訊
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/member/myfavorite?memberId=${memberId}">
                <span data-feather="heart" class="align-text-bottom"></span>
                追蹤商品
              </a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/comment/memberPage?p=1&memberId=${memberId}">
                <span data-feather="list" class="align-text-bottom"></span>
                我的評論
              </a>
            </li>
<!--             <li class="nav-item"> -->
<!--               <a class="nav-link" href="#"> -->
<!--                 <span data-feather="credit-card" class="align-text-bottom"></span> -->
<!--                 付款資訊 -->
<!--               </a> -->
<!--             </li> -->
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/mycoupon">
                <span data-feather="percent" class="align-text-bottom"></span>
                優惠券
              </a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/chatbox">
                <span data-feather="list" class="align-text-bottom"></span>
                客服中心
              </a>
            </li>
           
          </ul>

          <h6
            class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted text-uppercase">
            <span>商品專區</span>
            <a class="link-secondary" href="#" aria-label="Add a new report">
              <span data-feather="menu" class="align-text-bottom"></span>
            </a>
          </h6>
          <ul class="nav flex-column mb-2">
<!--             <li class="nav-item"> -->
<!--               <a class="nav-link" href="#"> -->
<!--                 <span data-feather="headphones" class="align-text-bottom"></span> -->
<!--                 有聲書 -->
<!--               </a> -->
<!--             </li> -->
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/member/myebook?memberId=${memberId}">
                <span data-feather="book-open" class="align-text-bottom"></span>
                電子書
              </a>
            </li>

          </ul>
        </div>
      </nav>
     
     
      </body>
      </html>
     
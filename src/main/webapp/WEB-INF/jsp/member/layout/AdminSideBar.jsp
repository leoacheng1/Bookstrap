<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    
    <!-- ----------------side bar top--------------- -->
   
   <aside class="main-sidebar sidebar-dark-primary elevation-4">

    <a href="index3.html" class="brand-link">
      <img src="http://localhost:8080/Bookstrap/logo/logo2.png" class="brand-image img-circle elevation-3"
        style="opacity: .8">
      <span class="brand-text font-weight-light">Bookstrap</span>
    </a>
  
    <div class="sidebar">
  
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="http://localhost:8080/Bookstrap/eddie/images/user.jpg" class="img-circle elevation-2">
        </div>
        <div class="info">
          <a href="#" class="d-block">Bookstrap user</a>
        </div>
      </div>
  
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
        <div class="sidebar-search-results">
          <div class="list-group"><a href="#" class="list-group-item">
              <div class="search-title"><strong class="text-light"></strong>N<strong class="text-light"></strong>o<strong
                  class="text-light"></strong> <strong class="text-light"></strong>e<strong
                  class="text-light"></strong>l<strong class="text-light"></strong>e<strong
                  class="text-light"></strong>m<strong class="text-light"></strong>e<strong
                  class="text-light"></strong>n<strong class="text-light"></strong>t<strong class="text-light"></strong>
                <strong class="text-light"></strong>f<strong class="text-light"></strong>o<strong
                  class="text-light"></strong>u<strong class="text-light"></strong>n<strong
                  class="text-light"></strong>d<strong class="text-light"></strong>!<strong class="text-light"></strong>
              </div>
              <div class="search-path"></div>
            </a></div>
        </div>
      </div>
  
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          

              <!-- member top -->

              <li class="nav-header">會員管理</li>
              <li class="nav-item">
                <a href="${contextRoot}/member/admin/allmember" class="nav-link">
                <i class="nav-icon fas fa-calendar-alt"></i>
                <p>
                  查詢所有會員
                  <span class="badge badge-info right"></span>
                </p>
            
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-calendar-alt"></i>
                <p>
                  功能2
                  <span class="badge badge-info right"></span>
                </p>
            
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-calendar-alt"></i>
                <p>
                  功能3
                  <span class="badge badge-info right"></span>
                </p>
            
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                <i class="nav-icon fas fa-table"></i>
                <p>
                  功能下拉選單
                  <i class="fas fa-angle-left right"></i>
                </p>
                </a>
                <ul class="nav nav-treeview" style="display: none;">
                <li class="nav-item">
                  <a href="pages/tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>功能1</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="pages/tables/data.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>功能2</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="pages/tables/jsgrid.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>功能3</p>
                  </a>
                </li>
                </ul>
              </li>

              <!-- member bottom -->

        </ul>
      </nav>
  
    </div>
  
  </aside>

   <!-- ------------------side bar bottom------------- -->
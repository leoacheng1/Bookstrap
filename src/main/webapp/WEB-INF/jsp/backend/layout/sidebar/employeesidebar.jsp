<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

  <a href="${contextRoot}/backend/index" class="brand-link"> 
    <img src="${contextRoot}/logo/logo2.png" class="brand-image img-circle elevation-3"
      style="opacity: .8">
    <span class="brand-text font-weight-light">Bookstrap</span>
  </a>

  <div class="sidebar">

    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <img src="${contextRoot}/employee/photo/${sessionScope.empAccount}" class="img-circle elevation-2">
      </div>
      <div class="info">
        <a href="#" class="d-block">Hello, ${sessionScope.empName}</a>
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
        <%@ include file="../sidebarlinks/employeelinks.jsp" %> 
      </ul>
    </nav>

  </div>

</aside>
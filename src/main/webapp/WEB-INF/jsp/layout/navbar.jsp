<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="jstl"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${contextRoot}/css/index.css" />

</head>
<body>
    <!-- <nav class="navbar navbar-expand-lg row" style="background-color: #ddd0c8">
      <div class="container-fluid container">
        <a class="navbar-brand" href="${contextRoot}">商城後台</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse col-3" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" href="${contextRoot}/books/search" aria-current="page">首頁</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/books/page">所有書籍</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/books/add">新增書籍</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="${contextRoot}/">disabled</a>
            </li>
          </ul>
        </div>
           
        
        <div class="input-group d-flex mx-auto my-auto col-5" style="width:500px">
          <input
            type="text"
            id="search"
            class="search form-control w-50"
            aria-label="Text input with dropdown button"/>
          <button class=" btn btn-dark" type="button" id=" button-addon2">搜尋
            <i class="fa-solid fa-magnifying-glass"></i>
          </button>
        </div>
        
        <div class="col-3"></div>
        
        <div class="col-1">
          <a href="${contextRoot}/index">商城前台</a>
        </div>
      </div>
    </nav> -->
    
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
</body>
</html>

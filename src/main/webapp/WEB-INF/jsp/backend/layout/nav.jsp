<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<nav class="main-header navbar navbar-expand navbar-dark">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
    <li class="nav-item d-none d-sm-inline-block">
      <a href="${contextRoot}/backend/index" class="nav-link">首頁</a>
    </li>
  </ul>

  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">

    <!-- Messages Dropdown Menu -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-envelope"></i>
        <span class="badge badge-danger navbar-badge nav-mail-count">${fn:length(unreadMails)}</span>
      </a>
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" id="nav-mail-dropdown">
        <jstl:if test="${not empty unreadMails}">
          <jstl:forEach items="${unreadMails}" var="accmail" begin="0" end="2">
            <a href="${contextRoot}/backend/mailpage/readmail/${accmail.mail.mailId}" class="dropdown-item nav-mail-link">
              <!-- Message Start -->
              <div class="media">
                <img src="${contextRoot}/employee/photo/${accmail.mail.accountFrom.employee.account}" alt="User Avatar" class="img-size-50 mr-3 img-circle nav-mail-empPhoto">
                <div class="media-body">
                  <h3 class="dropdown-item-title nav-mail-empName">
                    ${accmail.mail.accountFrom.employee.empName}
                    <span class="float-right text-sm text-danger"></span>
                  </h3>
                  <p class="text-sm nav-mail-subject">${accmail.mail.mailSubject}</p>
                  <p class="text-sm text-muted nav-mail-time"><i class="far fa-clock mr-1"></i> <fmt:formatDate type="both" 
                    value="${accmail.mail.mailTime}" timeStyle="short"/></p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
          </jstl:forEach>
        </jstl:if>
        <a href="${contextRoot}/backend/mailpage/mailbox/folder/inbox" class="dropdown-item dropdown-footer">瀏覽所有郵件</a>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
        <i class="fas fa-th-large"></i>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${contextRoot}/backend/logout">
        <i class="fa fa-power-off"></i>
      </a>
    </li>
  </ul>
</nav>
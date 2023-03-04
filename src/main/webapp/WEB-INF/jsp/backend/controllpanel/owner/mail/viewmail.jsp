<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <!--版型需要的css -->
    <link rel="stylesheet" href="${contextRoot}/eddie/css/sweetalert2.min.css">
    <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
    <link rel="stylesheet" href="${contextRoot}/eddie/css/mailside.css">
      <style>
        .mailbox-attachment-name {
          display: inline-block;
          height: 100px;
          max-width: 190px;
        }

        .mailbox-attachment-icon {
          font-size: 50px;
        }
      </style>
  </head>

  <body
    class="sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse" data-ref="${mailAccount.accountId}">
    <div class="wrapper">
      <!--上面導覽列 -->
      <%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %>
        <!-- 左邊導覽列 -->
        <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/ownersidebar.jsp" %>
          <div class="content-wrapper" style="min-height: 1302.4px;">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <div class="container-fluid">
                <div class="row mb-2">
                  <div class="col-sm-6">
                    <h1>Compose</h1>
                  </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="#">Home</a></li>
                      <li class="breadcrumb-item active">Compose</li>
                    </ol>
                  </div>
                </div>
              </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
              <div class="container-fluid">
                <div class="row">
                  <div class="col-md-3">
                    <a href="${contextRoot}/backend/mailpage/mailbox/folder/inbox" class="btn btn-primary btn-block mb-3">收件匣</a>

                    <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">郵件匣</h3>

                        <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                          </button>
                        </div>
                      </div>
                      <div class="card-body p-0">
                        <ul class="nav nav-pills flex-column" id="folder-ul">
                          <li class="nav-item">
                            <a href="${contextRoot}/backend/mailpage/mailbox/folder/inbox" class="nav-link" data-typename = "inbox">
                              <i class="fas fa-inbox"></i> 收件匣
                              <span class="badge bg-primary float-right" id="inbox-count">${mailCount.inboxCount != 0 ? mailCount.inboxCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="${contextRoot}/backend/mailpage/mailbox/folder/sent" class="nav-link" data-typename = "sent">
                              <i class="fa fa-paper-plane"></i> 已寄出
                              <span class="badge bg-success float-right" id="sent-count">${mailCount.sentCount != 0 ? mailCount.sentCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="${contextRoot}/backend/mailpage/mailbox/folder/draft" class="nav-link" data-typename = "draft">
                              <i class="far fa-file-alt"></i> 草稿
                              <span class="badge bg-warning float-right" id="draft-count">${mailCount.draftCount != 0 ? mailCount.draftCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="${contextRoot}/backend/mailpage/mailbox/folder/bin" class="nav-link" data-typename = "bin">
                              <i class="far fa-trash-alt"></i> 回收桶
                              <span class="badge bg-danger float-right" id="bin-count">${mailCount.binCount != 0 ? mailCount.binCount : ''}</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                      <!-- /.card-body -->
                    </div>
                    <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">類別</h3>

                        <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                          </button>
                        </div>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body p-0">
                        <ul class="nav nav-pills flex-column" id="category-ul">
                          <li class="nav-item">
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/category/normal" data-typename = "normal">
                              <i class="far fa-envelope text-secondary"></i> 一般信件
                              <span class="badge badge-primary float-right" id="normal-count">${mailCount.normalCount != 0 ? mailCount.normalCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/category/job" data-typename = "job">
                              <i class="fa fa-briefcase text-secondary"></i> 工作指派
                              <span class="badge badge-primary float-right" id="job-count">${mailCount.workCount != 0 ? mailCount.workCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/category/company" data-typename = "company">
                              <i class="fa fa-bullhorn text-secondary"></i> 公司訊息
                              <span class="badge badge-primary float-right" id="company-count">${mailCount.companyCount != 0 ? mailCount.companyCount : ''}</span>
                            </a>
                          </li>
                        </ul>
                      </div>
                      <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                    <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">標籤</h3>

                        <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                          </button>
                        </div>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body p-0">
                        <ul class="nav nav-pills flex-column" id="label-ul">
                          <li class="nav-item">
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/label/starred" data-typename = "starred">
                              <i class="fas fa-star text-secondary"></i> 加入星號
                              <span class="badge badge-warning float-right" id="starred-count">${mailCount.starredCount != 0 ? mailCount.starredCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/label/important" data-typename = "important">
                              <i class="fa fa-flag text-secondary" style="padding-left: 3px; padding-right: 2px;"></i> 重要郵件
                              <span class="badge badge-warning float-right" id="important-count">${mailCount.importantCount != 0 ? mailCount.importantCount : ''}</span>
                            </a>
                          </li>
                          <jstl:forEach items="${mailAccount.accountLabels}" var="label">
                            <li class="nav-item label-li" data-lid="${label.labelId}">
                            <a class="nav-link user-label" href="${contextRoot}/backend/mailpage/mailbox/l/label/${label.labelId}" data-typename = "${label.labelId}">
                              <i class="fa fa-tag text-secondary" style="padding-left:3px;padding-right: 2px;"></i> ${label.labelName}
                              <i class="fa fa-trash text-primary invisible float-right"></i>
                            </a>
                          </li>
                          </jstl:forEach>
                          <li class="nav-item">
                            <a class="nav-link" href="#" id="add-label">
                              <i class="fa fa-plus-square text-secondary" style="padding-left:2px;padding-right: 2px;"></i> 新增標籤
                            </a>
                          </li>
                        </ul>
                      </div>
                      <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-9">
                    <div class="card card-primary card-outline">
                      <div class="card-header">
                        <h3 class="card-title">Read Mail</h3>

                        <div class="card-tools">
                          <a href="#" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                          <a href="#" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
                        </div>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body p-0">
                        <div class="mailbox-read-info">
                          <h5></h5>
                          <h6>
                            <span class="mailbox-read-time float-right"></span>
                          </h6>
                        </div>
                        <!-- /.mailbox-read-info -->
                        <div class="mailbox-controls with-border text-center">
                          <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete">
                              <i class="far fa-trash-alt"></i>
                            </button>
                            <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
                              <i class="fas fa-reply"></i>
                            </button>
                            <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward">
                              <i class="fas fa-share"></i>
                            </button>
                          </div>
                          <!-- /.btn-group -->
                          <button type="button" class="btn btn-default btn-sm" title="Print">
                            <i class="fas fa-print"></i>
                          </button>
                        </div>
                        <!-- /.mailbox-controls -->
                        <div class="mailbox-read-message">
                          <h1 style="color:red">無法顯示郵件內容</h1>
                        </div>
                        <!-- /.mailbox-read-message -->
                      </div>
                      <!-- /.card-body -->
                      <div class="card-footer bg-white">
                        <ul class="mailbox-attachments align-items-stretch d-flex clearfix flex-wrap">

                        </ul>
                      </div>
                      <!-- /.card-footer -->
                      <div class="card-footer">
                        <div class="float-right">
                          <button type="button" class="btn btn-default"><i class="fas fa-reply"></i> Reply</button>
                          <button type="button" class="btn btn-default"><i class="fas fa-share"></i> Forward</button>
                        </div>
                        <button type="button" class="btn btn-default"><i class="far fa-trash-alt"></i> Delete</button>
                        <button type="button" class="btn btn-default"><i class="fas fa-print"></i> Print</button>
                      </div>
                      <!-- /.card-footer -->
                    </div>
                    <!-- /.card -->
                  </div>
                  <!-- /.col -->
                </div>
                <!-- /.row -->
              </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
          </div>
          <div class="preloader flex-column justify-content-center align-items-center" style="background-color: darkgrey;">
            <div class="overlay" style="margin-left: 100px;">
              <span style="visibility: hidden;">推一下</span>
              <i class="fas fa-3x fa-sync-alt fa-spin" style="font-size: 5rem;"></i>
              <div class="text-bold pt-4">
                <h3>郵件讀取中......</h3>
              </div>
            </div>
          </div>
    </div>
    <!--右側彈跳式功能列 -->
    <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/ownercontroll.jsp" %>
      <!--版型需要的js-->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="http://localhost:8080/Bookstrap/eddie/js/jquery.overlayScrollbars.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
      <script src="http://localhost:8080/Bookstrap/eddie/js/adminlte.min.js"></script>
      <!-- <script src="http://localhost:8080/Bookstrap/eddie/js/layoutfix.js"></script> -->
      <script>
        $('.main-sidebar').toggleClass("sidebar-dark-danger");
        $('.brand-link').toggleClass("bg-danger");
        $('.main-header').toggleClass("bg-gray");
      </script>
        <script src="${contextRoot}/eddie/js/axios.min.js"></script>
        <script src="${contextRoot}/eddie/js/sweetalert2.all.min.js"></script>
        <script src="${contextRoot}/eddie/js/mail/viewmail.js"></script>
  </body>

  </html>
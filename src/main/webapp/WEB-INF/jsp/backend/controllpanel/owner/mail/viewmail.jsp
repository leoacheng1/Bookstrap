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
    class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse" data-ref="${empId}">
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
                    <a href="http://localhost:8080/Bookstrap/backend/inbox" class="btn btn-primary btn-block mb-3">Back to Inbox</a>

                    <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">Folders</h3>

                        <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                          </button>
                        </div>
                      </div>
                      <div class="card-body p-0">
                        <ul class="nav nav-pills flex-column">
                          <li class="nav-item active">
                            <a href="#" class="nav-link">
                              <i class="fas fa-inbox"></i> Inbox
                              <span class="badge bg-primary float-right">12</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="#" class="nav-link">
                              <i class="far fa-envelope"></i> Sent
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="#" class="nav-link">
                              <i class="far fa-file-alt"></i> Drafts
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="#" class="nav-link">
                              <i class="fas fa-filter"></i> Junk
                              <span class="badge bg-warning float-right">65</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="#" class="nav-link">
                              <i class="far fa-trash-alt"></i> Trash
                            </a>
                          </li>
                        </ul>
                      </div>
                      <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                    <div class="card">
                      <div class="card-header">
                        <h3 class="card-title">Labels</h3>

                        <div class="card-tools">
                          <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                          </button>
                        </div>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body p-0">
                        <ul class="nav nav-pills flex-column">
                          <li class="nav-item">
                            <a class="nav-link" href="#"><i class="far fa-circle text-danger"></i> Important</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#"><i class="far fa-circle text-warning"></i> Promotions</a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#"><i class="far fa-circle text-primary"></i> Social</a>
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
      <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
        <script src="${contextRoot}/eddie/js/axios.min.js"></script>
        <script src="${contextRoot}/eddie/js/sweetalert2.all.min.js"></script>
        <script src="${contextRoot}/eddie/js/mail/viewmail.js"></script>
  </body>

  </html>
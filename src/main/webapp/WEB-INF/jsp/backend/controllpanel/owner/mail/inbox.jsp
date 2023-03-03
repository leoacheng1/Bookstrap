<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>收件匣</title>
        <!--版型需要的css -->
        <link rel="stylesheet" href="${contextRoot}/eddie/css/sweetalert2.min.css">
        <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
        <link rel="stylesheet" href="${contextRoot}/eddie/css/select2.min.css">
        <link rel="stylesheet" href="${contextRoot}/eddie/css/mailside.css">
            <style>
                .ellipsis {
                    overflow: hidden;
                    white-space: nowrap;
                    text-overflow: ellipsis;
                }

                .mailbox-subject {
                    /* no idea if min width works */
                    min-width: 500px; 
                    max-width: 500px;
                    padding-left: 0rem !important;
                    color: darkgray;
                }

                .mailbox-subject a {
                    color: black;
                }

                .mailbox-important {
                    padding: 0.75rem 0.3rem 0.75rem 0.3rem !important;
                }

                .mailbox-star {
                    padding: 0.75rem 0.3rem 0.75rem 0rem !important;
                }

                .mailbox-subject:hover {
                    cursor: pointer;
                }

                .mailbox-subject a:hover {
                    color: black
                }
            </style>
    </head>

    <body
        class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse" data-ref="${mailAccount.accountId}">
        <div class="wrapper">
            <!--上面導覽列 -->
            <%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %>
                <!-- 左邊導覽列 -->
                <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/ownersidebar.jsp" %>
                    <div class="content-wrapper" style="min-height: 2056.4px;">
                        <!-- Content Header (Page header) -->
                        <section class="content-header">
                            <div class="container-fluid">
                                <div class="row mb-2">
                                    <div class="col-sm-6">
                                        <h1>瀏覽郵件</h1>
                                    </div>
                                    <div class="col-sm-6">
                                        <ol class="breadcrumb float-sm-right">
                                            <li class="breadcrumb-item"><a href="#">個人信箱</a></li>
                                            <li class="breadcrumb-item active">瀏覽郵件</li>
                                        </ol>
                                    </div>
                                </div>
                            </div><!-- /.container-fluid -->
                        </section>

                        <!-- Main content -->
                        <section class="content">
                            <div class="row">
                                <div class="col-md-3">
                                    <a href="${contextRoot}/backend/mailpage/composemail" class="btn btn-primary btn-block mb-3">撰寫郵件</a>
                
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
                                            <h3 class="card-title">Inbox</h3>

                                            <div class="card-tools">
                                                <div class="input-group input-group-sm">
                                                    <input type="text" class="form-control" placeholder="Search Mail">
                                                    <div class="input-group-append">
                                                        <div class="btn btn-primary">
                                                            <i class="fas fa-search"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.card-tools -->
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body p-0">
                                            <div class="mailbox-controls">
                                                <!-- Check all button -->
                                                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i
                                                        class="far fa-square"></i>
                                                </button>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default btn-sm" id="delete-mail" data-toggle="tooltip" data-placement="bottom" title="刪除郵件">
                                                        <i class="far fa-trash-alt"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="bottom" title="回覆郵件">
                                                        <i class="fas fa-reply"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip" data-placement="bottom" title="分享郵件">
                                                        <i class="fas fa-share"></i>
                                                    </button>
                                                </div>
                                                <!-- /.btn-group -->
                                                <button type="button" class="btn btn-default btn-sm" id="refreshBtn" data-toggle="tooltip" data-placement="bottom" title="刷新">
                                                    <i class="fas fa-sync-alt"></i>
                                                </button>
                                                <div class="float-right">
                                                      <button class="btn btn-sm btn-secondary dropdown-toggle" type="button" id="labelMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        加入標籤
                                                      </button>
                                                      <div class="dropdown-menu" aria-labelledby="labelMenuButton">
                                                        <a class="dropdown-item" href="#">加入星號</a>
                                                        <a class="dropdown-item" href="#">重要郵件</a>
                                                        <a class="dropdown-item" href="#">自訂標籤</a>
                                                      </div>
                                                    <button type="button" class="btn btn-default btn-sm" id="delete-mail">
                                                        <i class="far fa-trash-alt"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default btn-sm">
                                                        <i class="fas fa-reply"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default btn-sm">
                                                        <i class="fas fa-share"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="table-responsive mailbox-messages">
                                                <table class="table table-hover table-striped">
                                                    <tbody id="mailboxbody">

                                                    </tbody>
                                                </table>
                                                <!-- /.table -->
                                            </div>
                                            <!-- /.mail-box-messages -->
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer p-0">
                                            <div class="mailbox-controls">
                                                <div class="float-right">
                                                    <!-- 1-50/200
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-default btn-sm">
                                                            <i class="fas fa-chevron-left"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-default btn-sm">
                                                            <i class="fas fa-chevron-right"></i>
                                                        </button>
                                                    </div> -->
                                                    <nav aria-label="Page navigation" class="mt-2">
                                                        <ul class="pagination">
                                                          <li class="page-item">
                                                            <a class="page-link" href="#" aria-label="Previous">
                                                              <span aria-hidden="true">&laquo;</span>
                                                              <span class="sr-only">Previous</span>
                                                            </a>
                                                          </li>
                                                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                          <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                          <li class="page-item">
                                                            <a class="page-link" href="#" aria-label="Next">
                                                              <span aria-hidden="true">&raquo;</span>
                                                              <span class="sr-only">Next</span>
                                                            </a>
                                                          </li>
                                                        </ul>
                                                      </nav>
                                                </div>
                                                <!-- /.float-right -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card -->
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </section>
                        <!-- /.content -->
                    </div>
        </div>

        <!--右側彈跳式功能列 -->
        <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/ownercontroll.jsp" %>
            <!--版型需要的js-->
            <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
                <script src="${contextRoot}/eddie/js/axios.min.js"></script>
                <script src="${contextRoot}/eddie/js/sweetalert2.all.min.js"></script>
                <script src="${contextRoot}/eddie/js/select2.min.js"></script>
                <script src="${contextRoot}/eddie/js/mail/mailbox.js"></script>
                <script src="${contextRoot}/eddie/js/mail/mailside.js"></script>
    </body>

    </html>
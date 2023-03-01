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
        class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse" data-ref="${empId}">
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
                                        <h1>收件匣</h1>
                                    </div>
                                    <div class="col-sm-6">
                                        <ol class="breadcrumb float-sm-right">
                                            <li class="breadcrumb-item"><a href="#">個人信箱</a></li>
                                            <li class="breadcrumb-item active">收件匣</li>
                                        </ol>
                                    </div>
                                </div>
                            </div><!-- /.container-fluid -->
                        </section>

                        <!-- Main content -->
                        <section class="content">
                            <div class="row">
                                <div class="col-md-3">
                                    <a href="${contextRoot}/backend/mailpage/inbox" class="btn btn-primary btn-block mb-3">收件匣</a>

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
                                            <ul class="nav nav-pills flex-column">
                                                <li class="nav-item active">
                                                    <a href="#" class="nav-link">
                                                        <i class="fas fa-inbox"></i> 收件匣
                                                        <span class="badge bg-primary float-right">20</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="#" class="nav-link">
                                                        <i class="far fa-envelope"></i> 已寄出
                                                        <span class="badge bg-success float-right">8</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="#" class="nav-link">
                                                        <i class="far fa-file-alt"></i> 草稿
                                                        <span class="badge bg-warning float-right">2</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="#" class="nav-link">
                                                        <i class="far fa-trash-alt"></i> 回收桶
                                                        <span class="badge bg-danger float-right">32</span>
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
                                            <ul class="nav nav-pills flex-column">
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#"><i
                                                            class="far fa-circle text-danger"></i> 一般信件</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#"><i
                                                            class="far fa-circle text-warning"></i> 工作指派</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#"><i
                                                            class="far fa-circle text-primary"></i> 公司訊息</a>
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
                                            <ul class="nav nav-pills flex-column">
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#"><i
                                                            class="far fa-circle text-danger"></i> 自訂標籤一</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#"><i
                                                            class="far fa-circle text-warning"></i> 自訂標籤二</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#"><i
                                                            class="far fa-circle text-primary"></i> 自訂標籤三</a>
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
                                                    <button type="button" class="btn btn-default btn-sm">
                                                        <i class="far fa-trash-alt"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default btn-sm">
                                                        <i class="fas fa-reply"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-default btn-sm">
                                                        <i class="fas fa-share"></i>
                                                    </button>
                                                </div>
                                                <!-- /.btn-group -->
                                                <button type="button" class="btn btn-default btn-sm">
                                                    <i class="fas fa-sync-alt"></i>
                                                </button>
                                                <div class="float-right">
                                                    1-50/200
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-default btn-sm">
                                                            <i class="fas fa-chevron-left"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-default btn-sm">
                                                            <i class="fas fa-chevron-right"></i>
                                                        </button>
                                                    </div>
                                                    <!-- /.btn-group -->
                                                </div>
                                                <!-- /.float-right -->
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
                                                    1-50/200
                                                    <div class="btn-group">
                                                        <button type="button" class="btn btn-default btn-sm">
                                                            <i class="fas fa-chevron-left"></i>
                                                        </button>
                                                        <button type="button" class="btn btn-default btn-sm">
                                                            <i class="fas fa-chevron-right"></i>
                                                        </button>
                                                    </div>
                                                    <!-- /.btn-group -->
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
                <script src="${contextRoot}/eddie/js/mail/mailbox.js"></script>
    </body>

    </html>
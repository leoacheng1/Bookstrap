<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>撰寫郵件</title>
    <!--版型需要的css -->
    <link rel="stylesheet" href="${contextRoot}/eddie/css/summernote-bs4.min.css">
    <link rel="stylesheet" href="${contextRoot}/eddie/css/sweetalert2.min.css">
    <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
    <link rel="stylesheet" href="${contextRoot}/eddie/css/mailside.css">
    <style>
      .remove-attachment{
        color: aliceblue;
        background-color: brown;
        float: right;
      }

      .mailbox-attachment-name {
        display: inline-block;
        height: 100px;
        max-width: 190px;
      }

      .mailbox-attachment-icon{
        font-size: 50px;
      }

      #toastsContainerTopRight {
        position: fixed;
        top: 60px;
        right: 10px;    
      }
      .eddie-toast a{
        padding: 8px 10px 8px 10px;
        border-radius: 5px;
      }
      .eddie-toast a:hover {
        cursor: pointer;
        background-color: lightgray;
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
          <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <div class="container-fluid">
                <div class="row mb-2">
                  <div class="col-sm-6">
                    <h1>撰寫郵件</h1>
                  </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="#">個人信箱</a></li>
                      <li class="breadcrumb-item active">撰寫郵件</li>
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
                        <h3 class="card-title">撰寫郵件</h3>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body">
                        <div class="form-group">
                          <input class="form-control" placeholder="收件者" name = "mailTo">
                        </div>
                        <div class="form-group">
                          <input class="form-control" placeholder="主旨" name = "mailSubject">
                        </div>
                        <div class="form-group">
                          <textarea id="compose-textarea" class="form-control" style="height: 300px">
                          </textarea>
                        </div>
                        <div class="form-group">
                          <div class="btn btn-default btn-file">
                            <i class="fas fa-paperclip"></i> 附件
                            <input type="file" name="attachment" multiple id="attachments">
                          </div>
                          <p class="help-block">附件上限. 32MB</p>
                        </div>
                        <div class="form-group">
                          <ul class="mailbox-attachments align-items-stretch d-flex clearfix flex-wrap"  id="fileplace"> <!--d-flex --> 

                          </ul>
                        </div>
                      </div>
                      <!-- /.card-body -->
                      <div class="card-footer">
                        <div class="float-right">
                          <button type="button" class="btn btn-warning" id="draftBtn"><i class="fas fa-pencil-alt"></i> 草稿</button>
                          <button type="submit" class="btn btn-primary" id="sendBtn" data-toggle="modal" data-target="#sendModal"><i class="far fa-envelope"></i> 送出</button>
                        </div>
                        <button type="reset" class="btn btn-danger" id="giveupBtn" data-toggle="modal" data-target="#dropModal"><i class="fas fa-times"></i> 放棄</button>
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
    </div>
    <!-- 版型偷藏區 -->
    <div id="templates" style="display:none">
      <li id="pdf_template">
        <span class="mailbox-attachment-icon"><i class="far fa-file-pdf"></i></span>
        <div class="mailbox-attachment-info">
          <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i></a>
              <span class="mailbox-attachment-size clearfix mt-1">
                <span class="filesize"></span>
                <button class="remove-attachment">移除</button>
              </span>
        </div>
      </li>
      <li id="word_template">
        <span class="mailbox-attachment-icon"><i class="far fa-file-word"></i></span>
        <div class="mailbox-attachment-info">
          <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i></a>
              <span class="mailbox-attachment-size clearfix mt-1">
                <span class="filesize"></span>  
                <button class="remove-attachment">移除</button>
              </span>
        </div>
      </li>
      <li id="text_template">
        <span class="mailbox-attachment-icon"><i class="fas fa-book"></i></span>
        <div class="mailbox-attachment-info">
          <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i></a>
              <span class="mailbox-attachment-size clearfix mt-1">
                <span class="filesize"></span>  
                <button class="remove-attachment">移除</button>
              </span>
        </div>
      </li>
      <li id="excel_template">
        <span class="mailbox-attachment-icon"><i class="far fa-file-excel"></i></span>
        <div class="mailbox-attachment-info">
          <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i></a>
              <span class="mailbox-attachment-size clearfix mt-1">
                <span class="filesize"></span>  
                <button class="remove-attachment">移除</button>
              </span>
        </div>
      </li>
      <li id="archive_template">
        <span class="mailbox-attachment-icon"><i class="far fa-file-archive"></i></span>
        <div class="mailbox-attachment-info">
          <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i></a>
              <span class="mailbox-attachment-size clearfix mt-1">
                <span class="filesize"></span>
                <button class="remove-attachment">移除</button>
              </span>
        </div>
      </li>
      <li id="other_template">
        <span class="mailbox-attachment-icon"><i class="far fa-file"></i></span>
        <div class="mailbox-attachment-info">
          <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i></a>
              <span class="mailbox-attachment-size clearfix mt-1">
                <span class="filesize"></span>
                <button class="remove-attachment">移除</button>
              </span>
        </div>
      </li>
      <li id="image_template" style="background-color: white;">
        <span class="mailbox-attachment-icon has-img" style="min-height: 114px;"><img src="" style="height: 114px;"></span>
        <div class="mailbox-attachment-info">
          <a href="#" class="mailbox-attachment-name"><i class="fas fa-camera"></i></a>
              <span class="mailbox-attachment-size clearfix mt-1">
                <span class="filesize"></span>
                <button class="remove-attachment">移除</button>
              </span>
        </div>
      </li>         
    </div>
    <!-- modal 偷藏區 -->
    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-sizelimit" style="display: none" id="triggersizelimit">
      Launch Default Modal
    </button>
    <div class="modal fade" id="modal-sizelimit" style="display: none;" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">超過附件上限大小</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            <p>超過附件支援最大32MB大小，請重新上傳</p>
          </div>
          <div class="modal-footer justify-content-end">
            <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    <!-- Modal -->
    <div class="modal fade" id="sendModal" tabindex="-1" role="dialog" aria-labelledby="sendModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="#sendModal">即將寄出郵件</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <span>確認要寄出郵件?</span>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary" id="sendMail">寄出</button>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="dropModal" tabindex="-1" role="dialog" aria-labelledby="dropModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="#dropModal">放棄確認</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <span>您確認要放棄目前所編輯內容?</span>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-danger" id="dropMailBtn">放棄</button>
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
        <script src="${contextRoot}/eddie/js/summernote-bs4.min.js"></script>
        <script src="${contextRoot}/eddie/js/axios.min.js"></script>
        <script src="${contextRoot}/eddie/js/sweetalert2.all.min.js"></script>
        <script src="${contextRoot}/eddie/js/mail/composemail.js"></script>
        <script src="${contextRoot}/eddie/js/mail/mailside.js"></script>
  </body>

  </html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <!--版型需要的css -->
    <link rel="stylesheet" href="/Bookstrap/eddie/css/summernote-bs4.min.css">
    <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
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
    </style>
  </head>

  <body
    class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
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
                    <a href="mailbox.html" class="btn btn-primary btn-block mb-3">收件匣</a>

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
                        <h3 class="card-title">撰寫郵件</h3>
                      </div>
                      <!-- /.card-header -->
                      <div class="card-body">
                        <div class="form-group">
                          <input class="form-control" placeholder="To:" name = "mailTo">
                        </div>
                        <div class="form-group">
                          <input class="form-control" placeholder="Subject:" name = "mailSubject">
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
                          <button type="button" class="btn btn-default" id="draftBtn"><i class="fas fa-pencil-alt"></i> 草稿</button>
                          <button type="submit" class="btn btn-primary" id="sendBtn" data-toggle="modal" data-target="#sendModal"><i class="far fa-envelope"></i> 送出</button>
                        </div>
                        <button type="reset" class="btn btn-default" id="giveupBtn"><i class="fas fa-times"></i> 放棄</button>
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
        <span class="mailbox-attachment-icon"><i class="fas fa-file"></i></span>
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
      <li id="image_template" style="background-color: white;">
        <span class="mailbox-attachment-icon has-img"><img src="" style="height: 110px;"></span>
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
    <!--右側彈跳式功能列 -->
    <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/ownercontroll.jsp" %>
      <!--版型需要的js-->
      <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
        <script src="/Bookstrap/eddie/js/summernote-bs4.min.js"></script>
        <script src="/Bookstrap/eddie/js/axios.min.js"></script>
        <script src="/Bookstrap/eddie/js/mail/composemail.js"></script>
  </body>

  </html>
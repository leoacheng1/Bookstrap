<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>收件匣</title>
      <!--版型需要的css -->
      <link rel="stylesheet" href="${contextRoot}/eddie/css/sweetalert2.min.css">
      <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
        <link rel="stylesheet" href="${contextRoot}/eddie/css/daterangepicker.css">
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

          .page-link:focus {
            box-shadow: none;
          }
        </style>
    </head>

    <body class="sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse"
      data-ref="${mailAccount.accountId}" data-pagenum="1">
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
                    <a href="${contextRoot}/backend/mailpage/composemail"
                      class="btn btn-primary btn-block mb-3">撰寫郵件</a>

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
                            <a href="${contextRoot}/backend/mailpage/mailbox/folder/inbox" class="nav-link"
                              data-typename="inbox">
                              <i class="fas fa-inbox"></i> 收件匣
                              <span class="badge bg-primary float-right" id="inbox-count">${mailCount.inboxCount != 0 ?
                                mailCount.inboxCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="${contextRoot}/backend/mailpage/mailbox/folder/sent" class="nav-link"
                              data-typename="sent">
                              <i class="fa fa-paper-plane"></i> 已寄出
                              <span class="badge bg-success float-right" id="sent-count">${mailCount.sentCount != 0 ?
                                mailCount.sentCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="${contextRoot}/backend/mailpage/mailbox/folder/draft" class="nav-link"
                              data-typename="draft">
                              <i class="far fa-file-alt"></i> 草稿
                              <span class="badge bg-warning float-right" id="draft-count">${mailCount.draftCount != 0 ?
                                mailCount.draftCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a href="${contextRoot}/backend/mailpage/mailbox/folder/bin" class="nav-link"
                              data-typename="bin">
                              <i class="far fa-trash-alt"></i> 回收桶
                              <span class="badge bg-danger float-right" id="bin-count">${mailCount.binCount != 0 ?
                                mailCount.binCount : ''}</span>
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
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/category/normal"
                              data-typename="normal">
                              <i class="far fa-envelope text-secondary"></i> 一般信件
                              <span class="badge badge-primary float-right" id="normal-count">${mailCount.normalCount !=
                                0 ? mailCount.normalCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/category/job"
                              data-typename="job">
                              <i class="fa fa-briefcase text-secondary"></i> 工作指派
                              <span class="badge badge-primary float-right" id="job-count">${mailCount.workCount != 0 ?
                                mailCount.workCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/category/company"
                              data-typename="company">
                              <i class="fa fa-bullhorn text-secondary"></i> 公司訊息
                              <span class="badge badge-primary float-right" id="company-count">${mailCount.companyCount
                                != 0 ? mailCount.companyCount : ''}</span>
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
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/label/starred"
                              data-typename="starred">
                              <i class="fas fa-star text-secondary"></i> 加入星號
                              <span class="badge badge-warning float-right" id="starred-count">${mailCount.starredCount
                                != 0 ? mailCount.starredCount : ''}</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="${contextRoot}/backend/mailpage/mailbox/label/important"
                              data-typename="important">
                              <i class="fa fa-flag text-secondary" style="padding-left: 3px; padding-right: 2px;"></i>
                              重要郵件
                              <span class="badge badge-warning float-right"
                                id="important-count">${mailCount.importantCount != 0 ? mailCount.importantCount :
                                ''}</span>
                            </a>
                          </li>
                          <jstl:forEach items="${mailAccount.accountLabels}" var="label">
                            <li class="nav-item label-li" data-lid="${label.labelId}">
                              <a class="nav-link user-label"
                                href="${contextRoot}/backend/mailpage/mailbox/l/label/${label.labelId}"
                                data-typename="${label.labelId}">
                                <i class="fa fa-tag text-secondary" style="padding-left:3px;padding-right: 2px;"></i>
                                ${label.labelName}
                                <i class="fa fa-trash text-primary invisible float-right"></i>
                              </a>
                            </li>
                          </jstl:forEach>
                          <li class="nav-item">
                            <a class="nav-link" href="#" id="add-label">
                              <i class="fa fa-plus-square text-secondary"
                                style="padding-left:2px;padding-right: 2px;"></i> 新增標籤
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
                        <h3 class="card-title"></h3>
                        <div class="btn-group" id="condition-btns">
                          <button class="btn btn-sm btn-light border rounded-pill mr-2" type="button"
                            id="condition-unread">
                            未讀郵件
                          </button>
                          <button class="btn btn-sm btn-light border rounded-pill mr-2" type="button"
                            id="condition-hasAttachment">
                            有附件
                          </button>
                          <button id="condition-daterange" class="btn btn-sm btn-light border rounded-pill mr-2">
                            <span class="range-display">不限日期</span>
                            <input style="display: none" class="range-data"></input> <i class="fa fa-caret-down"></i>
                          </button>
                          <button class="btn btn-sm btn-light border rounded-pill dropdown-toggle" type="button"
                            id="condition-sendBy" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            寄件人
                          </button>
                          <div class="dropdown-menu pb-0" aria-labelledby="condition-sendBy" style="min-width: 130px" id="sendByItems">
                            <a class="dropdown-item" href="#">不限</a>
                          </div>
                        </div>
                        <div class="card-tools">
                          <div class="input-group input-group-md">
                            <input type="text" class="form-control" placeholder="搜尋" id="searchText">
                            <div class="input-group-append">
                              <button class="btn btn-outline-secondary" type="button" id="searchMailBtn"><i class="fas fa-search"></i></button>
                              <button class="btn btn-outline-secondary" type="button" id="searchFilterBtn" data-toggle="modal" data-target="#filterModal"><i class="fa fa-list"></i></button>
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
                            <button type="button" class="btn btn-default btn-sm" id="delete-mail" data-toggle="tooltip"
                              data-placement="bottom" title="刪除郵件">
                              <i class="far fa-trash-alt"></i>
                            </button>
                            <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip"
                              data-placement="bottom" title="設為已讀" id="hasread-mail">
                              <i class="fa fa-eye"></i>
                            </button>
                            <button type="button" class="btn btn-default btn-sm" data-toggle="tooltip"
                              data-placement="bottom" title="設為未讀" id="notread-mail">
                              <i class="fa fa-eye-slash"></i>
                            </button>
                          </div>
                          <!-- /.btn-group -->
                          <button type="button" class="btn btn-default btn-sm" id="refreshBtn" data-toggle="tooltip"
                            data-placement="bottom" title="刷新">
                            <i class="fas fa-sync-alt"></i>
                          </button>
                          <div class="float-right">
                            <button class="btn btn-sm btn-light border rounded-pill dropdown-toggle" type="button"
                              id="labelMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              設定標籤
                            </button>
                            <div class="dropdown-menu pb-0" aria-labelledby="labelMenuButton" id="labelDropdown"
                              style="min-width: 130px">

                              <!-- <div class="form-check form-control-md pb-2" style="font-size: 1.0rem">
                                                              <input class="form-check-input" type="checkbox">
                                                              <label class="form-check-label">標籤一</label>
                                                            </div>
                                                            <div class="form-check form-control-md pb-2" style="font-size: 1.0rem">
                                                              <input class="form-check-input" type="checkbox">
                                                              <label class="form-check-label">標籤二</label>
                                                            </div>
                                                          
                                                          <a class="dropdown-item border-top" href="#">套用</a> -->
                            </div>
                          </div>
                        </div>
                        <div class="table-responsive mailbox-messages">
                          <table class="table table-hover table-striped" id="mailbox-table">
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
                            <nav aria-label="Page navigation" class="mt-2">
                              <ul class="pagination">
                                <li class="page-item" id="prevPageLi">
                                  <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                </li>
                                <li class="page-item" id="nextPageLi">
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
      <!-- modal偷藏區 -->
      <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModal" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="filterModalLabel">New message</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form>
                <div class="form-group">
                  <label for="recipient-name" class="col-form-label">Recipient:</label>
                  <input type="text" class="form-control" id="recipient-name">
                </div>
                <div class="form-group">
                  <label for="message-text" class="col-form-label">Message:</label>
                  <textarea class="form-control" id="message-text"></textarea>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary">送出</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
          </div>
        </div>
      </div>
      <!--右側彈跳式功能列 -->
      <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/ownercontroll.jsp" %>
        <!--版型需要的js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="http://localhost:8080/Bookstrap/eddie/js/jquery.overlayScrollbars.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
          integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
          crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
          crossorigin="anonymous"></script>
        <script src="http://localhost:8080/Bookstrap/eddie/js/adminlte.min.js"></script>
        <!-- <script src="http://localhost:8080/Bookstrap/eddie/js/layoutfix.js"></script> -->
        <script>
          $('.main-sidebar').toggleClass("sidebar-dark-danger");
          $('.brand-link').toggleClass("bg-danger");
          $('.main-header').toggleClass("bg-gray");
        </script>
        <script src="${contextRoot}/eddie/js/axios.min.js"></script>
        <script src="${contextRoot}/eddie/js/sweetalert2.all.min.js"></script>
        <script src="${contextRoot}/eddie/js/select2.min.js"></script>
        <script src="${contextRoot}/eddie/js/moment.min.js"></script>
        <script src="${contextRoot}/eddie/js/daterangepicker.min.js"></script>
        <script type="text/javascript">
          $(function () {
            console.log(moment());
            var start = moment().subtract(100,'years');
            var end =moment().add(100,'years');
            function cb(start, end) {
              $('#condition-daterange input.range-data').val(start.format('YYYY-MM-DD') + 'to' + end.format('YYYY-MM-DD'));
            }
            $('#condition-daterange').daterangepicker({
              showDropdowns: true,
              startDate: start,
              endDate: end,
              ranges: {
                '不限日期': [moment().subtract(100,'years'),moment().add(100,'years')],
                '今天': [moment(), moment()],
                '昨天': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                '過去一星期': [moment().subtract(6, 'days'), moment()],
                '過去三十天': [moment().subtract(29, 'days'), moment()],
                '這個月': [moment().startOf('month'), moment().endOf('month')],
                '上個月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
              },
              locale: {
                format: "YYYY-MM-DD",
                cancelLabel: '取消',
                applyLabel: '確認',
                customRangeLabel: "自訂日期",
                daysOfWeek: [
                  "日",
                  "一",
                  "二",
                  "三",
                  "四",
                  "五",
                  "六",
                ],
                monthNames: [
                  "一月",
                  "二月",
                  "三月",
                  "四月",
                  "五月",
                  "六月",
                  "七月",
                  "八月",
                  "九月",
                  "十月",
                  "十一月",
                  "十二月"
                ],
              }
            }, cb);

            cb(start, end);

          });
        </script>
        <script src="${contextRoot}/eddie/js/mail/mailbox.js"></script>
    </body>

    </html>
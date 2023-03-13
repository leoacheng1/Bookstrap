<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <title>Welcome</title>
          <!--版型需要的css -->
          <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
        </head>

        <body
          class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
          <div class="wrapper">
            <!--上面導覽列 -->
            <%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %>
              <!-- 左邊導覽列 -->
              <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>
                <div class="content-wrapper">
                  <div class="content-header">
                    <!-- 標題位置 -->
                    <h1>建立員工資料</h1>
                  </div>
                  <section class="content">
                    <!-- 寫東西的地方 -->
                    <div class="container mt-5">
                      <div class="row justify-content-center">
                        <div class="col-md-6">
                          <form action="${contextRoot}/semps/insertemployee" method="post"
                            enctype="multipart/form-data">
                            <div class="form-group">
                              <label>員工分店:
                                <select name="empShopid" class="form-control">
                                  <option selected value="1">麥當勞</option>
                                  <option value="2">肯德基</option>
                                  <option value="3">漢堡王</option>
                                  <option value="4">摩斯漢堡</option>
                                </select>
                              </label>
                            </div>
                            <div class="form-group">
                              <label>員工姓名:</label>
                              <input type="text" name="empName" class="form-control">
                            </div>
                            <div class="form-group">
                              <label>上傳員工照片:</label>
                              <div class="row">
                                <div class="col-sm-4">
                                  <input type="file" id="empPhotoInput" name="empPhoto" accept="image/*">
                                  <button id="deletePhotoBtn" type="button" style="display: none;">刪除照片</button>
                                </div>

                                <div class="col-sm-4">
                                  <div id="empPhotoPreview"></div>
                                </div>
                              </div>
                            </div>
                            <div class="form-group">
                              <label>員工薪資:</label>
                              <input type="text" name="empSalary" class="form-control">
                            </div>
                            <div class="form-group">
                              <label>員工職稱:</label>
                              <input type="text" name="empTitle" class="form-control">
                            </div>
                            <input type="submit" value="上傳" class="btn btn-primary">
                          </form>
                          <div id="empPhotoPreview"></div>
                        </div>
                      </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script>
                      $(document).ready(function () {
                        $("#empPhotoInput").change(function () {
                          var file = this.files[0];
                          var reader = new FileReader();
                          reader.readAsDataURL(file);
                          reader.onload = function (event) {
                            $("#empPhotoPreview").html('<div><img src="' + event.target.result + '"></div>');
                            $("#deletePhotoBtn").click(function () {
                              $("#empPhotoPreview").empty();
                              $("#empPhotoInput").val("");
                              $(this).hide();
                            });
                          }
                          $("#deletePhotoBtn").show();
                        });
                      });
                    </script>

                  </section>
                </div>
          </div>
          <!--右側彈跳式功能列 -->
          <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
            <!--版型需要的js-->
            <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
        </body>

        </html>
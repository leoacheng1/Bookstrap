<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bookstrap後台</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="http://localhost:8080/Bookstrap/eddie/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="http://localhost:8080/Bookstrap/eddie/css/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="http://localhost:8080/Bookstrap/eddie/css/adminlte.min.css">
  </head>

  <body class="login-page" style="min-height: 464px;">
    <div class="login-box">
      <!-- /.login-logo -->
      <div class="card card-outline card-primary">
        <div class="card-header text-center">
          <a href="http://localhost:8080/Bookstrap/backend/login" class="h1"><b>Bookstrap</b></a>
        </div>
        <div class="card-body">
          <p class="login-box-msg" style="color: red;">${error}</p>
          <form action="http://localhost:8080/Bookstrap/backend/login" method="post">
            <div class="input-group mb-3">
              <input name="level" type="hidden" value=""/>
              <input type="text" class="form-control" placeholder="Username" id="account" name="account">
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fa fa-user"></span>
                </div>
              </div>
            </div>
            <div class="input-group mb-3">
              <input type="password" class="form-control" placeholder="Password" id="password" name="password">
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-lock"></span>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-6">

              </div>
              <!-- /.col -->
              <div class="col-6">
                <button type="submit" class="btn btn-primary btn-block">登入</button>
              </div>
              <!-- /.col -->
            </div>
          </form>
          <div class="row mt-3" id="quickLogin">
            <div class="col-4">
              <button type="submit" class="btn btn-danger btn-block" id="admin">管理員</button>
            </div>
            <div class="col-4">
              <button type="submit" class="btn btn-info btn-block" id="owner">店長</button>
            </div>
            <div class="col-4">
              <button type="submit" class="btn btn-success btn-block" id="employee">員工</button>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="http://localhost:8080/Bookstrap/eddie/js/jquery-3.6.3.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="http://localhost:8080/Bookstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="http://localhost:8080/Bookstrap/eddie/js/adminlte.min.js"></script>

    <script>
      const accountInfo = {
        'admin': {
          username: "Elizabeth",
          password: "123456"
        },
        'owner': {
          username: "Robert",
          password: "12345"
        },
        'employee': {
          username: "Tom",
          password: "1234"
        }
      }
      function quickLogin(jobLevel) {
        document.getElementById("account").value = accountInfo[jobLevel].username;
        document.getElementById("password").value = accountInfo[jobLevel].password;
        document.getElementById("level").value = jobLevel;
      }

      for (let btn of document.querySelectorAll("#quickLogin > div > button")) {
        btn.addEventListener("click", () => {quickLogin(btn.getAttribute("id"))})
      }

    </script>
  </body>

  </html>
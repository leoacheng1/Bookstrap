<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Welcome</title>
        <%@ include file="./css.jsp" %>
    </head>

    <body
        class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
        <div class="wrapper">
            <%@ include file="./nav.jsp" %>
            <%@ include file="./sidebar.jsp" %>
            <div class="content-wrapper">
                <div class="content-header">
                    <!-- 標題位置 -->
                    <h1>Hello World</h1>
                </div>
                <section class="content">
                    <!-- 寫東西的地方 -->
                </section>
            </div>
        <%@ include file="./js.jsp" %>
    </body>

    </html>
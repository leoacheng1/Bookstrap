<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/employeesidebar.jsp" %>
            <div class="content-wrapper">
                <div class="content-header">
                    <!-- 標題位置 -->
                    
                </div>
                <section class="content">
                    <!-- 寫東西的地方 -->
                </section>
            </div>
        </div>
        <!--右側彈跳式功能列 -->
        <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/employeecontroll.jsp" %>
  		<!--版型需要的js-->
        <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
    </body>

    </html>
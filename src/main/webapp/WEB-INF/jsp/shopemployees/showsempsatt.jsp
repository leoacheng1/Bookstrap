<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                    <h1>假單簽核</h1>
                </div>
                <section class="content">
                    <!-- 寫東西的地方 -->
                    <table>
		<tr>
			<th>員工編號</th>
			<th>員工姓名</th>
			<th>請假起始日期</th>
			<th>請假截止日期</th>
			<th>請假假別</th>
			<th>請假事由</th>
			<th>請假時數</th>
			<th>核准狀態</th>
		</tr>
		<jstl:forEach items="${sempsattList}" var="showsempatt">
			<tr>
			
				<td>${showsempatt.attSemps.empId}</td>
				<td>${showsempatt.attSemps.empName}</td>
				<td>${showsempatt.attStartDate}</td>
				<td>${showsempatt.attEndDate}</td>
				<td>${showsempatt.attVacation}</td>
				<td>${showsempatt.attReason}</td>
				<td>${showsempatt.attTime}</td>
				<td>${showsempatt.attAgree}</td>
				<td><form action="${contextRoot}/sempsatt/upload" method="post">
						<input name="_method" type="hidden" value="put" />
						<input name="attId" type="hidden" value="${showsempatt.attId}" /> 
						<input name="attSempid" type="hidden" value="${showsempatt.attSemps.empId}" /> 
						<input name="attStartDate" type="hidden" value="${showsempatt.attStartDate}" /> 
						<input name="attEndDate" type="hidden" value="${showsempatt.attEndDate}" /> 
						<input name="attVacation" type="hidden" value="${showsempatt.attVacation}" /> 
						<input name="attReason" type="hidden" value="${showsempatt.attReason}" /> 
						<input name="attTime" type="hidden" value="${showsempatt.attTime}" /> 
						<input name="attAgree" type="hidden" value="核准" /> 
						<input type="submit" class="btn btn-info btn-sm" value="核准" />
					</form></td>
				<td><form action="${contextRoot}/sempsatt/upload" method="post">
						<input name="_method" type="hidden" value="put" />
						<input name="attId" type="hidden" value="${showsempatt.attId}" /> 
						<input name="attSempid" type="hidden" value="${showsempatt.attSemps.empId}" /> 
						<input name="attStartDate" type="hidden" value="${showsempatt.attStartDate}" /> 
						<input name="attEndDate" type="hidden" value="${showsempatt.attEndDate}" /> 
						<input name="attVacation" type="hidden" value="${showsempatt.attVacation}" /> 
						<input name="attReason" type="hidden" value="${showsempatt.attReason}" /> 
						<input name="attTime" type="hidden" value="${showsempatt.attTime}" /> 
						<input name="attAgree" type="hidden" value="未核准" /> 
						<input type="submit" class="btn btn-info btn-sm" value="未核准" />
					</form></td>
				<td><form action="${contextRoot}/sempsatt/upload" method="post">
						<input name="_method" type="hidden" value="put" />
						<input name="attId" type="hidden" value="${showsempatt.attId}" /> 
						<input name="attSempid" type="hidden" value="${showsempatt.attSemps.empId}" /> 
						<input name="attStartDate" type="hidden" value="${showsempatt.attStartDate}" /> 
						<input name="attEndDate" type="hidden" value="${showsempatt.attEndDate}" /> 
						<input name="attVacation" type="hidden" value="${showsempatt.attVacation}" /> 
						<input name="attReason" type="hidden" value="${showsempatt.attReason}" /> 
						<input name="attTime" type="hidden" value="${showsempatt.attTime}" /> 
						<input name="attAgree" type="hidden" value="待處理" /> 
						<input type="submit" class="btn btn-info btn-sm" value="待處理" />
					</form></td>		
			</tr>

		</jstl:forEach>
	</table>
                </section>
            </div>
        </div>
        <!--右側彈跳式功能列 -->
        <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
  		<!--版型需要的js-->
        <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
    </body>

    </html>
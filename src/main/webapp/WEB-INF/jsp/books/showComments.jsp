<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有評論</title>
<!--版型需要的css -->
<%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
<style>
  table {
  table-layout: fixed;
}
</style>
</head>
<body class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
    <div class="wrapper">
        <!--上面導覽列 -->
        <%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %> 
        <!-- 左邊導覽列 -->
        <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>
  
  <div class="content-wrapper">
  <div>
  <div class="content-header" >
    <br/>
    <div style="position: absolute;top: 40px;left: 250px;">
      <h1 style="margin-left: 550px;">所有評論</h1>
    <hr>    
  
  <div>
  <table class="text-center" style="width: 1150px;">
    <thead  style="background-color:#DCDCDC;">
      <tr>
        <th style="width: 50px;">會員id</th>
        <th style="width: 150px;">書名</th>
        <th style="width: 50px">評分</th>
        <th style="width: 75px;">評論時間</th>
        <th style="width: 150px;">評論</th>
	      <th style="width: 75px;">刪除</th>
      </tr>
    </thead>
    <tbody>

    <jstl:forEach items="${page.content}" var="comments" >
     <tr>
      <td style="height: 50px;"><jstl:out value="${comments.member.memberId}"/></td> 
      <td style="height: 50px;"><jstl:out value="${comments.book.name}"/></td> 
      <td style="height: 50px;"><jstl:out value="${comments.evaluation}"/></td>   
      <td style="height: 50px;"><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${comments.date}"/></td>   
      <td style="height: 50px;"><jstl:out value="${comments.content}"/></td> 
      <td style="height: 50px;">
        <button class="delete-btn btn btn-danger"  data-cmid="${comments.commentId}">刪除</button>
      </td>
    </tr>
    </jstl:forEach>

    </tbody>  
</table>
</div>

<br>
<div style="font-size:larger;">
  <nav aria-label="Page navigation example">
    <ul class="pagination">
<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
  <jstl:choose>
    <jstl:when test="${page.number != pageNumber-1}">
      <li class="page-item"><a class="page-link" href="${contextRoot}/comment/allPage?p=${pageNumber}">${pageNumber}</a></li>
    </jstl:when>
    
    <jstl:otherwise>
      <li class="page-item active"><a class="page-link">${pageNumber}</a></li>
    </jstl:otherwise>
  </jstl:choose>
  
</jstl:forEach>
    </ul>
  </nav>
</div>
</div>
</div>
</div>
</div>
<!--右側彈跳式功能列 -->
<%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
<!--版型需要的js-->
<%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
<script>
////////////// delete鍵 ///////////
  const deleteBtn = document.getElementsByClassName('delete-btn')

  for(i=0;i<=deleteBtn.length;i++){
  deleteBtn[i].addEventListener('click',function(e){
    // console.log("好ㄟ")
    let cmID = this.getAttribute('data-cmid');
    console.log(cmID)
    swal({
      title: "確定要刪除此筆評論?",
      icon: "warning",
      buttons: {
        Btn: false,
        cancel: {
          text: "取消",
          visible: true
        },
        danger: {
          text: "確認",
          visible: true
        }
      }
    }).then((willDelete) => {
      if (willDelete) {      
        deleteComment(cmID);       
      }
    })
  })
  }

  function deleteComment(cmID){
    axios({
      url: 'http://localhost:8080/Bookstrap/comment/admin/delete',
      method:'delete',
      responseType: 'text',
      params: {
        commentId: cmID
      }
    })
    .then(res=>{
      console.log(res.data)
    })
    .catch(err=>{
      console.log(err)
      window.location.href = 'http://localhost:8080/Bookstrap/comment/allPage';
    })
  }

</script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit member</title>
</head>
<body>

<div class="container">
<h1>Edit member</h1>
<div class="card-header">
   新增訊息
  </div>

<form action="${contextRoot}/member/edit"  method="post">
    
<!--     因為只改訊息，但編輯還送出後還是要給原來該有的屬性，故此為拿回舊資料 -->
    
     <tag:bind path="member.memberId">
    <input type="text" name="memberId" readonly="readonly" value="${member.memberId}"><br>
    </tag:bind>
    
     
    
    <tag:bind path="member.memberAccount">
    <input type="text" name="memberAccount"><br>
    </tag:bind>
    
    <tag:bind path="member.memberPassword">
    <input type="text" name="memberPassword"><br>
    </tag:bind>
    
    <span>valid123</span> <br>
    <tag:bind path="member.memberValid">
    <input type="text" name="memberValid" value="1" hidden readonly="readonly"><br>
    </tag:bind>
    
    <tag:bind path="member.memberLevel">
    <input type="text" name="memberLevel" value="1" hidden readonly="readonly"><br>
    </tag:bind>
    

   
    <tag:bind path="memberDetails.memberId">
    <input type="text" name="dMemberId" readonly="readonly" value="${member.memberId}"><br>
    </tag:bind>
    
    
    <tag:bind path="memberDetails.memberName">
    <input type="text" name="memberName"><br>
    </tag:bind>
    
    <tag:bind path="memberDetails.memberPhoto">
    <img src="${contextRoot}/member/getphoto?memberId=${member.memberId}">
    <input type="file" name="memberPhoto"><br>
    </tag:bind>
    
     <tag:bind path="memberDetails.memberSex">
    <input type="text" name="memberSex"><br>
    </tag:bind>
    
    <tag:bind path="memberDetails.memberEmail">
    <input type="text" name="memberEmail"><br>
    </tag:bind>
    
        
      <tag:bind path="memberDetails.memberPhone">
    <input type="text" name="memberPhone"><br>
    </tag:bind>
    
     <tag:bind path="memberDetails.memberAddress">
    <input type="text" name="memberAddress" ><br>
    </tag:bind>
    
     <tag:bind path="memberDetails.memberBirthday">
    <input type="date" name="memberBirthday" value="${memberDetails.memberBirthday}" readonly="readonly"><br>
    </tag:bind>
    
    
    
    
    <br>
		<button type="submit" class="btn btn-outline-primary">Submit</button>  
    </form>


</div>

</body>
</html>
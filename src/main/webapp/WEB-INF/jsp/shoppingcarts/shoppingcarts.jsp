<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="jstl"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>購物車 - Bookstrap</title>
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" type="text/css" href="../css/slick.css" />
    <link rel="stylesheet" type="text/css" href="../css/slick-theme.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&display=swap"
      rel="stylesheet"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@600&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="${contextRoot}/css/index.css" />
  </head>
  <body>
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <div class="container">
     <jstl:forEach var="message" items="${page.content}">
            <div class="card">
              <div class="card-header">
                顯示訊息 時間:
                <span>
                  <fmt:formatDate
                    value="${message.added}"
                    pattern="yyyy-MM-dd HH:mm:ss"
                  />
                </span>
              </div>
              <div class="card-body">
                <h2>${message.text}</h2>
                <br />
                <div class="edit-place" style="display: flex">
                  <form action="${contextRoot}/message/edit" method="get">
                    <input name="id" type="hidden" value="${message.id}" />
                    <input
                      type="submit"
                      class="btn btn-info btn-sm"
                      value="編輯"
                    />
                  </form>
                  <form action="${contextRoot}/message/delete" method="post">
                    <input name="_method" type="hidden" value="delete" />
                    <input name="id" type="hidden" value="${message.id}" />
                    <input
                      type="submit"
                      class="btn btn-danger btn-sm"
                      value="刪除"
                    />
                  </form>
                </div>
              </div>
            </div>
          </jstl:forEach>
    
    </div>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Comments</title>

    </head>

    <body>

      <%@ include file="../layout/MainHeader.jsp" %>
      <%@ include file="../layout/MainNav.jsp" %>

      <div class="container-fluid">
        <div class="row">



          <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div
              class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom border-2">
              <div class="container">
                <h3 class="text-center"> 我的評論 </h3>
              </div>
            </div>

            <!-- /////// -->
            <div class="container"  id="commentArea" class="commentArea">
              <!-- 您的會員id是:${sessionScope.memberId} -->
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>書名</th>
            <th>評分</th>
            <th>評論時間</th>
            <th>評論內容</th>
            <th>修改</th>
            <th>刪除</th>
          </tr>
        </thead>
        <tbody>
          <jstl:forEach items="${memberComment.content}" var="memberComment" >
            <tr>
              <td><jstl:out value="${memberComment.book.name}"/></td> 
              <td><jstl:out value="${memberComment.evaluation}"/></td>   
              <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${memberComment.date}"/></td>   
              <td><jstl:out value="${memberComment.content}"/></td> 
              <td>
                <button type="button" id="edit-btn" class="edit-btn btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" data-cmid="${memberComment.commentId}">
                  編輯
                </button>
              </td>
              <td>
                <button type="button" class="delete-btn btn btn-danger" data-cmid="${memberComment.commentId}">
                  刪除
                </button>
              </td>
            </tr>
          </jstl:forEach>
        </tbody>
      </table>

      <div style="height: 13px; margin-right:30px;">
        <nav aria-label="Page navigation example" >
          <ul class="pagination justify-content-end">
            <jstl:forEach var="pageNumber" begin="1" end="${memberComment.totalPages}">
              <jstl:choose>
                <jstl:when test="${page.number != pageNumber-1}">
                  <li class="page-item"><a class="page-link pageBtn" data-pgNB="${pageNumber}" data-mbID="${sessionScope.memberId}">${pageNumber}</a></li>
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

          </main>
        </div>

<!-- 更新頁面 -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">編輯評論</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="${contextRoot}/comment/editPage" method="put" id="updateArea" modelAttribute="comment" var="comment">
              <input type="hidden" name="commentId" id="idInput" class="idInput" value="${comment.commentId}">
            <label  class="form-label">書名</label>
              <input type="text" name="name" id="nameInput" class="nameInput form-control" value="${comment.book.name}" readonly="readonly" disabled><br>
            <label  class="form-label">評分</label>
              <input type="text" name="evaluation" id="evaluationtInput" class="evaluationInput form-control" value="${comment.evaluation}"><br>
            <label  class="form-label">評論時間</label>
              <input type="text" name="date" id="dateInput" class="dateInput  form-control" value="${comment.date}" readonly="readonly" disabled><br>
            <label  class="form-label">評論內容</label>
              <textarea name="content" id="contentInput" class="contentInput  form-control" value="${comment.content}"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
          <button type="button" class="btn btn-primary">送出</button>
        </div>
      </div>
    </div>
  </div>


      </div>
    <script>
//////////  會員所有評論的分頁按鈕  /////////
const pageBtn = document.getElementsByClassName('pageBtn')

for(i=0;i<pageBtn.length;i++){
  pageBtn[i].addEventListener('click',function(e){
    console.log("OK")
    let page = this.getAttribute('data-pgNB')
    let memID = this.getAttribute('data-mbID')
    console.log(page)
    console.log(memID)
    commentPage(page,memID)
  })
}

function commentPage(page,memID){
  axios({
    url: 'http://localhost:8080/Bookstrap/comment/ajax/page',
    method:'get',
    params: {
      pageNumber: page,
      memberId: memID,
}
  })
  .then(res=>{
    console.log(res)
    pageMaker(res)
  })
  .catch(err=>{
    console.log(err)
  })
}

function pageMaker(res){
  const commentArea = document.getElementById('commentArea')
  commentArea.innerHTML = ''
  let front = ''
  front +=`<table class="table table-bordered">
             <thead>
               <tr>
                 <th>書名</th>
                 <th>評分</th>
                 <th>評論時間</th>
                 <th>評論內容</th>
                 <th>修改</th>
                 <th>刪除</th>
               </tr>
             </thead>
           <tbody>`
  let text = ''
  res.data.content.forEach(element => {
    text += `<tr>
              <td><jstl:out value="`+element.bookId+`"/></td> 
              <td><jstl:out value="`+element.evaluation+`"/></td>   
              <td><jstl:out value="`+element.date+`"/></td>   
              <td><jstl:out value="`+element.content+`"/></td> 
              <td>
                <button type="button" class="edit-btn btn btn-primary" id="edit-btn" data-cmid="`+element.commentId+`">
                  編輯
                </button>
              </td>
              <td>
                <button type="button" class="delete-btn btn btn-danger" data-cmid="`+element.commentId+`">
                  刪除
                </button>
                </td>
              </tr>` 
  });
  let down = ''
  down += `</tbody></table>`
  
  let totalPages = res.data.totalPages;
  console.log(totalPages)
  let pageNum = ''
  for (let i = 1; i <= totalPages; i++) {
    pageNum += '<li class="page-item"><a class="page-link pageBtn2" data-pgNB="'+i+'" data-mbID="${sessionScope.memberId}" id="pageButton" data-page="' + i + '">' + i + '</a></li>'
  }             
  let before ='<div style="height: 13px; margin-right:30px;"><nav aria-label="Page navigation example"><ul class="pagination justify-content-end">'
  let after='</ul></nav></div><br><br>'

  commentArea.innerHTML += front+text+down+before+pageNum+after

  const pageBtn2 = document.getElementsByClassName('pageBtn2')

  for(i=0;i<pageBtn2.length;i++){
    pageBtn2[i].addEventListener('click',function(e){
      let page = this.getAttribute('data-pgNB')
      let memID = this.getAttribute('data-mbID')
      newPage(page,memID)
    })
  }

  function newPage(page,memID){
    axios({
      url: 'http://localhost:8080/Bookstrap/comment/ajax/page',
      method:'get',
      params: {
        pageNumber: page,
        memberId: memID,
      }
    })
    .then(res=>{
      console.log(res)
      pageMaker(res)
    })
    .catch(err=>{
      console.log(err)
    })
  }
}

////////////// delete鍵 ///////////
const deleteBtn = document.getElementsByClassName('delete-btn')

for(i=0;i<deleteBtn.length;i++){
deleteBtn[i].addEventListener('click',function(e){
  // console.log("好ㄟ")
  let cmID = this.getAttribute('data-cmid');
  console.log(cmID)

  deleteComment(cmID);
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
    window.location.href = 'http://localhost:8080/Bookstrap/comment/memberPage?p=1&memberId=${memberId}';
  })
}

/////////////// update鍵 ///////////////
const editBtn = document.getElementsByClassName('edit-btn')

for(i=0;i<deleteBtn.length;i++){
  editBtn[i].addEventListener('click',function(e){
    event.preventDefault();
    // console.log('有喔')
    // let cmID = this.getAttribute('data-cmid');
    // console.log(cmID)
    // updateHtml(cmID);

    let evaluationtInput = document.getElementById('evaluationtInput').value
    let contentInput = document.getElementById('contentInput').value

    console.log('評論內容:'+contentInput)
  })
}


    </script>
      <script src="${contextRoot}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
      <script src="${contextRoot}/js/jquery-3.6.3.min.js" type="text/javascript"></script>
      <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>

     <jsp:include page="../layout/MainJs.jsp"/>
    </html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">

    

    

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

 <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      #addToWatchlistButton.watchlist-added {
   		 background-color: green;
    	color: white;
	}

	

    </style>



<title>Insert title here</title>
</head>
<body>

   
<jsp:include page="../layout/MainHeader.jsp"/>

<main>

  

  <div class="album py-5 bg-light">
    <div class="container">

<!-- 	single card top -->
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        
        
        <jstl:forEach var="eBook" items="${page.content}">
         <!--  top ------------------ -->
        <div class="col">
            <div class="card shadow-sm">
              <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg"
                role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>${eBook.eBookName}</title>
                <rect width="100%" height="100%" fill="#55595c" /><text x="50%" y="50%" fill="#eceeef"
                  dy=".3em">Test</text>
              </svg>

              <div class="card-body">
              <h4>${eBook.eBookName} testTitle</h4>
              <br>
              <h4>${eBook.eBookId} testID</h4>
              <br>
              <h4>${memberId} testmemberID</h4>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional
                  content. This content is a little bit longer.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    	<a href="${contextRoot}/favorite/ebook/add?eBookId=${eBook.eBookId}&member=${memberId}" class="btn btn-sm btn-outline-secondary " id="addToWatchlistButton" onclick="addToWatchlist(${eBook.eBookId})">
                    		
						        <div id="watchListString">
						        Add to Watchlist
						  		</div>
                    	
                    	</a>
                  </div>
                  <a type="button" href="${contextRoot}/eBook/get/pdfpage?eBookId=${eBook.eBookId}">Go to PDF</a>
                  <small class="text-muted">${eBook.eBookPublishDate}</small>
                </div>
              </div>
            </div>
          </div>
        <!--    bottom  ------------------ -->
        </jstl:forEach>
 
 
 
 <jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<jstl:choose>

						<jstl:when test="${page.number != pageNumber-1}">
							<a href="${contextRoot}/ebook/get/allebook?p=${pageNumber}">${pageNumber}</a>
						</jstl:when>

						<jstl:otherwise>
	     				${pageNumber}
	    				</jstl:otherwise>
					</jstl:choose>

					<jstl:if test="${pageNumber != page.totalPages}">
						|
				</jstl:if>


				</jstl:forEach>
 
        
        
        
      </div>
      <!-- 	single card bottom -->
      
    </div>
  </div>

</main>

<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>


    <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    <script src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
    <script  src="${contextRoot}/js/member/axios.min.js"></script>
    <script  src="${contextRoot}/js/member/watchlist.js"></script>
   
	



</body>
</html>
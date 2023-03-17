<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

		<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
		<li class="nav-item"><a href="${contextRoot}/backend/index" class="nav-link"> <i
					class="nav-icon fas fa-calendar-alt"></i>
				<p>
					首頁 <span class="badge badge-info right"></span>
				</p>

			</a>
		</li>
		<li class="nav-header">商城管理</li>
		<li class="nav-item">
			<a href="pages/calendar.html" class="nav-link">
				<i class="nav-icon fas fa-calendar-alt"></i>
				<p>
					功能
					<span class="badge badge-info right"></span>
				</p>

			</a>
		</li>
		<li class="nav-item">
			<a href="#" class="nav-link">
				<i class="nav-icon fas fa-table"></i>
				<p>
					商城管理
					<i class="fas fa-angle-left right"></i>
				</p>
			</a>
			<ul class="nav nav-treeview" style="display: none;">
				<li class="nav-item">
					<a href="${contextRoot}/books/page" class="nav-link">
						<i class="far fa-circle nav-icon"></i>
						<p>所有書籍</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="${contextRoot}/books/add" class="nav-link">
						<i class="far fa-circle nav-icon"></i>
						<p>新增書籍</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="pages/tables/jsgrid.html" class="nav-link">
						<i class="far fa-circle nav-icon"></i>
						<p>功能3</p>
					</a>
				</li>
			</ul>
		</li>

		<li class="nav-header">分店管理</li>
		<li class="nav-item">
			<a href="http://localhost:8080/Bookstrap/shops/shophome" class="nav-link">
				<i class="nav-icon fas fa-calendar-alt"></i>
				<p>
					分店管理
					<span class="badge badge-info right"></span>
				</p>

			</a>
		</li>
		<li class="nav-header">會員管理</li>
		<li class="nav-item">
			<a href="${contextRoot}/admin/get/allmember" class="nav-link">
				<i class="nav-icon far fa-circle nav-icon"></i>
				<p>
					查尋所有會員
					<span class="badge badge-info right"></span>
				</p>
			</a>
		</li>

		<li class="nav-item">
			<a href="${contextRoot}/admin/get/member" class="nav-link">
				<i class="nav-icon far fa-circle nav-icon"></i>
				<p>
					查尋會員
					<span class="badge badge-info right"></span>
				</p>

			</a>
		</li>

		<!-- 	<li class="nav-item"> -->
		<!-- 		<a href="#" class="nav-link"> -->
		<!-- 		  <i class="nav-icon fas fa-table"></i> -->
		<!-- 		  <p> -->
		<!-- 			會員管理 -->
		<!-- 			<i class="fas fa-angle-left right"></i> -->
		<!-- 		  </p> -->
		<!-- 		</a> -->
		<!-- 		<ul class="nav nav-treeview" style="display: none;"> -->
		<!-- 		  <li class="nav-item"> -->
		<!-- 			<a href="pages/tables/simple.html" class="nav-link"> -->
		<!-- 			  <i class="far fa-circle nav-icon"></i> -->
		<!-- 			  <p>功能1</p> -->
		<!-- 			</a> -->
		<!-- 		  </li> -->
		<!-- 		  <li class="nav-item"> -->
		<!-- 			<a href="pages/tables/data.html" class="nav-link"> -->
		<!-- 			  <i class="far fa-circle nav-icon"></i> -->
		<!-- 			  <p>功能2</p> -->
		<!-- 			</a> -->
		<!-- 		  </li> -->
		<!-- 		  <li class="nav-item"> -->
		<!-- 			<a href="pages/tables/jsgrid.html" class="nav-link"> -->
		<!-- 			  <i class="far fa-circle nav-icon"></i> -->
		<!-- 			  <p>功能3</p> -->
		<!-- 			</a> -->
		<!-- 		  </li> -->
		<!-- 		</ul> -->
		<!-- 	</li> -->
		<li class="nav-header">個人功能</li>
		<li class="nav-item">
			<a href="pages/calendar.html" class="nav-link">
				<i class="nav-icon fas fa-calendar-alt"></i>
				<p>
					功能
					<span class="badge badge-info right"></span>
				</p>

			</a>
		</li>
		<li class="nav-item">
			<a href="${contextRoot}/comment/allPage" class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>所有評論</p>
			</a>
		</li>
		<li class="nav-item">
			<a href="pages/tables/jsgrid.html" class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>功能4</p>
			</a>
		</li>
		</ul>
		</li>

		<li class="nav-header">分店管理</li>
		<li class="nav-item">
			<a href="http://localhost:8080/Bookstrap/shops/shophome" class="nav-link">
				<i class="nav-icon fas fa-calendar-alt"></i>
				<p>
					分店管理
					<span class="badge badge-info right"></span>
				</p>

			</a>
		</li>
		<li class="nav-header">會員管理</li>
		<li class="nav-item">
			<a href="${contextRoot}/admin/get/allmember" class="nav-link">
				<i class="nav-icon far fa-circle nav-icon"></i>
				<p>
					查詢所有會員
					<span class="badge badge-info right"></span>
				</p>
			</a>
		</li>

		<li class="nav-item">
			<a href="${contextRoot}/admin/get/member" class="nav-link">
				<i class="nav-icon far fa-circle nav-icon"></i>
				<p>
					查詢會員
					<span class="badge badge-info right"></span>
				</p>

			</a>
		</li>

		<!-- 	<li class="nav-item"> -->
		<!-- 		<a href="#" class="nav-link"> -->
		<!-- 		  <i class="nav-icon fas fa-table"></i> -->
		<!-- 		  <p> -->
		<!-- 			會員管理 -->
		<!-- 			<i class="fas fa-angle-left right"></i> -->
		<!-- 		  </p> -->
		<!-- 		</a> -->
		<!-- 		<ul class="nav nav-treeview" style="display: none;"> -->
		<!-- 		  <li class="nav-item"> -->
		<!-- 			<a href="pages/tables/simple.html" class="nav-link"> -->
		<!-- 			  <i class="far fa-circle nav-icon"></i> -->
		<!-- 			  <p>功能1</p> -->
		<!-- 			</a> -->
		<!-- 		  </li> -->
		<!-- 		  <li class="nav-item"> -->
		<!-- 			<a href="pages/tables/data.html" class="nav-link"> -->
		<!-- 			  <i class="far fa-circle nav-icon"></i> -->
		<!-- 			  <p>功能2</p> -->
		<!-- 			</a> -->
		<!-- 		  </li> -->
		<!-- 		  <li class="nav-item"> -->
		<!-- 			<a href="pages/tables/jsgrid.html" class="nav-link"> -->
		<!-- 			  <i class="far fa-circle nav-icon"></i> -->
		<!-- 			  <p>功能3</p> -->
		<!-- 			</a> -->
		<!-- 		  </li> -->
		<!-- 		</ul> -->
		<!-- 	</li> -->
		<li class="nav-header">個人功能</li>
		<li class="nav-item">
			<a href="pages/calendar.html" class="nav-link">
				<i class="nav-icon fas fa-calendar-alt"></i>
				<p>
					功能
					<span class="badge badge-info right"></span>
				</p>

			</a>
		</li>
		<li class="nav-item">
			<a href="#" class="nav-link">
				<i class="nav-icon fas fa-table"></i>
				<p>
					個人功能
					<i class="fas fa-angle-left right"></i>
				</p>
			</a>
			<ul class="nav nav-treeview" style="display: none;">
				<li class="nav-item">
					<a href="pages/tables/simple.html" class="nav-link">
						<i class="far fa-circle nav-icon"></i>
						<p>功能1</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="pages/tables/data.html" class="nav-link">
						<i class="far fa-circle nav-icon"></i>
						<p>功能2</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="pages/tables/jsgrid.html" class="nav-link">
						<i class="far fa-circle nav-icon"></i>
						<p>功能3</p>
					</a>
				</li>
			</ul>
		</li>
		<li class="nav-header">客服</li>
		<li class="nav-item">
			<a href="${contextRoot}/chatboxback" class="nav-link">
				<i class="nav-icon fas fa-calendar-alt"></i>
				<p>
					客服
					<span class="badge badge-info right"></span>
				</p>

			</a>
		</li>
		>>>>>>> a7b2e9a688ba2fd6b30d110eed3aa38c8c648a54
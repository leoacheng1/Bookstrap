<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<aside class="control-sidebar control-sidebar-dark">
	<!-- Control sidebar content goes here -->
	<div class="p-3 control-sidebar-content">
		<!-- Content of the sidebar goes here -->
		<h5 class="text-center">DEMO功能</h5>
		<hr class="mb-2"></hr>
		<div class="text-center">
			<h6 class="mt-2 mb-2 text-center">郵件撰寫</h6>
			<div>
				<button class="mt-2 mb-2 btn btn-sm btn-secondary"
					id="oneclick-empty-mail">一鍵清空</button>
			</div>
			<div>
				<button class="mt-2 mb-2 btn btn-sm btn-secondary"
					id="oneclick-mail-content">一鍵郵件</button>
			</div>
			<div>
				<button class="mt-2 mb-2 btn btn-sm btn-secondary"
					id="oneclick-mal-mail">一鍵xss攻擊</button>
			</div>
			<h6 class="mt-5 mb-2 text-center">前端防護</h6>
			<div class="custom-control custom-switch text-center mt-2">
				<input type="checkbox" class="custom-control-input" id="dom-purify"
					checked> <label class="custom-control-label"
					for="dom-purify">開啟dompurify</label>
			</div>
			<div class="custom-control custom-switch text-center mt-2">
				<input type="checkbox" class="custom-control-input"
					id="xss-summernote" checked> <label
					class="custom-control-label" for="xss-summernote">開啟編輯器xss防護</label>
			</div>
		</div>
	</div>
</aside>

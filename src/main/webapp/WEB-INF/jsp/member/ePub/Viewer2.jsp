<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="description" content="">
        <meta name="viewport" content="width=device-width, user-scalable=no">
        <meta name="apple-mobile-web-app-capable" content="yes">

        <link rel="stylesheet" href="${contextRoot}/css/normalize.css">
        <link rel="stylesheet" href="${contextRoot}/css/main.css">
        <link rel="stylesheet" href="${contextRoot}/css/popup.css">

        <script src="${contextRoot}/js/libs/jquery.min.js"></script>

        <script src="${contextRoot}/js/libs/zip.min.js"></script>
        <script src="${contextRoot}/js/jszip.js"></script>
        

        <script>
            "use strict";
              //https://s3.amazonaws.com/moby-dick/
              //${contextRoot}/epub/ebook/1
            document.onreadystatechange = function () {
              if (document.readyState == "complete") {
                window.reader = ePubReader("${contextRoot}/epub/ebook/${eBookId}.epub", {
                   restore: true
                 });
              }
            };

        </script>

        <!-- File Storage -->
        <!-- <script src="js/libs/localforage.min.js"></script> -->

        <!-- Full Screen -->
        <script src="${contextRoot}/js/libs/screenfull.min.js"></script>

        <!-- Render -->
        <script src="${contextRoot}/js/epub.js"></script>

        <!-- Reader -->
        <script src="${contextRoot}/js/reader.js"></script>

        <!-- Plugins -->
<%--         <script src="${contextRoot}/js/plugins/search.js"></script> --%>

        <!-- Highlights -->
<%--         <script src="${contextRoot}/js/libs/jquery.highlight.js"></script> --%>
<%--         <script src="${contextRoot}/js/hooks/extensions/highlight.js"></script> --%>
</head>
<body>
<div data-eBookId="${eBookId}" class="findeBookId">
</div>
   <div id="sidebar">
        <div id="panels">
          <!-- <input id="searchBox" placeholder="search" type="search"> -->

          <!-- <a id="show-Search" class="show_view icon-search" data-view="Search">Search</a> -->
          <a id="show-Toc" class="show_view icon-list-1 active" data-view="Toc">TOC</a>
          <a id="show-Bookmarks" class="show_view icon-bookmark" data-view="Bookmarks">Bookmarks</a>
          <!-- <a id="show-Notes" class="show_view icon-edit" data-view="Notes">Notes</a> -->

        </div>
        <div id="tocView" class="view">
        </div>
        <div id="searchView" class="view">
          <ul id="searchResults"></ul>
        </div>
        <div id="bookmarksView" class="view">
          <ul id="bookmarks"></ul>
        </div>
        <div id="notesView" class="view">
          <div id="new-note">
            <textarea id="note-text"></textarea>
            <button id="note-anchor">Anchor</button>
          </div>
          <ol id="notes"></ol>
        </div>
      </div>
      <div id="main">

        <div id="titlebar">
          <div id="opener">
            <a id="slider" class="icon-menu">Menu</a>
          </div>
          <div id="metainfo">
            <span id="book-title"></span>
            <span id="title-seperator">&nbsp;&nbsp;–&nbsp;&nbsp;</span>
            <span id="chapter-title"></span>
          </div>
          <div id="title-controls">
            <a id="bookmark" class="icon-bookmark-empty">Bookmark</a>
            <a id="setting" class="icon-cog">Settings</a>
            <a id="fullscreen" class="icon-resize-full">Fullscreen</a>
          </div>
        </div>

        <div id="divider"></div>
        <div id="prev" class="arrow">‹</div>
        <div id="viewer"></div>
        <div id="next" class="arrow">›</div>

        <div id="loader"><img src="${contextRoot}/img/loader.gif"></div>
      </div>
      <div class="modal md-effect-1" id="settings-modal">
          <div class="md-content">
              <h3>Settings</h3>
              <div>
                  <p>
                    <input type="checkbox" id="sidebarReflow" name="sidebarReflow">Reflow text when sidebars are open.
                  </p>
              </div>
          </div>
      </div>
      <div class="overlay"></div>

    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.5/jszip.min.js"></script>

<script src="${contextRoot}/js/epub.js"></script>

<link rel="stylesheet" type="text/css" href="${contextRoot}/css/examples.css">
</head>
<body>
 <div id="title"></div>
  <div id="viewer" class="spreads"></div>
  <a id="prev" href="#prev" class="arrow">‹</a>
  <a id="next" href="#next" class="arrow">›</a>

  <script>
    var currentSectionIndex = 8;
    // Load the opf
    var book = ePub("C:\Users\Student\Downloads\1010490077\OEBPS\content.opf");
    var rendition = book.renderTo("viewer", {
      width: "100%",
      height: 800,
      manager: "continuous"
    });

    rendition.display("0.xhtml");

    var title = document.getElementById("title");

    var next = document.getElementById("next");
    next.addEventListener("click", function(e){
      rendition.next();
      e.preventDefault();
    }, false);

    var prev = document.getElementById("prev");
    prev.addEventListener("click", function(e){
      rendition.prev();
      e.preventDefault();
    }, false);

    var keyListener = function(e){

      // Left Key
      if ((e.keyCode || e.which) == 37) {
        rendition.prev();
      }

      // Right Key
      if ((e.keyCode || e.which) == 39) {
        rendition.next();
      }

    };

    rendition.on("keyup", keyListener);
    document.addEventListener("keyup", keyListener, false);



    rendition.on("rendered", function(section){
      var nextSection = section.next();
      var prevSection = section.prev();
      var current = book.navigation.get(section.href);

      if (current) {
        title.textContent = current.label;
      }

      if(nextSection) {
        next.textContent = "›";
      } else {
        next.textContent = "";
      }

      if(prevSection) {
        prev.textContent = "‹";
      } else {
        prev.textContent = "";
      }



    });

    rendition.on("relocated", function(location){
      console.log(location);
    });


    rendition.themes.register("dark", "themes.css");
    rendition.themes.register("light", "themes.css");
    rendition.themes.register("tan", "themes.css");



    rendition.themes.default({
      h2: {
        'font-size': '32px',
        color: 'purple'
      },
      p: {
        "margin": '10px'
      }
    });

    rendition.themes.select("tan");
    rendition.themes.fontSize("140%");

  </script>

</body>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${contextRoot}/js/epub.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.5/jszip.min.js"></script>

  <link rel="stylesheet" type="text/css" href="${contextRoot}/css/examples.css">

  <style type="text/css">
    ::selection {
      background: yellow;
    }

    #extras {
      width: 600px;
      margin: 40px auto;
    }

    #highlights {
      list-style: none;
      margin-left: 0;
      padding: 0;
    }

    #highlights li {
      list-style: none;
      margin-bottom: 20px;
      border-top: 1px solid #E2E2E2;
      padding: 10px;
    }

    #highlights a {
      display: block;
    }

    #viewer.spreads {
      top: 0;
      margin-top: 50px;
    }

    [ref="epubjs-mk"] {
      background: url("data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPScxLjEnIHhtbG5zPSdodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZycgeG1sbnM6eGxpbms9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsnIHg9JzBweCcgeT0nMHB4JyB2aWV3Qm94PScwIDAgNzUgNzUnPjxnIGZpbGw9JyNCREJEQkQnIGlkPSdidWJibGUnPjxwYXRoIGNsYXNzPSdzdDAnIGQ9J00zNy41LDkuNEMxOS42LDkuNCw1LDIwLjUsNSwzNC4zYzAsNS45LDIuNywxMS4zLDcuMSwxNS42TDkuNiw2NS42bDE5LTcuM2MyLjgsMC42LDUuOCwwLjksOC45LDAuOSBDNTUuNSw1OS4yLDcwLDQ4LjEsNzAsMzQuM0M3MCwyMC41LDU1LjQsOS40LDM3LjUsOS40eicvPjwvZz48L3N2Zz4=") no-repeat;
      width: 20px;
      height: 20px;
      cursor: pointer;
      margin-left: 0;
    }

  </style>
  <!-- Load EPUB.js and the reader extension -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/epub.js/0.3.77/epub.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/epub.js/0.3.77/epubjs-reader.min.js"></script>
  
</head>
<body>
 <div id="frame">
    <div id="viewer" class="spreads"></div>
    <a id="prev" href="#prev" class="arrow">‹</a>
    <a id="next" href="#next" class="arrow">›</a>
  </div>
  <div id="extras">
    <ul id="highlights"></ul>
  </div>
  <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
  <script>
    // Load the opf
    //https://s3.amazonaws.com/moby-dick/moby-dick.epub
    //${contextRoot}/epub/ebook/1
    //https://haodooclassic.net/PDB/P/1010490082.epub
    var book = ePub("${contextRoot}/epub/1010490076.epub");
	axios.get("https://s3.amazonaws.com/moby-dick/moby-dick.epub").then(response => console.log(response))

    var rendition = book.renderTo("viewer", {
      width: "100%",
      height: 600,
      ignoreClass: 'annotator-hl',
      manager: "continuous"
    });

    var displayed = rendition.display(6);

    // Navigation loaded
    book.loaded.navigation.then(function(toc){
      // console.log(toc);
    });

    var next = document.getElementById("next");
    next.addEventListener("click", function(){
      rendition.next();
    }, false);

    var prev = document.getElementById("prev");
    prev.addEventListener("click", function(){
      rendition.prev();
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

    rendition.on("relocated", function(location){
      // console.log(location);
    });


    // Apply a class to selected text
    rendition.on("selected", function(cfiRange, contents) {
      rendition.annotations.highlight(cfiRange, {}, (e) => {
        console.log("highlight clicked", e.target);
      });
      contents.window.getSelection().removeAllRanges();

    });

    this.rendition.themes.default({
      '::selection': {
        'background': 'rgba(255,255,0, 0.3)'
      },
      '.epubjs-hl' : {
        'fill': 'yellow', 'fill-opacity': '0.3', 'mix-blend-mode': 'multiply'
      }
    });

    // Illustration of how to get text from a saved cfiRange
    var highlights = document.getElementById('highlights');

    rendition.on("selected", function(cfiRange) {

      book.getRange(cfiRange).then(function (range) {
        var text;
        var li = document.createElement('li');
        var a = document.createElement('a');
        var remove = document.createElement('a');
        var textNode;

        if (range) {
          text = range.toString();
          textNode = document.createTextNode(text);

          a.textContent = cfiRange;
          a.href = "#" + cfiRange;
          a.onclick = function () {
            rendition.display(cfiRange);
          };

          remove.textContent = "remove";
          remove.href = "#" + cfiRange;
          remove.onclick = function () {
            rendition.annotations.remove(cfiRange);
            return false;
          };

          li.appendChild(a);
          li.appendChild(textNode);
          li.appendChild(remove);
          highlights.appendChild(li);
        }

      })

    });

  </script>
</body>
</body>
</html>
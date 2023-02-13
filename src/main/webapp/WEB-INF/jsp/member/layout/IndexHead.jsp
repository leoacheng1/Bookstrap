<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bookstrap</title>
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

    <link rel="stylesheet" type="text/css" href="css/slick.css" />
    <link rel="stylesheet" type="text/css" href="css/slick-theme.css" />

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

    <style>
    .top_search_table {
    padding-left: 50px;
}

.searchBar {
    padding-left: 500px;
}

.w-10 {
    width: 10%;
}

.ms-45 {
    margin-left: 30px;
}

.logoFont {
    font-family: 'Roboto', sans-serif;
}


.nav-link {
   
   position: relative;
}



.nav-link::after{
   content: '';
   opacity: 0;
   transition: all 0.3s;
   height: 3px;
    width: 100%;
    background-color: black;
    position: absolute;
       bottom: 0;
    left: 0;
}

.nav-link:hover::after{
    content: '';
    opacity: 1;
}

.slick-prev:before {
    color: black;
}

.slick-next::before {
    color: black;
}

body {
    font-family: 'Noto Sans TC', sans-serif;
}

.icon-text {
    text-decoration: none;
    color: black;
}

.icon-text:hover {
    color: black;
}

.slider-title-en {
    font-family: 'Roboto Slab', serif;
}

.bg-custom {
    background-color: #5ea0cc;
}
</style>
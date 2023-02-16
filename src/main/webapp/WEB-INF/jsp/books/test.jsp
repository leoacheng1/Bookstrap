<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
   
<h1>test</h1>
<script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
<script>
    
axios({
    method:'get',
    url: "http://localhost:8080/Bookstrap/books/update",
    params: {
        id:29
    }
}).then(res => {
      console.log(res.data)
    })
    .catch(err => {
      console.log(err)
    //   window.location.href = 'http://localhost:8080/Bookstrap/books/page';
    })

</script>
</body>
</html>
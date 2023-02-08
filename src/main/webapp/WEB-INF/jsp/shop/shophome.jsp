<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
      <title>Insert title here</title>
      
    </head>


    <body>

      
      <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
      <button id="shopinsert">新增分店</button>
      <button id="shopshowall">瀏覽全部分店</button>
      <div id="view">


        </div>
      </div>
      </div>

      <script>
        const output = document.querySelector('#view')
        const insertreqUrl = 'http://localhost:8080/Booktopia/shops/add';
        const showallreqUrl = 'http://localhost:8080/Booktopia/shops/all';
        ////////////////// 渲染insert  /////////////////////////
        $('#shopinsert').click(function htmlMaker(data) {
          output.innerHTML = '<div class="container"><form><label class="form-label">店名</label>       <input type="text" class="form-control" id="shopName"><label class="form-label">地址</label><input type="text" class="form-control" id="shopAddress"><label class="form-label">電話</label><input type="text" class="form-control" id="shopPhone"><label class="form-label" >營業時間</label>  <input type="time" class="form-control" id="shopOpenHour" min="00:00" max="24:00" required><label class="form-label">打烊時間</label> <input type="time" class="form-control" id="shopcloseHour" min="00:00" max="24:00" required><button type="submit" class="btn btn-primary" id="myButton">送出</button></div></form>';
          insertshop();
        })




        ////////////////// jQuery AJAX 送insert資料  /////////////////////////
        function insertshop() {
          $('#myButton').click(function (event) {
            console.log("ok");
            const shopName = document.getElementById('shopName').value
            const shopAddress = document.getElementById('shopAddress').value
            const shopPhone = document.getElementById('shopPhone').value
            const shopOpenHour = document.getElementById('shopOpenHour').value
            const shopcloseHour = document.getElementById('shopcloseHour').value

            const dtoObject = { "shopName": shopName, "shopAddress": shopAddress, "shopPhone": shopPhone, "shopOpenHour": shopOpenHour ,"shopcloseHour":shopcloseHour } // js 物件
            const dtoJsonString = JSON.stringify(dtoObject) // 將 js 物件轉成 JSON 字串給網路傳遞
            $.ajax({
              url: insertreqUrl,
              method: 'POST',
              contentType: 'application/json;charset:UTF-8',
              data: dtoJsonString,
              success: function (response) {
                // response : jQuery 會幫忙轉成 js 物件
                console.log('response: ' + response)
                console.log('response string ' + JSON.stringify(response))
              },
              error: function (err) {
                console.log('err: ' + err)
              }
            })
          })
        }



        ////////////////// jQuery AJAX showall  /////////////////////////

        $('#shopshowall').click(function (e) {
          output.innerHTML=""
  
          $.ajax({
            url: showallreqUrl,
            method: 'GET',
            success: function (response) {
              console.log(response)
              htmlMaker(response)
            },
            error: function (err) {
              console.log(err)
            }
          })
        })



        function htmlMaker(data) {
         
          data.forEach((element, index) => {
            const div = document.createElement('div');
            div.classList.add("card");
            div.innerHTML += '<div class="card-header">id:'+ element.id+'</div>'
              + '<div class="card-body">店名:' + element.shopName +"<br>"
              + '地址:' + element.shopAddress +"<br>"
              + '電話: ' + element.shopPhone +"<br>"
              +'營業時間:' + element.shopOpenHour 
              +'<div class="edit-place" style="display: flex"><form action="${contextRoot}/message/edit" method="get"><input name="id" type="hidden" value="'+ element.id+'"/> <input				type="submit" class="btn btn-info btn-sm" value="編輯"/></form>'
                
                +'<form action="${contextRoot}/message/delete" method="post"><input name="_method" type="hidden" value="delete" /> <input	name="id" type="hidden" value="'+ element.id+'" /> <input type="submit" class="btn btn-danger btn-sm" value="刪除" /></form></div>';
            // output[0].append(div) // 用 getElementsByClassName
            output.append(div) // 用 querySelector
          });
          
        }
      </script>

    </body>

    </html>
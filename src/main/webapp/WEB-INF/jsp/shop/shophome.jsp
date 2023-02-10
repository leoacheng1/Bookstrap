<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

    <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
      <title>Insert title here</title>
      <style>
        table,
        td,
        tr {
          border: 1px solid #333;
        }
      </style>
    </head>


    <body>

      <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
      <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
      <button id="shopinsert">新增分店</button>
      <button id="shopshowall">瀏覽全部分店</button>
      <div id="view">
        <table>
          <thead>
            <tr>
              <th >書店ID</th>
              <th >書店名</th>
              <th>地址</th>
              <th >電話</th>
              <th >開店時間</th>
              <th >打烊時間</th>
              <th >經度</th>
              <th >緯度</th>
              <th >圖片</th>
              <th >修改</th>
              <th >刪除</th>
            </tr>
          </thead>
          <tbody id="shoptb">
            <jstl:forEach items="${shopList}" var="oneShop">
              <tr>
                <td>${oneShop.id}</td>
                <td>${oneShop.shopName}</td>
                <td>${oneShop.shopAddress}</td>
                <td>${oneShop.shopPhone}</td>
                <td>${oneShop.shopOpenHour}</td>
                <td>${oneShop.shopcloseHour}</td>
                <td>${oneShop.longitude}</td>
                <td>${oneShop.latitude}</td>
                <td><img alt="" src="${contextRoot}/shops/id?id=${oneShop.id}" /></td>
                <td>修改</td>
                <td>刪除</td>
              </tr>
            </jstl:forEach>
          </tbody>
        </table>
       <script>
      //   $.ajax({
      //     url:" http://localhost:8080/Bookstrap/shops/allshopslist",
      //     method: 'GET',
      //     success: function (response) {
      //       const output = document.querySelector('#shoptb')
      //       output.innerHTML=
      //       <jstl:forEach items="${list}" var="oneShop">
      //         <tr>
      //           <td>${oneShop.id}</td>
      //           <td>${oneShop.shopName}</td>
      //           <td>${oneShop.shopAddress}</td>
      //           <td>${oneShop.shopPhone}</td>
      //           <td>${oneShop.shopOpenHour}</td>
      //           <td>${oneShop.shopcloseHour}</td>
      //           <td>${oneShop.longitude}</td>
      //           <td>${oneShop.latitude}</td>
      //           <td><img alt="" src="${contextRoot}/shops/id?id=${oneShop.id}" /></td>
      //           <td>修改</td>
      //           <td>刪除</td>
      //         </tr>
      //       </jstl:forEach>
      //       console.log(response)
      //     },
      //     error: function (err) {
      //       console.log(err)
      //     }
      //   })
      // </script>
        <!-- ////////////////// 渲染insert  ///////////////////////// -->
        <!-- <div class="container"><form id="ajaxForm">
          <label class="form-label">店名</label>       
          <input type="text" class="form-control" name="shopName" id="shopNameInput">
          <label class="form-label">地址</label>
          <input type="text" class="form-control" name="shopAddress" id="shopAddressInput">
          <label class="form-label">電話</label>
          <input type="text" class="form-control"  name="shopPhone"id="shopPhoneInput">
          <label class="form-label" >開店時間</label>  
          <input type="time" class="form-control"  name="shopOpenHour" id="shopOpenHourInput" min="00:00" max="24:00" required>
          <label class="form-label">打烊時間</label> 
          <input type="time" class="form-control" name="shopcloseHour" id="shopcloseHourInput"   min="00:00" max="24:00" required>    
          <label class="form-label">經度</label>
          <input type="text" class="form-control" name="longitude" id="longitudeInput">
          <label class="form-label">緯度</label>   
          <input type="text" class="form-control" name="latitude" id="latitudeInput"> 
          <label  for="file" class="form-label">店面照片:</label>
          <input type="file" name="shopphoto" id="shopphotoInput"/><br>
          <button type="submit" class="btn btn-primary" id="myButton">送出</button></div></form> -->

        <!-- ////////////////// 渲染allshop  ///////////////////////// -->
        <!-- <table>
          <thead>
            <tr>
                <th >書店ID</th>
                <th>地址</th>
                <th >書店名</th>
                <th >電話</th>
                <th >開店時間</th>
                <th >打烊時間</th>
                <th >經度</th>
                <th >緯度</th>
            </tr>
        </thead>
        <tbody>
          <tr>
            <td>zZ</td>
            <td>zZ</td>
            <td>z</td>
            <td>z</td>
            <td>z</td>
            <td>z</td>
            <td>z</td>
            <td>z</td>
          </tr>
        </tbody>
        </table> -->

      </div>






      <script>
        const output = document.querySelector('#view')
        const insertreqUrl = 'http://localhost:8080/Bookstrap/shops/add';
       
        ////////////////// 渲染insert  /////////////////////////
        $('#shopinsert').click(function htmlMaker(data) {
          output.innerHTML = '<div class="container"><form id="ajaxForm"><label class="form-label">店名</label>       <input type="text" class="form-control" name="shopName" id="shopNameInput"><label class="form-label">地址</label><input type="text" class="form-control" name="shopAddress" id="shopAddressInput"><label class="form-label">電話</label><input type="text" class="form-control"  name="shopPhone"id="shopPhoneInput"><label class="form-label" >開店時間</label>  <input type="time" class="form-control"  name="shopOpenHour" id="shopOpenHourInput" min="00:00" max="24:00" required><label class="form-label">打烊時間</label> <input type="time" class="form-control" id="shopcloseHourInput" name="shopcloseHour" min="00:00" max="24:00" required>    <label class="form-label">經度</label><input type="text" class="form-control" name="longitude" id="longitudeInput"><label class="form-label">緯度</label>   <input type="text" class="form-control" name="latitude" id="latitudeInput"> <label  for="file" class="form-label">店面照片:</label><input type="file" name="shopphoto" id="shopphotoInput"/><br><button type="submit" class="btn btn-primary" id="myButton">送出</button></div></form>';
          insertshop();
        })




        ////////////////// jQuery AJAX 送insert資料  /////////////////////////
        function insertshop() {
          const uploadBtn = document.getElementById('myButton');
          uploadBtn.addEventListener('click', function (event) {
            event.preventDefault();
            let shopName = document.getElementById('shopNameInput').value
            let shopAddress = document.getElementById('shopAddressInput').value
            let shopPhone = document.getElementById('shopPhoneInput').value
            let shopOpenHour = document.getElementById('shopOpenHourInput').value
            let shopcloseHour = document.getElementById('shopcloseHourInput').value
            let longitude = document.getElementById('longitudeInput').value
            let latitude = document.getElementById('latitudeInput').value
            let shopphoto = document.getElementById('shopphotoInput').files[0];




            let formData = new FormData();
            formData.append("shopName", shopName);
            formData.append("shopAddress", shopAddress);
            formData.append("shopPhone", shopPhone);
            formData.append("shopOpenHour", shopOpenHour);
            formData.append("shopcloseHour", shopcloseHour);
            formData.append("longitude", longitude);
            formData.append("latitude", latitude);
            formData.append("shopphoto", shopphoto);


            axios({
              url: 'http://localhost:8080/Bookstrap/shops/postAjax',
              method: 'post',
              data: formData,
              headers: { "Content-Type": "multipart/form-data" }
            })
              .then(res => {
                console.log(res.data)
                console.log('上傳成功')
              })
              .catch(err => {
                console.log(err)
              })
            // const dtoObject = { "shopName": shopName, "shopAddress": shopAddress, "shopPhone": shopPhone, "shopOpenHour": shopOpenHour ,"shopcloseHour":shopcloseHour } // js 物件
            // const dtoJsonString = JSON.stringify(dtoObject) // 將 js 物件轉成 JSON 字串給網路傳遞
            // $.ajax({
            //   url: insertreqUrl,
            //   method: 'POST',
            //   contentType: 'application/json;charset:UTF-8',
            //   data: dtoJsonString,
            //   success: function (response) {
            //     // response : jQuery 會幫忙轉成 js 物件
            //     console.log('response: ' + response)
            //     console.log('response string ' + JSON.stringify(response))
            //   },
            //   error: function (err) {
            //     console.log('err: ' + err)
            //   }
            // })
          })
        }



        ////////////////// jQuery AJAX showall  /////////////////////////

        // $('#shopshowall').click(function (e) {
        //   output.innerHTML = ""
        //   output.innerHTML = 
        // })






      </script>


    </body>

    </html>
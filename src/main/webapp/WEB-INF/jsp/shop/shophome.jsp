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
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        新增分店
      </button>
      <button id="shopshowall">分店主頁</button>

      <h2>一個標題？！</h2>
      <div id="view">

      </div>

     

      <!-- 新增分店 -->
      <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">新增分店</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form id="ajaxForm"><label class="form-label">店名</label> <input type="text" class="form-control"
                  name="shopName" id="shopNameInput"><label class="form-label">地址</label><input type="text"
                  class="form-control" name="shopAddress" id="shopAddressInput"><label class="form-label">電話</label>
                <inaput type="text" class="form-control" name="shopPhone" id="shopPhoneInput"><label
                    class="form-label">開店時間</label> <input type="time" class="form-control" name="shopOpenHour"
                    id="shopOpenHourInput" min="00:00" max="24:00" required><label class="form-label">打烊時間</label>
                  <input type="time" class="form-control" id="shopcloseHourInput" name="shopcloseHour" min="00:00"
                    max="24:00" required> <label class="form-label">經度</label><input type="text" class="form-control"
                    name="longitude" id="longitudeInput"><label class="form-label">緯度</label> <input type="text"
                    class="form-control" name="latitude" id="latitudeInput"> <label for="file"
                    class="form-label">店面照片:</label><input type="file" name="shopphoto"
                    id="shopphotoInput" /><br><button type="submit" class="btn btn-primary" id="myButton">送出</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- 更新分店 -->
      <div class="modal fade" id="staticBackdropupdate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="staticBackdropLabel">更新分店</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form id="ajaxForm"><label class="form-label">店名</label> <input type="text" class="form-control"
                  name="shopName" id="shopNameInput"><label class="form-label">地址</label><input type="text"
                  class="form-control" name="shopAddress" id="shopAddressInput"><label class="form-label">電話</label>
                <inaput type="text" class="form-control" name="shopPhone" id="shopPhoneInput"><label
                    class="form-label">開店時間</label> <input type="time" class="form-control" name="shopOpenHour"
                    id="shopOpenHourInput" min="00:00" max="24:00" required><label class="form-label">打烊時間</label>
                  <input type="time" class="form-control" id="shopcloseHourInput" name="shopcloseHour" min="00:00"
                    max="24:00" required> <label class="form-label">經度</label><input type="text" class="form-control"
                    name="longitude" id="longitudeInput"><label class="form-label">緯度</label> <input type="text"
                    class="form-control" name="latitude" id="latitudeInput"> <label for="file"
                    class="form-label">店面照片:</label><input type="file" name="shopphoto"
                    id="shopphotoInput" /><br><button type="submit" class="btn btn-primary" id="myButton">送出</button>
              </form>
            </div>
          </div>
        </div>
      </div>


      <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
      <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
      <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
      <script>
        const output = document.querySelector('#view')
        const insertreqUrl = 'http://localhost:8080/Bookstrap/shops/add';



        ////////////////// jQuery AJAX 送insert資料  /////////////////////////


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
        })


        ////////////////// jQuery AJAX 送showallpage資料  /////////////////////////
        $('#shopshowall').click(function (pageNumber) {

          axios({
            url: 'http://localhost:8080/Bookstrap/shops/api/page2',
            method: 'get',

          })
            .then(res => {

              htmlMaker(res)
            })
            .catch(err => {
              console.log(err)
            })

        })




        function htmlMaker(data) {
          // console.log()

          let msg_data = '<table class="table table-hover">'
            + '<thead>'
            + '<tr>'
            + ' <th>書店ID</th>'
            + ' <th>書店名</th>'
            + ' <th>地址</th>'
            + ' <th>電話</th>'
            + ' <th>開店時間</th>'
            + ' <th>打烊時間</th>'
            + ' <th>經度</th>'
            + ' <th>緯度</th>'
            + ' <th>圖片</th>'
            + ' <th>修改</th>'
            + ' <th>刪除</th>'
            + ' </tr>'
            + ' </thead>'
            + '<tbody>';
          data.data.content.forEach(element => {
            msg_data += '<tr>'
              + '<td>' + element.id + '</td>'
              + '<td>' + element.shopName + '</td>'
              + '<td>' + element.shopAddress + '</td>'
              + '<td>' + element.shopPhone + '</td>'
              + '<td>' + element.shopOpenHour + '</td>'
              + '<td>' + element.shopcloseHour + '</td>'
              + '<td>' + element.latitude + '</td>'
              + '<td>' + element.longitude + '</td>'
              + '<td><img alt="" src="http://localhost:8080/Bookstrap/shops/id?id=' + element.id + '"/></td>'
              + '<td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropupdate"> 修改</button></td>'
              + '<td><button class=" delete-btn btn btn-danger"  data-msgid='+element.id +'>刪除</button></td>'
              + '</tr>'
          })
          msg_data += '</tbody></table>';

          console.log('data.totalPages', data.data.totalPages)

          let totalPages = data.data.totalPages;

          for (let i = 1; i <= totalPages; i++) {
            msg_data += '<button class="pageBtn" data-page="' + i + '">' + i + '</button>'
          }

          let view = document.getElementById('view')

          view.innerHTML = msg_data


          let buttonsArray = document.getElementsByClassName('pageBtn');
          console.log('buttonsArray', buttonsArray)

  
         
          for (i = 0; i <= buttonsArray.length; i++) {
            buttonsArray[i].addEventListener('click', function (e) {
              
              let pageNumber = this.getAttribute('data-page');

              console.log('pageNumber:'+pageNumber)
              loadThatPage(pageNumber)
            })
          }
            const deleteBtn = document.getElementsByClassName("delete-btn");

            for (i = 0; i < deleteBtn.length; i++) {
              deleteBtn[i].addEventListener('click', function (e) {
                let msgID = this.getAttribute('data-msgid');

                console.log("msgID:" + msgID)
                sendDeleteAjax(msgID)
              })
            }
          

        }

        /////// 點 page button 發送的 ajax ////////

        function loadThatPage(pageNumber){
    
    axios({
     url:'http://localhost:8080/Bookstrap/shops/api/page',
     method: 'get',
     params:{
         p: pageNumber
     }
    })
    .then(res =>{
      console.log(res)
      htmlMaker(res)
    })
    .catch(err =>{
     console.log(err)
    })
 }


        ////////////////// jQuery AJAX deletebyid  /////////////////////////


        function sendDeleteAjax(msgID) {
          // console.log("deleteBtn");


          axios({
            url: 'http://localhost:8080/Bookstrap/shops/api/delete',
            method: 'delete',
            // get reqest 以外的 axios 會自動把 content type 轉 application/json
            // 但我們這次沒有要送 body, 所以要設定回 application/x-www-form-urlencoded
            headers: {
              "Content-Type": "application/x-www-form-urlencoded"
            },
            // axios 的 response type 預設為 json, 但這次要回傳 html
            responseType: 'text',
            params: {
              msgId: msgID
            }
          })
            .then(res => {

              // 405 就不會跳這裡
            })
            .catch(err => {
              console.log(err)
              // 前端 reqest 不是送 get, 就不能用後端送 get 回來，需要在前端呼叫 controller 跳頁 
              window.location.href = 'http://localhost:8080/Bookstrap/shops/shophome'
            })
        }





      </script>
    </body>


    </html>
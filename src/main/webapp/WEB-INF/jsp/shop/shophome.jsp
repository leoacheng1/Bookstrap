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
        table {
          border-collapse: collapse;
        }

        th,
        td {
          padding: 8px;
          text-align: left;
        }

        th {
          height: 50px;
          background-color: #dddddd;
          font-weight: bold;
          white-space: nowrap;
        }

        td {
          border: 1px solid #dddddd;

        }

        img {
          max-width: 200px;
          max-height: 100px;
        }

        .pageButton {
          padding-bottom: 300px;
        }

        button.insertshop,
        button.pageBtn {
          display: inline-block;

        }

        button.insertshop {
          float: right
        }
      </style>


      <meta charset="UTF-8">
      <title>Welcome</title>
      <!--版型需要的css -->
      <%@ include file="/WEB-INF/jsp/backend/layout/css.jsp" %>
    </head>

    <body
      class="dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed sidebar-closed sidebar-collapse">
      <div class="wrapper">
        <!--上面導覽列 -->
        <%@ include file="/WEB-INF/jsp/backend/layout/nav.jsp" %>
          <!-- 左邊導覽列 -->
          <%@ include file="/WEB-INF/jsp/backend/layout/sidebar/adminsidebar.jsp" %>
            <div class="content-wrapper">
              <div class="content-header">
                <!-- 標題位置 -->
                <h2>分店管理</h2>
              </div>
              <section class="content">

                <div class="row mt-3">
                  <div class="col-md-5 mx-auto">
                    <div class="input-group">
                      <input class="form-control border rounded-pill" type="search" value="search"
                        id="example-search-input">
                    </div>

                  </div>
                </div>
                <br>
              </section>

              <div id="view">
              </div>
            </div>
            <!--右側彈跳式功能列 -->
            <%@ include file="/WEB-INF/jsp/backend/layout/controllsidebar/admincontroll.jsp" %>
              <!--版型需要的js-->
              <%@ include file="/WEB-INF/jsp/backend/layout/js.jsp" %>
    </body>

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
            <form id="ajaxForm">
              <label class="form-label">店名</label>
              <input type="text" class="form-control" name="shopName" id="shopNameInput">
              <div></div>
              <label class="form-label">地址</label>
              <input type="text" class="form-control" name="shopAddress" id="shopAddressInput">
              <div></div>
              <label class="form-label">電話</label>
              <input type="text" class="form-control" name="shopPhone" id="shopPhoneInput">
              <div></div>
              <label class="form-label">開店時間</label>
              <input type="time" class="form-control" name="shopOpenHour" id="shopOpenHourInput" min="00:00" max="24:00"
                required>
              <div></div>
              <label class="form-label">打烊時間</label>
              <input type="time" class="form-control" name="shopcloseHour" id="shopcloseHourInput" min="00:00"
                max="24:00" required>
              <div></div>
              <label class="form-label">緯度</label>
              <input type="text" class="form-control" name="longitude" id="longitudeInput" readonly="readonly" disabled>
              <label class="form-label">經度</label>
              <input type="text" class="form-control" name="latitude" id="latitudeInput" readonly="readonly" disabled>
              <label for="file" class="form-label">店面照片:</label>
              <input type="file" name="shopphoto" id="shopphotoInput" />
              <img id="preview_progressbarTW_img" src="#" /><br>
              <div></div>
              <button type="submit" class="btn btn-primary" id="myButton">送出</button>
              <div id="wrongp"></div>
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
            <form id="ajaxForm2"></form>
            <label class="form-label">id</label>
            <input type="text" class="form-control" name="shopId" id="updateshopIdInput" value="" readonly="readonly"
              disabled>
            <label class="form-label">店名</label>
            <input type="text" class="form-control" name="shopName" id="updateshopNameInput" value="">
            <label class="form-label">地址</label>
            <input type="text" class="form-control" name="shopAddress" id="updateshopAddressInput">
            <label class="form-label">電話</label>
            <input type="text" class="form-control" name="shopPhone" id="updateshopPhoneInput">
            <label class="form-label">開店時間</label>
            <input type="time" class="form-control" name="shopOpenHour" id="updateshopOpenHourInput" min="00:00"
              max="24:00" required>
            <label class="form-label">打烊時間</label>
            <input type="time" class="form-control" id="updateshopcloseHourInput" name="shopcloseHour" min="00:00"
              max="24:00" required>
            <label class="form-label">緯度</label>
            <input type="text" class="form-control" name="longitude" id="updatelongitudeInput" readonly="readonly"
              disabled>
            <label class="form-label">經度</label>
            <input type="text" class="form-control" name="latitude" id="updatelatitudeInput" readonly="readonly"
              disabled>
            <label for="file" class="form-label">店面照片:</label>
            <input type="file" name="shopphoto" id="updateshopphotoInput" /><br>
            <img id="preview_progressbarTW_img2" src="#" /><br>
            <button type="submit" class="btn btn-primary" id="myupdateButton">送出</button>
            </form>
          </div>
        </div>
      </div>
    </div>

    <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
    <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.6.1/socket.io.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.6.1/socket.io.js  "></script>

    <script>
      const output = document.querySelector('#view')
      const insertreqUrl = 'http://localhost:8080/Bookstrap/shops/add';


      ////////////////// jQuery AJAX 檢查欄位  /////////////////////////

      ////////////////// 店名  /////////////////////////

      const shopNameInput = document.querySelector('#shopNameInput');
      shopNameInput.addEventListener('input', function () {
        if (shopNameInput.value.trim() === '') {
          // 名稱欄位為空，顯示錯誤消息
          shopNameInput.classList.add('is-invalid');
          shopNameInput.nextElementSibling.textContent = '名稱欄位不能為空';
        } else {
          // 名稱欄位不為空，移除錯誤消息
          shopNameInput.classList.remove('is-invalid');
          shopNameInput.nextElementSibling.textContent = '';
        }
      })
      ////////////////// 地址  /////////////////////////

      const shopAddressInput = document.querySelector('#shopAddressInput');

      shopAddressInput.addEventListener('input', function () {
        const longitudeInput = document.querySelector('#longitudeInput').value;

        if (longitudeInput.trim() === '') {
          // 名稱欄位為空，顯示錯誤消息
          shopAddressInput.classList.add('is-invalid');
          shopAddressInput.nextElementSibling.textContent = '請輸入有效地址';

        }
        else {
          // 名稱欄位不為空，移除錯誤消息
          shopAddressInput.classList.remove('is-invalid');
          shopAddressInput.nextElementSibling.textContent = '';
        }
      })

      ////////////////// 電話  /////////////////////////

      const shopPhoneInput = document.querySelector('#shopPhoneInput');
      shopPhoneInput.addEventListener('input', function () {
        const shopPhoneInputv = document.getElementById('shopPhoneInput').value;


        if (checkIfAllNumbers(shopPhoneInputv)) {
          // 名稱欄位為空，顯示錯誤消息
          shopPhoneInput.classList.remove('is-invalid');
          shopPhoneInput.nextElementSibling.textContent = '';

        } else {
          // 名稱欄位不為空，移除錯誤消息
          shopPhoneInput.classList.add('is-invalid');
          shopPhoneInput.nextElementSibling.textContent = '請輸入數字';
        }
      })

      function checkIfAllNumbers(str) {
        return /^\d+$/.test(str);
      }
      ////////////////// 開店  /////////////////////////

      const shopOpenHourInput = document.querySelector('#shopOpenHourInput');
      shopOpenHourInput.addEventListener('input', function () {
        if (shopOpenHourInput.value.trim() === '') {
          // 名稱欄位為空，顯示錯誤消息
          shopOpenHourInput.classList.add('is-invalid');
          shopOpenHourInput.nextElementSibling.textContent = '名稱欄位不能為空';
        } else {
          // 名稱欄位不為空，移除錯誤消息
          shopOpenHourInput.classList.remove('is-invalid');
          shopOpenHourInput.nextElementSibling.textContent = '';
        }
      })

      ////////////////// 打烊  /////////////////////////

      const shopcloseHourInput = document.querySelector('#shopcloseHourInput');
      shopcloseHourInput.addEventListener('input', function () {
        if (shopcloseHourInput.value.trim() === '') {
          // 名稱欄位為空，顯示錯誤消息
          shopcloseHourInput.classList.add('is-invalid');
          shopcloseHourInput.nextElementSibling.textContent = '名稱欄位不能為空';
        } else {
          // 名稱欄位不為空，移除錯誤消息
          shopcloseHourInput.classList.remove('is-invalid');
          shopcloseHourInput.nextElementSibling.textContent = '';
        }
      })
      ////////////////// 圖片  /////////////////////////

      const fileInput = document.getElementById("shopphotoInput");
      fileInput.addEventListener("change", function () {
        const file = fileInput.files[0];
        if (file) {
          // 名稱欄位為空，顯示錯誤消息
          shopphotoInput.classList.add('is-invalid');
          shopphotoInput.nextElementSibling.textContent = '請上傳圖片';
        } else {
          // 名稱欄位不為空，移除錯誤消息
          shopphotoInput.classList.remove('is-invalid');
          shopphotoInput.nextElementSibling.textContent = '';
        }
      })








      ////////////////// jQuery AJAX 送insert資料  /////////////////////////
      // const socket = new WebSocket('ws://localhost:8080');

      $("#shopphotoInput").change(function () {
        //當檔案改變後，做一些事 
        readURL(this);   // this代表<input id="imgInp">
      });

      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $("#preview_progressbarTW_img").attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
        }
      }


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

        if (shopName == null || shopAddress == null || shopPhone == null || shopOpenHour == null || shopcloseHour == null || longitude == null || shopphoto == null) {
          const shopAddressInput = document.getElementById('wrongp');
          shopAddressInput.innerHTML = '資料有錯';
        }
        else {
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
              $('#staticBackdrop').modal('hide');
              window.location.href = 'http://localhost:8080/Bookstrap/shops/shophome';
            })
            .catch(err => {
              console.log(err)
            })
        }
      })
      ////////////////// jQuery AJAX 送showallpage資料  /////////////////////////

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

      function htmlMaker(data) {
        console.log(data.data)

        let view = document.getElementById('view')
        view.innerHTML = ""


        let msg_data = '<table class="table table-Default table-hover">'
          + '<thead>'
          + '<tr>'
          + ' <th>書店ID</th>'
          + ' <th>書店名</th>'
          + ' <th>地址</th>'
          + ' <th>電話</th>'
          + ' <th>開店時間</th>'
          + ' <th>打烊時間</th>'
          + ' <th>緯度</th>'
          + ' <th>經度</th>'
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
            + '<td><button type="button"  id="edit-btn" '
            + ' data-msgid=' + element.id
            + ' data-msgshopName=' + element.shopName
            + ' data-msgshopAddress=' + element.shopAddress
            + ' data-msgshopPhone=' + element.shopPhone
            + ' data-msgshopOpenHour=' + element.shopOpenHour
            + ' data-msgshopcloseHour=' + element.shopcloseHour
            + ' data-msglatitude=' + element.latitude
            + ' data-msglongitude=' + element.longitude

            + ' class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropupdate"> 修改</button></td>'
            + '<td><button class=" delete-btn btn btn-danger"  data-msgid=' + element.id + '>刪除</button></td>'
            + '</tr>'
        })
        msg_data += '</tbody></table>';

        let msg_page = ""

        let totalPages = data.data.totalPages;

        for (let i = 1; i <= totalPages; i++) {
          msg_page += '<button class="pageBtn btn btn-outline-info  " id="pageButton"  data-page="' + i + '">' + i + '</button>'
        }
        msg_page += '<button type="button" class="insertshop btn btn-info" data-bs-toggle="modal"'
          + ' data-bs-target="#staticBackdrop">'
          + ' 新增分店'
          + ' </button>'

        view.innerHTML = msg_page + msg_data

        let buttonsArray = document.getElementsByClassName('pageBtn');

        ////////////////// 塞值到修改  /////////////////////////

        const editBtn = document.getElementsByClassName('btn');

        for (i = 0; i <= editBtn.length - 1; i++) {
          editBtn[i].addEventListener('click', function (e) {

            let msgID = this.getAttribute('data-msgid');
            let msgshopName = this.getAttribute('data-msgshopName');
            let msgshopAddress = this.getAttribute('data-msgshopAddress');
            let msgshopPhone = this.getAttribute('data-msgshopPhone');
            let msgshopOpenHour = this.getAttribute('data-msgshopOpenHour');
            let msgshopcloseHour = this.getAttribute('data-msgshopcloseHour');
            let msglatitude = this.getAttribute('data-msglatitude');
            let msglongitude = this.getAttribute('data-msglongitude');

            document.getElementById('updateshopIdInput').value = msgID
            document.getElementById('updateshopNameInput').value = msgshopName
            document.getElementById('updateshopAddressInput').value = msgshopAddress
            document.getElementById('updateshopPhoneInput').value = msgshopPhone
            document.getElementById('updateshopOpenHourInput').value = msgshopOpenHour
            document.getElementById('updateshopcloseHourInput').value = msgshopcloseHour
            document.getElementById('updatelongitudeInput').value = msglatitude
            document.getElementById('updatelatitudeInput').value = msglongitude

          })
        }

        ////////////////// 刪除  /////////////////////////

        const deleteBtn = document.getElementsByClassName("delete-btn");

        for (i = 0; i < deleteBtn.length; i++) {
          deleteBtn[i].addEventListener('click', function (e) {

            console.log()
            let msgID = this.getAttribute('data-msgid');

            console.log("msgID:" + msgID)
            sendDeleteAjax(msgID)
          })
        }

        ////////////////// 頁數  /////////////////////////


        for (i = 0; i <= buttonsArray.length; i++) {
          buttonsArray[i].addEventListener('click', function (e) {

            let pageNumber = this.getAttribute('data-page');

            console.log('pageNumber:' + pageNumber)
            loadThatPage(pageNumber)
          })
        }
      }

      ////////////////// jQuery AJAX 送修改分店資料  /////////////////////////
      $("#updateshopphotoInput").change(function () {
        //當檔案改變後，做一些事 
        readURL1(this);   // this代表<input id="imgInp">
      });

      function readURL1(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $("#preview_progressbarTW_img2").attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
        }
      }

      const updateBtn = document.getElementById('myupdateButton');
      updateBtn.addEventListener('click', function (event) {
        event.preventDefault();
        let shopId = document.getElementById('updateshopIdInput').value
        let shopName = document.getElementById('updateshopNameInput').value
        let shopAddress = document.getElementById('updateshopAddressInput').value
        let shopPhone = document.getElementById('updateshopPhoneInput').value
        let shopOpenHour = document.getElementById('updateshopOpenHourInput').value
        let shopcloseHour = document.getElementById('updateshopcloseHourInput').value
        let longitude = document.getElementById('updatelongitudeInput').value
        let latitude = document.getElementById('updatelatitudeInput').value
        let shopphoto = document.getElementById('updateshopphotoInput').files[0];

        let formData = new FormData();
        formData.append("shopId", shopId);
        formData.append("shopName", shopName);
        formData.append("shopAddress", shopAddress);
        formData.append("shopPhone", shopPhone);
        formData.append("shopOpenHour", shopOpenHour);
        formData.append("shopcloseHour", shopcloseHour);
        formData.append("longitude", longitude);
        formData.append("latitude", latitude);
        formData.append("shopphoto", shopphoto);

        axios({
          url: 'http://localhost:8080/Bookstrap/shops/api/put',
          method: 'put',
          data: formData,
          headers: { "Content-Type": "multipart/form-data" }
        })
          .then(res => {
            console.log(res.data)
            console.log('上傳成功')
            $('#staticBackdropupdate').modal('hide');
            window.location.href = 'http://localhost:8080/Bookstrap/shops/shophome';



          })
          .catch(err => {
            console.log(err)
          })
      })

      /////// 點 page button 發送的 ajax ////////

      function loadThatPage(pageNumber) {

        axios({
          url: 'http://localhost:8080/Bookstrap/shops/api/page',
          method: 'get',
          params: {
            p: pageNumber
          }
        })
          .then(res => {
            console.log(res)
            htmlMaker(res)
          })
          .catch(err => {
            console.log(err)
          })
      }
      ////////////////// jQuery AJAX deletebyid  /////////////////////////

      function sendDeleteAjax(msgID) {

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

      ////////////////// jQuery AJAX 模糊收尋  /////////////////////////

      const likeButtom = document.getElementById('example-search-input')
      likeButtom.addEventListener('keyup', function (e) {
        console.log("okok")
        let inputaddress = document.getElementById('example-search-input').value
        console.log("inputaddress=" + inputaddress)
        axios({
          url: 'http://localhost:8080/Bookstrap/shops/addressshopslist',
          method: 'get',
          params: {
            address: inputaddress
          }
        })
          .then(res => {
            console.log(res)
            view.innerHTML = ""
            likehtmlMaker(res)
          })
          .catch(err => {
            console.log(err)
          })
      })
      function likehtmlMaker(data) {
        console.log(data.data)

        let msg_data = '<table class="table table-Default table-hover">'
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
        data.data.forEach(element => {
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
            + '<td><button type="button"  id="edit-btn" '
            + ' data-msgid=' + element.id
            + ' data-msgshopName=' + element.shopName
            + ' data-msgshopAddress=' + element.shopAddress
            + ' data-msgshopPhone=' + element.shopPhone
            + ' data-msgshopOpenHour=' + element.shopOpenHour
            + ' data-msgshopcloseHour=' + element.shopcloseHour
            + ' data-msglatitude=' + element.latitude
            + ' data-msglongitude=' + element.longitude

            + ' class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropupdate"> 修改</button></td>'
            + '<td><button class=" delete-btn btn btn-danger"  data-msgid=' + element.id + '>刪除</button></td>'
            + '</tr>'
        })
        msg_data += '</tbody></table>';

        let view = document.getElementById('view')
        view.innerHTML = msg_data

        ////////////////// 修改  /////////////////////////

        const editBtn = document.getElementsByClassName('btn');

        for (i = 0; i <= editBtn.length - 1; i++) {
          editBtn[i].addEventListener('click', function (e) {

            let msgID = this.getAttribute('data-msgid');
            let msgshopName = this.getAttribute('data-msgshopName');
            let msgshopAddress = this.getAttribute('data-msgshopAddress');
            let msgshopPhone = this.getAttribute('data-msgshopPhone');
            let msgshopOpenHour = this.getAttribute('data-msgshopOpenHour');
            let msgshopcloseHour = this.getAttribute('data-msgshopcloseHour');
            let msglatitude = this.getAttribute('data-msglatitude');
            let msglongitude = this.getAttribute('data-msglongitude');

            document.getElementById('updateshopIdInput').value = msgID
            document.getElementById('updateshopNameInput').value = msgshopName
            document.getElementById('updateshopAddressInput').value = msgshopAddress
            document.getElementById('updateshopPhoneInput').value = msgshopPhone
            document.getElementById('updateshopOpenHourInput').value = msgshopOpenHour
            document.getElementById('updateshopcloseHourInput').value = msgshopcloseHour
            document.getElementById('updatelongitudeInput').value = msglatitude
            document.getElementById('updatelatitudeInput').value = msglongitude


          })
        }

        ////////////////// 刪除  /////////////////////////

        const deleteBtn = document.getElementsByClassName("delete-btn");

        for (i = 0; i < deleteBtn.length; i++) {
          deleteBtn[i].addEventListener('click', function (e) {

            console.log()
            let msgID = this.getAttribute('data-msgid');

            console.log("msgID:" + msgID)
            sendDeleteAjax(msgID)
          })
        }

      }

      ////////////////// google map api  找經緯度  /////////////////////////

      const googleadressBtn = document.getElementById('shopAddressInput');

      const googleadressBtn2 = document.getElementById('updateshopAddressInput');

      googleadressBtn2.addEventListener('keyup', function (e) {

        const address = document.getElementById('updateshopAddressInput').value

        console.log(address)

        googlemap2(address)
      })


      googleadressBtn.addEventListener('keyup', function (e) {

        const address = document.getElementById('shopAddressInput').value

        console.log(address)

        googlemap(address)

      })


      function googlemap(address) {

        const geocoder = new google.maps.Geocoder();

        geocoder.geocode({ address: address }, function (results, status) {
          if (status === "OK") {

            var latitude = results[0].geometry.location.lat();
            var longitude = results[0].geometry.location.lng();

            console.log("latitude" + latitude)
            console.log("longitude" + longitude)
            document.getElementById('longitudeInput').value = longitude
            document.getElementById('latitudeInput').value = latitude

          }
        })
      }


      function googlemap2(address) {


        const geocoder = new google.maps.Geocoder();

        geocoder.geocode({ address: address }, function (results, status) {
          if (status === "OK") {

            var latitude = results[0].geometry.location.lat();
            var longitude = results[0].geometry.location.lng();

            console.log("latitude" + latitude)
            console.log("longitude" + longitude)
            document.getElementById('updatelongitudeInput').value = longitude
            document.getElementById('updatelatitudeInput').value = latitude

          }
        })
      }




    </script>
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0pg7HeK2NczdqZQCbjfdkzNlErFJZTVg&callback=googlemap"></script>
    </body>

    </html>
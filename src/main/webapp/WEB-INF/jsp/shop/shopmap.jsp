<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <!DOCTYPE html>
        <html>

        <head>
            <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet" />


            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@500&display=swap" rel="stylesheet" />

            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
            <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@600&display=swap" rel="stylesheet" />

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

                .nav-link::after {
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

                .nav-link:hover::after {
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

                .right-align {
                    position: absolute;
                    top: 0;
                    right: 0;
                    text-align: right;

                    padding: 5px;
                    margin-top: 92px;

                    max-width: 350px;
                    max-height: 650px;
                    overflow: scroll;
                }

                .left-align {
                    position: absolute;
                    top: 0;
                    left: 0;
                    text-align: left;

                    padding: 5px;
                    margin-top: 92px;
                    max-width: 500px;
                    max-height: 900px;



                }

                .googleMap {
                    width: 1000px;
                    height: 600px;
                    margin-left: auto;
                    margin-right: auto;

                }

                .card-text {
                    font-size: 12px;
                    color: white;
                }

                .roaddetail {
                    position: absolute;
                    top: 0;
                    left: 0;
                    text-align: left;

                    padding: 5px;
                    margin-top:300px;
                    width: 350px;
                    max-height: 500px;

                    overflow: scroll;
                }

                .instructions {
                    padding: 5px;
                    width: 300px;

                    white-space: normal;

                }
            </style>
        </head>

        <body>

            <jsp:include page="../layout/header.jsp"></jsp:include>

            <div id="googleMap" class="googleMap"></div>
            <div id="viewright" class="right-align"> </div>
            <div id="viewleft" class="left-align">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                    <label class="form-check-label" for="defaultCheck1">
                        依花費時間排序
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                    <label class="form-check-label" for="defaultCheck1">
                        依距離排序
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="北部" id="north">
                    <label class="form-check-label" for="defaultCheck1">
                        北部
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="西部" id="west">
                    <label class="form-check-label" for="defaultCheck1">
                        西部
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="南部" id="south">
                    <label class="form-check-label" for="defaultCheck1">
                        南部
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="東部" id="east">
                    <label class="form-check-label" for="defaultCheck1">
                        東部
                    </label>
                </div>

            </div>

            <div class="roaddetail" id="roaddetail">

            </div>
            <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
            <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.0/socket.io.min.js"></script>



            <script>

                function initMap() {
                    axios({
                        url: 'http://localhost:8080/Bookstrap/shops/allshopslist',
                        method: 'get',
                    })
                        .then(res => {
                            console.log(res.data)
                            showMap(res.data)
                        })
                        .catch(err => {
                            console.log(err)
                        })
                }
                var originPosition;

                function showMap(data) {
                    var map;
                    var location = [];
                    data.forEach(element => {
                        var latitude = parseFloat(element.latitude)
                        var longitude = parseFloat(element.longitude)
                        const myLatLng = { lat: latitude, lng: longitude };
                        location.push(myLatLng);
                    })

                    var lat, lon;
                    var promise1 = new Promise(function (resolve, reject) {
                        navigator.geolocation.getCurrentPosition(function (pos) {
                            lat = pos.coords.latitude
                            lon = pos.coords.longitude

                            resolve({ lat, lon })
                        })
                    })

                    promise1.then(function (value) {
                        console.log("promise:" + value.lat, value.lon)



                        var originPosition = new google.maps.LatLng(value.lat, value.lon);
                        var mapProp2 = {
                            center: originPosition,
                            zoom: 14
                        };

                        map = new google.maps.Map(document.getElementById("googleMap"), mapProp2);
                        var icon = "../shoppic/libicon.png";

                        marker = new google.maps.Marker({
                            position: { lat: lat, lng: lon },
                            map: map,

                        })

                        for (i = 0; i < location.length; i++) {
                            marker = new google.maps.Marker({
                                position: location[i],
                                map: map,
                                icon: icon
                            })
                        }



                    })
                    var checkbox1 = document.getElementById("defaultCheck1");
                    checkbox1.addEventListener("change", function () {
                        if (checkbox1.checked) {
                            checkbox2.checked = false;
                        }
                        axios({
                            url: 'http://localhost:8080/Bookstrap/shops/allshopslist',
                            method: 'get',
                        })
                            .then(res => {
                                console.log(res.data)
                                showcloseshop(res.data)
                            })
                            .catch(err => {
                                console.log(err)
                            })
                        function showcloseshop(data) {

                            var locations = [];
                            data.forEach(element => {
                                let shopid = element.id
                                let shopAddress = element.shopAddress
                                let shopPhone = element.shopPhone
                                locations.push(element.shopAddress)
                                // locations.push(new google.maps.LatLng(element.latitude, element.longitude))
                            })
                            var locationdetails = [];
                            data.forEach(element => {
                                let shopid = element.id
                                let shopName = element.shopName
                                let shopAddress = element.shopAddress
                                let shopPhone = element.shopPhone
                                let shoptime = element.shopOpenHour + "-" + element.shopcloseHour

                                locationdetails.push({
                                    shopid: shopid, shopName: shopName, shopAddress: shopAddress
                                    , shopPhone: shopPhone, shoptime: shoptime
                                })

                            })



                            var lat, lon;
                            var promise1 = new Promise(function (resolve, reject) {
                                navigator.geolocation.getCurrentPosition(function (pos) {
                                    lat = pos.coords.latitude
                                    lon = pos.coords.longitude

                                    resolve({ lat, lon })
                                })
                            })

                            promise1.then(function (value) {
                                let originPosition = new google.maps.LatLng(value.lat, value.lon);
                                console.log('opop:' + originPosition)


                                const service = new google.maps.DistanceMatrixService();
                                service.getDistanceMatrix({
                                    origins: [originPosition],
                                    destinations: locations,
                                    travelMode: 'DRIVING', // 交通方式：BICYCLING(自行車)、DRIVING(開車，預設)、TRANSIT(大眾運輸)、WALKING(走路)
                                    unitSystem: google.maps.UnitSystem.METRIC, // 單位 METRIC(公里，預設)、IMPERIAL(哩)
                                    avoidHighways: false, // 是否避開高速公路
                                    avoidTolls: false // 是否避開收費路線
                                }, callback);

                                function callback(response, status) {
                                    if (status === "OK") {
                                        console.log("goodgood");
                                        console.log(response);
                                        let len = locations.length
                                        let places = [];
                                        console.log("location" + locations[0]);
                                        console.log("distancevalue" + response.rows[0].elements[1].distance.value);
                                        console.log("distance" + response.rows[0].elements[1].distance.text);
                                        console.log("duration" + response.rows[0].elements[1].duration.text);

                                        for (let i = 0; i < len; i++) {
                                            let placedetail = {
                                                shopAddress: locations[i],
                                                durationvalue: response.rows[0].elements[i].duration.value,

                                                distance: response.rows[0].elements[i].distance.text,
                                                duration: response.rows[0].elements[i].duration.text
                                            };
                                            places.push(placedetail)
                                        }

                                        places.sort((a, b) => {
                                            return a.durationvalue - b.durationvalue;
                                        });
                                        var shopshow = ""
                                        for (let i = 0; i < places.length; i++) {

                                            let viewright = document.getElementById('viewright')

                                            viewright.innerHTML = ""
                                            const result = locationdetails.find(obj => obj.shopAddress === places[i].shopAddress);

                                            shopshow += '<div   class="card" style="width: 16rem; height: 18rem; background-image: url(http://localhost:8080/Bookstrap/shops/id?id=3); background-size:width: 14rem; height: 14rem;"> '
                                                + '<div class="card-body row justify-content-center">'
                                                + ' <p class="card-text  text-center">店名:' + result.shopName + '</p>'
                                                + ' <p class="card-text text-center">地址:' + result.shopAddress + '</p>'
                                                + ' <p class="card-text text-center">電話:' + result.shopPhone + '</p>'
                                                + ' <p class="card-text text-center">距離:' + places[i].distance + '</p>'
                                                + ' <p class="card-text text-center">預估花費時間:' + places[i].duration + '</p>'
                                                + '<button id="road"    class="road btn btn-info  btn-sm " style="width: 100px;" data-msgid=' + result.shopid + '  address="' + result.shopAddress + '">路線規劃</button>'
                                                + '<button id="deleteroad"  class="deleteroad btn btn-warning  btn-sm " style="width: 100px;">路線刪除</button>'
                                                + '</div>'
                                                + '</div>'
                                                + '</div>'
                                                + '</br>'

                                        };


                                        viewright.innerHTML = shopshow






                                        var directionsService = new google.maps.DirectionsService();
                                        var directionsDisplay = new google.maps.DirectionsRenderer();

                                        const deleteroad1 = document.getElementsByClassName("deleteroad");

                                        for (i = 0; i < deleteroad1.length; i++) {
                                            deleteroad1[i].addEventListener('click', function (e) {
                                                directionsDisplay.setMap(null);
                                                document.getElementById('roaddetail').innerHTML = ""

                                            })
                                        }

                                        const roadguideBtn = document.getElementsByClassName("road");
                                        for (i = 0; i < roadguideBtn.length; i++) {
                                            roadguideBtn[i].addEventListener('click', function (e) {
                                                let msgID = this.getAttribute('data-msgid');
                                                let address = this.getAttribute('address')
                                                console.log("msgID:" + msgID)
                                                directionsDisplay.setMap(null);
                                                console.log(address)
                                                showroad(address)

                                            })
                                        }


                                        function showroad(address) {
                                            console.log(address)

                                            directionsDisplay.setMap(map);
                                            var request = {
                                                origin: { lat: lat, lng: lon },
                                                destination: address,
                                                travelMode: 'DRIVING',
                                                language: 'zh-TW'
                                            };

                                            directionsService.route(request, function (result, status) {
                                                if (status == 'OK') {
                                                    // 回傳路線上每個步驟的細節
                                                    directionsDisplay.setDirections(result);  // 顯示路線

                                                    directionsDisplay.setMap(map);
                                                    var steps = result.routes[0].legs[0].steps;
                                                    var html = '<div>路徑:</div>';
                                                    for (var i = 0; i < steps.length; i++) {
                                                        html += '<p class ="instructions">' + steps[i].instructions + '<p>';
                                                    }
                                                    document.getElementById('roaddetail').innerHTML = html;

                                                } else {
                                                    console.log(status);
                                                }
                                            })
                                        }




                                    } else {
                                        console.error("Failed to get distance matrix: " + status);
                                    }
                                }




                            })
                        }


                    })
                    var checkbox2 = document.getElementById("defaultCheck2");
                    checkbox2.addEventListener("change", function () {
                        if (checkbox2.checked) {
                            checkbox1.checked = false;
                        }
                        axios({
                            url: 'http://localhost:8080/Bookstrap/shops/allshopslist',
                            method: 'get',
                        })
                            .then(res => {
                                console.log(res.data)
                                showcloseshop(res.data)
                            })
                            .catch(err => {
                                console.log(err)
                            })
                        function showcloseshop(data) {

                            var locations = [];
                            data.forEach(element => {
                                let shopid = element.id
                                let shopAddress = element.shopAddress
                                let shopPhone = element.shopPhone
                                locations.push(element.shopAddress)
                                // locations.push(new google.maps.LatLng(element.latitude, element.longitude))
                            })
                            var locationdetails = [];
                            data.forEach(element => {
                                let shopid = element.id
                                let shopName = element.shopName
                                let shopAddress = element.shopAddress
                                let shopPhone = element.shopPhone
                                let shoptime = element.shopOpenHour + "-" + element.shopcloseHour

                                locationdetails.push({
                                    shopid: shopid, shopName: shopName, shopAddress: shopAddress
                                    , shopPhone: shopPhone, shoptime: shoptime
                                })

                            })



                            var lat, lon;
                            var promise1 = new Promise(function (resolve, reject) {
                                navigator.geolocation.getCurrentPosition(function (pos) {
                                    lat = pos.coords.latitude
                                    lon = pos.coords.longitude

                                    resolve({ lat, lon })
                                })
                            })

                            promise1.then(function (value) {
                                let originPosition = new google.maps.LatLng(value.lat, value.lon);
                                console.log('opop:' + originPosition)


                                const service = new google.maps.DistanceMatrixService();
                                service.getDistanceMatrix({
                                    origins: [originPosition],
                                    destinations: locations,
                                    travelMode: 'DRIVING', // 交通方式：BICYCLING(自行車)、DRIVING(開車，預設)、TRANSIT(大眾運輸)、WALKING(走路)
                                    unitSystem: google.maps.UnitSystem.METRIC, // 單位 METRIC(公里，預設)、IMPERIAL(哩)
                                    avoidHighways: false, // 是否避開高速公路
                                    avoidTolls: false // 是否避開收費路線
                                }, callback);

                                function callback(response, status) {
                                    if (status === "OK") {
                                        console.log("goodgood");
                                        console.log(response);
                                        let len = locations.length
                                        let places = [];
                                        console.log("location" + locations[0]);
                                        console.log("distancevalue" + response.rows[0].elements[1].distance.value);
                                        console.log("distance" + response.rows[0].elements[1].distance.text);
                                        console.log("duration" + response.rows[0].elements[1].duration.text);

                                        for (let i = 0; i < len; i++) {
                                            let placedetail = {
                                                shopAddress: locations[i],
                                                distancevalue: response.rows[0].elements[i].distance.value,

                                                distance: response.rows[0].elements[i].distance.text,
                                                duration: response.rows[0].elements[i].duration.text
                                            };
                                            places.push(placedetail)
                                        }

                                        places.sort((a, b) => {
                                            return a.distancevalue - b.distancevalue;
                                        });
                                        var shopshow = ""
                                        for (let i = 0; i < places.length; i++) {

                                            let viewright = document.getElementById('viewright')

                                            viewright.innerHTML = ""
                                            const result = locationdetails.find(obj => obj.shopAddress === places[i].shopAddress);

                                            shopshow += '<div   class="card" style="width: 15rem; height: 18rem; background-image: url(http://localhost:8080/Bookstrap/shops/id?id=3); background-size:width: 14rem; height: 14rem;"> '
                                                + '<div class="card-body row justify-content-center">'
                                                + ' <p class="card-text  text-center">店名:' + result.shopName + '</p>'
                                                + ' <p class="card-text text-center">地址:' + result.shopAddress + '</p>'
                                                + ' <p class="card-text text-center">電話:' + result.shopPhone + '</p>'
                                                + ' <p class="card-text text-center">距離:' + places[i].distance + '</p>'
                                                + ' <p class="card-text text-center">預估花費時間:' + places[i].duration + '</p>'
                                                + '<button id="road"    class="road btn btn-info  btn-sm " style="width: 100px;" data-msgid=' + result.shopid + '  address="' + result.shopAddress + '">路線規劃</button>'
                                                + '<button id="deleteroad"  class="deleteroad btn btn-warning  btn-sm " style="width: 100px;">路線刪除</button>'
                                                + '</div>'
                                                + '</div>'
                                                + '<br>'

                                        };


                                        viewright.innerHTML = shopshow



                                        const roadguideBtn = document.getElementsByClassName("road");




                                        for (i = 0; i < roadguideBtn.length; i++) {
                                            roadguideBtn[i].addEventListener('click', function (e) {
                                                let msgID = this.getAttribute('data-msgid');
                                                let address = this.getAttribute('address')
                                                console.log("msgID:" + msgID)
                                                directionsDisplay.setMap(null);
                                                console.log(address)
                                                showroad(address)

                                            })
                                        }

                                        var directionsService = new google.maps.DirectionsService();
                                        var directionsDisplay = new google.maps.DirectionsRenderer();

                                        const deleteroad1 = document.getElementsByClassName("deleteroad");

                                        for (i = 0; i < deleteroad1.length; i++) {
                                            deleteroad1[i].addEventListener('click', function (e) {
                                                directionsDisplay.setMap(null);
                                                document.getElementById('roaddetail').innerHTML = ""
                                            })
                                        }





                                        function showroad(address) {
                                            console.log(address)

                                            var request = {
                                                origin: { lat: lat, lng: lon },
                                                destination: address,
                                                travelMode: 'DRIVING',
                                                language: 'zh-TW'
                                            };

                                            directionsService.route(request, function (result, status) {
                                                if (status == 'OK') {
                                                    // 回傳路線上每個步驟的細節

                                                    directionsDisplay.setDirections(result);  // 顯示路線

                                                    directionsDisplay.setMap(map);            // 再設置地圖

                                                    var steps = result.routes[0].legs[0].steps;
                                                    var html = '<div>路徑:</div>';
                                                    for (var i = 0; i < steps.length; i++) {
                                                        html += '<p class ="instructions">' + steps[i].instructions + '<p>';
                                                    }
                                                    document.getElementById('roaddetail').innerHTML = html
                                                } else {
                                                    console.log(status);
                                                }
                                            })
                                        }
                                    } else {
                                        console.error("Failed to get distance matrix: " + status);
                                    }
                                }
                            })
                        }
                    })

                    const northBtn = document.getElementById("north");
                    const southBtn = document.getElementById("south");
                    const westBtn = document.getElementById("west");
                    const eastBtn = document.getElementById("east");

                    northBtn.addEventListener("change", function () {
                        console.log("okok")
                        console.log(northBtn.value)
                        let place = ""

                        // %臺北市% OR address LIKE %新北市% OR address LIKE %基隆市% OR address LIKE %新竹市% OR address LIKE %宜蘭縣% OR address LIKE %台北市% OR address LIKE %花蓮縣%

                        place += " '%臺北市%' or address LIKE '%花蓮縣%'"
                        // if (southBtn.checked == true) {
                        //     console.log(southBtn.value)
                        // }
                        // if (westBtn.checked == true) {
                        //     console.log(westBtn.value)
                        // }
                        // if (eastBtn.checked == true) {
                        //     console.log(eastBtn.value)
                        // }
console.log(place)
                        axios({
                            url: 'http://localhost:8080/Bookstrap/shops/likeaddress',
                            method: 'get',
                            params:{
                                place:place
                            }
                        })
                            .then(res => {
                                console.log(res.data)
                                // showcloseshop(res.data)
                            })
                            .catch(err => {
                                console.log(err)
                            })

                        function showcloseshop(data) {

                            var locations = [];
                            data.forEach(element => {
                                let shopid = element.id
                                let shopAddress = element.shopAddress
                                let shopPhone = element.shopPhone
                                locations.push(element.shopAddress)
                                // locations.push(new google.maps.LatLng(element.latitude, element.longitude))
                            })
                            var locationdetails = [];
                            data.forEach(element => {
                                let shopid = element.id
                                let shopName = element.shopName
                                let shopAddress = element.shopAddress
                                let shopPhone = element.shopPhone
                                let shoptime = element.shopOpenHour + "-" + element.shopcloseHour

                                locationdetails.push({
                                    shopid: shopid, shopName: shopName, shopAddress: shopAddress
                                    , shopPhone: shopPhone, shoptime: shoptime
                                })

                            })
                        }
                    })
                }





            </script>

            <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0pg7HeK2NczdqZQCbjfdkzNlErFJZTVg&callback=initMap"></script>


        </body>

        </html>
        <script
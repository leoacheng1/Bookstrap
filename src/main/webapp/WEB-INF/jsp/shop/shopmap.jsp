<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <!DOCTYPE html>
        <html>

        <head>
            <style>
                .right-align {
                    position: absolute;
                    top: 0;
                    right: 0;
                    text-align: right;
                    border: 1px solid red;
                    padding: 5px;
                }
            </style>
        </head>

        <body>



            <div id="googleMap" style="width: 1000px;height:500px;"></div>
            <div id="view" class="right-align"> </div>

            <div><button id="cool">cool</button></div>
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


                        var lat = value.lat
                        var lon = value.lon

                        var mapProp2 = {
                            center: { lat: lat, lng: lon },
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

                    const cool = document.getElementById('cool')
                    cool.addEventListener('click', function () {
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
                                            // console.log(places[i].shopAddress)

                                            const result = locationdetails.find(obj => obj.shopAddress === places[i].shopAddress);

                                            shopshow += '<div class="card" style="width: 18rem; ">'
                                                + '<img alt="" src="http://localhost:8080/Bookstrap/shops/id?id=' + result.shopid + '" width="40%" height="40%/>'
                                                + '<div class="card-body">'
                                                + ' <p class="card-text">店名' + result.shopName + '</p>'
                                                + ' <p class="card-text">地址' + result.shopAddress + '</p>'
                                                + ' <p class="card-text">電話' + result.shopPhone + '</p>'
                                                + '<button id="road"   class="road" data-msgid=' + result.shopid + '  address="' + result.shopAddress + '">路線規劃</button>'
                                                + '</div>'
                                                + '</div>'

                                        };

                                        console.log(shopshow)
                                        let view = document.getElementById('view')
                                        view.innerHTML = shopshow




                                        const roadguideBtn = document.getElementsByClassName("road");


                                        for (i = 0; i < roadguideBtn.length; i++) {
                                            roadguideBtn[i].addEventListener('click', function (e) {
                                                let msgID = this.getAttribute('data-msgid');
                                                let address = this.getAttribute('address')
                                                console.log("msgID:" + msgID)

                                                console.log(address)
                                                showroad(address)

                                            })
                                        }
                                        var directionsService = new google.maps.DirectionsService();
                                        var directionsDisplay = new google.maps.DirectionsRenderer();

                                        function showroad(address) {
                                            console.log(address)
                                            directionsDisplay.setMap(map);
                                            var request = {
                                                origin: { lat: lat, lng: lon },
                                                destination: address,
                                                travelMode: 'DRIVING'
                                            };

                                            directionsService.route(request, function (result, status) {
                                                if (status == 'OK') {
                                                    // 回傳路線上每個步驟的細節
                                                    console.log(result.routes[0].legs[0].steps);
                                                    directionsDisplay.setDirections(result);
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
                }





            </script>

            <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0pg7HeK2NczdqZQCbjfdkzNlErFJZTVg&callback=initMap"></script>


        </body>

        </html>
        <script
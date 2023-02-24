<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <!DOCTYPE html>
        <html>

        <head>

        </head>

        <body>

            <h1>My First Google Map</h1>

            <div id="googleMap" style="width: 1000px;height:500px;"></div>
            <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
            <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.5.0/socket.io.min.js"></script>



            <script>
                const socket = new WebSocket('ws://localhost:8080');

                // When a message is received over the WebSocket connection
                socket.addEventListener('message', (event) => {
                    // Get the URL from the message
                    const url = event.data;

                    // Use the URL to execute the desired action
                    window.location.href = url;
                });


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

                        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp2);
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
                        var numMarkers = marker.length;

                        console.log('標記數量：', numMarkers);

                    })
                }


            </script>

            <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0pg7HeK2NczdqZQCbjfdkzNlErFJZTVg&callback=initMap"></script>


        </body>

        </html>
        <script
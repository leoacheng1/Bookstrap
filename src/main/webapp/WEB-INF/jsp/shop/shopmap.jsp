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

            <script>
                function initMap() {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var userLocation = { lat: position.coords.latitude, lng: position.coords.longitude };
                        console.log('我的位置：', userLocation);
                        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                        var mapProp = {
                            center: userLocation,
                            zoom: 15
                        };

                        var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                        var marker = new google.maps.Marker({
                            position: userLocation,
                            map: map,
                            title: 'You are here'
                        });


                        const address = "新北市新店區中正路362號";

                        const geocoder = new google.maps.Geocoder();

                        geocoder.geocode({ address: address }, function (results, status) {
                            if (status === "OK") {

                                var latitude = results[0].geometry.location.lat();
                                var longitude = results[0].geometry.location.lng();
                               
                                console.log("latitude"+latitude)
                                console.log("longitude"+longitude)
                            }
                        })


                    })
                }




            </script>

            <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0pg7HeK2NczdqZQCbjfdkzNlErFJZTVg&callback=initMap"></script>
            <script src="https://unpkg.com/axios@1.1.2/dist/axios.min.js"></script>
            <script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript" src="${contextRoot}/js/jquery-3.6.3.min.js"></script>

        </body>

        </html>
        <script
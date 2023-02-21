<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    var userLocation = {lat: position.coords.latitude, lng: position.coords.longitude};
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
                });
            }

        </script>

        <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0pg7HeK2NczdqZQCbjfdkzNlErFJZTVg&callback=initMap"></script>

    </body>

    </html>
    <script
  
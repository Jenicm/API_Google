<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta charset="utf-8">
<style>
html, body, #map_canvas {
	height: 100%;
}
</style>
<title>Rutas en Google Maps v3</title>

<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<script>
	var map;
	function initialize() {

		var mapOptions = {
			zoom : 12,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions);

		var request = {
			origin : "Madrid",
			destination : "Avila",
			travelMode : google.maps.TravelMode.DRIVING
		};

		var directionsService = new google.maps.DirectionsService();
		var directionsDisplay = new google.maps.DirectionsRenderer();

		// Indicamos d�nde esta el mapa para renderizarnos
		directionsDisplay.setMap(map);
		// Indicamos d�nde esta el panel para mostrar el texto
		directionsDisplay.setPanel(document.getElementById("directionsPanel"));

		directionsService.route(request, function(result, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(result);
			}
		});

	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>

	<h1>Rutas en Google Maps v3</h1>
	<div id="map_canvas" style="width: 50%; float: left;"></div>
	<div id="directionsPanel" style="width: 50%; float: left;"></div>
</body>
</html>

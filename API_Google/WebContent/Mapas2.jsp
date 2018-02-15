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
<title>Mapas</title>

<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<script>
	var map;
	function initialize() {

		var mapOptions = {
			zoom : 12,
			center : new google.maps.LatLng(40.674389, -4.700432),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		map = new google.maps.Map(document.getElementById('map_canvas'),
				mapOptions);

	}
	function cargarRuta(origen, destino) {
		var request = {
			origin : origen,
			destination : destino,
			travelMode : google.maps.TravelMode.DRIVING
		};

		var directionsService = new google.maps.DirectionsService();
		var directionsDisplay = new google.maps.DirectionsRenderer();

		// Indicamos dónde esta el mapa para renderizarnos
		directionsDisplay.setMap(map);
		// Indicamos dónde esta el panel para mostrar el texto
		var panel = document.getElementById("directionsPanel");
		panel.innerHTML = ""; // Vacío el panel, por si buscamos varias veces
		directionsDisplay.setPanel(panel);

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

	<h1>Mapa con inicio y destino</h1>

	<form id="ruta">
		<label>Origen:</label><input type="text" id="origen" name="origen"><br />
		<label>Destino:</label><input type="text" id="destino" name="destino"><br />
		<button id="calcularRuta">Calcular Ruta</button>
	</form>


	<div id="map_canvas" style="width: 50%; float: left;"></div>
	<div id="directionsPanel" style="width: 50%; float: left;"></div>

	<script>
		var boton = document.getElementById("calcularRuta");
		boton.addEventListener("click", function(ev) {

			var origen = document.getElementById("origen").value;
			var destino = document.getElementById("destino").value;

			cargarRuta(origen, destino);

			ev.preventDefault();

		}, false);
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>

<script type="text/javascript">
	var map;
	var gdir;
	var geocoder = null;
	var addressMarker;

	function initialize() {
		if (GBrowserIsCompatible()) {
			map = new GMap2(document.getElementById("mapa_ruta"));
			map.addControl(new GLargeMapControl());
			map.addControl(new GMapTypeControl());
			gdir = new GDirections(map, document.getElementById("direcciones"));
			GEvent.addListener(gdir, "load", onGDirectionsLoad);
			GEvent.addListener(gdir, "error", handleErrors);
		}
	}

	function setDirections(fromAddress, toAddress) {
		gdir.load("from: " + fromAddress + " to: " + toAddress);
	}

	function handleErrors() {
		if (gdir.getStatus().code == G_GEO_UNKNOWN_ADDRESS)
			alert("Dirección no disponible.\nError code: "
					+ gdir.getStatus().code);
		else if (gdir.getStatus().code == G_GEO_SERVER_ERROR)
			alert("A geocoding or directions request could not be successfully processed, yet the exact reason for the failure is not known.\n Error code: "
					+ gdir.getStatus().code);
		else if (gdir.getStatus().code == G_GEO_MISSING_QUERY)
			alert("The HTTP q parameter was either missing or had no value. For geocoder requests, this means that an empty address was specified as input. For directions requests, this means that no query was specified in the input.\n Error code: "
					+ gdir.getStatus().code);
		else if (gdir.getStatus().code == G_GEO_BAD_KEY)
			alert("The given key is either invalid or does not match the domain for which it was given. \n Error code: "
					+ gdir.getStatus().code);
		else if (gdir.getStatus().code == G_GEO_BAD_REQUEST)
			alert("A directions request could not be successfully parsed.\n Error code: "
					+ gdir.getStatus().code);
		else
			alert("An unknown error occurred.");
	}

	function onGDirectionsLoad() {
	}
</script>

</head>
<body  onload="initialize()" onunload="GUnload()">
	<h1>Mapa con iframe</h1>
	
	<div id="mapa">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1231.8808227820125!2d-3.704003601424132!3d40.41705506882895!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd42287e1463b6cf%3A0x14a34120b9332d61!2sSol%2C+Madrid!5e0!3m2!1ses!2ses!4v1518728239379" width="100%" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div>

	<h1>Mapa Simple</h1>
	
	<div id="mapa1">
		<script>
	      	function initMap1() {
		        var mapa1 = new google.maps.Map(document.getElementById('mapa1'), {
		          	center: {lat: -34.397, lng: 150.644},
		          	zoom: 8
		       	});
	      	}
	    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIhDqO9n6rHByXpIPdvul9ALS5M30EJhY&callback=initMap" async defer></script>
	</div>
	
	<hr />
	
	<h1>Mapa con ruta</h1>
	
	<div id="mapa2">
		<script>
	      	function initMap2() {
		        var mapa2 = new google.maps.Map(document.getElementById('mapa2'), {
		          	center: {lat: -34.397, lng: 150.644},
		          	zoom: 8
		       	});
	      	}
	    </script>
    <script src="https://www.google.com/maps/embed/v1/directions?key=AIzaSyBIhDqO9n6rHByXpIPdvul9ALS5M30EJhY&origin=Oslo+Norway&destination=Telemark+Norway&avoid=tolls|highways" async defer></script>    
	</div>















	<h1>Mapa con inicio y destino</h1>

	<form action="#"
		onsubmit="setDirections(this.from.value, this.to.value); return false"
		name="form">

		Origen: <input type="text" size="25" id="fromAddress" name="from" />

		Destino: <input name="to" type="text" id="toAddress" size="25" /><br>

		<input type="submit" name="Submit" value="Calcular Ruta" />
	</form>

	<div id="mapa_ruta"
		style="width: 100%; height: 500px; border: 4px solid #FF6600;"></div>

	<div id="direcciones" style="width: 100%"></div>
	</div>
</body>
</html>
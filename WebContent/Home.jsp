<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="Home1.css">
		<meta charset="UTF-8">
		<title>Home</title>
		<%application.setAttribute("username", null); %>
	</head>
	<body>
	
<script type="text/javascript">


var map;
var lat = null;
var lng = null;
function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 36.084621, lng:  -96.921387},
      zoom: 4
    });
  
  
map.addListener('click', function(e) {
    placeMarkerAndPanTo(e.latLng, map);
  });
}



function placeMarkerAndPanTo(latLng, map) {
	lat = latLng.lat();
    lng = latLng.lng();
  var marker = new google.maps.Marker({
    position: latLng,
    map: map
  });
  
  map.panTo(latLng);
  a();
}

  
  function a(){
	  var str = lat;
	  var str2 = lng;
	  var my_map = document.getElementById('map');
	  my_map.style.display = "none";
	  str = Math.round(str * 100) / 100;
	  str2 = Math.round(str2 * 100) / 100;
	  var gray = document.getElementById('gray');
	  gray.style.display = "none";
	  
	  var latt = document.getElementById('lat');
	  var lngg = document.getElementById('long');
	  latt.value = str;
	  lngg.value = str2;
	  
	  

	}
  
  function showmap(){
	  var my_map = document.getElementById('map');
	  var gray = document.getElementById('gray');
	  my_map.style.display = "block";
	  gray.style.display = "block";

	}
</script>	
	
		<div id="background"></div>
		<div id="gray"></div>
<%
	session.setAttribute("username", null);
%>




<div class="topnav">
  <a  class = "wm" href="Home.jsp">What's The Weather</a>
  

  <div class="links">
     <a href = "Login.jsp" style = "color: inherit; text-decoration: none; margin-right: 25px;">Login</a>
     <a href = "Create.jsp" style = "color: inherit; text-decoration: none;">Register</a>
  </div>
  </div>
  
<div id="map"></div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWiyC_t6IGf66sBeCKII4I-fK680wE-b8&callback=initMap" async defer></script>
  
		<div id="content">
			<img src="https://www.stickpng.com/assets/images/580b585b2edbce24c47b263b.png">
			
				<form action="CitySearchServlet" method="post">
				<div id = "form2">
					<div id="cityInput">
						<input style="width:100%" type="text" name="city" placeholder="Los Angeles">
						<input type="submit" value="">
					</div>
					</div>
					<div id="form">
					<div id="locationInput" style = "display: none;">
						<input id = "lat"  type="text"  name="latitude" placeholder="Latitude">
						<input id = "long" style="margin-left: 10px;" type="text" name="longitude" placeholder="Longitude">
						<button id = "sub" type = "submit"></button>
						<img onclick = 'showmap()' style = "width: 40px; height: 40px; border-radius: 5px; margin-top: 2px; padding-top: 0px;" src = "images/MapIcon.png">
					</div>
					</div>
					<div id = "form2">
					<div id="radio">
						<input type="radio" id="city" name="input" onclick="displayForm()" checked>City
						<input type="radio" id="location" name="input" onclick="displayForm()">Location (Lat./Long.)
					</div>
					</div>
				</form>
			
		</div>
		
		
	</body>
	
	<script>
		function displayForm() {
			if(document.getElementById('city').checked){
				document.getElementById('cityInput').style.display = 'block';
				document.getElementById('locationInput').style.display = 'none';
			}
			else{
				document.getElementById('cityInput').style.display = 'none';
				document.getElementById('locationInput').style.display = 'flex';
			}
		}

	</script>
</html>


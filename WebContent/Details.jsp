<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="Details.css">
		<title>Details Page</title>
		<%@page import="owndata.Weatherobj" %>
		<%
			Weatherobj w = (Weatherobj) request.getSession().getAttribute("city");
		%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		<div id="background"></div>
				 <div id="map"></div>
				 <div id="gray"></div>
		 
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWiyC_t6IGf66sBeCKII4I-fK680wE-b8&callback=initMap" async defer></script>
 
	

		
				<div class="topnav">
				
			<%
			String u=(String)session.getAttribute("username");
			String link = "Home.jsp";
			if (u != null){
				link = "Home2.jsp";
			}
			%>
			  <a  class = "wm" href=<%= link %>>What's The Weather</a>
			    
				
				<form action="CitySearchServlet" method="post">
					<div id="cityInput">
						<input class = "input1" type="text" name="city" placeholder="Los Angeles">
						<input type="submit" value="">
						<!-- <button type="submit">Submit</button> -->
					</div>
					<div id="locationInput" style="display:none">
						<input id = "lat" class = "input2" type="text" name="latitude" placeholder="Latitude" style = "margin-right: 10px;">
						<input id = "long" class = "input2" type="text" name="longitude" placeholder="Longitude">
						<button id="sub" type="submit"></button>
						<img class = "mymap"onclick = 'showmap()' style = "width: 30px; height: 30px; border-radius: 5px; margin-top: 1px; padding-top: 0px;" src = "images/MapIcon.png">
					</div>
					<div id="radio">
						<input type="radio" id="city" name="input" onclick="displayForm()" checked>City
						<input type="radio" id="location" name="input" onclick="displayForm()">Location (Lat./Long.)
					</div>
				</form>
			  </div>
		<div class="content">

			
			<script>

function switch1(){
	  var x = document.getElementById("togg");
	  var y = document.getElementById("tog");
	  var z = document.getElementById("rad1");
	  var a = document.getElementById("rad2");
	  x.style.display = "none";
	  y.style.display = "block";
}

function switch2(){
	  var x = document.getElementById("tog");
	  var y = document.getElementById("togg");
	  var z = document.getElementById("rad2");
	  var a = document.getElementById("rad1");
	  x.style.display = "none";
	  y.style.display = "flex";
}

</script>


<% String city = w.getCity(); %>
<div style="font-family: avenir; color: white; font-size: 30px; padding-left: 55px; margin = 0;padding-top:20px;"><%= city %></div>

<% 
	String country = w.getCountry(); 
	Double low = w.getDayLow(); 
	Double high = w.getDayHigh(); 
	Double wind = w.getWindspeed(); 
	int humidity = w.getHumidity();
	Double longitude = w.getLongitude();
	Double latitude = w.getLatitude();
	Double curr = w.getCurrentTemperature();
	int rise = w.getSunrise();
	int set = w.getSunset();
%> 
<table class = "center" style="color: white; margin-top: 0; margin-bottom: 100px;">
    <tr>
      <td>

	      <button class = "_img" onclick = "revloc()"> 
	      <div id = "tog1"><img class = "img" src="planet-earth.png">
	      </div>
	      <div id ="tog2" style = "display: none">
	      <span style='font-size:20px; color: white; font-family: avenir;' ><%=country%></span>
	      </div>
	      </button>
	      <script>
			function revloc() {
				  var x = document.getElementById("tog1");
				  var y = document.getElementById("tog2");
				  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				    
				  } else {
					y.style.display = "block";
				    x.style.display = "none";
				  }
			}	
		  </script>
		  <div class = "mydiv">Location</div>
	  </td>
      <td>
      	  <button class = "_img" onclick = "revlow()">
      	  <div id = "tog3"><img class = "img" src="snowflake.png">
	      </div>
	      <div id ="tog4" style = "display: none">
	      <span style='font-size:20px; color: white; font-family: avenir;' ><%=low%> degrees Fahrenheit</span>
	      </div>
      	  </button>
      	  <script>
			function revlow() {
				  var x = document.getElementById("tog3");
				  var y = document.getElementById("tog4");
				  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				    
				  } else {
					y.style.display = "block";
				    x.style.display = "none";
				  }
			}	
		  </script>
		  <div class = "mydiv">Temp Low</div>
	  </td>
      <td>
          <button class = "_img" onclick = "revhigh()">
      	  <div id = "tog5"><img class = "img" src="sun.png">
	      </div>
	      <div id ="tog6" style = "display: none">
	      <span style='font-size:20px; color: white; font-family: avenir;' ><%=high%> degrees Fahrenheit</span>
	      </div>
      	  </button>
      	  <script>
      	  function revhigh() {
				  var x = document.getElementById("tog5");
				  var y = document.getElementById("tog6");
				  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				    
				  } else {
					y.style.display = "block";
				    x.style.display = "none";
				  }
			}
      	  </script>
		  <div class = "mydiv">Temp High</div>
	  </td>
      <td>
	      <button class = "_img" onclick = "revwind()">
      	  <div id = "tog7"><img class = "img" src="wind.png">
	      </div>
	      <div id ="tog8" style = "display: none">
	      <span style='font-size:20px; color: white; font-family: avenir;' ><%=wind%> miles/hour</span>
	      </div>
      	  </button>
      	  <script>
      	  function revwind() {
				  var x = document.getElementById("tog7");
				  var y = document.getElementById("tog8");
				  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				    
				  } else {
					y.style.display = "block";
				    x.style.display = "none";
				  }
			}
      	  </script>
		  <div class = "mydiv">Wind</div>
	  </td>
      </tr>
      <tr>
      <td>
          <button class = "_img" onclick = "revhum()">
      	  <div id = "tog9"><img class = "img" src="drop.png">
	      </div>
	      <div id ="tog10" style = "display: none">
	      <span style='font-size:20px; color: white; font-family: avenir;' ><%=humidity%>%</span>
	      </div>
      	  </button>
      	  <script>
      	  function revhum() {
				  var x = document.getElementById("tog9");
				  var y = document.getElementById("tog10");
				  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				    
				  } else {
					y.style.display = "block";
				    x.style.display = "none";
				  }
			}
      	  </script>
		  <div class = "mydiv">Humidity</div>
	  </td>
      <td>
          <button class = "_img" onclick = "revll()">
      	  <div id = "tog11"><img class = "img" src="LocationIcon.png">
	      </div>
	      <div id ="tog12" style = "display: none">
	      <span style='font-size:20px; color: white; font-family: avenir;' ><%=latitude%>,  <%=longitude %></span>
	      </div>
      	  </button>
      	  <script>
      	  function revll() {
				  var x = document.getElementById("tog11");
				  var y = document.getElementById("tog12");
				  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				    
				  } else {
					y.style.display = "block";
				    x.style.display = "none";
				  }
			}
      	  </script>
		  <div class = "mydiv">Coordinates</div>
	  </td>
      <td>
          <button class = "_img" onclick = "revtemp()">
      	  <div id = "tog13"><img class = "img" src="thermometer.png">
	      </div>
	      <div id ="tog14" style = "display: none">
	      <span style='font-size:20px; color: white; font-family: avenir;' ><%=curr%> degrees Fahrenheit</span>
	      </div>
      	  </button>
      	  <script>
      	  function revtemp() {
				  var x = document.getElementById("tog13");
				  var y = document.getElementById("tog14");
				  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				    
				  } else {
					y.style.display = "block";
				    x.style.display = "none";
				  }
			}
      	  </script>
		  <div class = "mydiv">Current Temp</div>
	  </td>
      <td>
          <button class = "_img" onclick = "revs()">
      	  <div id = "tog15"><img class = "img" src="sunrise-icon.png">
	      </div>
	      <div id ="tog16" style = "display: none">
	      <span style='font-size:20px; color: white; font-family: avenir;' ><%=rise%>,  <%=set %></span>
	      </div>
      	  </button>
      	  <script>
      	  function revs() {
				  var x = document.getElementById("tog15");
				  var y = document.getElementById("tog16");
				  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				    
				  } else {
					y.style.display = "block";
				    x.style.display = "none";
				  }
			}
      	  </script>
		  <div class = "mydiv">Sunrise/Sunset</div>
	  </td>
      </tr>
</table>
	
			
		</div>
	</body>
	<script>
		function displayForm() {
			if(document.getElementById('city').checked){
				document.getElementById('cityInput').style.display = 'flex';
				document.getElementById('locationInput').style.display = 'none';
			}
			else{
				document.getElementById('cityInput').style.display = 'none';
				document.getElementById('locationInput').style.display = 'flex';
			}
		}
		function switchDisplay(div){
			$(div).find("img").toggle();
			$(div).find("p").toggle();
		}
		
		$(document).ready(function(){
			$("p").hide();
		});
	</script>
</html>
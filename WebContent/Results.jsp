<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="Results2.css">
		<title>Results Page</title>
		<%@page import="java.util.ArrayList" %>
		<%@page import="owndata.Weatherobj" %>
		
		<%
		@SuppressWarnings("unchecked")
			ArrayList<Weatherobj> cities = (ArrayList<Weatherobj>) session.getAttribute("selected");
		@SuppressWarnings("unchecked")
			ArrayList<Weatherobj> nameasc = (ArrayList<Weatherobj>) session.getAttribute("nameasc");
		@SuppressWarnings("unchecked")
			ArrayList<Weatherobj> namedes = (ArrayList<Weatherobj>) session.getAttribute("namedes");
		@SuppressWarnings("unchecked")
			ArrayList<Weatherobj> templowasc = (ArrayList<Weatherobj>) session.getAttribute("templowasc");
		@SuppressWarnings("unchecked")
			ArrayList<Weatherobj> templowdes = (ArrayList<Weatherobj>) session.getAttribute("templowdes");
		@SuppressWarnings("unchecked")
			ArrayList<Weatherobj> temphighasc = (ArrayList<Weatherobj>) session.getAttribute("temphighasc");
		@SuppressWarnings("unchecked")
			ArrayList<Weatherobj> temphighdes = (ArrayList<Weatherobj>) session.getAttribute("temphighdes");
		%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>
	<body>
		 <div id="background"></div>
		 <div id="map"></div>
		 <div id="gray"></div>
		 

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWiyC_t6IGf66sBeCKII4I-fK680wE-b8&callback=initMap" async defer></script>
 
		 
		 <%
			String u=(String)session.getAttribute("username");
			String link = "Home.jsp";
			if (u != null){
				link = "Home2.jsp";
			}
			%>
			
			
			<div class="topnav">
			  <a  class = "wm" href=<%=link %>>What's The Weather</a>
			    
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
			<p id="ac">All Cities</p>
			<table id="nameasc" class="table">
				<tr>
					<th>City Name</th>
					<th>Temp. Low</th>
					<th>Temp. High</th>
				</tr>
				<%
					if(nameasc != null) {
						if(nameasc.size() != 0) {
							for(Weatherobj w : nameasc) {
								out.println("<tr class='row' onclick='getDetails(\"" + w.getId() + "\")'>");
								out.println("<td>" + w.getNamec() + "</td>");
								out.println("<td>" + w.getDayLow() + "</td>");
								out.println("<td>" + w.getDayHigh() + "</td>");
								out.println("</tr>");
							}
						}
					}
				%>
			</table>
			<table id="namedes" class="table" style="display:none">
				<tr>
					<th>City Name</th>
					<th>Temp. Low</th>
					<th>Temp. High</th>
				</tr>
				<%
					if(namedes != null){
						if(namedes.size() != 0){
							for(Weatherobj w : namedes) {
								out.println("<tr class='row' onclick='getDetails(\"" + w.getId() + "\")'>");
								out.println("<td>" + w.getNamec() + "</td>");
								out.println("<td>" + w.getDayLow() + "</td>");
								out.println("<td>" + w.getDayHigh() + "</td>");
								out.println("</tr>");
							}
						}
					}
				%>
			</table>
			<table id="templowasc" class="table" style="display:none">
				<tr>
					<th>City Name</th>
					<th>Temp. Low</th>
					<th>Temp. High</th>
				</tr>
				<%
					if(templowasc != null){
						if(templowasc.size() != 0){
							for(Weatherobj w : templowasc) {
								out.println("<tr class='row' onclick='getDetails(\"" + w.getId() + "\")'>");
								out.println("<td>" + w.getNamec() + "</td>");
								out.println("<td>" + w.getDayLow() + "</td>");
								out.println("<td>" + w.getDayHigh() + "</td>");
								out.println("</tr>");
							}
						}
					}
				%>
			</table>
			<table id="templowdes" class="table" style="display:none">
				<tr>
					<th>City Name</th>
					<th>Temp. Low</th>
					<th>Temp. High</th>
				</tr>
				<%
					if(templowdes != null){
						if(templowdes.size() != 0){
							for(Weatherobj w : templowdes) {
								out.println("<tr class='row' onclick='getDetails(\"" + w.getId() + "\")'>");
								out.println("<td>" + w.getNamec() + "</td>");
								out.println("<td>" + w.getDayLow() + "</td>");
								out.println("<td>" + w.getDayHigh() + "</td>");
								out.println("</tr>");
							}
						}
					}
				%>
			</table>
			<table id="temphighasc" class="table" style="display:none">
				<tr>
					<th>City Name</th>
					<th>Temp. Low</th>
					<th>Temp. High</th>
				</tr>
				<%
					if(temphighasc != null){
						if(temphighasc.size() != 0){
							for(Weatherobj w : temphighasc) {
								out.println("<tr class='row' onclick='getDetails(\"" + w.getId() + "\")'>");
								out.println("<td>" + w.getNamec() + "</td>");
								out.println("<td>" + w.getDayLow() + "</td>");
								out.println("<td>" + w.getDayHigh() + "</td>");
								out.println("</tr>");
							}
						}
					}
				%>
			</table>
			<table id="temphighdes" class="table" style="display:none">
				<tr>
					<th>City Name</th>
					<th>Temp. Low</th>
					<th>Temp. High</th>
				</tr>
				<%
					if(temphighdes != null){
						if(temphighdes.size() != 0){
							for(Weatherobj w : temphighdes) {
								out.println("<tr class='row' onclick='getDetails(\"" + w.getId() + "\")'>");
								out.println("<td>" + w.getNamec() + "</td>");
								out.println("<td>" + w.getDayLow() + "</td>");
								out.println("<td>" + w.getDayHigh() + "</td>");
								out.println("</tr>");
							}
						}
					}
				%>
			</table>
			<div id="sortList">
				<% 
					if(cities.size() > 1){
						out.println("<p>Sort By:</p>");
						out.println("<form>");
						out.println("<select id=\"sort\" onchange='displayTable()'>");
						out.println("<option value=\"nameasc\" selected>City Name A-Z</option>");
						out.println("<option value=\"namedes\">City Name Z-A</option>");
						out.println("<option value=\"templowasc\">Temp. Low ASC</option>");
						out.println("<option value=\"templowdes\">Temp. Low DESC</option>");
						out.println("<option value=\"temphighasc\">Temp. High ASC</option>");
						out.println("<option value=\"temphighdes\">Temp. High DESC</option>");
						out.println("</select>");
						out.println("</form>");
					}
				%>
			</div>
		</div>
		
		<script >
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
	</body>
	
	<script>
		function getDetails(cityName) {
			$.ajax({
				url: "GetDetailsServlet",
				data: {
					"city": cityName
				},
				success: function(result){
					window.location.href = "Details.jsp";
				}
			});
		}
		
		function displayTable() {
			var selectBox = document.getElementById("sort");
			var selectedValue = "#" + selectBox.options[selectBox.selectedIndex].value;
			
			$(".table").hide();
			$(selectedValue).show();
		}
		
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
		
		
		$(document).ready(function(){
			var rows = $('#nameasc tr').length;
			
			if(rows < 2){
				alert("No such city exists!");
			}
		});
	</script>
</html>
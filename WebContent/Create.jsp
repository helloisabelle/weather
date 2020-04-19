<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="Login.css">
		<meta charset="UTF-8">
		<title>Home</title>
		
		<script>function validate() {
			var xhttp = new XMLHttpRequest();
			xhttp.open("GET", "authenticate.jsp?username=" + document.myform.username.value +
			"&password=" + document.myform.password.value + "&confirm_password=" + document.myform.confirm_password.value, false);
			xhttp.send();
			 if (xhttp.responseText.trim().length > 0) {
			 	document.getElementById("formerror").innerHTML = xhttp.responseText;
			 	return false;
			 }
			 document.getElementById("formerror").innerHTML = "<font><em>Successfully created a new account!</em></font>";
			 return true;
		 }
		 </script>
	</head>
	<body>
		<div id="background"></div>
		<!-- <div id="header">
			<h1 id="wm" onclick="goHome()">Weather Meister</h1>
		</div> -->


<div class="topnav">
  <a  class = "wm" href="Home.jsp">WeatherMeister</a>

  <div class="links">
     <a href = "Login.jsp" style = "color: inherit; text-decoration: none; margin-right: 25px;">Login</a>
     <a >Register</a>
  </div>
  </div>
  
		
				

  
		
<div style=" display: flex; justify-content: center;  padding-bottom: 0px; margin-bottom: 0px;" >
		<img src = "images/new-account-icon-256x256.png" style="width: 100px; height: 100px; position: absolute; top: 190px; z-index: 2;">
</div>
		
		<div id = "block" style = "height: 350px;">
			 <form name = "myform" action = "Home2.jsp" onsubmit="return validate();" method = "GET">
			
			 <div style=" margin-top: 0px; padding-top: 70px"> <p id = "text" >Username</p>
			  <input class = "center" type="text" name="username">
			  <p id = "text">Password</p>
			  <input class = "center"  type="password" name="password">
			  <p id = "text">Confirm Password</p>
			  <input class = "center"  type="password" name="confirm_password">
			   <div id="formerror" style = " padding-top: 10px; text-align: center; color: white; font-size: 14px; font-family: avenir;"></div>
			  <input  class = "mybtn"  style = "color:white; background-color: orange; font-family: avenir;" type="submit" value="Register">
			 

			  </div>
			</form>
		
		</div>
		
		
		
	</body>
	
	<script>
		
		
		function goHome(){
			window.location.replace("Home.jsp");
		}
	</script>
</html>


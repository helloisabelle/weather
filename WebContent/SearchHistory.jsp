<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="checking.check" %>
    <%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="SearchHistory.css">
		<meta charset="UTF-8">
		<title>Home</title>
	
	</head>
	<body>
		<div id="background"></div>

<div class="topnav">
  <a  class = "wm" href="Home2.jsp">WeatherMeister</a>

  <div class="links">
     <a style = "margin-right: 25px;">Profile</a>
     <a href = "Home.jsp" style = "color: inherit; text-decoration: none;">Sign Out</a>
  </div>
  </div>
  
		
				
<% String user=(String)session.getAttribute("username"); 
	ArrayList<String> v = new ArrayList<>();
	v = check.getSH(user);
%>
	<div id = "title"><p> <%= user %> 's Search History </p></div>
<div style=" display: flex; justify-content: center;  padding-bottom: 0px; margin-bottom: 0px;" >
</div>
		
		<table class = "table" style = "height: 350px;">
		<% for (int i = 0; i < v.size(); i++) {
			String x = v.get(i);
			%>
			<tr>
		    <td><%=x%></td>
		  	</tr>
			<% 
		}%>
				</table>
		
		
		
	</body>
	
	<script>
		
		
		function goHome(){
			window.location.replace("Home.jsp");
		}
	</script>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="checking.check" %>
 
<%  

String username = request.getParameter("username");
String password = request.getParameter("password");
session.setAttribute("username", username);
int ans = -1;
int flag = 0;

if (username.length() == 0) {
	%>
	<font><em>Please enter a username.</em></font><br />
	<%
}
else if (password.length() == 0) {
	%>
	<font><em>Please enter a password.</em></font><br />
	<%
}


else {ans = check.login(username, password); flag = 1; }
if (flag == 1){
	if (ans == 1) {
		boolean x = true;
		session.setAttribute("valid", x);
	}
	else if (ans == 2) {
		%>
		<font><em>This user does not exist.</em></font><br />
		<%
	}
	else if (ans == 3) {
		%>
		<font><em>Incorrect password.</em></font><br />
		<%
	}
}
%>

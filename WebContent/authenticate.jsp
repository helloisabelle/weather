<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="checking.check" %>
 
<%  


String username = request.getParameter("username");
String password = request.getParameter("password");
String confirm_password = request.getParameter("confirm_password");
session.setAttribute("username", username);
boolean ans = false;
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

else if (!password.equals(confirm_password)){
	%>
	<font><em>The passwords do not match.</em></font><br />
	<% 
	
}

else {ans = check.validation(username, password); flag = 1;}
if (flag == 1){
	if (!ans) {
	%>
	<font><em>This username is already taken.</em></font><br />
	<%
	}
	else if (password.equals(confirm_password) && ans) {
		boolean x = true;
		session.setAttribute("valid", x);
	}
}
%>

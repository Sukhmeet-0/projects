<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
UserDetails user2 = (UserDetails) session.getAttribute("userd");
if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-Error","Please login first");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid " >
		<div class="card " style="height:84vh">
		<div class="card-body text-center ">
		<img class="img-fluid mx-auto" style="max-width:300px" alt="" src="img/1.png">
		<h1>START TAKING YOUR NOTES</h1>
		<a href="addnotes.jsp" class="btn btn-outline-primary">Start Here</a>
		</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.Connection" import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="all_component/allcss.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container-fluid back-img bg-primary">
		<div class="text-center mt6">
			<h1 class="text-white" >
				<i class="fa fa-book" aria-hidden="true" ></i> E Notes Save Your
				Notes
			</h1>
			<a href="login.jsp" class="btn btn-light btn-lg mr-4 mt-5"><i
				class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a> 
				<a href="register.jsp" class="btn btn-light mt-5 btn-lg"><i
				class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
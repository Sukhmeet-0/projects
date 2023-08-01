<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_component/allcss.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid  back-img bg-primary">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-primary">
						<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>
					
					<div class="card-body">
					<% String invalidMsg=(String)session.getAttribute("login-failed");
						if(invalidMsg!=null){%>
							<div class="alert alert-danger" role="alert"><%=invalidMsg %></div>
					<% 	session.removeAttribute("login-failed");}
					%>
					
					<%String withoutLoginMsg=(String)session.getAttribute("Login-Error");
						if(withoutLoginMsg!=null)
						{%>
							
							<div class="alert alert-danger" role="alert"><%=withoutLoginMsg %></div>
							
						<% 
						session.removeAttribute("Login-Error");}
					%>
					
					<%
					String logoutmsg=(String)session.getAttribute("logoutMsg");
					if(logoutmsg!=null)
					{ %>
						<div class="alert alert-success" role="alert"><%=logoutmsg %></div>
						
					<% session.removeAttribute("logoutMsg");}
					%>
					
						<form action="loginServlet" method="post">

							<div class="form-group">
								<label>Enter Email address</label> <input type="email"
									name="uemail" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password" name="upassword"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<br>
							<button type="submit" class="btn btn-primary btn-sm col-12 ">Login</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
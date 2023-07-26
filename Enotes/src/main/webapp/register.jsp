<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid bg-primary back-img">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-primary">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registration</h4>
					</div>
					
					
					
						<%String regMsg=(String)session.getAttribute("reg-success");
							if(regMsg!=null){%>
							<div class="alert alert-success" role="alert"><%=regMsg %> Login<a href="login.jsp"> Click Here</a></div>
								
							<% session.removeAttribute("reg-success");}
						%>
						
						<%String failedMsg=(String)session.getAttribute("failed-msg");
							if(failedMsg!=null){%>
							<div class="alert alert-danger" role="alert"><%=failedMsg %></div>
								
							<% session.removeAttribute("failed-msg");}
						%>
						
					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="form-group">
								<label>Enter Name</label> <input type="text"
									class="form-control" id="exampleInputName"
									aria-describedby="nameHelp" name="fname"
									placeholder="Enter Name">
							</div>
							<div class="form-group">
								<label>Enter Email address</label> <input type="email"
									class="form-control" name="uemail" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label>Password</label> <input type="password" name="upassword"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<br>
							<button type="submit" class="btn btn-primary btn-sm col-12 ">Register</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
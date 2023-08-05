<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.DAO.postDAO,com.db.DBConnect,java.util.List,com.user.post"%>
<%
UserDetails user3 = (UserDetails) session.getAttribute("userd");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-Error", "Please login first");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_component/allcss.jsp"%>
<title>Show Notes</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container mb-3" style="height:auto ">
		<h2 class="text-center">All Notes:</h2>
		<div class="row">
			<div class="col-md-12">
				
				<%
				if (user3 != null) {
					postDAO ob = new postDAO(DBConnect.getCon());
					List<post> pst = ob.getData(user3.getId());
					for(post po:pst){
				%>
				
				<div class="card mt-3">
					<img src="img/1.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px">
					<div class="card-body p-4">

						<h5 class="card-title"><%=po.getTitle() %></h5>
						<p><%=po.getContent() %></p>
						<p>
							<b class="text-success">Published By: <%=user3.getName() %></b><br> <b
								class="text-primary"></b>
						</p>
						<p>
							<b class="text-success">Published Date: <%=po.getDate() %></b><br> <b
								class="text-sucess"></b>
						</p>
						<div class="container text-center mt-2">
							<a href="" class="btn btn-danger">Delete</a> <a href=""
								class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				
				<% } }
				%>

			</div>
		</div>
	</div>
</body>
<%@include file="all_component/footer.jsp"%>
</html>
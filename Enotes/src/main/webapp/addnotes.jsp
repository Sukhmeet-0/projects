<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<h1 class="text-center">Add your Notes</h1>
	<div class="container-fluid">
		<div class="container mb-5">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="mb-3">
						<%
						UserDetails us=(UserDetails)session.getAttribute("userd");
						%>
						<input type="hidden" name="uid" value="<%=us.getId()%>">
							<label for="exampleInputEmail1" class="form-label"> Enter
								Title</label> <input name="title" required="required" name="title" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label"> Enter
								Content</label>
							<textarea required="required" name="tarea" rows="9" cols="" class="form-control mb-2"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="mb-5 btn mt-3 btn-primary">Add
								Notes</button>
						</div>
					</form>
					<br>
					<br>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="all_component/footer.jsp" %>
</html>
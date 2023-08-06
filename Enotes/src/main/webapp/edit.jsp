<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.DAO.postDAO , com.db.DBConnect , com.user.post"%>
<%
UserDetails user1 = (UserDetails) session.getAttribute("userd");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-Error","Please login first");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_component/allcss.jsp"%>
<title>Edit Page</title>
</head>
<body>
	<%
	Integer noteid=Integer.parseInt(request.getParameter("note_id"));
	
	postDAO post=new postDAO(DBConnect.getCon());
	post p=post.getDataById(noteid);
	
	%>
	<%@include file="all_component/navbar.jsp"%>
	<h1 class="text-center">Edit your Notes</h1>
	
	<div class="container-fluid">
		<div class="container mb-5">
			<div class="row">
				<div class="col-md-12">
					<form action="NoteEditServlet" method="post">
					<input type="hidden" value=<%=noteid %> name="noteid">
						<div class="mb-3">
							
							
							
							<label for="exampleInputEmail1" class="form-label"> Enter
								Title</label> <input name="title" required="required" name="title"
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" value="<%= p.getTitle()%>">

						</div>
						<div class="form-group">
							<label for="exampleInputEmail1" class="form-label"> Enter
								Content</label>
							<textarea required="required" name="tarea" rows="9" cols=""
								class="form-control mb-2"><%=p.getContent() %></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="mb-5 btn mt-3 btn-primary">Add
								Notes</button>
						</div>
					</form>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="all_component/footer.jsp"%>
</html>
<%@page import="com.user.UserDetails"%>
<nav class="navbar bg-primary navbar-expand-lg navbar-custom"
	data-bs-theme="dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa fa-book"
			aria-hidden="true"></i> E-Notes</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i class="fa fa-home"
						aria-hidden="true"></i> Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-plus-circle" aria-hidden="true"></i> Add Notes</a></li>

				<li class="nav-item"><a class="nav-link "><i
						class="fa fa-address-book-o" aria-hidden="true"></i> Show Notes</a></li>
			</ul>
			<%
			UserDetails user = (UserDetails) session.getAttribute("userd");
			if (user != null) {
			%>
			<a class="btn btn-light me-2" type="submit" href=""
				data-bs-toggle="modal" data-bs-target="#exampleModal"
				data-toggle="modal" data-target="#exampleModal"><i
				class="fa fa-user-circle-o" aria-hidden="true"></i> <%=user.getName()%></a>


			<a href="index.jsp" class="btn btn-light " type="submit"><i
				class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
			<!-- Modal -->
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header bg-white">
							<h5 class="modal-title" id="exampleModalLabel">User Details</h5>
							<!-- <button type="button" class="btn-close" aria-label="Close" data-bs-dismiss="modal"
								aria-label="Close"></button>-->
						</div>
						<div class="modal-body bg-white">
							<div class="container text-center ">
								<i class="fa fa-user fa-3x"></i>
								<h5></h5>
								<table class="table">
									<tbody class="bg-white">
										<tr>
											<th class="bg-white text-dark" >User Id</th>
											<td class="bg-white text-dark"><%=user.getId()%></td>
										</tr>
										<tr>
											<th class="bg-white text-dark">Full Name</th>
											<td class="bg-white text-dark"><%=user.getName()%></td>
										</tr>
										<tr>
											<th class="bg-white text-dark">Email Id</th>
											<td class="bg-white text-dark"><%=user.getEmail()%></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
					</div>
				</div>
			</div>

			<%
			} else {
			%>
			<a class="btn btn-light me-2" type="submit" href="login.jsp"><i
				class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a> <a
				href="register.jsp" class="btn btn-light " type="submit"><i
				class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
			<%
			}
			%>





		</div>








	</div>
</nav>
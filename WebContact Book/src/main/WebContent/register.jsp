<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration Page</title>
		<%@ include file="Component/allCSS.jsp"%>
		<style type="text/css">
			body
			{
				background-image: url("Images/register.png");
				background-size: cover;
				width: 100%;
			 	height: 85vh;
			 	background-repeat: no-repeat;
			}
		</style>
	</head>
	<body style="background-color:#f7faf8; min-height:100vh;">
		<%@ include file="Component/navbar.jsp"%>
		<div class="container-fluid">
			<div class="row p-2">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Register your account</h4>
							<%
								String SuccessMsg=(String) session.getAttribute("SuccessMsg");
								String ErrorMsg=(String) session.getAttribute("ErrorMsg");
								 if (SuccessMsg!=null)
								 {
									 %>
									 	<p class="text-success text-center"><%= SuccessMsg %></p>
									 <%
									 session.removeAttribute("SuccessMsg");
								 }
								 if (ErrorMsg!=null)
								 {
									 %>
								 		<p class="text-danger text-center"><%= ErrorMsg %></p>
								 	<%
								 	session.removeAttribute("ErrorMsg");
								 } 
							%>
							<form action="register" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Enter Name</label> <input
									name="Name" type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Enter Email address</label> <input
									name="Email" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Enter Password</label> <input
									name="Password" type="password" class="form-control" id="exampleInputPassword1">
								</div>
								<div class="text-center mt-2">
									<button type="submit" class="btn btn-primary">Register</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top:150px;">
			<%@include file="Component/footer.jsp" %>
		</div>
	</body>
</html>
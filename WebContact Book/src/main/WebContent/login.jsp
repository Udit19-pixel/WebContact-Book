<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login Page</title>
		<%@ include file="Component/allCSS.jsp"%>		
		<style type="text/css">
			body
			{
				background-image: url("Images/login.png");
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
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Login</h4>
							<%
								String InvalidMsg=(String) session.getAttribute("InvalidMsg");
								if (InvalidMsg!=null)
								{
									%>
										<p class="text-danger text-center"><%=InvalidMsg %></p>
									<%
								}
								session.removeAttribute("InvalidMsg");
							%>
							<%
								String LogMsg=(String) session.getAttribute("LogMsg");
								if (LogMsg!=null)
								{
									%>
										<p class="text-success text-center"><%=LogMsg %></p>
									<%
								}
								session.removeAttribute("LogMsg");
							%>
							<form action="login" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
									name="Email" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
									name="Password" type="password" class="form-control" id="exampleInputPassword1">
								</div>
								<div class="text-center mt-2">
									<button type="submit" class="btn btn-primary">Login</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top:253px;">
			<%@include file="Component/footer.jsp" %>
		</div>
	</body>
</html>
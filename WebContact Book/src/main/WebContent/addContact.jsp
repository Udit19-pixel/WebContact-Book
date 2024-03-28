<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add Contact</title>
		<%@ include file="Component/allCSS.jsp" %>
		<style type="text/css">
			body
			{
				background-image: url("Images/add_contacts.png");
				background-size: cover;
				width: 100%;
			 	height: 45vh;
			 	background-repeat: no-repeat;
			}
		</style>
	</head>
	<body style="background-color:#f7faf8; min-height:100vh;">
		<%@ include file="Component/navbar.jsp" %>
		
		<%
		    if (user==null)
		    {
		    	session.setAttribute("invalidMsg","Login First");
		    	response.sendRedirect("login.jsp");
		    }
		 %>
		 
		<div class="container-fluid">
			<div class="row p-2">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Add Contacts here</h4>
							<%
								String succMsg=(String) session.getAttribute("succMsg");
								String errMsg=(String) session.getAttribute("failedMsg");
								 if (succMsg!=null)
								 {
									 %>
									 	<p class="text-success text-center"><%= succMsg %></p>
									 <%
									 session.removeAttribute("succMsg");
								 }
								 if (errMsg!=null)
								 {
									 %>
								 		<p class="text-danger text-center"><%= errMsg %></p>
								 	<%
								 	session.removeAttribute("failedMsg");
								 } 
							%>
							<form action="addContact" method="post">
								<%
									if (user!=null)
									{%>
										<input type="hidden" value="<%= user.getID() %>" name="userId">
									<%}
								%>
								<div class="form-group">
									<label for="exampleInputEmail1">Name</label> <input name="name"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Phone Number</label> <input name="phone"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">About</label> <input name="about"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="text-center mt-2">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top:62px;">
			<%@include file="Component/footer.jsp" %>
		</div>
	</body>
</html>
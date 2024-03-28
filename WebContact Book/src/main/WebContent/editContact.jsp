<%@ page import="com.dao.ContactDAO"  %>
<%@ page import="com.conn.*"  %>
<%@ page import="com.entity.*"  %>

<%@ page import="java.util.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Edit Contacts</title>
		<%@ include file="Component/allCSS.jsp" %>
	</head>
	<body>
		<%@ include file="Component/navbar.jsp" %>
		
		 <div class="container-fluid">
			<div class="row p-2">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Add Contacts here</h4>
							<%
								String errMsg=(String) session.getAttribute("failedMsg");
								 if (errMsg!=null)
								 {
									 %>
								 		<p class="text-danger text-center"><%= errMsg %></p>
								 	<%
								 	session.removeAttribute("failedMsg");
								 } 
							%>
							<form action="update" method="post">
								<%
									int cid=Integer.parseInt(request.getParameter("cid"));
							    	ContactDAO dao=new ContactDAO(dbConnect.getConn());
							    	Contact c=dao.getContactByID(cid);
								%>
								<input type="hidden" value="<%= cid %>" name="cid">
								
								<div class="form-group">
									<label for="exampleInputEmail1">Name</label> <input value="<%= c.getName() %>" name="name"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input value="<%= c.getEmail() %>" name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">Phone Number</label> <input value="<%= c.getPhone() %>" name="phone"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">About</label> <input value="<%= c.getAbout() %>" name="about"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
								</div>
								<div class="text-center mt-2">
									<button type="submit" class="btn btn-primary">Update Contact</button>
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
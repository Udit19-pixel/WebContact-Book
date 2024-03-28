<%@ page import="com.dao.ContactDAO"  %>
<%@ page import="com.conn.*"  %>
<%@ page import="com.entity.*"  %>

<%@ page import="java.util.*"  %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>View Contacts</title>
		<%@ include file="Component/allCSS.jsp" %>
		<style type="text/css">
			body
			{
				background-image: url("Images/view_contacts.png");
				background-size: cover;
				width: 100%;
			 	height: 45vh;
			 	background-repeat: no-repeat;
			}
			.crd-ho:hover
			{
				background-color: #f7f7f7;
			}
		</style>
	</head>
	<body>
		<%@ include file="Component/navbar.jsp" %>
		<%
		    if (user==null)
		    {
		    	session.setAttribute("invalidMsg","Login First");
		    	response.sendRedirect("login.jsp");
		    }
		 %>
		<%
			String succMsg=(String)session.getAttribute("succMsg");
		    String errMsg=(String) session.getAttribute("failMsg");
			if (succMsg!=null)
			{%>
				<div class="alert alert-success" role="alert"><%= succMsg %></div>
			<%
					session.removeAttribute("succMsg");
			}
			else if (errMsg!=null)
			 {
				 %>
			 		<p class="text-danger text-center"><%= errMsg %></p>
			 	<%
			 	session.removeAttribute("failedMsg");
			 }
		%>
		 <div class="container">
		 	<div class="row p-4">	
		 			<%
		 				if (user!=null)
		 				{
		 					ContactDAO dao=new ContactDAO(dbConnect.getConn());
		 					List<Contact> contact=dao.getAllContact(user.getID());
		 				
		 					for (Contact c : contact)
		 					{%>
		 					<div class="col-md-3">
		 						<div class="card crd-ho">
		 							<div class="card-body" style="background-color:#d9ae9c;">
		 								<h5><strong>Name : <%= c.getName() %></strong></h5>
		 								<p>Phone No : <%= c.getPhone() %></p>
		 								<p>Email : <%= c.getEmail() %></p>
		 								<p>About : <%= c.getAbout() %></p>
		 								<div class="text-center">
		 									<a href="editContact.jsp?cid=<%= c.getID() %>" class="btn btn-success btn-sm text-white">Edit</a>
		 									<a href="delete?cid=<%= c.getID() %>"class="btn btn-danger btn-sm text-white">Delete</a>
		 								</div>
		 							</div>
		 						</div>
		 					</div>
		 					<%}
		 					}%>
		 		</div>
		 	</div>
			<div style="margin-top:590px;">
				<%@include file="Component/footer.jsp" %>
			</div>
		</body>
</html>
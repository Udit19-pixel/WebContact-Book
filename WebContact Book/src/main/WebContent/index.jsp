<%@ page import="com.entity.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.conn.dbConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>WebContact Book</title>
		<%@ include file="Component/allCSS.jsp" %>
		<style type="text/css">
			.back-img
			{
				background-image: url("Images/Home.png");
				background-size: cover;
				width: 100%;
			 	height: 85vh;
			 	background-repeat: no-repeat;
			}
			h1
			{
				color: orange;
			}
		</style>
	</head>
	<body>
		<%@ include file="Component/navbar.jsp" %>
		
		<div class="container-fluid back-img text-center">
			<h1><strong>Welcome To Contact Book</strong></h1>
		</div>
		
		<%@ include file="Component/footer.jsp" %>
	</body>
</html>
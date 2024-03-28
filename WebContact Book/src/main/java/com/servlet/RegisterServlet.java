package com.servlet;

import java.io.IOException;

import com.conn.dbConnect;
import com.entity.*;
import com.dao.*;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String Name=request.getParameter("Name");
		String Email=request.getParameter("Email");
		String Password=request.getParameter("Password");
		
		User u=new User(Name,Email,Password);
		UserDAO  dao=new UserDAO(dbConnect.getConn());
		boolean f=dao.userRegister(u);
		HttpSession session=request.getSession();
		if (f)
		{
			session.setAttribute("SuccessMsg","User registered successfully");
			response.sendRedirect("register.jsp");
		}
		else
		{
			session.setAttribute("ErrorMsg","Error in registering user");
			response.sendRedirect("register.jsp");
		}
	}
}
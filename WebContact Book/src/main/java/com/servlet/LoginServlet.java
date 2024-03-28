package com.servlet;

import com.conn.dbConnect;
import com.dao.*;
import com.entity.*;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String Email=req.getParameter("Email");
		String Password=req.getParameter("Password");
		
		
		UserDAO dao=new UserDAO(dbConnect.getConn());
		User u=dao.loginUser(Email, Password);
		HttpSession session=req.getSession();
		if (u!=null)
		{
			session.setAttribute("user",u);
			resp.sendRedirect("index.jsp");
		}
		else
		{
			session.setAttribute("InvalidMsg","Invalid Email or Password");
			resp.sendRedirect("login.jsp");
		}
	}
	
}
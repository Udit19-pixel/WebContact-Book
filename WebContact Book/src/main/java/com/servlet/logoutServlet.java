package com.servlet;

import com.mysql.cj.Session;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings({ "unused", "serial" })
@WebServlet("/Logout")
public class logoutServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session1=req.getSession();
		session1.removeAttribute("user");
		
		HttpSession session2=req.getSession();
		session2.setAttribute("LogMsg","Logout Successfully");
		
		res.sendRedirect("login.jsp");
	}
}
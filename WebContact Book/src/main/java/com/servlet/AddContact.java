package com.servlet;

import java.io.IOException;
import com.entity.Contact;
import com.conn.dbConnect;
import com.dao.ContactDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addContact")
@SuppressWarnings("serial")
public class AddContact extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		int  userId=Integer.valueOf(req.getParameter("userId"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String about=req.getParameter("about");

		HttpSession session = req.getSession();
	    	if (phone == null || !phone.matches("\\d{10}"))
	    	{
	        	session.setAttribute("failedMsg", "Phone number must be exactly 10 digits");
	        	resp.sendRedirect("addContact.jsp");
	        	return;
	    	}
		
		Contact c=new Contact(name,email,phone,about,userId);
		ContactDAO dao=new ContactDAO(dbConnect.getConn());
		
		boolean f=dao.saveContact(c);
		if (f)
		{
			session.setAttribute("succMsg","Contact saved");
			resp.sendRedirect("addContact.jsp");
		}
		else
		{
			session.setAttribute("failedMsg","Failed to save");
			resp.sendRedirect("addContact.jsp");
		}
	}
}

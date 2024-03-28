package com.servlet;

import com.dao.ContactDAO;
import com.conn.*;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/delete")
public class deleteContact extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		int cid=Integer.parseInt(req.getParameter("cid"));
		
		ContactDAO dao=new ContactDAO(dbConnect.getConn());
		boolean f=dao.deleteContactById(cid);
		
		HttpSession session=req.getSession();
		if (f)
		{
			session.setAttribute("succMsg", "Contact deleted");
			resp.sendRedirect("viewContact.jsp");
		}
		else
		{
			session.setAttribute("failMsg", "failed to delete");
			resp.sendRedirect("editContact.jsp");
		}
	}
	
}
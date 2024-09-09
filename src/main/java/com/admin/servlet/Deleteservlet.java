package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.DOA.BookDAOimpl;

@WebServlet("/delete")
public class Deleteservlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		int id=Integer.parseInt(req.getParameter("id"));
		BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
		boolean f= dao.deletebook(id);
		
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("success", "book Deleted successfully ");
			resp.sendRedirect("Admin/all_books.jsp");
		}else {
			session.setAttribute("failed", "something went wrong ");
			resp.sendRedirect("Admin/all_books.jsp");

		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

	
		
}

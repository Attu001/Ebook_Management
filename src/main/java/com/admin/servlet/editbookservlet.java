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
import com.entity.BookDts;

@WebServlet("/edit_book")
public class editbookservlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			

			int id=Integer.parseInt(req.getParameter("id"));
			String bookname=req.getParameter("bookTitle");
			String author=req.getParameter("author");
			String genre=req.getParameter("genre");
			String price=req.getParameter("price");
			String status=req.getParameter("status");
			
			BookDts b=new BookDts();
			b.setBookid(id);
			b.setStatus(status);
			b.setAuthor(author);
			b.setGenre(genre);
			b.setBooktitle(bookname);
			b.setPrice(price);
			
			BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
			boolean f= dao.editbooks(b);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("success", "book upated successfully ");
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

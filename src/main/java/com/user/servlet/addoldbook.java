package com.user.servlet;



	import java.io.File;
	import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.MultipartConfig;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
	import javax.servlet.http.Part;

	import com.DB.DBconnect;
	import com.DOA.BookDAOimpl;
	import com.entity.BookDts;

	@WebServlet("/add_old_books")
	@MultipartConfig
	public class addoldbook extends HttpServlet{

		private static final long serialVersionUID = 1L;

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			try {
				
				String user=req.getParameter("user");
				String bookname=req.getParameter("bookTitle");
				String author=req.getParameter("author");
				String genre="old";
				String price=req.getParameter("price");
				String status="InActive";
				Part part=req.getPart("bookImage");
				String filename=part.getSubmittedFileName();
				
				BookDts b = new BookDts(bookname, author, price, genre, status, filename, user);
				
				
				BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
				
				
				
				
				boolean f= dao.addBook(b);
				
				HttpSession session=req.getSession();
				
				if(f) {
					String path= getServletContext().getRealPath("")+"book";
				 
				 File file=new File(path);
				 
				 part.write(path+File.separator+filename);
				 
				 System.out.println(path);
					session.setAttribute("success", "Books add succesfully");
					resp.sendRedirect("sellbook.jsp");
				}else {
					session.setAttribute("failed", "something went wrong");
					resp.sendRedirect("sellbook.jsp");
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		

	}


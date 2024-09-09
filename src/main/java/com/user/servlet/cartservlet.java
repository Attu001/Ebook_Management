package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.DOA.BookDAOimpl;
import com.DOA.cartdaoimpl;
import com.entity.BookDts;
import com.entity.cart;

@WebServlet("/cartservlet")
public class cartservlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
				
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOimpl dao=new BookDAOimpl(DBconnect.getConn());
			BookDts b=dao.getBookbyid(bid);
			
			cart c=new cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBook_name(b.getBooktitle());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_price(Double.parseDouble(b.getPrice()));
			
			cartdaoimpl dao2=new cartdaoimpl(DBconnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f) {
				
				session.setAttribute("addcart","book added to cart");
				resp.sendRedirect("allrecentbook.jsp");
				
				
			}else {

				session.setAttribute("failed","something wrong on server");
				resp.sendRedirect("allrecentbook.jsp");
			}
			
			
			
			
	
	}
	
	

}

package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.DOA.cartdaoimpl;

@WebServlet("/remove_book")
public class removebookservlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			int cid=Integer.parseInt(req.getParameter("cid"));

			cartdaoimpl dao=new cartdaoimpl(DBconnect.getConn());
			boolean  f=dao.reamovefromcart(bid,uid,cid);
			
			HttpSession session=req.getSession();
			
			
			if(f) {
				System.out.println("removed");
				session.setAttribute("success","succesfully removed");
				resp.sendRedirect("chekoutpage.jsp");
				
			}else {
				System.out.println("failed");
				session.setAttribute("failed","somthing went wrong");
				
				resp.sendRedirect("chekoutpage.jsp");

		
	}
	
	

	}}

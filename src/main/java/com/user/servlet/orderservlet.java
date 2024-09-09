package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.DOA.bookorderdaoimpl;
import com.DOA.cartdaoimpl;
import com.entity.book_order;
import com.entity.cart;


@WebServlet("/ordersservlet")
public class orderservlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession oservlet=req.getSession();
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		String email=req.getParameter("email");
		String name=req.getParameter("name");

		String phon=req.getParameter("phone");

		String address=req.getParameter("address");
		String landmark=req.getParameter("landmark");


		String city=req.getParameter("city");

		String state=req.getParameter("state");

		String zipcode=req.getParameter("pincode");
		
		String payment=req.getParameter("payment");
		
		
		
		String fulladd=address+","+landmark+","+city+","+state+","+zipcode;

		System.out.print(fulladd);
		
		cartdaoimpl dao=new cartdaoimpl(DBconnect.getConn());
		
		List<cart> blist=dao.getBookByUserid(id);
		
		if(blist.isEmpty()) {
			oservlet.setAttribute("failed","no items in cart");
			resp.sendRedirect("chekoutpage.jsp");
			
		}else {
			bookorderdaoimpl dao2=new  bookorderdaoimpl(DBconnect.getConn());
			
			ArrayList<book_order> orderlist=new ArrayList<>();

			// Generate a base order ID prefix
			String orderIdPrefix = "bookord";

			for (int j = 0; j < blist.size(); j++) {
			    cart c = blist.get(j);
			    
			    // Generate a unique order ID
			    String uniqueOrderId = orderIdPrefix + (dao2.getordernumber() + j);

			    // Create a new book_order object for each item
			    book_order o = new book_order();
			    o.setOrder_id(uniqueOrderId);
			    o.setuserName(name);
			    o.setEmail(email);
			    o.setPayment(payment);
			    o.setPhon(phon);
			    o.setFulladd(fulladd);
			    o.setBook_name(c.getBook_name());
			    o.setAuthor(c.getAuthor());
			    o.setPrice(c.getPrice());

			    // Add the new book_order object to the list
			    orderlist.add(o);
			}
			
			if("noselect".equals(payment)) {
				oservlet.setAttribute("select","please select the payment method !!");
				resp.sendRedirect("checkout.jsp");

				
			}else {
				boolean f2=dao2.saveorder(orderlist);
				
				if(f2) {
					
					resp.sendRedirect("order_success.jsp");

					
					
				}else {
					
				oservlet.setAttribute("failed","something went wrong please");
					resp.sendRedirect("chekoutpage.jsp");
				}
			}
		}
		
		
		}catch (Exception e) {

				e.printStackTrace();
		} 
		
		
		
	}
	
	
	
}

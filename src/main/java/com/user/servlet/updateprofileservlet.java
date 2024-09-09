package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.DOA.UserDAOimpl;
import com.entity.User;


@WebServlet("/updateprofileservlet")
public class updateprofileservlet extends HttpServlet{


	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
			
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.println("hello servlet");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhon(phone);	
			
			HttpSession session=req.getSession();
			UserDAOimpl dao=new UserDAOimpl(DBconnect.getConn());
			boolean f= dao.checkpassword(password, id);
			
			if(f) {
				
				boolean f2=dao.updateuser(us);
				if(f2) {
					
					session.setAttribute("success","user updated successfully!");
					resp.sendRedirect("editprofile.jsp");
					
				}else {
					
					session.setAttribute("failed","somthing went wrong");
					resp.sendRedirect("editprofile.jsp");
					
				}
				
					
				
			}else {
				session.setAttribute("incorrect","entered password is incorrect");
				resp.sendRedirect("editprofile.jsp");
			}
	}
	
	
	

}

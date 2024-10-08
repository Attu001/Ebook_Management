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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDAOimpl dao=new UserDAOimpl(DBconnect.getConn());
		
		HttpSession session=req.getSession();
		
			try {
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				
				if("admin@gmail.com".equals(email) && "admin".equals(password))
					
				{
					User us=new User();
					us.setName("Admin");	
					session.setAttribute("userobj",us);
					resp.sendRedirect("Admin/home.jsp");
				}else {
					
				User us=dao.userLogin(email, password);
				if(us!=null) 
				{
					session.setAttribute("userobj",us);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failed","email password invalid");
					resp.sendRedirect("login.jsp");
				}
				
				
				}

				
			}catch(Exception e)
			{	
					e.printStackTrace();
				
			}
		
	}
		
		
	
}

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


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2055534062912073388L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			//System.out.println(name+email+phone+password+check);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhon(phone);
			
			HttpSession session=req.getSession();//
			
			if(check!=null)
			{
				UserDAOimpl dao=new UserDAOimpl(DBconnect.getConn());
				boolean f= dao.userRegister(us);
				
				if(f)
				{
					session.setAttribute("success","User register success");
					resp.sendRedirect("register.jsp");
						//System.out.print("User register success");
				}else {
					session.setAttribute("failed","something wrong with server");
					resp.sendRedirect("register.jsp");
					//System.out.print("something wrong with server");
				}
			}else {
				session.setAttribute("error","Please agree terms and condition");
				resp.sendRedirect("register.jsp");
				//System.out.println("Please agree terms and condition");
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		
	}
		
}

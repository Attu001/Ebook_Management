package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOimpl implements UserDAo{
	private Connection conn;
	
	public UserDAOimpl(Connection conn) {
		super();
		this.conn=conn;
	}

	@Override
	public boolean userRegister(User us) {

		boolean f=false;
			
		try {
			String sql="insert into user(name,email,phonenumber,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getPhon());
			ps.setString(4,us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) 
			{
				f=true;
			}
			
		}catch (Exception e) {
		 e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public User	 userLogin(String email, String password) {
			User us=null;
			
			try {
				String sql="select * from user where email=? and password=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, password);
				ResultSet rs=ps.executeQuery();		
				while(rs.next()) {
					us=new User();
					us.setId(rs.getInt(1));
					us.setName(rs.getString(2));
					us.setEmail(rs.getString(3));
					us.setPhon(rs.getString(4));
					us.setPassword(rs.getString(5));
					us.setAddress(rs.getString(6));
					us.setLandmark(rs.getString(7));
					us.setCity(rs.getString(8));
					us.setState(rs.getString(9));
					us.setPassword(rs.getString(10));
					
					
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return us;
		
	}

	@Override
	public boolean checkpassword(String ps,int id) {
		boolean f=false;
		try {
			
			String sql="select * from user where  password=? and id=? ";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,ps);
			pst.setInt(2,id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				 f=true;
						
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			}
		
		
		return f;
	}

	@Override
	public boolean updateuser(User us) {
		boolean f=false;
		try {
			String sql="update user set name=?,email=?,phonenumber=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getPhon());
			ps.setInt(4, us.getId());
			
			int i=ps.executeUpdate();	
			if(i==1) 
			{
				f=true;
			}
			
		}catch (Exception e) {
		 e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public boolean updateaddress(String address) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	
	
	

}

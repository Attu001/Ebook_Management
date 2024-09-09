package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.cart;
import com.mysql.cj.protocol.Resultset;

public class cartdaoimpl implements cartDAO{

	private Connection conn;
	
	public cartdaoimpl(Connection conn) {
		this.conn=conn;
	}
	
	
	@Override
	public boolean addCart(cart c) {
		boolean f=false;
		try {
			
			String sql="insert into cart(bid,uid,book_name,author,price,total_price) values(?,?,?,?,?,?) ";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setInt(1,c.getBid());
			ps.setInt(2,c.getUid());
			ps.setString(3, c.getBook_name());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5,c.getPrice());
			ps.setDouble(6, c.getTotal_price());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}


	@Override
	public List<cart> getBookByUserid(int userId) {
		List<cart> list=new ArrayList<>();
		cart c=null;
		Double total_price=(double)000000;
		
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,userId);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				c=new cart();
				c.setCid(rs.getInt(1));
				c.setUid(rs.getInt(2));
				c.setBid(rs.getInt(3));
				c.setAuthor(rs.getString(4));
				c.setBook_name(rs.getString(5));
			
				c.setPrice(rs.getDouble(6));
				
				total_price=total_price+rs.getDouble(7);
				c.setTotal_price(total_price);
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public boolean reamovefromcart(int bid,int uid,int cid) {
		
		boolean f=false;
		
		try {
			
			String sql="delete from cart where bid=? and uid=? and cid=?";
			
		
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);
			System.out.println(bid);
			int rs=ps.executeUpdate();
			System.out.println(rs);
			
			if(rs==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	
	

	
	
	
	
	
	

}

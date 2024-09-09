package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.book_order;

public class bookorderdaoimpl implements bookorderdao{

	private Connection conn;
	
	public bookorderdaoimpl(Connection conn) {
		super();
		this.conn=conn;
	}
	
	
	public int getordernumber() {
		int i=1;
		
		
			try {
				String sql="select * from book_order";
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next()) {
					i++;	
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		
		return i;
	}


	@Override
	public boolean saveorder(List<book_order> blistt){
		
		boolean f=false;
		try {
		
		String sql="insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) value(?,?,?,?,?,?,?,?,?)";
		
		
			conn.setAutoCommit(false);
		
		
		PreparedStatement ps=conn.prepareStatement(sql);
		
		
		for(book_order b:blistt ) {
			
			ps.setString(1,b.getOrder_id());
			ps.setString(2,b.getuserName() );
			ps.setString(3,b.getEmail() );
			ps.setString(4,b.getFulladd() );
			ps.setString(5,b.getPhon());
			ps.setString(7,b.getBook_name());
			ps.setString(6,b.getAuthor());
			ps.setDouble(8,(b.getPrice()));
			ps.setString(9,b.getPayment());
			
			ps.addBatch();
			
			conn.commit();
			f=true;
			
		}
		conn.setAutoCommit(true);
		
		int[] count=ps.executeBatch();
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public List<book_order> getbook(String email) {

		List<book_order> list=new ArrayList<book_order>();
		book_order o=null;
		
		try {
			String sql="select * from book_order where email=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				o=new book_order();
				o.setOrder_id(rs.getString(1));
				o.setuserName(rs.getString(2));
				o.setEmail(rs.getString(3));
				o.setFulladd(rs.getString(4));
				o.setPhon(rs.getString(5));
				o.setAuthor(rs.getString(6));
				o.setBook_name(rs.getString(7));
				o.setPrice(rs.getDouble(9));
				o.setPayment(rs.getString(8));
				list.add(o);
				
			}
			
			}catch (Exception e) {
				e.printStackTrace();
			}
	
		
		
		
		
		
		return list;
	}
	
	
	
	

}

package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDts;

public class BookDAOimpl implements BookDAO {

	public Connection conn;

	public BookDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBook(BookDts b) {
		boolean f = false;

		try {

			String sql = "insert into book_dts(booktitle,author,status,genre,photo,price,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBooktitle());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getStatus());
			ps.setString(4, b.getGenre());
			ps.setString(5, b.getPhotoname());
			ps.setString(6, b.getPrice());
			ps.setString(7, b.getEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
					f=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<BookDts> getallbook() {
		
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		
		try {
			String sql="select * from book_dts";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBooktitle(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(7));
				b.setGenre(rs.getString(5));
				b.setStatus(rs.getString(4));
				b.setPhotoname(rs.getString(6));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public BookDts getBookbyid(int id) {
		
		BookDts b=null;
		
		try {
			
			String sql="select * from book_dts where book_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBooktitle(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(7));
				b.setGenre(rs.getString(5));
				b.setStatus(rs.getString(4));
				b.setPhotoname(rs.getString(6));
				b.setEmail(rs.getString(8));
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
		
	}

	@Override
	public boolean editbooks(BookDts b ) {
			boolean f=false;
			try {
				String sql="update book_dts set booktitle=?,author=?,status=?,genre=?,price=? where book_id=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1,b.getBooktitle());
				ps.setString(2,b.getAuthor() );
				ps.setString(3,b.getStatus());
				ps.setString(4,b.getGenre());
				ps.setString(5,b.getPrice());
				ps.setInt(6,b.getBookid());
				
				int i=ps.executeUpdate();
				if(i==1)
				{
					f=true;
				}		
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
	}

	@Override
	public boolean deletebook(int id) {
		
		boolean f=false;
		
		try {
			String sql="delete from book_Dts where book_id=?";			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			if(i==1) {
			f=true;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
			
		return f;
	}

	@Override
	public List<BookDts> getNewBook() {
		
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		
		try {
			PreparedStatement ps=conn.prepareStatement("Select * from book_dts where status=? and genre=? order by book_id desc");
			ps.setString(1,"Active");
			ps.setString(2,"new");
			ResultSet rs=ps.executeQuery();
			if (!rs.isBeforeFirst()) { // Check if result set is empty
			    System.out.println("No books found");
			}
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBooktitle(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(7));
				b.setGenre(rs.getString(5));
				b.setStatus(rs.getString(4));
				b.setPhotoname(rs.getString(6));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	
	
	
	
	
	
	@Override
	public List<BookDts> getallNewBook() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		
		try {
			PreparedStatement ps=conn.prepareStatement("Select * from book_dts where status=? and genre=?");
			ps.setString(1,"Active");
			ps.setString(2,"new");
			ResultSet rs=ps.executeQuery();
			if (!rs.isBeforeFirst()) { // Check if result set is empty
			    System.out.println("No books found");
			}
			
			while(rs.next()) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBooktitle(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(7));
				b.setGenre(rs.getString(5));
				b.setStatus(rs.getString(4));
				b.setPhotoname(rs.getString(6));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDts> getOldBook() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		
		try {
			PreparedStatement ps=conn.prepareStatement("Select * from book_dts where status=? and genre=? order by book_id desc");
			ps.setString(1,"InActive");
			ps.setString(2,"old");
			ResultSet rs=ps.executeQuery();
			if (!rs.isBeforeFirst()) { 
			    System.out.println("No books found");
			}
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBooktitle(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(7));
				b.setGenre(rs.getString(5));
				b.setStatus(rs.getString(4));
				b.setPhotoname(rs.getString(6));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDts> getallOldBook() {
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		
		try {
			PreparedStatement ps=conn.prepareStatement("Select * from book_dts where status=? and genre=? order by book_id desc");
			ps.setString(1,"InActive");
			ps.setString(2,"old");
			ResultSet rs=ps.executeQuery();
			if (!rs.isBeforeFirst()) { 
			    System.out.println("No books found");
			}
		
			while(rs.next()) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBooktitle(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(7));
				b.setGenre(rs.getString(5));
				b.setStatus(rs.getString(4));
				b.setPhotoname(rs.getString(6));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookDts> searchbooks(String search) {
		
		List<BookDts> list=new ArrayList<BookDts>();
		BookDts b=null;
		
		try {
			PreparedStatement ps=conn.prepareStatement("Select * from book_dts where booktitle like ? or author like ?");
			ps.setString(1,"%"+search+"%");
			ps.setString(2,"%"+search+"%");
			ResultSet rs=ps.executeQuery();
			if (!rs.isBeforeFirst()) { 
			    System.out.println("No books found");
			}
			int i=1;
			while(rs.next() && i<=4) {
				b=new BookDts();
				b.setBookid(rs.getInt(1));
				b.setBooktitle(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(7));
				b.setGenre(rs.getString(5));
				b.setStatus(rs.getString(4));
				b.setPhotoname(rs.getString(6));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
				
				
		
		return list;
	}

	
	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

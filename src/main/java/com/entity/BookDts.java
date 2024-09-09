package com.entity;

public class BookDts {
	
	private int bookid;
	private String booktitle;
	private String author;
	private String price;
	private String genre;
	private String status;
	private String photoname;
	private String email;
	
	
	  public BookDts(String booktitle, String author, String price, String genre, String status, String photoname, String email) {
	        super();
	        this.booktitle = booktitle;
	        this.author = author;
	        this.price = price;
	        this.genre = genre;
	        this.status = status;
	        this.photoname = photoname;
	        this.email = email;
	    }

	
	
	
	
	public BookDts() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBooktitle() {
		return booktitle;
	}
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoname() {
		return photoname;
	}
	public void setPhotoname(String photoname) {
		this.photoname = photoname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "BookDts [bookid=" + bookid + ", booktitle=" + booktitle + ", author=" + author + ", price=" + price
				+ ", genre=" + genre + ", status=" + status + ", photoname=" + photoname + ", email=" + email + "]";
	}
	public BookDts(int bookid, String booktitle, String author, String price, String genre, String status,
			String photoname, String email) {
		super();
		this.bookid = bookid;
		this.booktitle = booktitle;
		this.author = author;
		this.price = price;
		this.genre = genre;
		this.status = status;
		this.photoname = photoname;
		this.email = email;
	}
	
	

}

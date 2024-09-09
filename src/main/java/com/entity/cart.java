package com.entity;

public class cart {
	
	private int cid;
	private int uid;
	private int bid;
	private String book_name;
	private String author;
	private Double price;
	private Double total_price;
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}
	
	@Override
	public String toString() {
		return "cart [cid=" + cid + ", uid=" + uid + ", bid=" + bid + ", book_name=" + book_name + ", author=" + author
				+ ", price=" + price + ", total_price=" + total_price + "]";
	}
	
	
	
	

}

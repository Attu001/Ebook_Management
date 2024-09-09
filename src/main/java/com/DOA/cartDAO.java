package com.DOA;

import java.util.List;

import com.entity.cart;

public interface cartDAO {

	public boolean addCart(cart c);
	
	public List<cart> getBookByUserid(int userId);
	
	public boolean reamovefromcart(int bid,int uid,int cid);

}

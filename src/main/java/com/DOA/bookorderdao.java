package com.DOA;

import java.util.List;

import com.entity.book_order;

public interface bookorderdao {
	
		public int getordernumber();
		
		
		public boolean saveorder(List<book_order> blist);
		
		public List<book_order> getbook(String email);
}

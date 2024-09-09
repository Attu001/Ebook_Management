package com.DOA;

import java.util.List;

import com.entity.BookDts;

public interface BookDAO {
		
			public boolean addBook(BookDts b);
			
			public List<BookDts>  getallbook();
			
			public BookDts getBookbyid(int id);
			
			public boolean editbooks(BookDts b);
			
			public boolean deletebook(int id);
			
			public List<BookDts> getNewBook();
			
			public List<BookDts> getallNewBook();

			
			public List<BookDts> getOldBook();
			
			public List<BookDts> getallOldBook();
			
			public List<BookDts> searchbooks(String search);

			

			
			
			
}

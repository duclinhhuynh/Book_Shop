package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDao {
	public boolean addBooks(BookDtls b);

	public List<BookDtls> getAllBooks();

	public BookDtls getBookById(int id);

	public boolean updateEditBooks(BookDtls id);

	public boolean deleteBook(int id);

	public List<BookDtls> getNewBooks();

	public List<BookDtls> getRecentBooks();
	
	public List<BookDtls> getOldBooks();
	
	public List<BookDtls> getAllRecentBooks();
	
	public List<BookDtls> getAllNewBooks();
	
	public List<BookDtls> getAllOldBooks();
	
	public List<BookDtls> getBookByOld(String email, String cate);
	
	public boolean oldBookDelete(String email, String cate, int id);
	
	public List<BookDtls> getBookBySerch(String ch);
}

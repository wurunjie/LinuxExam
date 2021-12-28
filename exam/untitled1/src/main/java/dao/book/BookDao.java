package main.java.dao.book;

import main.java.pojo.Book;

import java.util.List;

public interface BookDao {
    List<Book> listAllBook();
    Book findBookById(int id);
    int updateBook(Book book);
    int addBook(Book book);
    int deleteBook(int id);

}

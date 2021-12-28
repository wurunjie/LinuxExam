package main.java.service.good;

import main.java.pojo.Book;
import main.java.utils.PageManager;

import java.util.List;

public interface BookService {
    List<Book> findAllBooks();
    Book findBookById(int id);
    public boolean updateBook(Book book);
    public boolean addBook(Book book);
    public boolean deleteBook(int id);
}

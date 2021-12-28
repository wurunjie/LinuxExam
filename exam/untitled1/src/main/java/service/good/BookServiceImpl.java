package main.java.service.good;

import main.java.dao.book.BookDao;
import main.java.dao.book.BookDaoImpl;
import main.java.pojo.Book;
import main.java.utils.PageManager;

import java.util.List;

public class BookServiceImpl implements BookService {
   BookDao bookDao = new BookDaoImpl();


    @Override
    public List<Book> findAllBooks() {
        return bookDao.listAllBook();
    }

    @Override
    public Book findBookById(int id) {
        return bookDao.findBookById(id);
    }

    @Override
    public boolean updateBook(Book book) {
        return bookDao.updateBook(book) > 0 ? true:false;
    }

    @Override
    public boolean addBook(Book book) {
        return bookDao.addBook(book)>0?true:false;
    }

    @Override
    public boolean deleteBook(int id) {
        return bookDao.deleteBook(id) > 0 ? true:false;
    }
}

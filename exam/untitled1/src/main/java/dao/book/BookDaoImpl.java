package main.java.dao.book;

import main.java.pojo.Book;
import main.java.utils.Dbutils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BookDaoImpl extends Dbutils implements BookDao {
    @Override
    public List<Book> listAllBook() {
        ArrayList<Book> arrayList = new ArrayList<>();
        String sql = "select * from book";
        Object[] objects = new Object[] {};
        ResultSet resultSet = executeQuery(sql,objects);
        try {
            while (resultSet.next()){
                arrayList.add(new Book(resultSet.getInt("id"),
                        resultSet.getString("writer"),
                        resultSet.getString("book_name")));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return arrayList;
    }

    @Override
    public Book findBookById(int id) {
        Book book = new Book();
        String sql = "select * from book where id = ?";
        Object[] objects = new Object[]{id};
        ResultSet resultSet = executeQuery(sql,objects);
        try {
            while (resultSet.next()){
                book= new Book(resultSet.getInt("id"),
                        resultSet.getString("writer"),
                        resultSet.getString("book_name"));
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public int updateBook(Book book) {
        String sql = "update book set book_name = ?,writer = ? where id =  ?";
        Object []objects = new Object[]{book.getBookName(),book.getWriter(),book.getId()};
        int i = executeUpdate(sql, objects);
        return i;
    }

    @Override
    public int addBook(Book book) {
        String sql = "insert into book (book_name,writer) values(?,?)";
        Object []objects = new Object[]{book.getBookName(),book.getWriter()};
        int row = executeUpdate(sql, objects);
        return row;
    }

    @Override
    public int deleteBook(int id) {
        String sql = "delete from book where id = ?";
        Object [] objects = new Object[]{id};
        int row = executeUpdate(sql, objects);
        return row;
    }

}

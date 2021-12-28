package main.java.pojo;

import java.util.ArrayList;
import java.util.Date;

public class Book {
    private int id;
    private String writer;
    private String bookName;

    public Book() {
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", writer='" + writer + '\'' +
                ", bookName='" + bookName + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public Book(int id, String writer, String bookName) {
        this.id = id;
        this.writer = writer;
        this.bookName = bookName;
    }
}

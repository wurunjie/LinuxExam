package main.java.controller.good;

import com.mysql.jdbc.StringUtils;
import main.java.pojo.Book;
import main.java.service.good.BookService;
import main.java.service.good.BookServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/indexPage")
public class GoodToShowServlet extends HttpServlet {
    BookService bookService = new BookServiceImpl();
//    这个功能卖家查看自己卖的商品，超级管理员可以查看所有的商品


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("books",bookService.findAllBooks());
        req.getRequestDispatcher("/index.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

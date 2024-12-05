package com.servlet;

import java.io.*;

import com.servlet.utilities.MySqlConn;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "SignupServlet", urlPatterns = {"/user-signup"})
   public class SignupServlet extends HttpServlet {
       @Serial
       private static final long serialVersionUID = 1L;

       protected void doPost(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
           String username = request.getParameter("register-username");
           String password = request.getParameter("register-password");
           String email_number = request.getParameter("email");
           String account = request.getParameter("register-account");
           if (MySqlConn.checkUserExists(username)) {
               request.setAttribute("feedback", "来晚啦，用户名已经被别人抢啦！");
               request.getRequestDispatcher("userSign.jsp").forward(request, response);
           }else if (MySqlConn.checkUserExists(account)) {
               request.setAttribute("feedback", "该用户已存在！");
               request.getRequestDispatcher("userSign.jsp").forward(request, response);
           } else if (MySqlConn.registerUser(username, password, email_number, account)){
               //注册成功
               request.setAttribute("feedback", "注册成功！");
               request.getRequestDispatcher("userSign.jsp").forward(request, response);
           }
       }
   }
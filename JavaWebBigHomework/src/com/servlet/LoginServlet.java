   package com.servlet;

   import java.io.*;

   import com.servlet.utilities.MySqlConn;
   import jakarta.servlet.ServletException;
   import jakarta.servlet.http.HttpServlet;
   import jakarta.servlet.http.HttpServletRequest;
   import jakarta.servlet.http.HttpServletResponse;
   import jakarta.servlet.annotation.WebServlet;

   @WebServlet(name = "LoginServlet", urlPatterns = {"/user-login"})
   public class LoginServlet extends HttpServlet {
       @Serial
       private static final long serialVersionUID = 1L;

       protected void doPost(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {

           String username = request.getParameter("login-username");
           String password = request.getParameter("login-password");
           if (MySqlConn.authenticateUser(username, password)) {
               request.getSession().setAttribute("user", MySqlConn.getUserByUsername(username));
               response.sendRedirect("index.jsp");
           } else {
               request.setAttribute("feedback", "账号或密码错误！");
//               response.sendRedirect("userSign.jsp");
               request.getRequestDispatcher("userSign.jsp").forward(request, response);

           }

       }
   }

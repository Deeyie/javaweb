package com.servlet.admin;

import java.io.*;
import com.servlet.utilities.MySqlConn;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "AdminLogin", urlPatterns = {"/admin-login"})
public class AdminLogin extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("login-username");
        String password = request.getParameter("login-password");
        if (MySqlConn.authenticateUser(username, password)) {
            request.getSession().setAttribute("admin", MySqlConn.getUserByUsername(username));
            response.sendRedirect("admin.jsp");
        } else {
            throw new RuntimeException("账号或密码错误！");
        }

    }
}


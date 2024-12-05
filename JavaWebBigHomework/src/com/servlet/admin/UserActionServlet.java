package com.servlet.admin;

import com.servlet.model.User;
import com.servlet.utilities.MySqlConn;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserActionServlet", urlPatterns = {"/userAction"})
public class UserActionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String action = request.getParameter("action");
        int userid = Integer.parseInt(request.getParameter("userid"));
        User user = (User)request.getSession().getAttribute("admin");


        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            if (user == null || !user.isAdmin()) {
                out.print("{\"success\": false, \"message\": \"只有管理员才能执行的操作！！！\"}");
                return;
            }
            switch (action) {
                case "delete":
                    if (user.getId() != 0) {
                        out.print("{\"success\": false, \"message\": \"只有超级管理员才能执行的操作！！！\"}");
                        return;
                    }
                    if (MySqlConn.deleteUser(userid)) {
                        out.print("{\"success\": true, \"message\": \"用户删除成功\"}");
                    } else {
                        out.print("{\"success\": false, \"message\": \"用户删除失败\"}");
                    }
                    break;
                case "ban":
                    if (MySqlConn.banUser(userid)) {
                        out.print("{\"success\": true, \"message\": \"用户已封号\"}");
                    } else {
                        out.print("{\"success\": false, \"message\": \"封号失败\"}");
                    }
                    break;
                case "unban":
                    if (MySqlConn.unbanUser(userid)) {
                        out.print("{\"success\": true, \"message\": \"用户已解封\"}");
                    } else {
                        out.print("{\"success\": false, \"message\": \"解封失败\"}");
                    }
                    break;
                default:
                    out.print("{\"success\": false, \"message\": \"无效的操作\"}");
            }
        } catch (Exception e) {
            out.print("{\"success\": false, \"message\": \"服务器错误\"}");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        doGet(request, response);
    }
}

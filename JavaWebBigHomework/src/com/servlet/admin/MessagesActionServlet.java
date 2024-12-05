package com.servlet.admin;

import com.servlet.model.User;
import com.servlet.utilities.MySqlConn;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "MessagesActionServlet", urlPatterns = {"/messagesAction"})
public class MessagesActionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        User user = (User) request.getSession().getAttribute("admin");

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        try {
            if (user == null || !user.isAdmin()) {
                out.print("{\"success\": false, \"message\": \"只有管理员才能执行的操作！！！\"}");
                return;
            }
            switch (action) {
                case "deletePost":
                    if (MySqlConn.deletePost(id)) {
                        out.print("{\"success\": true, \"message\": \"留言删除成功\"}");
                    } else {
                        out.print("{\"success\": false, \"message\": \"留言删除失败\"}");
                    }
                    break;
                case "deleteBarrage":
                    if (MySqlConn.deleteBarrage(id)) {
                        out.print("{\"success\": true, \"message\": \"弹幕删除成功\"}");
                    } else {
                        out.print("{\"success\": false, \"message\": \"弹幕删除失败\"}");
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

package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

import com.servlet.model.User;
import com.servlet.utilities.MySqlConn;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "sendMessage", urlPatterns = {"/sendMessage"})
public class SendMessageServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        User user = (User) request.getSession().getAttribute("user");

        // 获取表单数据
        String messageContent = request.getParameter("message");


        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        if (user == null) {
            out.print("{\"success\": true, \"message\": \"请先登录！\"}");
            return;
        }
        int userId = user.getId();
        try {
            if (action.equals("sendMessage")) {
                if (saveMessageToDatabase(userId, messageContent)) {
                    out.print("{\"success\": true, \"message\": \"留言成功！\"}");
                } else {
                    out.print("{\"success\": false, \"message\": \"留言失败！！！\"}");
                }
            } else {
                out.print("{\"success\": false, \"message\": \"无效的操作\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"success\": false, \"message\": \"服务器错误\"}");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private boolean saveMessageToDatabase(int userId,String message) {
        return MySqlConn.createPost(userId, "TBD", message);
    }
}
   
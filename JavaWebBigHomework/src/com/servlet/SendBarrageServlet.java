package com.servlet;

import com.servlet.model.User;
import com.servlet.utilities.MySqlConn;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

@WebServlet(name = "sendBarrage", urlPatterns = {"/sendBarrage"})
public class SendBarrageServlet  extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
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
            if (action.equals("sendBarrage")) {
                if (saveMessageToDatabase(userId, messageContent)) {
                    out.print("{\"success\": true, \"message\": \"发送成功！\"}");
                } else {
                    out.print("{\"success\": false, \"message\": \"发送失败！！！\"}");
                }
            } else {
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

    private boolean saveMessageToDatabase(int userId,String message) {
        return MySqlConn.addBarrage(userId, message);
    }
}

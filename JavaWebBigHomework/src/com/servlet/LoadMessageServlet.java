package com.servlet;

import com.servlet.model.Barrage;
import com.servlet.model.Message;
import com.servlet.model.Post;
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

import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "loadBarrages", urlPatterns = {"/loadBarrages"})
public class LoadMessageServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<Message> messages = getBarrages();
        // 将消息列表转换为 JSON 格式并返回
        String jsonResponse = convertMessagesToJson(messages);
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
    }

    private String convertMessagesToJson(List<Message> messages) {
        StringBuilder jsonBuilder = new StringBuilder("[");
        for (int i = 0; i < messages.size(); i++) {
            Message message = messages.get(i);
            jsonBuilder.append("{");
            jsonBuilder.append("\"username\": \"").append(message.getUsername()).append("\", ");
            jsonBuilder.append("\"content\": \"").append(message.getContent()).append("\", ");
            jsonBuilder.append("\"sendTime\": \"").append(message.getSendTime()).append("\"");
            jsonBuilder.append("}");
            if (i < messages.size() - 1) {
                jsonBuilder.append(", ");
            }
        }
        jsonBuilder.append("]");
        return jsonBuilder.toString();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public static List<Message> getMessages() {
        List<Post> posts;
        List<User> users;
        // 从数据库加载留言列表
        posts = MySqlConn.getAllPosts();
        // 从数据库加载用户列表
        users = MySqlConn.getAllUsers();
        List<Message> messages = new ArrayList<>();
        for (Post post : posts) {
            for (User user : users) {
                if (user.getId() == post.getUserId()) {
                    Message message = new Message();
                    message.setAccount(user.getAccount());
                    message.setId(post.getId());
                    message.setUserId(user.getId());
                    message.setUsername(user.getUsername());
                    message.setContent(post.getContent());
                    message.setSendTime(post.getCreatedAt());
                    messages.add(message);
                }
            }
        }
        return messages;
    }

    public static List<Message> getBarrages() {
        List<Barrage> barrages;
        List<User> users;
        // 从数据库加载弹幕列表
        barrages = MySqlConn.getAllBarrages();
        // 从数据库加载用户列表
        users = MySqlConn.getAllUsers();
        List<Message> messages = new ArrayList<>();
        for (Barrage barrage : barrages) {
            for (User user : users) {
                if (user.getId() == barrage.getUserId()) {
                    Message message = new Message();
                    message.setUserId(user.getId());
                    message.setId(barrage.getId());
                    message.setAccount(user.getAccount());
                    message.setUsername(user.getUsername());
                    message.setContent(barrage.getContent());
                    message.setSendTime(barrage.getSendTime());
                    message.setBarrage(true);
                    messages.add(message);
                }
            }
        }
        return messages;
    }
}



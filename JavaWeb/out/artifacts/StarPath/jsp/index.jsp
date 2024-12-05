<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/20
  Time: 下午5:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
        response.sendRedirect("Home.jsp");
        return;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <div class="main">
        <div class="background">
            <div class="index">
                <p class="title">欢迎来到我的博客！请先登录或者注册吧！</p>
                <div class="link">
                    <a href="Login.jsp" class="login">登录</a>
                    <a href="Signup.jsp" class="register">注册</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

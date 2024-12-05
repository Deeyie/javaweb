<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/20
  Time: 下午9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>错误页面</title>
    <link rel="stylesheet" href="css/error.css">
</head>
<body>
    <div class="error-container">
        <div class="background">
            <div class="index">
                <p class="title">ERROR!!!</p>
                <p class="info"><%= exception.getMessage() %></p>
                <div class="link">
                    <a href="Login.jsp">返回登录页面</a>
                    <a href="Home.jsp">返回我的主页</a>
                    <a href="Signup.jsp">返回注册页面</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

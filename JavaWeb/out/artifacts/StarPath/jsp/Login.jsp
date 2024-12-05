<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/16
  Time: 下午8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/login.js"></script>
</head>
<body>
    <div class="main">
        <div class="background">
            <div class="login-block">
                <a href="Home.jsp" class="title">StarFinding</a>
                <p class="login-title">StarFinding - Login</p>
                <form class="login-form" action="user-login" method="post">
                    <label>
                        <input type="text" class="username" placeholder="用户名" autocomplete="off" name="username">
                    </label>
                    <label>
                        <input type="password" class="password" placeholder="密码" autocomplete="off" name="password">
                    </label>
                    <button type="submit" class="login-button">登录</button>
                </form>
                <div class="link">
                    <a href="Signup.jsp" class="register">注册账号</a>
                    <a href="ForgetPass.jsp" class="forget">忘记密码</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

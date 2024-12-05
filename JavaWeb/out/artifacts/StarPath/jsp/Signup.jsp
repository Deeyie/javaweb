<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/16
  Time: 下午8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" href="css/register.css"></head>
    <script src="js/register.js"></script>
<body>
    <div class="main">
        <div class="background">
            <div class="register-block">
                <a href="Home.jsp" class="title">StarFinding</a>
                <p class="register-title">StarFinding - Signup</p>
                <form class="register-form" action="user-signup" method="post">
                    <input type="text" class="username" placeholder="用户名" autocomplete="off" name="username">
                    <input type="password" class="password" placeholder="密码" autocomplete="off" name="password">
                    <input type="password" class="password" placeholder="确认密码" autocomplete="off" name="confirm_password">
                    <input type="text" class="phone" placeholder="手机号" autocomplete="off" name="phone_number">
                    <div class="code-pane">
                        <input type="text" class="code" placeholder="验证码" autocomplete="off">
                        <input type="button" class="code-button" value="获取验证码">
                    </div>
                    <button type="submit" class="register-button">注册</button>
                </form>
                <div class="link">
                    <a href="Login.jsp" class="login">登录账号</a>
                    <a href="Home.jsp" class="index">前往主页</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/17
  Time: 下午10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>找回密码</title>
    <link rel="stylesheet" href="css/register.css">
    <script src="../js/background.js"></script>
    <script src="js/register.js"></script>
</head>
<body>
    <div class="main">
        <div class="background">
            <div class="register-block">
                <a href="Home.jsp" class="title">StarFinding</a>
                <p class="register-title">StarFinding - Reset password</p>
                <form class="register-form" action="user-forget" method="post">
                    <input type="text" class="username" placeholder="用户名" autocomplete="off" name="username">
                    <input type="password" class="password" placeholder="密码" autocomplete="off" name="password">
                    <input type="password" class="password" placeholder="确认密码" autocomplete="off" name="confirm_password">
                    <input type="text" class="phone" placeholder="手机号" autocomplete="off">
                    <div class="code-pane">
                        <input type="text" class="code" placeholder="验证码" autocomplete="off">
                        <input type="button" class="code-button" value="获取验证码">
                    </div>
                    <button type="button" class="register-button">确认修改</button>
                </form>
                <div class="link">
                    <a href="Login.jsp" class="login">登录账号</a>
                    <a href="Home.jsp" class="index">返回主页</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

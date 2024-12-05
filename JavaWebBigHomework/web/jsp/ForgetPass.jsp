<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/2
  Time: 上午10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言墙</title>
    <link rel="stylesheet" href="css/userSign.css">
    <script src="js/getBack.js"></script>
    <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">

</head>
<body>
<div class="shell">
    <div class="container a-container" id="a-container">
        <form class="form getBack-form" action="user-forget" method="post">
            <h2 class="form_title title">修改密码</h2>
            <span class="form_span">请通过邮箱验证</span>
            <input type="text" class="form_input" placeholder="输入用户名" name="getBack-username">
            <input type="password" class="form_input" placeholder="输入新密码" name="getBack-password">
            <input type="password" class="form_input" placeholder="确认密码" name="confirm_password">
            <input type="text" class="form_input" placeholder="邮箱账号" name="email">
            <div class="code-pane">
                <input type="text" class="code" placeholder="验证码" autocomplete="off">
                <input type="button" class="code-button" value="获取验证码">
            </div>
            <button class="form_button button submit getBack-button" >确认</button>
        </form>
    </div>

    <div class="switch" id="switch-cnt">
        <div class="switch_circle"></div>
        <div class="switch_circle switch_circle-t"></div>
        <div class="switch_container" id="switch-c1">
            <h2 class="switch_title title" style="letter-spacing: 0;">账号找回密码</h2>
            <p class="switch_description description">仅可通过邮箱验证修改密码！如验证失败，请联系管理员！</p>
            <button class="switch_button button switch-btn" onclick="window.location.href='userSign.jsp'">返回用户登录</button>
        </div>
    </div>
</div>
</body>
</html>


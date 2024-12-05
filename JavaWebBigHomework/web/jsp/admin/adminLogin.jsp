<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/1
  Time: 下午11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>留言墙后台管理</title>
  <link rel="stylesheet" href="css/userSign.css">
  <script src="js/login.js"></script>
  <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">

</head>
<body>
<div class="shell">
  <div class="container a-container" id="a-container">
    <form action="admin-login" method="post" class="form login-form" id="b-form">
      <h2 class="form_title title">登入账号</h2>
      <span class="form_span">请以管理员账号登录</span>
      <input type="text" class="form_input" placeholder="输入账号" name="login-username">
      <input type="password" class="form_input"  placeholder="输入密码" name="login-password">
<%--      <a class="form_link forget" href="ForgetPass.jsp">忘记密码？</a>--%>
      <button class="form_button button submit login-button">登录</button>
    </form>
  </div>
  <div class="switch" id="switch-cnt">
    <div class="switch_circle"></div>
    <div class="switch_circle switch_circle-t"></div>
    <div class="switch_container" id="switch-c1">
      <h2 class="switch_title title" style="letter-spacing: 0;">留言墙后台管理</h2>
      <p class="switch_description description">仅管理员可登录！登录后可管理站点内的所有用户！</p>
      <button class="switch_button button switch-btn" onclick="window.location.href='userSign.jsp'">返回用户登录</button>
    </div>
  </div>
</div>
</body>
</html>

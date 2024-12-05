<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/30
  Time: 下午2:55
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
    <script src="js/register.js"></script>
    <script src="js/login.js"></script>
    <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">

</head>
<script type="text/javascript">
    function showAlert(feedback) {
        alert(feedback);
    }
</script>
<%
    String feedback = (String) request.getAttribute("feedback");
    if (feedback != null) {
%>
<script type="text/javascript">
    showAlert('<%=feedback%>');
</script>
<%}%>
<body>
<div class="shell">
    <div class="container b-container" id="b-container">
        <form action="user-signup" method="post" class="form register-form" id="a-form">
            <h2 class="form_title title">创建账号</h2>
            <span class="form_span">请输入账号和电子邮箱以注册</span>
            <input type="text" class="form_input" placeholder="账号" name="register-account">
            <input type="text" class="form_input" placeholder="昵称" name="register-username">
            <input type="password" class="form_input" placeholder="输入密码" name="register-password">
            <input type="password" class="form_input" placeholder="确认密码" name="confirm_password">
            <input type="text" class="form_input" placeholder="邮箱账号" name="email">
            <div class="code-pane">
                <input type="text" class="code" placeholder="验证码" autocomplete="off">
                <input type="button" class="code-button" value="获取验证码">
            </div>
            <button class="form_button button submit register-button" >注册</button>
        </form>
    </div>


    <div class="container a-container" id="a-container">
        <form action="user-login" method="post" class="form login-form" id="b-form">
            <h2 class="form_title title">登入账号</h2>
            <span class="form_span">请以用户名方式登录</span>
            <input type="text" class="form_input" placeholder="用户名" name="login-username">
            <input type="password" class="form_input" placeholder="输入密码" name="login-password">
            <a class="form_link forget" href="ForgetPass.jsp">忘记密码？</a>
            <a class="form_link forget" href="adminLogin.jsp">登录后台</a>
            <button class="form_button button submit login-button">登录</button>
        </form>
    </div>

    <div class="switch" id="switch-cnt">
        <div class="switch_circle"></div>
        <div class="switch_circle switch_circle-t"></div>
        <div class="switch_container" id="switch-c1">
            <h2 class="switch_title title" style="letter-spacing: 0;">你好，朋友！</h2>
            <p class="switch_description description">去注册一个账号，成为我们的一员，让我们踏入奇妙的旅途！</p>
            <button class="switch_button button switch-btn">注册</button>
        </div>

        <div class="switch_container is-hidden" id="switch-c2">
            <h2 class="switch_title title" style="letter-spacing: 0;">欢迎回来！</h2>
            <p class="switch_description description">已经有账号了嘛，去登录账号来看看其他小伙伴都说了什么吧！！！</p>
            <button class="switch_button button switch-btn">登录</button>
        </div>
    </div>
</div>
</body>

<script>
    let switchCtn = document.querySelector("#switch-cnt");
    let switchC1 = document.querySelector("#switch-c1");
    let switchC2 = document.querySelector("#switch-c2");
    let switchCircle = document.querySelectorAll(".switch_circle");
    let switchBtn = document.querySelectorAll(".switch-btn");
    let aContainer = document.querySelector("#a-container");
    let bContainer = document.querySelector("#b-container");
    let allButtons = document.querySelectorAll(".submit");

    let getButtons = (e) => e.preventDefault()
    let changeForm = (e) => {
        // 修改类名
        switchCtn.classList.add("is-gx");
        setTimeout(function () {
            switchCtn.classList.remove("is-gx");
        }, 1500)
        switchCtn.classList.toggle("is-txr");
        switchCircle[0].classList.toggle("is-txr");
        switchCircle[1].classList.toggle("is-txr");

        switchC1.classList.toggle("is-hidden");
        switchC2.classList.toggle("is-hidden");
        aContainer.classList.toggle("is-txl");
        bContainer.classList.toggle("is-txl");
        bContainer.classList.toggle("is-z");
    }
    // 点击切换
    let shell = (e) => {
        for (var i = 0; i < allButtons.length; i++)
            allButtons[i].addEventListener("click", getButtons);
        for (var i = 0; i < switchBtn.length; i++)
            switchBtn[i].addEventListener("click", changeForm)
    }
    window.addEventListener("load", shell);

</script>

</html>

<%@ page import="com.servlet.model.Message"%>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.LoadMessageServlet" %>
<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/29
  Time: 上午10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://jakarta.apache.org/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言墙</title>
    <!-- link:favicon -->
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/contact.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="stylesheet" href="css/admin/font-awesome.min.css">

    <script src="./js/jq.js"></script>
    <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
</head>
<jsp:include page="jsp/tooltip.jsp" flush="true"></jsp:include>
<body>
<canvas class="canvas-wrap" id="triangle-lost-in-space" resize="true"></canvas>

<!-- loadding -->
<div class="lodding-wrap">
    <div class="loadding-div"></div>
</div>

<!-- 主要页面 -->
<div class="box">

    <!-- 顶部栏 -->
    <jsp:include page="jsp/header.jsp" flush="true"></jsp:include>

    <!-- 顶部导航 -->
    <div class="navigation">
        <div class="nav-titleBox co zz">
            <!-- 占位符 -->
            <div class="co-left"></div>

            <!-- 标题 -->
            <div class="co-right">
                <span class="titleBox-tag">表白墙</span>
                <h1>
                    说出你想说的话。
                </h1>
                <a class="buttom navbtn" href="#textarea">现在说说吧！
                </a>
            </div>
        </div>
    </div>

    <!-- 主要修改部分 -->
    <div class="content zz">
        <!-- 占位符 -->
        <jsp:include page="jsp/userInfoDisplay.jsp" flush="true"></jsp:include>
        <!-- 主要内容部分 -->
        <div class="co-right" id="next-one">
            <div class="content-li li1">
                <div class="carbox li1-box">
                    <img src="resources/img/toux.jpg" alt="">
                    <label>时间</label>
                    <h3>admin</h3>
                    <p>
                        真正的朋友不要把友谊挂在口上，他们并不为了友谊而相互要求点什么，而是彼此为对方做一切办得到的事情。------别林斯基
                    </p>
                </div>
                <%
                    List<Message> posts = LoadMessageServlet.getMessages();
                    request.setAttribute("messages", posts);
                    request.setAttribute("user", session.getAttribute("user"));
                %>
                %>

                <c:forEach var="message" items="${messages}">
                    <div class="carbox li1-box">
                        <img src="resources/img/toux.jpg" alt="">
                        <label>${message.getSendTime().toString()}</label>
                        <h3>${message.getUsername()}</h3>
                        <p>${message.getContent()}</p>
                    </div>
                </c:forEach>

            </div>
            <div class="borderbotm"></div>
            <div class="content-li li2">
                <div class="li2-box carbox">
                    <textarea id="textarea" name="message" cols="30" rows="10" placeholder="留言吧！" required></textarea>
                    <button class="buttonsty" onclick="sendMessage(${user.isBanned()})">发送</button>
                </div>
            </div>
            <div class="borderbotm"></div>
            <jsp:include page="jsp/footer.jsp" flush="true"></jsp:include>
        </div>
    </div>
</div>
</body>
<script>
    function sendMessage(isBanned){
        if (isBanned===true){
            alert('您已被封禁，无法进行留言！');
            return false;
        }
        else{
            const message = document.getElementById('textarea').value;
            if (!message.trim()) {
                alert('请输入留言内容！');
            }
            else if (message.length > 200) {
                alert('留言内容过长，请输入少于200个字符！');
            }else {
                const r = confirm("确定发送留言？");
                if (r === true) {
                    $.ajax({
                        url: '/sendMessage',
                        type: 'GET',
                        data: { action: 'sendMessage', message: message },
                        dataType: 'json',
                        success: function(data) {
                            alert(data.message);
                            if (data.success) {
                                window.location.reload();
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error('There was a problem with the AJAX request:', error);
                            alert('留言失败，请重试');
                        }
                    });
                } else {
                    return false;
                }
            }
        }
    }
</script>


<script src="js/base.js"></script>
<script type="text/javascript" src="js/paper-full.min.js"></script>
<script type="text/javascript" src="js/canvas.js"></script>

</html>

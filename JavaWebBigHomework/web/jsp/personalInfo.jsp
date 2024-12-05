<%@ page import="com.servlet.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.utilities.MySqlConn" %><%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/18
  Time: 下午1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/jstl/core" prefix="c" %>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言墙</title>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/blog.css">
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="stylesheet" href="css/admin/font-awesome.min.css">

    <script src="js/jq.js"></script>
    <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">

</head>


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
                <span class="titleBox-tag">你好</span>
                <c:if test="${sessionScope.user != null}">
                    <h1>${sessionScope.user.getUsername()}</h1>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <h1>游客</h1>
                </c:if>
                <a class="buttom navbtn" href="#next-one">个人信息
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
                <c:if test="${sessionScope.user != null}">
                    <div class="li1-box borderbefore">
                        账号
                        <p>${sessionScope.user.getAccount()}</p>
                    </div>
                    <div class="li1-box borderbefore">
                        用户名
                        <p>${sessionScope.user.getUsername()}</p>
                    </div>
                    <div class="li1-box borderbefore">
                        邮箱
                        <p>${sessionScope.user.getEmail()}</p>
                    </div>
                    <div class="li1-box borderbefore">
                        性别
                        <p>${sessionScope.user.getGender()?"男":"女"}</p>
                    </div>
                    <div class="li1-box borderbefore">
                        年龄
                        <p>${sessionScope.user.getAge()}</p>
                    </div>
                    <div class="li1-box borderbefore">
                        注册时间
                        <p>${sessionScope.user.getCreatedAt()}</p>
                    </div>
                    <div class="li1-box borderbefore">
                        账号状态
                        <p>${sessionScope.user.isBanned()?"禁言中":"正常"}</p>
                    </div>
                </c:if>
            </div>
            <div class="borderbotm"></div>
            <jsp:include page="jsp/footer.jsp" flush="true"></jsp:include>
        </div>
    </div>
</div>
</body>

<script src="js/base.js"></script>
<script type="text/javascript" src="js/paper-full.min.js"></script>
<script type="text/javascript" src="js/canvas.js"></script>

</html>
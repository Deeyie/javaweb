<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/18
  Time: 下午1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://jakarta.apache.org/jstl/core" prefix="c" %>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- meta:desc -->
    <meta name="description" content="Starfinding——星寻,漫步繁星,寻找世间最美的一片星辰。">
    <!-- meta:kw -->
    <meta name="keywords" content="星寻博客,星寻,Star,Starfinding,分享,博客,爱好,娱乐">
    <title>StarFinding</title>
    <!-- link:favicon -->
    <link rel="shortcut icon" href="<c:url value="/resources/icon.ico"/>" type="image/x-icon">
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/css/base.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/css/background.css"/>" type="text/css">
    <script src="<c:url value="/js/function.js"/>" type="application/javascript"></script>
    <script src="<c:url value="/js/background.js"/>" type="application/javascript"></script>
    <link rel="stylesheet" href="<c:url value="/css/slider.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/swiper-bundle.min.css"/>" />
</head>
<body>
    <!-- 加载界面按钮 -->
    <div id="loading-screen" class="loading-screen">
        <button id="enter-btn">点击加载页面</button>
    </div>

    <div class="background">
        <div class="bubbles"></div>
    </div>

    <div class="container" style="display:none;"> <!-- 隐藏页面内容，等待用户点击按钮后显示 -->
        <div class="left-column">
            <div>
                <img src="<c:url value="/resources/images/avatar.jpeg"/>" alt="头像" id="avatar">
                <div class="name">
                    <c:choose>
                    <c:when test="${not empty sessionScope.username}">
                    <strong>${sessionScope.username}</strong>
                    </c:when>
                    <c:otherwise>
                    <strong>DEE</strong>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div id="password-protect">
                <label><input type="password" id="password-input" placeholder="输入密码"></label>
                <button id="submit-password"><strong>提交</strong></button>
                <p id="error-message" style="color: red; display: none;">密码错误，请重试。</p>
            </div>
            <div class="story ">
                <div id="hidden-content" style="display: none;">
                    <p> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp有个问题是每个人生来就要回答的——人生是什么？每个人都有对自己人生的定义。有人认为人生处处因情而其。或于自身有友情亲情爱情，或于国家有家国情，或于世界有仁爱之情。人生一路走来，不负自己，不负他人，不负国家，不负世界。角色是现实与幻想的交织。主角是幻想的映射，那是否有现实的映射呢？在故事过后，自会发现其中的答案。从出生开始，主角也许无法得到诸如父爱母爱等亲情，由于身世甚至无法交到朋友，成长路上历经坎坷才最终收获友情，友情有长久真诚的，有短暂趋利的，但这些都是后话了，拥有的那段时光无论哪种都无比珍惜。后来机缘巧合下终于再次遇到了增加的故交，幸运的是，一次次分离，一次次错过，他们总能再重逢。一路走来，经历风风雨雨，感情也越来越深，相互依靠，相互陪伴。人生处处有各种各样的选择题，如何选择也许都会后悔，但是也许我们没得选择。主角的成长中，处处有情。有些事情在一开始就已经注定。与此同时，世界不乏一些孤独的人，也许他们难得找到伙伴，也许一生仅为自己而行。尽管这样很残忍，但是人生或者说命就是这样。时间的流逝不会因为个人而改变，留在时间长河中的错误永远无法弥补。正因如此，我们深知，人生只有一此，机会仅有一次，如何把握，走出什么样的人生，行走之人，正在给出答案……
                    </p>
                </div>
            </div>
        </div>
        <div class="middle-column">
            <h1><strong>内容墙</strong></h1>
            <div class="content">
                <div class="countdown">
                    <p class="next">今天是2222年2月22日</p>
                    <p class="title">此生已过</p>
                    <p class="days">9999天</p>
                    <p class="clock">
                      <span id="hour">00</span>
                      <i>时</i>
                      <span id="minutes">25</span>
                      <i>分</i>
                      <span id="scond">20</span>
                      <i>秒</i>
                    </p>

                  </div>

                <jsp:include page="/jsp/slider.jsp" flush="true">
                    <jsp:param name="" value="" />
                </jsp:include>

                <div>
                    <h3>今日天气</h3>
                    <strong><a href="http://ai.starfinding.online">AI</a></strong>
                </div>

                <div class="select">
                    <h3>今天干什么呢？</h3>
                    <span>今日活动：</span>
                    <div class="playwhat">干什么？</div>
                    <button class="start">开始</button>
                    <button class="end">结束</button>
                </div>

                <div class="video-column">
                    <h3>混剪短片</h3>
                    <div>
                        <p>旭日东升</p>
                        <video src="<c:url value="/resources/video.mp4"/>" controls width="600px" height="338px" ></video>
                    </div>

                </div>
                <div class="gamesweb">
                    <h3>小网页</h3>
                    <ul>
                        <li>
                            <a href="https://starfinding.online/GluttonousBeans/index.html">
                                <div><img src="<c:url value="/resources/images/GluttonousBeans.png"/>" alt="贪吃豆游戏"></div>
                                <div><p>贪吃豆游戏</p></div>
                            </a>
                        </li>
                        <li>
                            <a href="https://starfinding.online/HappyBirthday/index.html">
                                <div><img src="<c:url value="/resources/images/HappyBirthday.png"/>" alt="生日快乐"></div>
                                <div>
                                    <p>生日快乐</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="https://starfinding.online/PhotoAlbum/index.html">
                                <div><img src="<c:url value="/resources/images/PhotoAlbum.png"/>" alt="相册"></div>
                                <div>
                                    <p>相册</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="https://starfinding.online/bullseye-game/index.html">
                                <div><img src="<c:url value="/resources/images/bullseye-game.png"/>" alt="射箭小游戏"></div>
                                <div>
                                    <p>射箭小游戏</p>
                                </div>
                            </a>
                        </li>

                    </ul>
                </div>

            </div>
        </div>
        <div class="right-column">
            <button id="music-status">
                <span class="icon-play"></span>
            </button>
            <div class="user-info">
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <p>欢迎，${sessionScope.username}！</p>
                    <span><input type="button" value="注销" onclick="window.location.href='user-logout'"></span>
                </c:when>
                <c:otherwise>
                    <p>你好，请登录！</p>
                    <span><input type="button" value="登录" onclick="window.location.href='Login.jsp'"></span>
                    <span><input type="button" value="注册" onclick="window.location.href='Signup.jsp'"></span>
                </c:otherwise>
            </c:choose>
            </div>
            <template>
              <el-text class="mx-1">Default</el-text>
              <el-text class="mx-1" type="primary">Primary</el-text>
              <el-text class="mx-1" type="success">Success</el-text>
              <el-text class="mx-1" type="info">Info</el-text>
              <el-text class="mx-1" type="warning">Warning</el-text>
              <el-text class="mx-1" type="danger">Danger</el-text>
            </template>
        </div>
    </div>
    <!-- Swiper JS -->
    <script src="<c:url value="/js/swiper-bundle.min.js"/>"  type="application/javascript"></script>
    <!-- Initialize Swiper -->
    <script src="<c:url value="/js/slider.js"/>"  type="application/javascript"></script>
</body>
</html>
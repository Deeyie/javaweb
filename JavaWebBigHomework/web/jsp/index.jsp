<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/18
  Time: 下午1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言墙</title>
    <!-- link:favicon -->
    <link rel="stylesheet" href="css/base.css">
    <script src="js/jq.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/admin/font-awesome.min.css">

</head>

<body>

<div class="music-wrap" id="musicwrap">
    <audio id="play1" controls>
        <source src="resources/img/music.mp3">
    </audio>
</div>


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
            <div class="co-right ">
                <span class="titleBox-tag">你好，欢迎到来!</span>
                <h1>
                    你好<br>
                    我一直等着你！
                </h1>
                <a class="buttom navbtn" href="#next-one">往下查看
                </a>
            </div>
        </div>
    </div>

    <!-- 主要内容 -->
    <div class="container content zz">
        <!-- 占位符 -->
        <jsp:include page="jsp/userInfoDisplay.jsp" flush="true"></jsp:include>
        <!-- 右边 -->
        <div class="co-right" id="next-one">
            <div class="content-li li1">
                <div class="li1-box borderbefore">
                    <span>表白墙</span><span class="tag">！</span>
                    <div class="borderbotm"></div>
                    <p>你有什么想说的呢？对TA还是？</p>
                </div>
                <div class="li1-box borderbefore">
                    <span>弹幕广场</span><span class="tag">！</span>
                    <div class="borderbotm"></div>
                    <p>这里，请尽情畅聊！</p>
                </div>
                <div class="li1-box borderbefore">
                    <span>更多</span><span class="tag">！</span>
                    <div class="borderbotm"></div>
                    <p>敬请期待！</p>
                </div>
            </div>
            <div class="content-li li2">
                <h3>
                    <span>站内公告</span>
                    <div class="borderbotm"></div>
                    <span>01</span>
                </h3>
                <div class="carbox li2-box">
                    <p>
                        真正的朋友不要把友谊挂在口上，他们并不为了友谊而相互要求点什么，而是彼此为对方做一切办得到的事情。------别林斯基
                    </p>
                </div>
                <br>
            </div>
            <div class="borderbotm"></div>
            <!-- 底部 -->
            <jsp:include page="jsp/footer.jsp" flush="true"></jsp:include>
        </div>
        <div class="left">
        </div>

    </div>
</div>
</body>

<script type="text/javascript" src="js/paper-full.min.js"></script>
<script type="text/javascript" src="js/canvas.js"></script>
<script src="js/base.js"></script>
<script src="js/index.js"></script>


</html>
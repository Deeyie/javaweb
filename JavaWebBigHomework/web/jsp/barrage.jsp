<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/29
  Time: 上午10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言墙</title>
    <link rel="stylesheet" href="css/base.css">
    <script src="js/jq.js"></script>
<%--    <link rel="stylesheet" href="css/live.css">--%>
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/admin/font-awesome.min.css">
<%--    <link rel="stylesheet" href="css/style.css">--%>
</head>
<style>
    .danmu {
        position: fixed;
        right: 0;
        white-space: nowrap;
        font-size: 24px;
        color: white;
        transition: all ease 0.5s;
        z-index: 10;
        user-select: none;
    }

    .danmu:hover{
        transform: scale(1.05);
        padding: 10px;
        border: 1px solid white;
        z-index: 11;
        cursor: pointer;
    }

    .paused {
        animation-play-state: paused;
    }
    .show{
        opacity: 1;
    }
    .hide{
        opacity: 0;
    }
    .zan{
        transition: all ease 1s;
    }
    .btns{
        position: absolute;
        top:100%;
        left: 50%;
    }
    @keyframes move {
        from {right: -50px;}
        to {right: calc(100% + 200px);}
    }
</style>
<body>
<!-- loadding -->
<div class="lodding-wrap">
    <div class="loadding-div"></div>
</div>

<div class="box">
    <!-- 顶部栏 -->
    <jsp:include page="jsp/header.jsp" flush="true"></jsp:include>
    <!-- 顶部导航 -->
    <div class="navigation" id="container" >
        <div class="nav-titleBox co zz">
            <!-- 标题 -->
            <%
                request.setAttribute("user", session.getAttribute("user"));
            %>
            <div class="co-right">
                <span class="titleBox-tag">弹幕！</span>
                <h1>
                    把快乐与大家分享！or
                    把烦恼都宣泄出来吧！
                </h1>
                <input type="text" class="inputBox" id="textarea" name="message" placeholder="即刻弹幕">
                <button class="buttom navbtn" style="background-color:transparent" onclick="sendBarrage(${user.isBanned()})">发送弹幕</button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="js/admin/jquery.min.js"></script>
<script>
    function sendBarrage(isBanned){
        if (isBanned===true){
            alert('您已被封禁，无法进行留言！');
            return false;
        }
        else{
            const message = document.getElementById('textarea').value;
            if (!message.trim()) {
                alert('请输入弹幕内容！');
            }
            else if (message.length > 50) {
                alert('留言内容过长，请输入少于50个字符！');
            }else {
                const r = confirm("确定发送留言？");
                if (r === true) {
                    $.ajax({
                        url: '/sendBarrage',
                        type: 'GET',
                        data: { action: 'sendBarrage', message: message },
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
    // 定义一个函数用来创建和插入弹幕
    function createDanmu(text) {
        // 创建一个span元素
        var danmu = document.createElement("span");
        var zan = document.createElement("span");
        zan.innerHTML = '👍'

        var cai = document.createElement("span");
        cai.innerHTML ='👎'

        zan.className = "hide";
        cai.className = "hide";
        zan.classList.add('zan')
        cai.classList.add('zan')


        // 设置其文本内容为参数值
        danmu.innerText = text;
        // 设置其类名为danmu
        danmu.className = "danmu";
        danmu.appendChild(zan)
        danmu.appendChild(cai)
        // 设置其随机的高度
        danmu.style.top = Math.max(70,Math.random() * (container.clientHeight - danmu.clientHeight-100)) + "px";
        // 设置其随机的颜色
        danmu.style.color = "rgb(" + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + "," + Math.floor(Math.random() * 256) + ")";
        // 将span元素插入到容器元素中
        container.appendChild(danmu);
        // 使用CSS动画来让span元素从右向左移动
        danmu.style.animation = "move " + (5 + Math.random() * 5) + "s linear infinite";
    }

    // 定义一个数组用来存放一些弹幕内容
    const texts = [];
    $.ajax({
        url: '/loadBarrages',
        type: 'GET',
        data: { action: 'loadBarrages' },
        dataType: 'json',
        success: function(data) {
            console.log(data)
            for (let i = 0; i < data.length; i++) {
                createDanmu(data[i].content)
                texts.push(data[i].content)
                console.log(data[i].content)
            }
        },
        error: function(xhr, status, error) {
            console.error('There was aproblem with the AJAX request:', error);
        }
    })
    // 获取容器元素
    const container = document.getElementById("container");

    // 定义一个定时器，每隔一秒创建并插入一条弹幕
    let addDanmu=setInterval(function() {
        // 随机选择一个弹幕内容
        var text = texts[Math.floor(Math.random() * texts.length)];
        console.log(text)
        // 调用函数创建并插入弹幕
        createDanmu(text);
    },1000);

    setInterval(function(){
        let barrages = document.querySelectorAll('.danmu')
        barrages.forEach(function(barrage){
            if (barrage.offsetLeft<-100 || barrage.offsetLeft>container.offsetWidth){
                barrage.remove();
            }
        })
    },7000)

    $('body').on('mouseover','.danmu',function(e) {
        $(this).css("animation-play-state","paused")
        $(this).children().removeClass('hide')

    })

    $('body').on('mouseout','.danmu',function(e) {
        $(this).css("animation-play-state","running")
        $(this).children().addClass('hide')
    })

    $('body').on('click','.zan',function() {
        $(this).animate({
            'font-size':'35px'
        },300,function(){
        })
    })
    var s1;
    $('body').on('click','.btn',function() {
        s1=$(this).text().replace('发送','')
        createDanmu(s1)
    })

</script>
<script src="js/base.js"></script>
<script type="text/javascript" src="js/paper-full.min.js"></script>
</html>

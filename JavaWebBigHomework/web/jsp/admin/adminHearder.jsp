<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/2
  Time: 下午5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<header class="main-header">
    <!------------------ 左上角的LOGO ----------------->
    <a href="#" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>后台</b>管理</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>留言墙</b>后台管理</span>
    </a>
    <!----------------- 头部导航栏 ------------------>
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- 导航栏收缩按钮-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">切换导航</span>
        </a>
        <!-- 导航栏右侧菜单 -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="resources/img/toux.jpg" class="user-image" alt="用户图像">
                        <!-- hidden-xs 在小型设备上隐藏用户名，只显示图像。 -->
                        <span class="hidden-xs"><%=request.getParameter("admin")%></span>
                    </a>
                    <!-- 点击头像的菜单 -->
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <img src="resources/img/toux.jpg" class="img-circle" alt="用户图像">

                            <p>
                                留言墙超级管理员
                                <small>注册于2024年12月</small>
                            </p>
                        </li>

                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">资料</a>
                            </div>
                            <div class="pull-right">
                                <button class="btn btn-default btn-flat">退出</button>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- 最右侧的设置按钮 -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>

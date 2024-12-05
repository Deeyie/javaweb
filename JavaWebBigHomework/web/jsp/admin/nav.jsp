<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/2
  Time: 下午5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <section class="sidebar">
        <!--------- 用户状态面板 ----------->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="resources/img/toux.jpg" class="img-circle" alt="用户图像">
            </div>
            <div class="pull-left info">
                <p><%=request.getParameter("admin")%></p>
                <!-- 状态 -->
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!---------- 侧边栏搜索框 --------->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="搜索...">
                <span class="input-group-btn">
                            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i
                                    class="fa fa-search"></i>
                            </button>
                        </span>
            </div>
        </form>
        <!------------- 侧边栏菜单 ------------->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">主导航</li>
            <!--------- 导航链接 ----------->
            <li class="active"><a href="admin.jsp"><i class="fa fa-link"></i> <span>首页</span></a></li>
            <li><a href="userManagement.jsp"><i class="fa fa-link"></i> <span>用户管理</span></a></li>
            <li class="treeview">
                <a href="#"><i class="fa fa-link"></i> <span>表白墙</span>
                    <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="messageManagement.jsp">帖子管理</a></li>
                    <li><a href="barrageManagement.jsp">弹幕管理</a></li>
                </ul>
            </li>
        </ul>
    </section>
</aside>

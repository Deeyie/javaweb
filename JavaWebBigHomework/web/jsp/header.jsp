<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/1
  Time: 下午3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header borderafter">
    <!-- 返回按钮 -->
    <a style="position: absolute;left:50px;" href="javascript:history.back()">返回</a>
    <div class="col">
        <span style="font-size: 20px">留言墙</span>
        <!-- 右边操作栏 -->
        <div class="header-right">
            <!-- 按钮 -->
            <div class="min_menu-wrap" id="minmenu">
                <span class="min_menu"></span>
            </div>
            <!-- 列表 -->
            <div class="menu_list">
                <!-- 栏目 -->
                <ul class="header-nav">
                    <li><a href="index.jsp">主页</a></li>
                    <li><a href="messagewall.jsp">表白墙</a></li>
                    <li><a href="barrage.jsp">弹幕广场</a></li>
                    <li><a href="personalInfo.jsp">个人信息</a></li>
                </ul>
                <!-- 开关灯 -->
                <span class="kaig-bottm">
              <span class="iconfont icon-taiyang"></span>
                    <!-- 开关按钮 -->
              <span class="my-radio active" id="myRadio">
                <i></i>
              </span>
              <span class="iconfont icon-yueliang"></span>
            </span>
            </div>
        </div>
    </div>
</div>

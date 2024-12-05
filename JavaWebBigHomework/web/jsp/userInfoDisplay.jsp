<%@ page import="com.servlet.model.User" %><%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/1
  Time: 下午3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://jakarta.apache.org/jstl/core" prefix="c" %>
<%
    User user = (User) request.getSession().getAttribute("user");
%>
<div class="co-left">
    <div class="me-card carbox borderbefore" id="mycard">
        <div class="mecar-title">
            <div class="me-image">
                <img src="resources/img/toux.jpg" alt="">
                <%
                    if (user != null){
                %>
                <span class="status " style="background-color: <%=user.isBanned()?"red":""%>">
                        <i class="fa <%=user.isBanned()?"fa-ban":"fa-check"%>"></i>
                </span>
                <%
                    }
                %>
            </div>
            <%
                if (user != null) {
            %>
            <h3><%=user.getUsername()%></h3>
            <%
                } else {
            %>
            <h3>请先登录</h3>
            <%
                }
            %>
            <p class="me-hover">
                <span>我相信任何事情都不会不留痕迹就过去！</span>
            </p>
        </div>

        <div class="borderbotm"></div>
        <div class="mecar-bottm">
            <div>
                <span class="mecarbottm-key">账号</span>
                <span class="mecarbottm-value">${sessionScope.user.getAccount()}</span>
            </div>
            <div>
                <span class="mecarbottm-key">邮箱</span>
                <span class="mecarbottm-value">${sessionScope.user.getEmail()}</span>
            </div>
        </div>
        <div class="borderbotm"></div>
        <div>大作业BUG测试</div>
        <div class="borderbotm"></div>
        <div class="buttom-box ">
            <c:if test="${sessionScope.user != null}">
                <a href="user-logout" class="button" id="logout">退出登录</a>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <a href="userSign.jsp" class="button login">登录</a>
            </c:if>
        </div>
    </div>
</div>
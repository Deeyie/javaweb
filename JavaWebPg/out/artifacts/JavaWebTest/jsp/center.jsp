<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/21
  Time: 下午7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h2>1-100 范围内的素数</h2>
<div>
<%
    for (int i = 2; i <= 100; i++) {
        boolean isPrime = true;
        for (int j = 2; j * j <= i; j++) {
            if (i % j == 0) {
                isPrime = false;
                break;
            }
        }
        if (isPrime) {
%>
    <span><%= i %></span>
<%
        }
    }
%>
</div>

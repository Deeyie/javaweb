<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<html>
<head>
    <title>未知错误</title>
    <link rel="stylesheet" href="css/error.css">
</head>
<body>
    <div class="error-container">
        <div class="background">
            <div class="index">
                <p class="title">ERROR!!!</p>
                <p class="info"><%= exception.getMessage() %></p>
                <div class="link">
                    <a href="userSign.jsp">返回登录</a>
                    <a href="index.jsp">返回主页</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/11/21
  Time: 下午7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta charset="utf-8" />
		<title>实验4-3</title>
		<link rel="stylesheet" href="css/nav.css" type="text/css">
		<link rel="stylesheet" href="css/layout5.css" type="text/css">
    	<link rel="shortcut icon" href="images/icon.ico" type="image/x-icon">
		<link rel="stylesheet" href="css/bubble.css" type="text/css">
	</head>
	<body>
	<div id="container" class="">
		<div id="header" class="">
			<div id="logo" class="">
				<jsp:include page="/jsp/logo.jsp" flush="true">
					<jsp:param name="" value="" />
				</jsp:include>
			</div>
			<div id="nav" class="">
				<jsp:include page="jsp/nav.jsp" flush="true">
					<jsp:param name="" value="" />
				</jsp:include>
			</div>
		</div>

		<div id="main" class="">
			<div id="left" class="">
				<div id="left_up_1" class="">left_up_1</div>
				<div id="left_up_2" class="">left_up_2</div>
				<div id="left_down_1" class="">left_down_1</div>
				<div id="left_down_2" class="">left_down_2</div>
			</div>
			<div id="center" class="">
				<div id="center_up" class="">
					<jsp:include page="/jsp/center.jsp" flush="true"/>
				</div>
				<div id="center_down" class="">
					<jsp:include page="/jsp/bubble.jsp" flush="true">
						<jsp:param name="" value="" />
					</jsp:include>
				</div>
			</div>
			<div id="right" class="">
				<div id="right_up" class="">right_up</div>
				<div id="right_down" class="">right_down</div>
			</div>
		</div>
		<div id="footer" class="">
			<jsp:include page="jsp/footer.jsp" flush="true">
				<jsp:param name="" value="" />
			</jsp:include>
		</div>
	</div>
	</body>
</html>

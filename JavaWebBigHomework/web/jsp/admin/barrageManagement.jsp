<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/2
  Time: 下午5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.servlet.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.model.Message" %>
<%@ page import="com.servlet.LoadMessageServlet" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/jstl/core" prefix="c" %>
<%
    User admin = null;
    if (request.getSession().getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
    } else {
        admin = (User) request.getSession().getAttribute("admin");
    }
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>留言墙后台管理</title>
    <!-- 告诉浏览器该页面是自适应布局 -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="css/admin/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/admin/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="css/admin/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="css/admin/AdminLTE.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="css/admin/dataTables.bootstrap.min.css">
    <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
    <!-- AdminLTE 皮肤。默认使用蓝色皮肤。
        您可以选择其他皮肤。皮肤样式写在 body 标签中，
        以便使之生效。 -->
    <link rel="stylesheet" href="css/admin/_all-skins.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-purple sidebar-mini">
<div class="wrapper">
    <!--------------------------------------------- 头部 ------------------------------------------>
    <jsp:include page="jsp/admin/adminHearder.jsp" flush="true">
        <jsp:param name="admin" value="<%=admin.getUsername()%>"/>
    </jsp:include>
    <!-------------------------------------------- 左部侧边栏 ---------------------------------------------->
    <jsp:include page="jsp/admin/nav.jsp" flush="true">
        <jsp:param name="admin" value="<%=admin.getUsername()%>"/>
    </jsp:include>
    <!------------------------------------- 页面主体内容 -------------------------------------->
    <div class="content-wrapper">
        <!------- 头部 (页眉) ------->
        <jsp:include page="jsp/admin/innerHeader.jsp" flush="true"></jsp:include>
        <!------ 主体内容 ------>
        <section class="content container-fluid">
            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>
                <div class="box-body">
                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <jsp:include page="jsp/admin/tool.jsp" flush="true"></jsp:include>
                        <!--工具栏/-->
                        <!--数据列表-->
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>账号</th>
                                <th>用户名</th>
                                <th>留言帖</th>
                                <th>留言时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Message> allMessages = LoadMessageServlet.getBarrages();
                                request.setAttribute("allMessages", allMessages);
                            %>
                            <c:forEach var="message" items="${allMessages}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${message.getAccount()}</td>
                                    <td>${message.getUsername()}</td>
                                    <td class="small content">${message.getContent()}</td>
                                    <td>${message.getSendTime()}</td>
                                    <td>
                                        <a href="javascript:void(0);" class="btn btn-danger btn-xs"
                                           onclick="deleteMessage(${sessionScope.admin.getId()},${message.getId()})">
                                            <i class="fa fa-trash"></i>
                                            删除
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>序号</th>
                                <th>账号</th>
                                <th>用户名</th>
                                <th>留言帖</th>
                                <th>留言时间</th>
                                <th>操作</th>
                            </tr>
                            </tfoot>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>
                <!-- /.box-body -->
            </div>
        </section>
    </div>

    <!------- 尾部Footer ------>
    <footer class="main-footer">
        <!-- 右测内容 -->
        <div class="pull-right hidden-xs">
            任何你想要的
        </div>
        <!-- 默认左侧内容 -->
        <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
    </footer>

    <!------------------------------------右侧设置按钮的侧边栏 ------------------------------------>
    <aside class="control-sidebar control-sidebar-dark" style="display: none;">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">个人中心</h3>

            </div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <h3 class="control-sidebar-heading">常规设置</h3>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- 添加侧边栏的背景。这个 div必须放在 control-sidebar 之后 -->
    <div class="control-sidebar-bg"></div>
</div>

<!--------------------------- 导入的 JS SCRIPTS ------------------------>
<script src="js/admin/setActive.js"></script>
<!-- jQuery 3 -->
<script src="js/admin/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="js/admin/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="js/admin/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/admin/demo.js"></script>
<!-- DataTables -->
<script src="js/admin/jquery.dataTables.min.js"></script>
<script src="js/admin/dataTables.bootstrap.min.js"></script>

<script>
    function deleteMessage(operator_id,id) {
        const r = confirm("确定删除该消息？");
        if (r === true) {
            $.ajax({
                url: '/messagesAction',
                type: 'GET',
                data: { action: 'deleteBarrage', id: id, operator_id: operator_id },
                dataType: 'json',
                success: function(data) {
                    alert(data.message);
                    if (data.success) {
                        window.location.reload();
                    }
                },
                error: function(xhr, status, error) {
                    console.error('There was a problem with the AJAX request:', error);
                    alert('删除失败，请重试');
                }
            });
        } else {
            return false;
        }
    }

    $(function () {
        $('#example1').DataTable({
            'paging': true,
            'lengthChange': true,
            'searching': false,
            'ordering': false,
            'info': true,
            'autoWidth': true,
            'responsive' :true,
            'scrollY': '420px',
        })
    })
</script>

</body>

</html>

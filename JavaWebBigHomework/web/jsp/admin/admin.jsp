<%@ page import="com.servlet.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.utilities.MySqlConn" %>
<%--
  Created by IntelliJ IDEA.
  User: lol41
  Date: 2024/12/1
  Time: 下午6:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/jstl/core" prefix="c" %>
<%
    User admin = null;
    if (request.getSession().getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
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
                    <h3 class="box-title">站点数据统计</h3>
                </div>
                <div class="box-body">
                    <!-- 站点数据统计 -->
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3><%=MySqlConn.getUsersCount()%></h3>
                                    <p>用户数量</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-stalker"></i>
                                </div>
<%--                                <a href="#" class="small-box-footer">更多信息 <i class="fa fa-arrow-circle-right"></i></a>--%>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3><%=MySqlConn.getPostsCount()%></h3>
                                    <p>帖子数量</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3><%=MySqlConn.getGenderCount(1)%></h3>
                                    <p>男生用户</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-male "></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3><%=MySqlConn.getGenderCount(0)%></h3>
                                    <p>女生用户</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-female"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3><%=MySqlConn.getBarragesCount()%></h3>
                                    <p>弹幕数量</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-android-chat"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3><%=MySqlConn.getBannedUsersCount()%></h3>
                                    <p>违规用户数量</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-android-close"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 站点数据统计 /-->
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
    $(function () {
        $('#example1').DataTable({
            'paging': true,
            'lengthChange': true,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': true
        })
    })
</script>

</body>

</html>

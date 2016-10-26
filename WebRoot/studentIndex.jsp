<%@ page language="java" import="java.util.*,cn.hpe.po.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HPE在线考试系统</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，本系统暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <small>欢迎登录&nbsp-${student.sname}</small>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="StudentServlet?op=index">主界面</a></li>
        <li><a href="StudentServlet?op=begin">开始考试</a></li>
        <li><a href="StudentServlet?op=showhistory">查看历史成绩</a></li>               
        <li><a href="StudentServlet?op=changepwd">密码修改</a></li>
        <li><a href="StudentServlet?op=exit">退出系统</a></li>
      </ul>

    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
		
	<p style="margin-left: 30px;margin-top:30px">个人信息：</p>
	<table width="300px" height="150px" style="margin-left: 200px" cellspacing="0">
    	<tr><td>学号:</td><td>${student.sno}</td></tr>
    	<tr><td>姓名:</td><td>${student.sname}</td></tr>
    	<tr><td>专业:</td><td>${student.major}</td></tr>
    	<tr><td>班级:</td><td>${student.classid}</td></tr>
	</table>
	<hr>
	<p style="margin-left: 30px">考生须知</p>
    <span style="margin-left:80px">
        1.此页面上方会显示考生个人信息，若有错误请及时联系老师<br>
        2.默认密码为123，若考生修改，请牢记你的账号密码，忘记请联系相关老师<br>
        3.考试期间禁止联网、刷新页面、返回桌面、使用其他软件，否则答案丢失，概不负责<br>
        4.考试时请遵守考场纪律，听从监考老师安排<br>
        5.考试时发生任何状况，请通知监考老师<br>
    </span>

  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>

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
  <style >
      .a{
          list-style:none;
          margin-top:30px;
          
      }
      #firstli{
          margin-top:130px;
      }
      .btn{
          margin-left:50px;
      }
  </style>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，本系统暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <small>修改密码</small>
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
  <div class="admin-content" align="center">
		<form action="StudentServlet" method="post"> 
		<input name="op" type="hidden" value="change"> 
        <ul>
            <li class="a" id="firstli">
                                             输入原密码：<input name="pwd" type="text"/></li>
            <li class="a">输入新密码：<input name="pwd1" type="text"/></li>
            <li class="a">确认新密码：<input name="pwd2" type="text"/></li>
            <li class="a" id="btn">
                
                <input type="submit" value="确认" class="btn" />
                <input type="button" value="重置" class="btn" onclick=""/>
                <a href="StudentServlet?op=index">
                <input type="button" value="返回" class="btn" /></a>
            </li>
        </ul> 
        </form>
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

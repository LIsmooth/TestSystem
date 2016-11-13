<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js fixed-layout">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>在线考试系统教师界面</title>
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
 
<frameset rows="8%,*">
	<frame src="header.jsp" noresize="yes"/>
	<div class="admin-sidebar am-offcanvas" id="admin-offcanvas"  style="float: right">
	<div class="am-offcanvas-bar admin-offcanvas-bar">
	<frameset cols="260px,*">
	<frame src="left.jsp" noresize="yes"/>
	<frame src="right.jsp" name="right"/></frameset>
	</div>
	</div>
</frameset>
       

 
</html>

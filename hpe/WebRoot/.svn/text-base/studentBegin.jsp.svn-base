<%@ page language="java" import="java.util.*,cn.hpe.po.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
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
  <script src="js/jquery-2.1.4.js"></script>
</head>

<body>

<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，本系统暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <small>考试信息</small>
  </div>
</header>
<c:set var="servertime" value="${NOWDATE}"></c:set>
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

    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">考试信息列表</strong></div>
        <div style="margin-left:850px;">
         <a href="StudentServlet?op=index"><input type="button" value="返回"></a>
        </div>
      </div> 
        
      <div class="am-g">
        <div class="am-u-sm-12">
          
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-id">编号</th>
                <th class="table-title">名称</th>
                <th class="table-type">科目</th>
                <th class="table-author am-hide-sm-only">出题人</th>
                <th class="table-date am-hide-sm-only">考试日期</th>
                <th class="table-date am-hide-sm-only">考试时长</th>
                <th class="table-set">操作</th>
              </tr>
              </thead>
              <tbody>
              <c:set var="str2" value="${student.classid }"></c:set>
              <c:forEach var='a' items="${examlist}">
              <c:set var="str1" value="${a.classList }"></c:set>
              <c:if test="${fn:contains(str1,str2)}">
              <c:if test="${a.examTime.substring(0,10)==servertime}">
              <tr>
                <td>${a.examNo}</td>
                <td>${a.paperName}</td>
                <td>${a.subjectId}</td>
                <td>${a.teaName}</td>
                <td>${a.examTime}</td>               
                <td>${a.totalTime}分钟</td>
                <td>
                  <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                    <c:if test="${a.isStudentExam==0}">
                       <a href="StudentServlet?op=wait&paperno=${a.paperNo}&totaltime=${a.totalTime}&examno=${a.examNo}">准备考试</a>
                    </c:if>
                    <c:if test="${a.isStudentExam==1}">
                      	已完成考试
                    </c:if>
                    </div>
                  </div>
                </td>
               </tr>
               </c:if>
               </c:if>
              </c:forEach>                   
              </tbody>
            </table>
            <hr/>
          
        </div>

      </div>
    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left">© 2016 hpe</p>
    </footer>


  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->


<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>

</html>

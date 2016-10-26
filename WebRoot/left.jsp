<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 
<html   style="width:260px">
<head>
  <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
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
  
  <body style="overflow:scroll;">
    <!-- <div class="admin-sidebar am-offcanvas" id="admin-offcanvas"  style="float: right"> -->
   <!--  <div class="am-offcanvas-bar admin-offcanvas-bar"> -->
      <ul class="am-list admin-sidebar-list">
        <li><a href="main.jsp" id="home" target="_parent"><span class="am-icon-home"></span> 首页</a></li>
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 题库管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <div class="item">
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="QuestionServlet?op=ToAddPage" class="am-cf" target="right"><span class="am-icon-check"></span>题库增加页<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="QuestionServlet?op=getQues" target="right"><span class="am-icon-puzzle-piece"></span> 题库删除页</a></li>
            <li><a href="QuestionServlet?op=getQues" target="right"><span class="am-icon-th"></span> 题库修改页</a></li>
            <li><a href="QuestionServlet?op=getQues" target="right"><span class="am-icon-calendar"></span> 题库查看页</a></li>
          </ul>
          </div>
          
          
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 试卷管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <div class="item">
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="questionAdd.jsp" class="am-cf" target="right"><span class="am-icon-check"></span>试卷增加页<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="admin-help.html" target="right"><span class="am-icon-puzzle-piece"></span> 试卷删除页</a></li>
            <li><a href="questionUpdate.jsp" target="right"><span class="am-icon-th"></span> 试卷修改页</a></li>
            <li><a href="questionShow.jsp" target="right"><span class="am-icon-calendar"></span> 试卷查看页</a></li>
          </ul>
          </div> 
          
            <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span>成绩管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
            <div class="item">
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="questionAdd.jsp" class="am-cf" target="right"><span class="am-icon-check"></span>查看历史成绩<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="admin-help.html" target="right"><span class="am-icon-puzzle-piece"></span>成绩浏览</a></li>
          </ul> 
          </div>
          
          
          
           <a href="charge.jsp" class="am-cf" data-am-collapse="{target: '#collapse-nav'}" target="right"><span class="am-icon-file"></span>阅卷<span class="am-icon-angle-right am-fr am-margin-right"></span></a>   
                         
          
        </li>        
        <li><a href="exit.jsp"><span class="am-icon-sign-out"></span>注销</a></li>
      </ul>
  </body>
  <script>$(function(){
  $(".item").hide();
   $(".am-cf").click(function(){
   $(this).next(".item").slideToggle(300).siblings(".item").slideUp();
        })
  })
  
  </script>
</html>


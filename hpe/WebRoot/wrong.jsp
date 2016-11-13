<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
  </head>
  <body>
     
  </body>
  <script >
  $(function(){
  alert("没有学生做答该试卷!");
  window.location.href="paperReaderMessage.jsp";
  });
  </script>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script src="js/jquery-1.8.3.js"></script>

  </head>
  
  <body>
  <%session.setAttribute("sum", 0); %>
  </body>
   <script>
  $(function(){
  alert("没有下一份试卷!");
 location.href="paperReader.jsp";
  });
  </script>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>准备考试</title>
    <meta name="description" content="这是一个 table 页面">
    <meta name="keywords" content="table">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">
    <style>
        .admin-main{
			padding-top: 0;
		}
    </style>
    <script src="js/jquery-2.1.4.js"></script>
    
</head>
<script type="text/javascript">
	window.setInterval(function(){ 
		var examno=${suExamno};
		$.ajax({
			url :'StudentCheckExamServlet?examno=' + examno,
			type : "post",
			success : function(v) {
			    if(v=='考试未开始'){
			        $("#examstatus").html(v);
			        $("#usetd").html('请等待');
			    }else if(v=='可以开始考试'){
			        $("#examstatus").html('开始考试');
				    $("#usetd").html('读取试卷');
				    window.location.href="StudentServlet?op=beginexam&paperno=${suPaperno}&examNo="+examno;
				    
				}else if(v=='考试已结束'){
				    $("#examstatus").html('考试已结束');
				    $("#usetd").html('请考生离开考场');
				    $("#usefanhui").html('<a href="StudentServlet?op=index"><input type="button" value="返回" class="btn" /></a>');
				}
			}
		})
    }, 1000); 	
</script>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->
<div class="am-cf admin-main">

    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">准备考试</strong></div>
            </div>

            <hr>

               <table border="0" cellspacing="10" cellpadding="0" width="100%">
				 <tr align="center">
				 	<td height="100px"><div  id="examstatus"></div></td>
				 </tr>
				 <tr align="center">
				 	<td height="100px" id="usetd"> </td>
				 </tr>
				 <tr align="center">
				    <td height="100px" id="usefanhui"></td>
				 </tr>
				</table>
				
		</div>
            

        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2016 hpe.</p>
        </footer>

    </div>
    <!-- content end -->
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
    <hr>
    <p class="am-padding-left">© 2016 hpe.</p>
</footer>

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


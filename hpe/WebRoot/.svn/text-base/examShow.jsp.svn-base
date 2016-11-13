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
    <title>试卷发布结果</title>
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
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->
<c:set var="PageBean1" value="${PageBean1}"></c:set>
<div class="am-cf admin-main">

    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">试卷发布结果</strong></div>
            </div>

            <hr>

                <table border="0" cellspacing="10" cellpadding="0" width="100%">
				 <tr>
				 	<td align="center" height="200px">${ERRORMESSAGE }</td>
				 </tr>
				 <tr>
				 	<td align="center" height="100px"><a href="ExamServlet?op=EXAMPUBLISH">返回试卷发布页</a></td>
				 </tr>
			</table>
            

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
<script type="text/javascript">
	window.onload = function() {
		var subject = document.getElementsByClassName("subject");
		var endSection = document.getElementsByClassName("endSection");
		var questionType = document.getElementsByClassName("questionType");
		var levelType = document.getElementsByClassName("levelType");
		var str1 = "${LIMIT.subject_id }";
		var str2 = "${LIMIT.end_section }";
		var str3 = "${LIMIT.question_type }";
		var str4 = "${LIMIT.level_type }";
		for (var i = 0; i < subject.length; i++) {
			if (subject[i].value == str1) {
				subject[i].selected = true;

			}
		}
		for (var i = 0; i < endSection.length; i++) {
			if (endSection[i].value == str2) {
				endSection[i].selected = true;
			}
		}
		for (var i = 0; i < questionType.length; i++) {
			if (questionType[i].value == str3) {
				questionType[i].selected = true;
			}
		}
		for (var i = 0; i < levelType.length; i++) {
			if (levelType[i].value == str4) {
				levelType[i].selected = true;
			}
		}
	}
	function sureDel(questionno, questionType) {
		var r = confirm("确定要删除吗？");
		if (r) {
			location.href = 'QuestionServlet?op=DEL&questionno=' + questionno
					+ '&questiontype=' + questionType;
		}
	}

	function checkTitle() {
		var obj = document.getElementById("questionTitle").value;
		if (obj == null || obj.length == 0) {
			alert("请输入搜索内容");
		} else {
			document.getElementById("questionTitleForm").submit();
		}
	}
	
	$("#cball").change(function(){
            var ischeck=this.checked;
            $(".ischeckbox").each(function(){
                this.checked=ischeck;
                //alert($(this).attr('checked'));
            });
        });
</script>
</body>
</html>


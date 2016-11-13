<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>试卷修改</title>
<meta name="description" content="这是一个 table 页面">
<meta name="keywords" content="table">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/admin.css">
<script src="js/jquery-2.1.4.js"></script>
<style>
.degree0 {
	background-color: orange;
}

.degree1 {
	background-color: #69cb74;
}

.degree2 {
	background-color: #eeeb3d;
}

.degree3 {
	background-color: #f55435;
}

.degree {
	display: inline-block;
	width: 10px;
	height: 10px;
	margin: 0 17px;
}
.admin-main{
	padding-top: 0;
}


</style>
</head>
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
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">成绩报表</strong>
						<a href="scoreManage.jsp"><button>返回</button></a>
					</div>
				</div>

				<hr>
				 
				<div class="am-g">
					<div class="am-u-sm-12">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr align="left">
										<th width="10%">考试编号</th>
										<th width="20%">考试名称</th>
										<th width="10%">学号</th>
										<th width="10%">姓名</th>
										<th width="10%">班级</th>
										<th width="10%">科目</th>
										<th width="10%">平时成绩</th>
										<th width="10%">期末成绩</th>
										<th width="10%">总成绩</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ss" items="${STUDENTSCORE}">
				  	 <tr align="left">
				  	 		<td>${ss.examNo}</td>
							<td>${ss.examTitle}</td>
							<td>${ss.sno }</td>
							<td>${ss.sname }</td>
							<td>
								<c:forEach var="cla" items="${CLASSINFO}">
									<c:if test="${ss.classId==cla.classId }">
										${cla.className  }
									</c:if>
								</c:forEach>
							</td>
							<td>
								<c:forEach var="si" items="${SUBJECTINFO}">
									<c:if test="${ss.subjectId==si.subjectId }">
										${si.subjectName  }
									</c:if>
								</c:forEach>
							</td>
							<td>${ss.ptScore }</td>
							<td>${ss.etScore }</td>
							<td>${ss.score }</td>
					  </tr>
				  </c:forEach>
								</tbody>
							</table>
							<hr />
							<p>注：.....</p>
					</div>

				</div>
			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed
					under MIT license.</p>
			</footer>

		</div>
		<!-- content end -->
	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

	<footer>
		<hr>
		<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under
			MIT license.</p>
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
	<script>
	function getFilename(){
		var filename=window.prompt("请输入文件名","");
		filename="D:/"+filename+".csv";
		location.href='ScoreServlet?op=OUTPUT&filename='+filename;
	}
</script>
</body>
</html>


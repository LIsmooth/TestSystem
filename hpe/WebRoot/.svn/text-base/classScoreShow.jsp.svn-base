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
	<c:set var="PageBean1" value="${PageBean1}"></c:set>
	<div class="am-cf admin-main">

		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">成绩报表</strong>
						<!--  <button onclick="getFilename()" value="导出成绩">导出成绩</button>-->
					</div>
				</div>

				<hr>
			
				<div class="am-g">
					<div class="am-u-sm-12">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr align="left">
										<th width="14%">学号</th>
										<th width="14%">姓名</th>
										<th width="14%">班级</th>
										<th width="14%">科目</th>
										<th width="14%">平时成绩</th>
										<th width="14%">期末成绩</th>
										<th width="14%">总成绩</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="tss" items="${THISCLASSSCORE.result}">
				  	 <tr align="left">
							<td>${tss.sno }</td>
							<td>${tss.sname }</td>
							<td>
								<c:forEach var="cla" items="${CLASSINFO}">
									<c:if test="${tss.classId==cla.classId }">
										${cla.className  }
									</c:if>
								</c:forEach>
							</td>
							<td>
								<c:forEach var="si" items="${SUBJECTINFO}">
									<c:if test="${tss.subjectId==si.subjectId }">
										${si.subjectName  }
									</c:if>
								</c:forEach>
							</td>
							<td>${tss.ptScore }</td>
							<td>${tss.etScore }</td>
							<td>${tss.score }</td>
					  </tr>
				  </c:forEach>
				  <tr>
				  	<td colspan="7" align="center">不及格人数:${TOTALCLASSSCORE[0] },&nbsp;&nbsp;60~70的人数:${TOTALCLASSSCORE[1] }</td>
				  </tr>
				  <tr>
				  	<td colspan="7" align="center">70~80人数:${TOTALCLASSSCORE[2] },&nbsp;&nbsp;80~90的人数:${TOTALCLASSSCORE[3] }</td>
				  </tr>
				  <tr>
				  	<td colspan="7" align="center">90~100人数:${TOTALCLASSSCORE[4] }</td>
				  </tr>
								</tbody>
							</table>
							<div class="am-cf">
                             <span id=totalsize>共${THISCLASSSCORE.totalSize}条纪录，当前第${THISCLASSSCORE.currentPage}/${THISCLASSSCORE.totalPage}页，每页${THISCLASSSCORE.perPageRows}条纪录</span>
                            <div class="am-fr">
                                <ul class="am-pagination">
                                    <li><a href="ScoreServlet?op=LOOK&cpage=${THISCLASSSCORE.currentPage-1}">«</a></li>                               
                                    <li class="am-active"><a href="ScoreServlet?op=LOOK&cpage=1">首页</a></li>
                                    <li class="am-active"><a href="ScoreServlet?op=LOOK&cpage=${THISCLASSSCORE.totalPage}">末页</a></li>                 
                                    <li><a href="ScoreServlet?op=LOOK&cpage=${THISCLASSSCORE.currentPage+1}">»</a></li>
                                </ul>
                            </div>
                        </div>
							<hr />
							<p>注：.....</p>
					</div>

				</div>
			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">© 2016 hpe.</p>
			</footer>

		</div>
		<!-- content end -->
	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

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
	<script>
	function getFilename(){
		var filename=window.prompt("请输入文件名","");
		filename="D:/"+filename+".csv";
		location.href='ScoreServlet?op=OUTPUT&filename='+filename;
	}
</script>
</body>
</html>


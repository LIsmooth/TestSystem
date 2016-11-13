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
<title></title>
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
					</div>
				</div>

				<hr>
				<div class="am-g">
					<div style="float:left;margin-left:20px">
						<form action="ScoreServlet" method="post">
							<input type="hidden" value="getScore" name="op">
							<td><label for="subject">科目</label> <select name="subject"
								id="subject">
									<option class="subject" value="0">全部课程</option>
									<c:forEach var="si" items="${SUBJECTINFO}">
										<option class="subject" value="${si.subjectId }">${si.subjectName }</option>
									</c:forEach>
							</select></td>
							<td><label for="className">班级</label> <select
								name="className" id="className">
									<option value="-1">全部班级</option>
									<c:forEach var="cla" items="${CLASSINFO}">
										<option class="classInfo" value="${cla.classId }">${cla.className }</option>
									</c:forEach>
							</select></td>
							<td><label for="scoreOrder">平均分排序</label> <select
								name="scoreOrder" id="scoreOrder">
									<option class="scoreOrder" value="0">不排序</option>
									<option class="scoreOrder" value="1">升序</option>
									<option class="scoreOrder" value="2">降序</option>
							</select></td>
							<td><input type="submit" value="查询"></td>
							<td><input type="reset" value="重置"></td>
						</form>
					</div>
					<div style="float:right;margin-right:50px">
						<form action="ScoreServlet" id="FindStudentId">
							<input type="hidden" value="FIND" name="op">
							<td><input type="text" name="studentId" id="studentId"></td>
							<td><input type="button" placeholder="学号" value="搜索" onclick="checkID()"></td>
						</form>
					</div>
				</div>
				</form>
				<div class="am-g">
					<div class="am-u-sm-12">
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr align="left">
										<th width="10%">考试编号</th>
										<th width="20%">考试名称</th>
										<th width="20%">考试日期</th>
										<th width="10%">班级</th>
										<th width="10%">平均分</th>
										<th width="10%">最高分</th>
										<th width="10%">最低分</th>
										<th width="10%">查看</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cs" items="${CLASSSCORE}">
										<tr align="left">
											<td>${cs.examNo}</td>
											<td>${cs.examName}</td>
											<td>${cs.examDate}</td>
											<td><c:forEach var="cla" items="${CLASSINFO}">
													<c:if test="${cs.classId==cla.classId }">
														${cla.className  }
													</c:if>
												</c:forEach>
											</td>
											<td>${cs.avgScore }</td>
											<td>${cs.maxScore }</td>
											<td>${cs.minScore }</td>
											<td><a
												href="ScoreServlet?op=LOOK&classid=${cs.classId}&subjectid=${cs.subjectId}&examNo=${cs.examNo}">查看</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<hr />
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
	<script type="text/javascript">
window.onload=function(){
  		var subject=document.getElementsByClassName("subject");
  		var classInfo=document.getElementsByClassName("classInfo");
  		var scoreOrder=document.getElementsByClassName("scoreOrder");
  		var str1="${SCORELIMIT.subjectId }";
  		var str2="${SCORELIMIT.classId }";
  		var str3="${SCORELIMIT.order }";
  		for(var i=0;i<subject.length;i++){
  			if(subject[i].value==str1){
  				subject[i].selected=true;
  			
  			}
  		}
  		for(var i=0;i<classInfo.length;i++){
  			if(classInfo[i].value==str2){
  				classInfo[i].selected=true;
  			}
  		}
  		if(str3==" order by classid"){
  			scoreOrder[0].selected=true;
  		}
  		if(str3==" order by score"){
  			scoreOrder[1].selected=true;
  		}
  		if(str3==" order by score desc"){
  			scoreOrder[2].selected=true;
  		}
  	}
  	function checkID(){
  		var obj = document.getElementById("studentId").value;
  		document.getElementById("FindStudentId").submit();

  	}
 </script>
</body>
</html>


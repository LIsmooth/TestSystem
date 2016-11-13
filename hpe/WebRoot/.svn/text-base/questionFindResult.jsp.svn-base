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
    <title>试卷修改</title>
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">题库管理</strong></div>
            </div>
            <hr>
            <div class="am-g">
                <div style="float:left;margin-left:20px">
                    <form action="QuestionServlet" method="post">
							<input type="hidden" value="getQues" name="op">
							<td><label for="subject">科目</label> <select name="subject"
								id="subject">
									<option class="subject" value="0">全部课程</option>
									<c:forEach var="si" items="${SUBJECTINFO}">
										<option class="subject" value="${si.subjectId }">${si.subjectName }</option>
									</c:forEach>
							</select></td>
							<td><label for="endSection">章节</label> <select
								name="endSection" id="endSection">
									<option value="0">全部章节</option>
									<c:forEach var="sec" items="${SECTIONS}">
										<option class="endSection" value="${sec.sectionId }">${sec.sectionName }</option>
									</c:forEach>
							</select></td>
							<td><label for="questionType">题型</label> <select
								name="questionType" id="questionType">
									<option class="questionType" value="0">全部题型</option>
									<c:forEach var="qt" items="${QUESTIONTYPE}">
										<option class="questionType" value="${qt.typeId }">${qt.typeName }</option>
									</c:forEach>
							</select></td>
							<td><label for="levelType">难度等级</label> <select
								name="levelType" id="levelType">
									<option value="0">所有等级</option>
									<c:forEach var="qi" items="${QUESTIONINFO}">
										<option class="levelType" value="${qi.levelId }">${qi.levelName }</option>
									</c:forEach>
							</select></td>
							<td><input type="submit" value="查询"></td>
							<td><input type="reset" value="重置"></td>
						</form>
                </div>
                <div style="float:right;margin-right:50px">
                    <form action="QuestionServlet" id="questionTitleForm"
							method="post">
							<input type="hidden" value="FIND" name="op">
							<td><input type="text" name="questionTitle" id="questionTitle" value=${QUESTIONTITLE }></td>
							<td><input type="button" value="搜索" onclick="checkTitle()"></td>
					</form>
                </div>
            </div>
            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th class="table-check"><input id="cball" type="checkbox" onchange="a"/></th>
                                <th class="table-id">ID</th>
                                <th class="table-title" width="300px">试题标题</th>
                                <th class="table-type">试题选项</th>
                                <th>正确答案</th>
                                <th class="table-author am-hide-sm-only" width="50px">难度</th>
                                <th class="table-date am-hide-sm-only" width="50px">分值</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                   <c:if test="${QUESTIONMAP!=null}">
				  	<c:forEach var="QM" items="${QUESTIONMAP}">
				  	<c:if test="${QM.key.substring(0,5).equals("multi")}">
				  	 <tr>
				  	 		<td><input type="checkbox" class="ischeckbox" name="papercb" value="${QM.value.questionno }"/></td>
							<td>${QM.value.questionno }</td>
							<td>${QM.value.question}</td>
							<td>
								<table>
								<tr><td>A:${QM.value.questionA}&nbsp;&nbsp;&nbsp;</td><td>B:${QM.value.questionA}</td></tr>
								<tr><td>C:${QM.value.questionC}&nbsp;&nbsp;&nbsp;</td><td>D:${QM.value.questionD}</td></tr>
								</table>
							</td>
							<td>${QM.value.rightanswer }</td>
							<td><c:if test="${QM.value.questionlevel==1 }">容易</c:if>
								<c:if test="${QM.value.questionlevel==2 }">中等</c:if>
								<c:if test="${QM.value.questionlevel==3 }">困难</c:if>
							</td>
							<td>${QM.value.questionmark}</td>
							<td><a href="QuestionServlet?op=LOOK&questionno=${QM.value.questionno }&questiontype=${QM.value.ismultiple}">查看</a>
								<a href="QuestionServlet?op=UPD&questionno=${QM.value.questionno }&questiontype=${QM.value.ismultiple}">更新</a>
								<a onclick="sureDel(${QM.value.questionno },${QM.value.ismultiple })">删除</a>
							</td>
					  </tr>
					  </c:if>
					  <c:if test="${QM.key.substring(0,5).equals("essay")}">
					  <tr>
					  		<td><input type="checkbox" class="ischeckbox" name="papercb" value="${QM.value.questionno }"/></td>
							<td>${QM.value.questionno }</td>
							<td>${QM.value.question}</td>
							<td width="100px">
								无
							</td>
							<td>${QM.value.rightanswer }</td>
							<td>
								<c:if test="${QM.value.questionlevel==1 }">容易</c:if>
								<c:if test="${QM.value.questionlevel==2 }">中等</c:if>
								<c:if test="${QM.value.questionlevel==3 }">困难</c:if>
							</td>
							<td>${QM.value.questionmark}</td>
							<td><a href="QuestionServlet?op=LOOK&questionno=${QM.value.questionno }&questiontype=${QM.value.isessay}">查看</a>
								<a href="QuestionServlet?op=LOOK&questionno=${QM.value.questionno }&questiontype=${QM.value.isessay}">更新</a>
								<a onclick="sureDel(${QM.value.questionno },${QM.value.isessay })">删除</a>
							</td>
					  </tr>
					  </c:if>
				  </c:forEach>
				  </c:if>
				  <c:if test="${QUESTIONMAP.isEmpty()}">
				  	<tr>
				  		<td align="center" colspan="8">
				  			${NOFOUND}
				  		</td>
				  	</tr>
				  </c:if>
        		</tbody>
           </table>
                        <hr />
                        <p>注：.....</p>
                    </form>
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


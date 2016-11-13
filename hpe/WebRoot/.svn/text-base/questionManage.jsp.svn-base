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
    	.degree0{
    		background-color: orange;
    	}
        .degree1{
            background-color: #69cb74;
        }
        .degree2{
            background-color: #eeeb3d;
        }
        .degree3{
            background-color: #f55435;
        }
        .degree{
            display:inline-block;
            width:10px;
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
							<td><input type="text" name="questionTitle"
								id="questionTitle"></td>
							<td><input type="button" value="搜索" onclick="checkTitle()"></td>
					</form>
                </div>
            </div>
            <div class="am-g">
                <div class="am-u-sm-12">
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
                            <c:forEach var='mq' items="${PageBean1.result}">
                            <tr>
                                <td><input type="checkbox" class="ischeckbox" name="papercb" value="${mq.questionno }"/></td>
                                <c:if test="${LIMIT.question_type=='0'||LIMIT.question_type=='1'||LIMIT.question_type=='2'}">
                                <td>${mq.questionno }</td>
                                <td>${mq.question}</td>
                                <td>
									<table>
										<tr>
											<td>A:${mq.questionA}&nbsp;&nbsp;&nbsp;</td>
											<td>B:${mq.questionB}</td>
										</tr>
										<tr>
											<td>C:${mq.questionC}&nbsp;&nbsp;&nbsp;</td>
											<td>D:${mq.questionD}</td>
										</tr>
									</table>
								</td>
                                <td>${mq.rightanswer }</td>
                                <td class="am-hide-sm-only">
									<c:if test="${mq.questionlevel==1 }">容易</c:if> 
									<c:if test="${mq.questionlevel==2 }">中等</c:if> 
									<c:if test="${mq.questionlevel==3 }">困难</c:if>
								</td>
                                <td>${mq.questionmark}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a href="QuestionServlet?op=LOOK&questionno=${mq.questionno }&questiontype=${mq.ismultiple}"><button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" remark="${paper.remark}"><span class="am-icon-copy"></span>查看</button></a>
                                            <a href="QuestionServlet?op=UPD&questionno=${mq.questionno }&questiontype=${mq.ismultiple}"><button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" value="${paper.paperno}"><span class="am-icon-pencil-square-o"></span>编辑</button></a>
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only deletebtn" onclick="sureDel(${mq.questionno },${mq.ismultiple })"><span class="am-icon-trash-o"></span> 删除</button>
                                        </div>
                                    </div>
                                </td>
                                </c:if>
                                <c:if test="${LIMIT.question_type=='3'||LIMIT.question_type=='4'}">
                                <td>${mq.questionno }</td>
                                <td>${mq.question}</td>
                                <td width="100px">
									无
								</td>
                                <td>${mq.rightanswer }</td>
                                <td class="am-hide-sm-only">
									<c:if test="${mq.questionlevel==1 }">容易</c:if> 
									<c:if test="${mq.questionlevel==2 }">中等</c:if> 
									<c:if test="${mq.questionlevel==3 }">困难</c:if>
								</td>
                                <td>${mq.questionmark}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a href="QuestionServlet?op=LOOK&questionno=${mq.questionno }&questiontype=${mq.isessay}"><button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span>查看</button></a>
                                            <a href="QuestionServlet?op=UPD&questionno=${mq.questionno }&questiontype=${mq.isessay}"><button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span>编辑</button></a>
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only deletebtn" onclick="sureDel(${mq.questionno },${mq.isessay})"><span class="am-icon-trash-o"></span> 删除</button>
                                        </div>
                                    </div>
                                </td>
                                </c:if>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="am-cf">
                            <span id=totalsize>共${PageBean1.totalSize}条纪录，当前第${PageBean1.currentPage}/${PageBean1.totalPage}页，每页${PageBean1.perPageRows}条纪录&nbsp;</span>
                            <div class="am-fr">
                                <ul class="am-pagination">
                                    <li><a href="QuestionServlet?op=getQues&cpage=${PageBean1.currentPage-1}">«</a></li>                               
                                    <li class="am-active"><a href="QuestionServlet?op=getQues&cpage=1">首页</a></li>
                                    <li class="am-active"><a href="QuestionServlet?op=getQues&cpage=${PageBean1.totalPage}">末页</a></li>                 
                                    <li><a href="QuestionServlet?op=getQues&cpage=${PageBean1.currentPage+1}">»</a></li>
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


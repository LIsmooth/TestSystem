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
    <title>阅卷管理</title>
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
        tr th:nth-child(2){
            text-align: center;
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">阅卷管理</strong></div>
            </div>

            <hr>
            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th width="100px">考试编号</th>
                                <th class="table-title">试卷名称</th>
                                <th class="table-type">科目</th>
                                <th class="table-author am-hide-sm-only">出题人</th>
                                <th class="table-date am-hide-sm-only">考试时间</th>
                                <th class="table-type">考试时长</th>
                                <th>考试状态</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var='exam' items="${EXAMMESSAGE.result}">
                            <tr>
                                <td>${exam.examNo}</td>
                                <td align="center">${exam.paperName}</td>
                                <td>
                                	<c:forEach var="si" items="${SUBJECTINFO}">
										<c:if test="${exam.subjectId==si.subjectId }">
											${si.subjectName }
										</c:if>
									</c:forEach>
								</td>
                                <td>${exam.teaName}</td>
                                <td class="am-hide-sm-only">${exam.examTime}</td>
                                <td class="am-hide-sm-only">${exam.totalTime}分钟</td>
                                <td text-align="center">
                                	<c:if test="${exam.examStatus==0 }">
                                		<span style="color:black;font-weight:bold">考试未开始</span>
                                    </c:if>
                                    <c:if test="${exam.examStatus==1 }">
                                    	<span style="color:green;font-weight:bold">考试中..</span>
                                    </c:if>
                                    <c:if test="${exam.examStatus==2 }">
                                    	<span style="color:red;font-weight:bold">考试已结束</span>
                                    </c:if>
                                </td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                           <a href="ExamServlet?op=getCLASSMES&examNo=${exam.examNo }&examName=${exam.paperName }&paperNo=${exam.paperNo }&classids=${exam.classList}"><button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy">查看</span></button></a>  
<%--                                            <a href="TestServlet?examNo=${exam.examNo }&classids=${exam.classList}"><button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy">查看</span></button></a> 
 --%>                                             
                                            <c:if test="${exam.examStatus==0 }">
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only deletebtn" onclick="sureBeginExam(${exam.examNo })"><span class="am-icon-trash-o">开始考试</span></button>
                                        	</c:if>
                                        	<c:if test="${exam.examStatus==1 }">
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only deletebtn" onclick="sureEndExam(${exam.examNo })"><span class="am-icon-trash-o">结束考试</span></button>
                                        	</c:if>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="am-cf">
                         <span id=totalsize>共 ${EXAMMESSAGE.totalSize}条记录,当前第${EXAMMESSAGE.currentPage}/${EXAMMESSAGE.totalPage}页，每页${EXAMMESSAGE.perPageRows}条纪录&nbsp;</span>
                            <div class="am-fr">
                                <ul class="am-pagination">
                                    <li><a href="ExamServlet?op=READ&cpage=${EXAMMESSAGE.currentPage-1}">«</a></li>                               
                                    <li class="am-active"><a href="ExamServlet?op=READ&cpage=1">首页</a></li>
                                    <li class="am-active"><a href="ExamServlet?op=READ&cpage=${EXAMMESSAGE.totalPage}">末页</a></li>                 
                                    <li><a href="ExamServlet?op=READ&cpage=${EXAMMESSAGE.currentPage+1}">»</a></li>
                                </ul>
                            </div>
                        </div>
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
<script>
	function sureBeginExam(ExamNo){
		var r = window.confirm("确认开始考试吗？");
		if(r){
			location.href="ExamServlet?op=beginExam&examNo="+ExamNo;
		}
	}
	function sureEndExam(ExamNo){
		var r = window.confirm("确认收卷吗？");
		if(r){
			location.href="ExamServlet?op=endExam&examNo="+ExamNo;
		}
	}
</script>
</html>


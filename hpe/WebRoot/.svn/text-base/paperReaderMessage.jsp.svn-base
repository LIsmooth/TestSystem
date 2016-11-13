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
                                <th class="table-type">班级</th>
                                <th class="table-author am-hide-sm-only">应考人数</th>
                                <th class="table-date am-hide-sm-only">实考人数</th>
                                <th class="table-type">缺考人数</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var='ecm' items="${EXAMCLASSMESSAGE}">
                            <tr>
                                <td>${ecm.examNo}</td>
                                <td align="center">${ecm.examName}</td>
                                <td>
                                	<c:forEach var="cla" items="${CLASSINFO}">
													<c:if test="${ecm.classid==cla.classId }">
														${cla.className  }
													</c:if>
									</c:forEach>
								</td>
                                <td>${ecm.countStu}</td>
                                <td class="am-hide-sm-only countExamStu">${ecm.countExamStu}</td>
                                <td class="am-hide-sm-only">${ecm.countNotExamStu}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                        	
                                        	<a class="examStuHref" href="TestServlet?examno=${ecm.examNo}&classid=${ecm.classid}&paperno=${ecm.paperNo}"><button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy">查看</span></button></a> 
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
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
	$(function(){
		$(".countExamStu").each(function(){
			if($(this).html()==0){
				$(this).parent().find("a.examStuHref").attr("href","#").click(function(){alert("没有学生参加考试！");});
			}
		});
	});
</script>
</body>
</html>


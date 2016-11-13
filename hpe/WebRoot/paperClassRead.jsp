<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
        .table-double{
            width: 50%;
            float: left;
        }
        .admin-main{
            padding-top: 0;
        }
        .isexamed0{
            opacity: 0;
        }
        #table1{
            border-right:2px gainsboro solid;
        }
        #chargeAll{
            width: 100px;
            margin:50px auto;
            text-align: center;
            display: block;
            font-weight: bold;
            background-color: #5eb95e;
            color:white;
            font-size: 1em;
            border-radius: 5px;
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
                <div class="am-fl am-cf"><strong class="am-text-primary" style="font-size: 2em;">考试人数</strong></div>
            </div>

            <hr>
            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form">
                        <table id="table1" class="am-table am-table-striped am-table-hover table-main table-double">
                        <thead>
                        <tr >
                            <th >ID</th>
                            <th >姓名</th>
                            <th >查看</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var='stu' items='${stuList}' begin='0' end='${size-1}'>
                            <tr>
                                <td>${stu.sno}</td>
                                <td>${stu.sname}</td>
                                <td>
                               <a href="ShowPaperServlet?paperno=${ecm.paperNo}&examno=${ecm.examNo}&op1=first&sno=${stu.sno}&classid=${ecm.classid}">查看试卷</a>  
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                        <table class="am-table am-table-striped am-table-hover table-main table-double">
                            <thead>
                            <tr >
                                <th >ID</th>
                                <th >姓名</th>
                                <th >查看</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var='stu' items='${stuList}' begin='${size}'>
                            <tr>
                                 <td>${stu.sno}</td>
                                <td>${stu.sname}</td>
                                <td>
                                  <a href="ShowPaperServlet?paperno=${ecm.paperNo}&examno=${ecm.examNo}&op1=first&sno=${stu.sno}&classid=${ecm.classid}">查看试卷</a>  
                                
                                </td>

                            </tr>
                        </c:forEach>
                            </tbody>
                        </table>
                    </form>
                    </hr>
                        <div style="clear:both;">
                            共 <span id=totalsize>${number}</span> 条记录

                        </div>
                        <div>
                        <%-- <a href="ChargeServlet?paperno=${ecm.paperNo}&examno=${ecm.examNo}&op1=first&classid=${ecm.classid}"> --%>
                            <a href="ChargeServlet?paperno=${ecm.paperNo}&examno=${ecm.examNo}&op1=first&classid=${ecm.classid}"><input id="chargeAll" class="am-btn am-btn-xs subbtn" type="button"  value="批改试卷"/>
                        	</a>
                        </div>
                        
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

<a href="#"  class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>

</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script>

</script>
</body>
</html>


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
    <title>试题增加</title>
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
    	.essayQuestion{
            display: none;
            margin:0;
            padding:0;
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">题库增加</strong></div>
            </div>

            <hr>
            <div class="am-g">
                <div class="am-u-sm-12">
                        <div id="addSubjectForm" align="center"><!--录入试题表单-->
                <form action="QuestionServlet" method="post" id="questionADD">
                	<input type="hidden" value="ADD" name="op">
                    <table border="0" cellspacing="10" cellpadding="10">
                        <tr>
                            <td>试题类型：</td>
                            <td>
                                <select name="questiontype" id="questiontype" onchange="showDiffPage(this)">
                                    <c:forEach var="qt" items="${QUESTIONTYPE}">
										<option class="questionType" value="${qt.typeId }">${qt.typeName }</option>
									</c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>课程:</td>
                            <td>
                                <select name="subject" id="subject">
									<c:forEach var="si" items="${SUBJECTINFO}">
										<option class="subject" value="${si.subjectId }">${si.subjectName }</option>
									</c:forEach>
								</select>
                            </td>
                        </tr>
                        <tr>
                            <td>章节:</td>
                            <td>
                                <select name="endSection" id="endSection">
									<c:forEach var="sec" items="${SECTIONS}">
										<option class="endSection" value="${sec.sectionId }">${sec.sectionName }</option>
									</c:forEach>
								</select>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">试题题目:</td>
                            <td><textarea name="subjectTitle" id="subjectTitle" cols="76" rows="3"></textarea></td>
                        </tr>
                        <tr class="multiAnswer">
                            <td>选项A:</td>
                            <td><input type="text" name="questionA" id="questionA" size="20" ></td>
                        </tr>
                        <tr class="multiAnswer">
                            <td>选项B:</td>
                            <td><input type="text" name="questionB" id="questionB" size="20" ></td>
                        </tr>
                        <tr class="multiAnswer">
                            <td>选项C:</td>
                            <td><input type="text" name="questionC" id="questionC" size="20" ></td>
                        </tr>
                        <tr class="multiAnswer">
                            <td>选项D:</td>
                            <td><input type="text" name="questionD" id="questionD" size="20" ></td>
                        </tr>
                        <tr>
                            <td valign="top">答案:</td>
                            <td class="multiQuestion">
                                <input class="rightanswer" name="rightanswer" type="radio" value="A" checked>A
                                <input class="rightanswer" name="rightanswer" type="radio" value="B">B
                                <input class="rightanswer" name="rightanswer" type="radio" value="C">C
                                <input class="rightanswer" name="rightanswer" type="radio" value="D">D
                            </td>
                            <td class="essayQuestion">
                                <textarea class="rightanswer" name="essayRightanswer" id="rightanswer" cols="76" rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>难度等级:</td>
                            <td>
                                <select name="questionlevel" id="questionlevel">
                                    <c:forEach var="qi" items="${QUESTIONINFO}">
										<option class="levelType" value="${qi.levelId }">${qi.levelName }</option>
									</c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>分值:</td>
                            <td><input type="text" name="questionmark" id="questionmark"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><div align="center">
                                <input type="button" value="录入" onclick="checkAll()">
                                <input type="reset" value="重置">
                            </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
                        
                        <hr />
                </div>

            </div>
        </div>

        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>

    </div>
    <!-- content end -->
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
    <hr>
    <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
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
    function showDiffPage(obj){
        var multiQuestion=document.getElementsByClassName("multiQuestion");
        var essayQuestion=document.getElementsByClassName("essayQuestion");
        var multiAnswer=document.getElementsByClassName("multiAnswer");
        var questionTypeValue=obj.value;
        if(questionTypeValue==1||questionTypeValue==2){
            for(var i = 0;i<multiQuestion.length;i++){
                multiQuestion[i].style.display="inline";
            }
            for(var i = 0;i<multiAnswer.length;i++){
                multiAnswer[i].style.display="table-row";
            }
            for(var i = 0;i<essayQuestion.length;i++){
                essayQuestion[i].style.display="none";
            }
        }
        if(questionTypeValue==3||questionTypeValue==4){
            for(var i = 0;i<multiQuestion.length;i++){
                multiQuestion[i].style.display="none";
            }
            for(var i = 0;i<multiAnswer.length;i++){
                multiAnswer[i].style.display="none";
            }
            for(var i = 0;i<essayQuestion.length;i++){
                essayQuestion[i].style.display="inline-block";
            }
        }
        if(questionTypeValue==1){
            var objChoose=document.getElementsByClassName("rightanswer");
            for(var i = 0;i<objChoose.length;i++){
                objChoose[i].type="radio";
            }
        }
        if(questionTypeValue==2){
            var objChoose=document.getElementsByClassName("rightanswer");
            for(var i = 0;i<objChoose.length;i++){
                objChoose[i].type="checkbox";
            }
        }
    }
    
    function checkAll(){
        var subjectTitle=$("#subjectTitle").val();
        var questionA=$("#questionA").val();
        var questionB=$("#questionB").val();
        var questionC=$("#questionC").val();
        var questionD=$("#questionD").val();
        var rightanswer=$(".rightanswer").val();
        var rightanswer2=$("#rightanswer").val();
        var questionmark=$("#questionmark").val();
        var questionTypeValue=$("#questiontype").val();
        var reg=/^\d{1,2}$/
        if(questionTypeValue==1||questionTypeValue==2){
            if(subjectTitle==null||subjectTitle.length==0){
                alert("请输入试题题目");
                return;
            }
            else if(questionA==null||questionA.length==0){
                alert("请输入选项A");
                return;
            }
            else if(questionB==null||questionB.length==0){
                alert("请输入选项B");
                return;
            }
            else if(questionC==null||questionC.length==0){
                alert("请输入选项C");
                return;
            }
            else if(questionD==null||questionD.length==0){
                alert("请输入选项D");
                return;
            }
            else if(rightanswer==null||rightanswer.length==0){
                alert("请输入正确答案");
                return;
            }
            else if(questionmark==null||questionmark.length==0){
                alert("请输入试题分值");
                return;
            }
            else if(!reg.test(questionmark)){
                alert("试题分值为两位数字");
            }
            else{
                $("#questionADD").submit();
            }
        }
        else{
            if(subjectTitle==null||subjectTitle.length==0){
                alert("请输入试题题目");
                return;
            }
            else if(rightanswer2==null||rightanswer2.length==0){
                alert("请输入正确答案");
                return;
            }
            else if(questionmark==null||questionmark.length==0){
                alert("请输入试题分值");
                return;
            }
            else if(!reg.test(questionmark)){
                alert("试题分值为两位数字");
            }
            else{
                $("#questionADD").submit();
            }
        }
    }
</script>
</body>
</html>


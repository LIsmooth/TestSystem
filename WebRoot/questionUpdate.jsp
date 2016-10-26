<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>试题添加页面</title>
    <style type="text/css">

        .essayQuestion{
            display: none;
        }

    </style>
    <meta charset="utf-8">
    <link href="images/skin.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-2.1.4.js"></script>
</head>
<body>
<c:set var="EQ" value="${ESSAYQUESTION}"></c:set>
<c:set var="MQ" value="${MULTIQUESTION}"></c:set>
<c:set var="PageBean1" value="${PageBean1}"></c:set>
 
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
        <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
            <tr>
                <td height="31"><div class="titlebt">录入试题</div></td>
            </tr>
        </table></td>
        <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
    </tr>
    <tr>
        <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="53%" valign="top">&nbsp;</td>
            </tr>
            <tr>
                <td valign="middle"><span class="left_txt">
			<div id="addSubjectForm" align="center"><!--录入试题表单-->
                <form action="QuestionServlet" method="post" id="questionADD">
                	<input type="hidden" value="ADD" name="op">
                    <table border="0" cellspacing="10" cellpadding="0">
                        <tr>
                            <td>试题类型：</td>
                            <td>
                                <select name="questiontype" id="questiontype" onchange="showDiffPage(this)">
                                    <option value="1">单选题</option>
                                    <option value="2">多选题</option>
                                    <option value="3">问答题</option>
                                    <option value="4">编程题</option>
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
                                <textarea class="rightanswer" name="rightanswer" id="rightanswer" cols="76" rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>难度等级:</td>
                            <td>
                                <select name="questionlevel" id="questionlevel">
                                    <option value="1">容易</option>
                                    <option value="2">中等</option>
                                    <option value="3">困难</option>
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
                </td>
            </tr>
        </table></td>
        <td background="images/mail_rightbg.gif">&nbsp;</td>
    </tr>
    <tr>
        <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
        <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
        <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
    </tr>
</table>
<iframe id="footer"  src="footer.jsp" width="100%" height="40px" frameborder="0" scrolling="no" ></iframe>
</body>
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
</html>
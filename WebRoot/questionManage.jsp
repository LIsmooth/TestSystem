<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>试题管理页面</title>
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
		background-color: #EEF2FB;
	}
	#manageSubject table  td{
		font-size:12px;
	}
	-->
	</style>
	<link href="images/skin.css" rel="stylesheet" type="text/css">
  </head>
<body>
<c:set var="PageBean1" value="${PageBean1}"></c:set>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif">
    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">管理试题</div></td>
      </tr>
    </table>
    </td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="53%" valign="top">&nbsp;</td>
      </tr>
      <tr valign="middle" style="float:left" align="center">
      	<form action="QuestionServlet" method="post">
      		<input type="hidden" value="getQues" name="op">
			<td><label for="subject">科目</label>
			<select name="subject" id="subject">
				<option class="subject" value="0">全部课程</option>
				<c:forEach var="si" items="${SUBJECTINFO}">
					<option class="subject" value="${si.subjectId }">${si.subjectName }</option>
				</c:forEach>
			</select>
			</td>
			<td>
			<label for="endSection">章节</label>
			<select name="endSection" id="endSection">
				<option value="0">全部章节</option>
				<c:forEach var="sec" items="${SECTIONS}">
					<option class="endSection" value="${sec.sectionId }">${sec.sectionName }</option>
				</c:forEach>
			</select>
			</td>
			<td>
			<label for="questionType">题型</label>
			<select name="questionType" id="questionType">
				<option class="questionType" value="0">全部题型</option>
				<c:forEach var="qt" items="${QUESTIONTYPE}">
					<option class="questionType" value="${qt.typeId }">${qt.typeName }</option>
				</c:forEach>
			</select>
			</td>
			<td><label for="levelType">难度等级</label>
			<select name="levelType" id="levelType">
				<option value="0">所有等级</option>
				<c:forEach var="qi" items="${QUESTIONINFO}">
					<option class="levelType" value="${qi.levelId }">${qi.levelName }</option>
				</c:forEach>
			</select>
			</td>
			<td><input type="submit" value="查询"></td>
			<td><input type="reset" value="重置"></td>
      	</form>
      </tr>
      <tr valign="middle" style="float:right;" align="center">
      	<form action="QuestionServlet" id="questionTitleForm" method="post">
      		<input type="hidden" value="FIND" name="op">
      		<td><input type="text" name="questionTitle" id="questionTitle"></td>
      		<td><input type="button" value="搜索" onclick="checkTitle()"></td>
      	</form>
      </tr>
      <tr>
        <td valign="middle"><span class="left_txt">
			<div id="manageSubject" align="center"><!--管理试题-->
			<table width="95%" cellspacing="10">
				  <tr align="center">
					<td>试题编号</td>
					<td>试题标题</td>
					<td>试题选项</td>
					<td>正确答案</td>
					<td>难度等级</td>
					<td>试题分值</td>
					<td>管理试题</td>
				  </tr>
				  <c:if test="${PageBean1 != null}">
				  <c:forEach var="mq" items="${PageBean1.result}">
				  	<c:if test="${LIMIT.question_type=='0'||LIMIT.question_type=='1'||LIMIT.question_type=='2'}">
				  	 <tr align="center">
							<td>${mq.questionno }</td>
							<td>${mq.question}</td>
							<td>
								<table>
								<tr><td>A:${mq.questionA}&nbsp;&nbsp;&nbsp;</td><td>B:${mq.questionA}</td></tr>
								<tr><td>C:${mq.questionC}&nbsp;&nbsp;&nbsp;</td><td>D:${mq.questionD}</td></tr>
								</table>
							</td>
							<td>${mq.rightanswer }</td>
							<td><c:if test="${mq.questionlevel==1 }">容易</c:if>
								<c:if test="${mq.questionlevel==2 }">中等</c:if>
								<c:if test="${mq.questionlevel==3 }">困难</c:if>
							</td>
							<td>${mq.questionmark}</td>
							<td><a href="QuestionServlet?op=LOOK&questionno=${mq.questionno }&questiontype=${mq.ismultiple}">查看</a>
								<a href="QuestionServlet?op=UPD&questionno=${mq.questionno }&questiontype=${mq.ismultiple}">更新</a>
								<a onclick="sureDel(${mq.questionno },${mq.ismultiple })">删除</a>
							</td>
					  </tr>
					  </c:if>
					  <c:if test="${LIMIT.question_type=='3'||LIMIT.question_type=='4'}">
					  <tr align="center">
							<td>${mq.questionno }</td>
							<td>${mq.question}</td>
							<td>
								无
							</td>
							<td>${mq.rightanswer }</td>
							<td>
								<c:if test="${mq.questionlevel==1 }">容易</c:if>
								<c:if test="${mq.questionlevel==2 }">中等</c:if>
								<c:if test="${mq.questionlevel==3 }">困难</c:if>
							</td>
							<td>${mq.questionmark}</td>
							<td><a href="QuestionServlet?op=LOOK&questionno=${mq.questionno }&questiontype=${mq.isessay}">查看</a>
								<a href="QuestionServlet?op=LOOK&questionno=${mq.questionno }&questiontype=${mq.isessay}">更新</a>
								<a onclick="sureDel(${mq.questionno },${mq.isessay })">删除</a>
							</td>
					  </tr>
					  </c:if>
				  </c:forEach>
				  </c:if>
				  <tr>
				  	<td colspan="6" align="center">
				  		共${PageBean1.totalSize}条纪录，当前第${PageBean1.currentPage}/${PageBean1.totalPage}页，每页${PageBean1.perPageRows}条纪录&nbsp;
				  		<a href="QuestionServlet?op=getQues&cpage=1">首页</a>&nbsp;
						<a href="QuestionServlet?op=getQues&cpage=${PageBean1.currentPage-1}">上一页</a>&nbsp;
						<a href="QuestionServlet?op=getQues&cpage=${PageBean1.currentPage+1}">下一页</a>&nbsp;
						<a href="QuestionServlet?op=getQues&cpage=${PageBean1.totalPage}">尾页</a>&nbsp;
				  	</td>
				  </tr>	  
			</table>	
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
</body>
<script type="text/javascript">
window.onload=function(){
  		var subject=document.getElementsByClassName("subject");
  		var endSection=document.getElementsByClassName("endSection");
  		var questionType=document.getElementsByClassName("questionType");
  		var levelType=document.getElementsByClassName("levelType");
  		var str1="${LIMIT.subject_id }";
  		var str2="${LIMIT.end_section }";
  		var str3="${LIMIT.question_type }";
  		var str4="${LIMIT.level_type }";
  		for(var i=0;i<subject.length;i++){
  			if(subject[i].value==str1){
  				subject[i].selected=true;
  			
  			}
  		}
  		for(var i=0;i<endSection.length;i++){
  			if(endSection[i].value==str2){
  				endSection[i].selected=true;
  			}
  		}
  		for(var i=0;i<questionType.length;i++){
  			if(questionType[i].value==str3){
  				questionType[i].selected=true;
  			}
  		}
  		for(var i=0;i<levelType.length;i++){
  			if(levelType[i].value==str4){
  				levelType[i].selected=true;
  			}
  		}
  	}
  	function sureDel(questionno,questionType){
  		var r=confirm("确定要删除吗？");
  		if(r)
	  	{
	     location.href='QuestionServlet?op=DEL&questionno='+questionno+'&questiontype='+questionType;
	  	}
  	}
  	
  	function checkTitle(){
  		var obj = document.getElementById("questionTitle").value;
  		if(obj==null||obj.length==0){
  			alert("请输入搜索内容");
  		}
  		else{
  			document.getElementById("questionTitleForm").submit();
  		}
  	}
 </script>
</html>

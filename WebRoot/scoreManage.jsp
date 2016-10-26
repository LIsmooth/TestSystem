<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>成绩管理页面</title>
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

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif">
    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">成绩报表</div></td>
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
      	<form action="ScoreServlet" method="post">
      		<input type="hidden" value="getScore" name="op">
			<td><label for="subject">科目</label>
			<select name="subject" id="subject">
				<option class="subject" value="0">全部课程</option>
				<c:forEach var="si" items="${SUBJECTINFO}">
					<option class="subject" value="${si.subjectId }">${si.subjectName }</option>
				</c:forEach>
			</select>
			</td>
			<td>
			<label for="className">班级</label>
			<select name="className" id="className">
				<option value="-1">全部班级</option>
				<c:forEach var="cla" items="${CLASSINFO}">
					<option class="classInfo" value="${cla.classId }">${cla.className }</option>
				</c:forEach>
			</select>
			</td>
			<td>
			<label for="scoreOrder">平均分排序</label>
			<select name="scoreOrder" id="scoreOrder">
				<option class="scoreOrder" value="0">不排序</option>
				<option class="scoreOrder" value="1">升序</option>
				<option class="scoreOrder" value="2">降序</option>
			</select>
			</td>
			<td><input type="submit" value="查询"></td>
			<td><input type="reset" value="重置"></td>
      	</form>
      </tr>
      <tr valign="middle" style="float:right;" align="center">
      	<form action="ScoreServlet" id="FindStudentId">
      		<input type="hidden" value="FIND" name="op">
      		<td><input type="text" name="studentId" id="studentId"></td>
      		<td><input type="button" value="搜索" onclick="checkID()"></td>
      	</form>
      </tr>
      <tr>
        <td valign="middle"><span class="left_txt">
			<div id="manageSubject" align="center"><!--管理试题-->
			<table width="95%" cellspacing="10">
				  <tr align="center">
					<td>科目</td>
					<td>班级</td>
					<td>平均分</td>
					<td>最高分</td>
					<td>最低分</td>
					<td>查看</td>
				  </tr>
				  <c:forEach var="cs" items="${CLASSSCORE}">
				  	 <tr align="center">
							<td>
							<c:forEach var="si" items="${SUBJECTINFO}">
								<c:if test="${cs.subjectId==si.subjectId }">
									${si.subjectName }
								</c:if>
							</c:forEach>
							</td>
							<td>
							<c:forEach var="cla" items="${CLASSINFO}">
								<c:if test="${cs.classId==cla.classId }">
									${cla.className  }
								</c:if>
							</c:forEach>
							</td>
							<td>${cs.avgScore }</td>
							<td>${cs.maxScore }</td>
							<td>${cs.minScore }</td>
							<td>
								<a href="ScoreServlet?op=LOOK&classid=${cs.classId}&subjectid=${cs.subjectId}">查看</a>
							</td>
					  </tr>
				  </c:forEach>

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
  		reg=/^\d{5}$/;
  		if(reg.test(obj)){
  			document.getElementById("FindStudentId").submit();
  		}
  		else{
  			alert("学生ID为5为数字");
  		}
  	}
 </script>
</html>

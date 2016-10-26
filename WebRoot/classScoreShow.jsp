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
      
      <tr>
        <td valign="middle"><span class="left_txt">
			<div id="manageSubject" align="center"><!--管理试题-->
			<table width="95%" cellspacing="10">
				  <tr align="center">
					<td>学号</td>
					<td>姓名</td>
					<td>班级</td>
					<td>科目</td>
					<td>成绩</td>
				  </tr>
				  <c:forEach var="tss" items="${THISCLASSSCORE.result}">
				  	 <tr align="center">
							<td>${tss.sno }</td>
							<td>${tss.sname }</td>
							<td>
								<c:forEach var="cla" items="${CLASSINFO}">
									<c:if test="${tss.classId==cla.classId }">
										${cla.className  }
									</c:if>
								</c:forEach>
							</td>
							<td>
								<c:forEach var="si" items="${SUBJECTINFO}">
									<c:if test="${tss.subjectId==si.subjectId }">
										${si.subjectName  }
									</c:if>
								</c:forEach>
							</td>
							<td>${tss.score }</td>
					  </tr>
				  </c:forEach>
				  <tr>
				  	<td colspan="5" align="center">不及格人数:${TOTALCLASSSCORE[0] },&nbsp;&nbsp;60~70的人数:${TOTALCLASSSCORE[1] }</td>
				  </tr>
				  <tr>
				  	<td colspan="5" align="center">70~80人数:${TOTALCLASSSCORE[2] },&nbsp;&nbsp;80~90的人数:${TOTALCLASSSCORE[3] }</td>
				  </tr>
				  <tr>
				  	<td colspan="5" align="center">90~100人数:${TOTALCLASSSCORE[4] }</td>
				  </tr>
					<tr>
				  		<td colspan="5" align="center">
				  		共${THISCLASSSCORE.totalSize}条纪录，当前第${THISCLASSSCORE.currentPage}/${THISCLASSSCORE.totalPage}页，每页${THISCLASSSCORE.perPageRows}条纪录&nbsp;
				  		<a href="ScoreServlet?op=LOOK&cpage=1">首页</a>&nbsp;&nbsp;
						<a href="ScoreServlet?op=LOOK&cpage=${THISCLASSSCORE.currentPage-1}">上一页</a>&nbsp;&nbsp;
						<a href="ScoreServlet?op=LOOK&cpage=${THISCLASSSCORE.currentPage+1}">下一页</a>&nbsp;&nbsp;
						<a href="ScoreServlet?op=LOOK&cpage=${THISCLASSSCORE.totalPage}">尾页</a>&nbsp;&nbsp;
				  		<a href="scoreManage.jsp"><div>返回</div></a>
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

</html>

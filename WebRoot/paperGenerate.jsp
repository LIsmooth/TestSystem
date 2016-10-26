<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Generate</title>
    <meta name="description" content="这是一个form页面">
    <meta name="keywords" content="form">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">
    <script src="js/jquery-2.1.4.js"></script>
</head>
<style>
    *{
        margin:0;
        border:0;
        font-family:"Segoe UI","Lucida Grande",Helvetica,Arial,"Microsoft YaHei",FreeSans,Arimo,"Droid Sans","wenquanyi micro hei","Hiragino Sans GB","Hiragino Sans GB W3",FontAwesome,sans-serif;;
        color: #333;

    }
    body{
    	overflow:scroll;
    }
    .content{
        margin: 20px 30px;
    }
    .questiondiv{
        margin:20px 0px;
        font-size: 0.9em;
    }
    .questiondiv span{
        display: block;
        white-space: pre;
    }
    .questiondiv>div{
    	height:30px;
    }
    .modifybtn{
    	display:inline;
        float:right;
        width: 65px;
        line-height: 24px;
        text-align: center;
        font-weight: bold;
        background-color:  #65aad3;
        color:white;
        font-size: 1em;
        font-weight: lighter;
        border-radius: 5px;
    }
    .modifybtn:hover{
        background-color: #68bfea;
    }

    .question{
    	width:50%;
    	
    }
    .subbtn{
        width: 100px;
        text-align: center;
        font-weight: bold;
        background-color: #5eb95e;
        color:white;
        font-size: 1em;
        border-radius: 5px;
    }
</style>
<body>
<form id="form1" action="" method="post">
	<input type="hidden" name="function" value="2"/>
    <div class="content">
    <h4>一：单选题</h4>
    <c:forEach var="q" items="${paper.multiList}"> 
    <div class="questiondiv">
        <span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span>
        <input type="button" class="modifybtn" value="编辑"/>
        <span>A：${q.questionA}</span>
        <span>B：${q.questionB}</span>
        <span>C：${q.questionC}</span>
        <span>D：${q.questionD}</span>
    </div> 
   </c:forEach>
   
   <%int flag=0; %>
   <h4>二：问答题</h4>
   <c:forEach var="q" items="${paper.essayList}">
   <div class="questiondiv" >
   		<c:if test="${q.isessay eq '3'}"> 
   			<span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span>
        	<input type="button" class="modifybtn" value="编辑"/>
        	<%++flag;%>
        </c:if>
   </div> 
   </c:forEach>
   
   <h4>三：编程题</h4>
 	<c:forEach var="q" items="${paper.essayList}" begin="<%=flag%>">
   <div class="questiondiv">
   			<span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span>
        	<input type="button" class="modifybtn" value="编辑"/>
   </div> 
   </c:forEach>
   
   <%-- <c:forEach var="q" items="${paper.essayList}" begin="<%=flag%>">
   <div class="questiondiv">
   			<span class="question">${q.inpaperno}.&nbsp;${q.question}</span>
        	<input type="button" class="modifybtn" value="编辑"/>
   </div> 
   </c:forEach> --%>
   
    <div>
        <input class="am-btn am-btn-xs subbtn" type="button" onclick="redirect(1)" value="保存试卷"/>
        <input class="am-btn am-btn-xs subbtn" style="background-color: #e46865" type="button" onclick="redirect(0)" value="取消"/>
    </div>
    </div>
 </form>
 <script>
	function redirect(num){
		num="PaperGenerateServlet?function=2&isUpload="+num;
		document.getElementById("form1").action=num;
		document.getElementById("form1").submit();
	}
	
 </script>
</body>
</html>
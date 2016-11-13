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
    .modifybtn,.choosebtn{
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
    .modifybtn:hover,.choosebtn:hover{
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
    
    .modifydiv{
        display: none;
        position: fixed;
        width:100%;
        height:100%;
        margin:auto;
        left: 0;
        right:0;
        bottom: 0;
        top:0;
    }
    .backdiv{
        width:100%;
        height:100%;
        background-color: #009cda;
        opacity: 0.2;
    }
    .quesdiv{
        background-color: white;
        color: black;
        position: fixed;
        width:90%;
        height:100%;
        margin:auto;
        left: 0;
        right:0;
        bottom: 0;
        top:0;
        overflow: scroll;
    }
    .quesdiv .questiondiv{
    	margin:34px;
    }
    .bottombar{
        height: 30px;
        margin: 10px auto;
        width: 65px;
    }
    .multimarks,.essaymarks,.progmarks{
        float:right;
        width: 65px;
        margin:0 20px;
        text-align: center;
        font-weight: bold;
        color:#333;
        font-size: 1em;
        font-weight: lighter;
        border:2px solid #65aad3 ;
        border-radius: 5px;
    }
    .allmultimark{
        width:100px;
        height:25px;
        margin:0 20px;
        text-align: center;
        font-weight: bold;
        color:#333;
        font-size: 13px;
        font-weight: lighter;
        border:2px solid #65aad3 ;
        border-radius: 5px;
    }
    .quesmarks{
        position: fixed;
        width:400px;
        height:40px;
        left: 50%;
        margin-left:-200px;
        border-radius: 10px;
        line-height: 40px;
        padding: 0 20px;
        color:white;
    }
    .rightmark{
    	background-color: #00aff1;
    }
    .wrongmark{
    	background-color: #e46865;
    }
    #quesmarks span{
        color:white;
    }
</style>
<body>
<div id="modifydiv" class="modifydiv">
    <div id="backdiv"class="backdiv"></div>
    <div id="quesdiv" class="quesdiv">
<%--         <div class="questiondiv">
            <span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span>
            <input type="button" class="modifybtn" value="选择"/>
        </div> --%>
    </div>
</div>
<div id="quesmarks" class="quesmarks rightmark">
<span>选择题：</span>
    <span id="totalm"></span>
    <span>+问答题：</span>
    <span id="totale"></span>
    <span>+编程题：</span>
    <span id="totalp"></span>
    <span>=</span>
    <span id="totalq"></span>
</div>
<form id="form1" action="" method="post">
	<input type="hidden" name="function" value="2"/>
	<input type="hidden" id="pageHide" value="1"/>
	<input type="hidden" id="qInfo" value=""/>
	<input type="hidden" id="isSaved" value="${sessionScope.isSaved}"/>
	<input type="hidden" id="isNew" value="${paper.paperno}"/>
    <div class="content">
    <h4>一：单选题
    <input type="number" min="1" max="100" id="allmultxt" placeholder="选择题分值" class="allmultimark" >
    	
    </h4>
    <c:forEach var="q" items="${paper.multiList}"> 
    <div class="questiondiv">
        <span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span>
        <input type="button" class="modifybtn" qinfo="type=${q.ismultiple}&qinno=${q.inpaperno}" value="替换"/>
        <input type="number" id="qinno${q.inpaperno}" min="1" max="100" placeholder="分值" class="multimarks" value="${q.questionmark}">
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
        	<input type="button" class="modifybtn" qinfo="type=${q.isessay}&qinno=${q.inpaperno}" value="替换"/>
        	<input type="number" id="qinno${q.inpaperno}" min="1" max="100" placeholder="分值" class="essaymarks" value="${q.questionmark}">
        	
        	<%++flag;%>
        </c:if>
   </div> 
   </c:forEach>
   
   <h4>三：编程题</h4>
 	<c:forEach var="q" items="${paper.essayList}" begin="<%=flag%>">
   <div class="questiondiv">
   			<span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span>
        	<input type="button" class="modifybtn" qinfo="type=${q.isessay}&qinno=${q.inpaperno}" value="替换"/>
        	<input type="number" id="qinno${q.inpaperno}" min="1" max="100" placeholder="分值" class="progmarks" value="${q.questionmark}">
        	
   </div> 
   </c:forEach>
   
   <%-- <c:forEach var="q" items="${paper.essayList}" begin="<%=flag%>">
   <div class="questiondiv">
   			<span class="question">${q.inpaperno}.&nbsp;${q.question}</span>
        	<input type="button" class="modifybtn" value="替换"/>
   </div> 
   </c:forEach> --%>
   
    <div>
        <input class="am-btn am-btn-xs subbtn" id="subbtn" type="button" onclick="redirect(${param.isUpload}${isUpload})" value="保存试卷"/>
        <input class="am-btn am-btn-xs subbtn" style="background-color: #e46865" type="button" onclick="window.history.back(-1)" value="取消"/>
    </div>
    </div>
 </form>
 <script>
 	$(function(){
 		if(${paper.paperno!=null}){
 		$.ajax({
 			url:"PaperGenerateServlet?function=3",
 			type:"post",
 			data:"paperno="+${paper.paperno},
 			success:function(msg){
 				if(msg==1){
 					$("#subbtn").val("试卷已用于考试 不可修改").attr("disabled","true").css("width","220px");
 					$(".modifybtn").css("display","none");
 					$(".multimarks").attr("disabled","true");
 					$(".essaymarks").attr("disabled","true");
 					$(".progmarks").attr("disabled","true");
 					$("#allmultxt").css("display","none");
 				}
 			},
 			error:function(r, s, e) {
				alert("出错了==" + r.status + "---" + s + "---" + e);
			}
 		});
 	}
 	});
	function redirect(num){
		if($("#totalq").html()==100){
			$("#isSaved").val("2");//如有修改退出提醒
			num="PaperGenerateServlet?function=2&isUpload="+num;
			document.getElementById("form1").action=num;
			document.getElementById("form1").submit();
		}
			
		else{
			alert("卷面总分有误，需为100分！");
		}
			
		
	}
	
 </script>
 <script src="js/papergenePage.js"></script>
</body>
</html>
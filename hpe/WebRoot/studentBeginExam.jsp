<%@ page language="java" import="java.util.*,cn.hpe.po.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HPE在线考试系统</title>
  <meta name="keywords" content="index">
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
    
    body{
    	overflow:scroll;
    	width:95%;
    	float:right;
    }
    *{
        margin:0;
        border:0;
        font-family:"Segoe UI","Lucida Grande",Helvetica,Arial,"Microsoft YaHei",FreeSans,Arimo,"Droid Sans","wenquanyi micro hei","Hiragino Sans GB","Hiragino Sans GB W3",FontAwesome,sans-serif;;
        color: #333;

    }
    .content{
        margin: 20px 30px;
    }
    .questiondiv{
        margin:20px 0px;
        font-size: 1.1em;
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
    #tim{
        weith:100px;
        height:40px;
        margin-left:75%;
        position:fixed;
        color:red;
        font-size:25px;
    }
</style>

 <script>
    window.setInterval(function(){ 
    	var examtotaltime=${suTotaltime}*60;
   	    var exambeginsec=${exambeginsec};
    	var examendsec=examtotaltime+exambeginsec;
		var examno=${suExamno};
		var shengyusec=0;
		$.ajax({
			url :'StudentCheckExamServlet?examno=' + examno,
			type : "post",
			success : function(v) {
			    if(v=='考试已结束'){
			        $("#leaveexam").val(1);
					document.getElementById('mystudentform').submit();
				}
			}
		}),
		$.ajax({
			url :'ExamCountDownServlet',
			type : "post",
			success : function(v) {
			    shengyusec=examendsec-v;
			    
			    var s=shengyusec % 60;//剩余秒数
			    if(s<10){
			        s='0'+s;
			    }
			    var m=(shengyusec-s)/60;//剩余分钟
			    document.getElementById('tim').innerHTML="剩余 "+m+":"+s;
			    if(shengyusec==0){
			    
			         $("#leaveexam").val(1);
			    	 document.getElementById('mystudentform').submit();
			    }
			}
		})
    }, 1000
    ); 	
	function btnsubmit(){
	    if(window.confirm("确定交卷吗？")){
	        $("#leaveexam").val(1);
            document.getElementById('mystudentform').submit();
        }
	};
	
	window.onbeforeunload=function(){
	    
		if($("#leaveexam").val()==0){
	        	return '正在考试，确认退出？(退出视为缺考)';
	    }
	}
</script>
<body>
<div>
 <div align="center">
 <h1>${p.papername}</h2>
 </div>
 <div id="tim">
    
    </div>
<form action="StudentServlet" method="post" id="mystudentform">
<input name="op" type="hidden" value="answersubmit">
<input name="paperno" type="hidden" value="${p.paperno}">
<input id="leaveexam" type="hidden" value="0">
  <div>
   <h4>一：选择题</h4>
   <c:forEach var="q" items="${p.multiList}"> 
       <div class="questiondiv">
        <span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span><br/>
        <c:if test="${q.ismultiple==1 }">
        <input type="radio" name="${q.inpaperno}" value="A" >A：${q.questionA}<br/>
        <input type="radio" name="${q.inpaperno}" value="B" >B：${q.questionB}<br/>
        <input type="radio" name="${q.inpaperno}" value="C" >C：${q.questionC}<br/>
        <input type="radio" name="${q.inpaperno}" value="D" >D：${q.questionD}<br/>
        </c:if>  
        <c:if test="${q.ismultiple==2 }">
        <input type="checkbox" name="${q.inpaperno}" value="A" >A：${q.questionA}<br/>
        <input type="checkbox" name="${q.inpaperno}" value="B" >B：${q.questionB}<br/>
        <input type="checkbox" name="${q.inpaperno}" value="C" >C：${q.questionC}<br/>
        <input type="checkbox" name="${q.inpaperno}" value="D" >D：${q.questionD}<br/>
        </c:if>
        </div>
   </c:forEach>
  </div>

   <br/>
   <div>
   <%int flag=0;%>
   <h4>二：问答题</h4>
   <c:forEach var="q" items="${p.essayList}">
   <div>
   		<c:if test="${q.isessay eq '3'}"> 
   			<span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span><br/>
   			<textarea name="essay${q.inpaperno}" id="" cols="140" rows="5" style="font-size: 10px;border: groove" maxlength="50000"></textarea>
   			
        	<%++flag;%>
        </c:if> 
         </div> 
   </c:forEach>
  </div>
  <br/>
  <br/>
  <div>
   <h4>三：编程题</h4>
 	<c:forEach var="q" items="${p.essayList}" begin="<%=flag%>">
 	<br>
   	<span class="question" style="display:inline;">${q.inpaperno}.&nbsp;${q.question}</span><br/>
        <textarea name="essay${q.inpaperno}" id="" cols="140" rows="5" style="font-size: 10px;border: groove" maxlength="50000"></textarea><br/>
   </c:forEach>
  </div> 
 
    
    <br>
    <div align="center">
      <input type="button" onclick="btnsubmit()" value="交卷"/>
    </div>
    <br>
    <br>
</form>
</div>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
<script type="text/javascript">
	document.body.onselectstart=document.body.oncontextmenu=function(){return false;}
</script>
</html>

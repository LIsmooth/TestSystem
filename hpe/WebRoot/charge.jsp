<%@page import="cn.hpe.po.Paper"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> 1111111</title>
    
	 
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

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
        display: block ;
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
    .answer{
    color:red;
    }
    .mark{
    display:inline;
    color:red;
    }
    h4{
    display:inline;
    }
    #score{
    float:right;
   
    
    }
    #sno{
    float:right;
   
    }
    #charge{
    display:inline;
    margin-left:500px;
    position:fixed;
    }
    .btn{
    border-radius:5px;
    width:90px;
    height:50px;
    }
    #end{
    margin-left:400px;
    }
    .myanswer{
    display:inline;
    color:blue;
    }
   	.questiondiv input:not([type="text"]){
   	border: 1px solid #333;
   	}
   	span{
   	width:100px;
   	}
   	.manswer{
   	display:inline;
   	color:blue;
   	}
   
   	
   	
   	
   	
</style>
  
  <body style="overflow:scroll,margin-left:10px" >
  
  <form action="SumServlet" method="post" id="form1">
  
  <input type="hidden" id="charged" value="<%=session.getAttribute("charged")%>"/>
  
   <input type="hidden" id="fscore" value="<%=session.getAttribute("fscore")==null?0:(Integer)session.getAttribute("fscore")%>"/>
  
  <input type="hidden" name="op" value="sum"/>
 <h4>一：单选题</h4>   <div class="mark">&nbsp;&nbsp;每道题${type1}分</div> <div id="charge"></dir><div id="score"><h4>成绩：</h4>     <input type="text" id="myscore" disabled="disabled" value="<%=session.getAttribute("sum")==null?0:(Integer)session.getAttribute("sum")%>"/>  </div>
<div id="sno"> <h4>考生姓名：</h4><%=session.getAttribute("sname") %>&nbsp;&nbsp;</div></div>
 <%int i=0; %>
  <%List<?> answer=(List<?>)session.getAttribute("answer");
 List<?> getMarkList=(List<?>)session.getAttribute("getMarkList");
  %>
 
 <c:forEach var="q" items="${paper.multiList}"> 
    <div class="questiondiv">
        <span class="question" style="display:inline;"><% out.print(++i); %>.&nbsp;${q.question}</span>
        <span>A：${q.questionA}</span>
        <span>B：${q.questionB}</span>
        <span>C：${q.questionC}</span>
        <span>D：${q.questionD}</span>
         学生答案：<%out.print(answer.get(i-1)); %>   
        <span class="answer">标准答案：${q.rightanswer}</span>
          学生得分：<input type="text" class="score" disabled="disabled" value="<%out.print(getMarkList.get(i-1)); %>" /> 
    </div> 
   </c:forEach>
   <%int flag=0; %>
     <%session.setAttribute("qid", i); %>
 <h4>二：问答题</h4> <div class="mark">&nbsp;&nbsp;每道题${type3}分</div>
 <c:forEach var="q" items="${paper.essayList}">
   <div class="questiondiv" >
  
   		<c:if test="${q.isessay eq '3'}"> 
   			<span class="question" style="display:inline;"><% out.print(++i); %>.&nbsp;${q.question} 
        	<%++flag;%>
      
        	 <div >学生答案：  <%out.print(answer.get(i-1)); %></div>   
        <span class="answer">参考答案：${q.rightanswer}</span>
<div class="manswer">本题打分:</div><input type="number" id="wenda"  name="wenda" class="essay"/>
学生得分:<input type="text" class="score" disabled="disabled" value="<%out.print(getMarkList.get(i-1)); %>" />
        </c:if>
         
       
       
   </div> 
   </c:forEach>
 <h4>三：编程题</h4> <div class="mark">&nbsp;&nbsp;每道题${type4}分</div>
 <c:forEach var="q" items="${paper.essayList}" begin="<%=flag%>">
   <div class="questiondiv">
   			<span class="question" style="display:inline;"><% out.print(++i); %>.&nbsp;${q.question}</span> 
   			  <div>学生答案： <%out.print(answer.get(i-1)); %></div>
   			        
        <span class="answer">参考答案：${q.rightanswer}</span>
<div class="manswer">本题打分:</div><input type="number"   id="biancheng" name="biancheng" class="essay"/></br>
学生得分:<input type="text" class="score" disabled="disabled" value="<%out.print(getMarkList.get(i-1)); %>" />
   </div> 
   </c:forEach>
   <div id="end">
 <input type="button"  id="tijiao" class="btn" value="阅卷" onclick="submitTheForm()"/>&nbsp;&nbsp;&nbsp;&nbsp; 
 <input type="button" class="btn" value="下一份" onclick="next()"/></div>
  </form>
  
  </body>
  <script>
  $(function(){
  var sum=0;
  var fscore;
  fscore=$("#fscore").val();
   
  if(fscore!=0){
   
   $("#tijiao").attr("disabled","disabled");
  }
  
  $(".score").each(function(){
  sum+=$(this).val()/1;
  
  })
  if($("#myscore").val()==0){
   $("#myscore").val(sum);
  }
 
  
  var charged=$("#charged").val();
   
  if(charged==0){
  $("#tijiao").attr("disabled","disabled");
  $("#tijiao").val("已阅");

  }
  else{
  }
  
 
  })  
  

  function submitTheForm(){
  var flag=0;
  	$(".essay").each(function(){
  	    
  		if($(this).val()==""){
  			alert("还有未给分试题，请给分！");
  			flag=1;
  			return false;
  		}  		
  	});
  	if(flag==0){			
    	$("#form1").submit(); 
  	}
  }
  function next(){
  $("#form1").attr("action","ChargeServlet?op=next&paperno=<%=session.getAttribute("paperno")%>&examno=<%=session.getAttribute("examno")%>&classid=<%=session.getAttribute("classid")%>");
  $("#form1").submit();
  <%session.setAttribute("fscore", 0);%>
  
  }
  
  </script>
   
</html>

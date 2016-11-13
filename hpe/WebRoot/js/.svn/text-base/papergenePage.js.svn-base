$(function() {
	window.onbeforeunload=function(){
		if($("#isSaved").val()==1){
			return "are you sure?";
		}
	};
	modifyQuestion = function(more) {
		$("#modifydiv").css("display","block");
		var page=1;
		var qinfo;
		if(more==1){
			qinfo=$("#qInfo").val();
			$("#bottombar").remove();
			$("#pageHide").val($("#pageHide").val()-0+1);
		}
		else qinfo=$(this).attr("qinfo");
		page=$("#pageHide").val();
		$.ajax({
			url : 'PaperGenerateServlet?function=4',
			type : 'post',
			data:'page='+page+"&"+qinfo,
			dataType : "json",
			success : function(msg) {
				if(msg!="]"){
					$("#qInfo").val(qinfo);
					for(var i=0;i<msg.length;++i){
						var strhtml="<div class='questiondiv'>"+
								"<span class='question' style='display:inline;'>"+
								msg[i].qno+".&nbsp;"+msg[i].question+"</span>"+
								"<input type='button' id='q"+msg[i].qno+"' class='choosebtn' value='选择'/></div>";
						$("#quesdiv").append(strhtml);
					}
					$(".choosebtn").each(function() {
						$(this).click(addQuestion);
					});
					$("#quesdiv").append("<div id='bottombar' class='bottombar'><a onclick='modifyQuestion(1)'> 显示更多</a></div>");
				}
			},
			error : function(r, s, e) {
				if(r.status!=200)
				alert("出错了==" + r.status + "---" + s + "---" + e);
			}
		});
	};
	// 关闭modifydiv
	closeModifydiv = function() {
		$("#modifydiv").css("display", "none");
		$("#pageHide").val("1");
		$("#quesdiv").html("");
	};
	
	// 添加按钮事件
	addQuestion=function(){
		var qno=$(this).attr("id").substr(1);
		var qinfo=$("#qInfo").val();
		var isNew=$("#isNew").val()==0?1:2;
		$("#isSaved").val("2");//如有修改退出提醒
		$.ajax({
			url : 'PaperGenerateServlet?function=5',
			type : 'post',
			data:'qno='+qno+"&"+qinfo,
			dataType : "json",
			success : function(msg) {
				closeModifydiv();
				window.location.href="paperGenerate.jsp?isUpload="+isNew;
				
			},
			error : function(r, s, e) {
				alert("出错了==" + r.status + "---" + s + "---" + e);
			}
		});
	};
	
	// 点击空白地方关闭
	$("#backdiv").click(closeModifydiv);
	// 添加按钮触发closemodifydiv//不能用
	//$(".choosebtn").live("click",closeModifydiv);

	$(".modifybtn").each(function() {
		$(this).click(modifyQuestion);
	});
	//修改分数ajax
	setMark=function(){
		var qinno=$(this).attr("id").substr(5);
		var mark=$(this).val();
		if(mark>100||mark<1)
			alert("分值有误，请修改");
		else {
			$.ajax({
				url:'PaperGenerateServlet?function=6',
				data:'qinno='+qinno+'&mark='+mark,
				type:'post',
				error:function(r,s,e){
					alert("出错了==" + r.status + "---" + s + "---" + e);
				}
			});
		}
	};
	countMark=function(){    			//分数栏
		var totalm=0;
		var totale=0;
		var totalp=0;
		var totalq=0;
		$(".multimarks").each(function(){
			totalm+=($(this).val()-0);
		});
		$(".essaymarks").each(function(){
			totale+=($(this).val()-0);
		});
		$(".progmarks").each(function(){
			totalp+=($(this).val()-0);
		});
		totalq=totalm+totale+totalp;
		if(totalq==100){
			$("#quesmarks").removeClass("wrongmark");
			$("#quesmarks").addClass("rightmark");
		}else{
			$("#quesmarks").addClass("wrongmark");
			$("#quesmarks").removeClass("rightmark");
		}
		$("#totalm").html(totalm);
		$("#totale").html(totale);
		$("#totalp").html(totalp);
		$("#totalq").html(totalq);		
	}
	setMultiMarks=function(){
		var mark=$(this).val();
		if(mark>100||mark<1)
			alert("分值有误，请修改");
		else {
			$.ajax({
				url:'PaperGenerateServlet?function=7',
				data:'mark='+mark,
				type:'post',
				error:function(r,s,e){
					alert("出错了==" + r.status + "---" + s + "---" + e);
				}
			});
		}
	};
	setMultiInput=function(){
		var mark=$("#allmultxt").val();
		$(".multimarks").each(function(){
			$(this).val(mark);
		});
		countMark();
	};
	countMark();
	$(".multimarks").blur(setMark).change(countMark);//easy way for class tag
	$(".essaymarks").blur(setMark).change(countMark);
	$(".progmarks").blur(setMark).change(countMark);
	$("#allmultxt").blur(setMultiMarks).change(setMultiInput);
});

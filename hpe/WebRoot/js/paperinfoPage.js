$(function() {
	$.ajax({
		url : 'PaperInfoServlet?function=0',
		type : 'post',
		dataType : "json",
		success : function(msg) {
			$("#subjectid").html("<option value=\"-1\">--请选择--</option>");
			for (var i = 0; i < msg.length; i++) {
				var strhtml = "<option value=" + msg[i].value + ">"
						+ msg[i].name + "<option>";
				$("#subjectid").append(strhtml);
			}	
		},
		error : function(r, s, e) {
			alert("出错了==" + r.status + "---" + s + "---" + e);
		}
	});
	$("#subjectid").change(
			function() {
				var subjectid = this.value;
				$.ajax({
					url : 'PaperInfoServlet?function=1',
					data : "subjectid=" + subjectid,
					type : 'post',
					dataType : "json",
					success : function(msg) {
						$("#beginsec").html("<option value=\"0\">--请选择--</option>");
						for (var i = 0; i < msg.length; i++) {
							var strhtml = "<option value="+msg[i].value+">"+(i+1)+"."+ msg[i].name + "</option>";
							$("#beginsec").append(strhtml);
						}
						$("#endsec").html("<option value=\"0\">--请选择--</option>");
						for (var i = 0; i < msg.length; i++) {
							var strhtml = "<option value="+msg[i].value+">"+(i+1)+"."+ msg[i].name + "</option>";
							$("#endsec").append(strhtml);
						}
					},
					error : function(r, s, e) {
						$("#beginsec").html("<option value=\"0\">--请选择--</option>");
						$("#endsec").html("<option value=\"0\">--请选择--</option>");
					}
				});
});

	
	 changeSec=function(){
		if(this.value=="")
			this.value=0;
		var subjectid=$("#subjectid").val();
		var degree=0;
		$(".degreetype").each(function(){
			if(this.checked){
				degree=this.value;
			}
		});
		if(subjectid==-1){
			return;
		}
		var beginsec=$("#beginsec").val();
		var endsec=$("#endsec").val();
		$.ajax({
			url : 'PaperInfoServlet?function=4',
			type : 'post',
			data:"beginsec="+beginsec+"&endsec="+endsec+"&subjectid="+subjectid+"&degree="+degree,
			success : function(msg) {
				
				var num=msg.split(",");

				
				var multinum=parseInt($("#multinum").val());
				var essaynum=parseInt($("#essaynum").val());
				var programnum=parseInt($("#programnum").val());
				if(multinum>num[0]||essaynum>num[1]||programnum>num[2]){
					$("#checkmsg").removeClass("rightmsg");
					$("#checkmsg").addClass("wrongmsg");
					$("#checkmsg").html("题库中符合当前类型的题数目不足，选择题："+num[0]+" 问答题："+num[1]+" 编程题："+num[2]);
				}
				else{
					$("#checkmsg").addClass("rightmsg");
					$("#checkmsg").removeClass("wrongmsg");
				}		
			},
			error : function(r, s, e) {
				alert("出错了==" + r.status + "---" + s + "---" + e);
			}
	});
};
	$("#beginsec").change(changeSec);
	$("#endsec").change(changeSec);
	$(".degreetype").each(function(){
		$(this).parent().change(changeSec);
	});
	$("#multinum").change(changeSec);
	$("#essaynum").change(changeSec);
	$("#programnum").change(changeSec);
	$("#subjectid").change(changeSec);
	
	$("#subbtn").click(function(){
		if($("#subjectid").val()==-1){
			$("#checkmsg").removeClass("rightmsg");
			$("#checkmsg").addClass("wrongmsg");
			$("#checkmsg").html("请选择科目");
		}
		else{
			changeSec();				
			var isOK=$(".wrongmsg").length;	
			if(isOK==0){
				if($("#endsec").val()==0){
					$("#beginsec").val("0");
					var endsec=$("#endsec").children();
					$("#endsec").val(endsec.length-1);
				}
				$("#form1").submit();
		}
	}
	});
});

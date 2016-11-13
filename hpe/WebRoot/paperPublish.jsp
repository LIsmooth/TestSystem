<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Amaze UI Admin form Examples</title>
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
  <script src="js/jquery-1.8.3.js"></script>
  <style>
        .admin-main{
			padding-top: 0;
		}
    </style>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->



<div class="am-cf admin-main">


<!-- content start -->
<div class="admin-content">
  <div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
     	<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">考试发布</strong></div>
    </div>

    <hr>

    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">考试发布</a></li>
      </ul>
      <form action="ExamServlet" method="post" id="ExamPUB">
      <input type="hidden" name="op" value="PUB">
      <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">考试科目</div>
            <div class="am-u-sm-8 am-u-md-10">
              <select data-am-selected="{btnSize: 'sm'}" name="subject" id="subject" onchange="checkPaperNo()">
                <c:forEach var="si" items="${SUBJECTINFO}">
					<option class="subject" value="${si.subjectId }">${si.subjectName }</option>
				</c:forEach>
              </select>
            </div>
          </div>

          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">试卷编号</div>
            <div class="am-u-sm-8 am-u-md-10">
              <div class="am-btn-group" data-am-button>
                  <input type="text" name="paperId" id="paperId" onchange="checkPaperNo()">
                  <div style="display:inline;color:red" id="paperIdError"></div>
              </div>
            </div>
          </div>

	<div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">适应班级</div>
            <div class="am-u-sm-8 am-u-md-10">
              <div class="am-btn-group" data-am-button>
				<select name="className" multiple="multiple" size="6" id="className" style="font-size:7px;width:100px;">
					<c:forEach var="cla" items="${CLASSINFO}">
						<option class="classInfo" value="${cla.classId }">${cla.className }</option>
					</c:forEach>
				</select>
              </div>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">考试时长</div>
            <div class="am-u-sm-8 am-u-md-10">
              <div class="am-btn-group" data-am-button>
                <input type="text" name="totalTime" id="totalTime">
              </div>
            </div>
          </div>

          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              考试日期
            </div>
            <div class="am-u-sm-8 am-u-md-10">
              <div class="am-form-group am-form-icon">
                <i class="am-icon-calendar"></i>
                <input type="datetime-local" id="examTime" name="examTime" class="am-form-field am-input-sm" style="width: 200px" placeholder="时间">
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>

    <div class="am-margin">
      <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="checkAll()">发布考试</button>
      <input type="reset" class="am-btn am-btn-primary am-btn-xs" value="取消发布">
    </div>
    </form>
  </div>
  <footer class="admin-content-footer">
    <hr>
    <p class="am-padding-left">© 2016 hpe.</p>
  </footer>
</div>
<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
  <hr>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script type="text/javascript">

	function checkPaperNo() {
		var paperId = $("#paperId").val();
		var subjectId = $("#subject").val();
		$.ajax({
			url : 'PaperUserServlet?paperId=' + paperId+'&subjectId='+subjectId,
			type : "post",
			success : function(v) {
				//alert(v);
				$("#paperIdError").html(v);
			}
		})
	}

	function checkForm() {
		var paperId = $("#paperId").val();
		var subjectId = $("#subject").val();
		$.ajax({
			url : 'PaperUserServlet?paperId=' + paperId+'&subjectId='+subjectId,
			type : "post",
			success : function(v) {
				if (v == '试卷已用于考试,请重新输入') {
					$("#paperIdError").html(v);
				}
				else if(v == '该科目试卷编号不存在') {
					$("#paperIdError").html(v);
				}
				else
				{
					$("#ExamPUB").submit();
				}
			}
		})
	}

	function checkAll(){
		var paperId=$("#paperId").val();
		var classids=$("#className").val();
		var totalTime=$("#totalTime").val();
		var examTime=$("#examTime").val();
		var reg=/^\d{1,}$/;
		 if(paperId==null||paperId.length==0){
                alert("请输入试卷编号!");
                return;
            }
            else if(!reg.test(paperId)){
                alert("试卷编号为数字!");
                return;
            }
            else if(classids==null||classids.length==0){
            	alert("请选择适应班级!");
                return;
            }
            else if(totalTime==null||totalTime.length==0){
                alert("请输入考试时长!");
                return;
            }
            else if(!reg.test(totalTime)){
                alert("考试时长为数字!");
                return;
            }
            else if(examTime==null||examTime.length==0){
                alert("请选择考试日期!");
                return;
            }
            else{
                checkForm();
            }
	}
</script>	
</body>
</html>

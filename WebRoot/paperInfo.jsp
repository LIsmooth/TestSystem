<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/admin.css">
<script src="js/jquery-2.1.4.js"></script>
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
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">生成试卷</strong>
					</div>
				</div>

				<hr>
				<form action="PaperGenerateServlet" method="post">
				<input type="hidden" name="function" value="1"/>
					<div class="am-tabs am-margin" data-am-tabs>
						<ul id="paperInfo" class="am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#">试卷信息</a></li>
							<li><a href="#">详细描述</a></li>
							<li><a href="#">备注</a></li>
						</ul>

						<div class="am-tabs-bd" style="overflow: visible">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">

								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-2 am-text-right">考试科目</div>
									<div class="am-u-sm-8 am-u-md-10">
										<select id="subjectid" name="subjectid" data-am-selected="{btnSize: 'sm'}">
											<option value="null">--请选择--</option>
										</select>
									</div>
								</div>

								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-2 am-text-right">试题难度</div>
									<div class="am-u-sm-8 am-u-md-10">
										<div class="am-btn-group" data-am-button>
											<label class="am-btn am-btn-default am-btn-xs"> <input
												type="radio" name="degreetype" id="option1" value="1">
												简单
											</label> <label class="am-btn am-btn-default am-btn-xs"> <input
												type="radio" name="degreetype" id="option2" value="2">
												正常
											</label> <label class="am-btn am-btn-default am-btn-xs"> <input
												type="radio" name="degreetype" id="option3" value="3">
												困难
											</label>
										</div>
									</div>
								</div>

								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-2 am-text-right">考试章节</div>
									<div class="am-u-sm-8 am-u-md-10">
										<select id="beginsec" name="beginsec" width="20px" length="5">
											<option value="null">--请选择--</option>
										</select> <span>至</span> <select id="endsec" name="endsec" width="20px">
											<option value="null">--请选择--</option>
										</select>
									</div>
								</div>


							</div>

							<div class="am-tab-panel am-fade" id="tab2">
								<span class="am-form">

									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">选择题个数</div>
										<div class="am-u-sm-8 am-u-md-4">
											<input type="text" name="multinum" class="am-input-sm"
												value="20">
										</div>
										<div class="am-hide-sm-only am-u-md-6"></div>
									</div>

									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">问答题个数</div>
										<div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
											<input type="text" name="essaynum" class="am-input-sm"
												value="2">
										</div>
									</div>

									<div class="am-g am-margin-top">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">编程题个数</div>
										<div class="am-u-sm-8 am-u-md-4">
											<input type="text" name="programnum" class="am-input-sm"
												value="2">
										</div>
										<div class="am-hide-sm-only am-u-md-6"></div>
									</div>


								</span>
							</div>

							<div class="am-tab-panel am-fade" id="tab3">
								<span class="am-form">
									<div class="am-g am-margin-top-sm">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">卷子标题</div>
										<div class="am-u-sm-8 am-u-md-4 am-u-end">
											<input type="text" name="papername" class="am-input-sm">
										</div>
									</div>

									<div class="am-g am-margin-top-sm">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">卷子备注</div>
										<div class="am-u-sm-8 am-u-md-4 am-u-end">
											<textarea name="remark" rows="4"></textarea>
										</div>
									</div>
								</span>
							</div>
						</div>

					</div>
					<div class="am-margin">
						<button type="submit" class="am-btn am-btn-primary">生成试卷</button>
					</div>
				</form>

			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed
					under MIT license.</p>
			</footer>
		</div>
		<!-- content end -->

	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

	<footer>
		<hr>
		<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under
			MIT license.</p>
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
	<script>
		$(function() {
			$.ajax({
				url : 'PaperInfoServlet?function=0',
				type : 'post',
				dataType : "json",
				success : function(msg) {
					$("#subjectid").html("<option value=\"null\">--请选择--</option>");
					for (i = 0; i < msg.length; i++) {
						var strhtml = "<option value="+msg[i].value+">"
								+ msg[i].name + "<option>";
						$("#subjectid").append(strhtml);
					}
				},
				error : function(r, s, e) {
					alert("出错了==" + r.status + "---" + s + "---" + e);
				}
			})
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
							$("#beginsec").html("<option value=\"null\">--请选择--</option>");
							for (i = 0; i < msg.length; i++) {
								var strhtml = "<option value="+msg[i].value+">"+(i+1)+"."+ msg[i].name + "</option>";
								$("#beginsec").append(strhtml);
							}
							$("#endsec").html("<option value=\"null\">--请选择--</option>");
							for (i = 0; i < msg.length; i++) {
								var strhtml = "<option value="+msg[i].value+">"+(i+1)+"."+ msg[i].name + "</option>";
								$("#endsec").append(strhtml);
							}
						},
						error : function(r, s, e) {
							$("#beginsec").html("<option value=\"null\">--请选择--</option>");
							$("#endsec").html("<option value=\"null\">--请选择--</option>");
						}
					})

				});
	</script>
</body>

</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>试卷修改</title>
    <meta name="description" content="这是一个 table 页面">
    <meta name="keywords" content="table">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">
    <script src="js/jquery-2.1.4.js"></script>
    <style>
    	.degree0{
    		background-color: orange;
    	}
        .degree1{
            background-color: #69cb74;
        }
        .degree2{
            background-color: #eeeb3d;
        }
        .degree3{
            background-color: #f55435;
        }
        .degree{
            display:inline-block;
            width:10px;
            height: 10px;
            margin: 0 17px;
        }
        tr th:nth-child(2){
            width:44px;
            text-align: center;
        }
		.admin-main{
	padding-top: 0;
}
.isexamed0{
            opacity: 0;
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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">试卷管理</strong></div>
            </div>

            <hr>
		<form action="PaperCheckServlet" method=post>
            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" class="am-btn am-btn-default" onclick="window.location.href='PaperInfoServlet?function=3'"><span class="am-icon-plus"></span> 新增</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-form-group">
                        <select id="subjectid" name="subjectid" data-am-selected="{btnSize: 'sm'}">
                            <option value="0">所有科目</option>
                        </select>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-input-group am-input-group-sm">
                        <input type="text" name="limit" class="am-form-field"  placeholder="ID、标题、出题人">
          <span class="am-input-group-btn">
            <input class="am-btn am-btn-default"  type="submit" onclick="" value="搜索"/>
          </span>
                    </div>
                </div>
            </div>
			</form>
            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th class="table-check"><input id="cball" type="checkbox" onchange="a"/></th>
                                <th>难度</th>
                                <th class="table-id">ID</th>
                                <th class="table-title">标题</th>
                                <th class="table-type">科目</th>
                                <th>考试章节</th>
                                <th class="table-author am-hide-sm-only">出题人</th>
                                <th class="table-date am-hide-sm-only">生成日期</th>
                                <th class="table-set">操作</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var='paper' items="${paperList}">
                            <tr>
                                <td><input type="checkbox" class="ischeckbox" name="papercb" value="${paper.paperno}"/></td>
                                <td><span class="iseasy degree degree${paper.paperDegree}"></span></td>
                                <td>${paper.paperno}</td>
                                <td><a href="PaperCheckServlet?function=2&paperno=${paper.paperno}">${paper.papername}</a></td>
                                <td>${paper.subjectId}</td>
                                <td>${paper.startSection}---${paper.endSection}</td>
                                <td class="am-hide-sm-only">${paper.tno}</td>
                                <td class="am-hide-sm-only"><fmt:formatDate value='${paper.generateDate}' pattern='yyyy年MM月dd日 HH:mm:ss'/></td>
                                <td style="width: 220px;">
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-hide-sm-only" remark="${paper.remark}" onclick="getRemark(this)"><span class="am-icon-copy"></span>提示</button>
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" value="${paper.paperno}" onclick="viewPaper(this)"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only deletebtn" value="${paper.paperno}"><span class="am-icon-trash-o"></span> 删除</button>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="isexamed${paper.isExamed}">已考</span></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="am-cf">
                            共 <span id=totalsize>${PageBean1.totalSize}</span> 条记录
                            <div class="am-fr">
                                <ul class="am-pagination">
                                    <li class="${PageBean1.currentPage=='1'?'am-disabled':''}"><a href="PaperCheckServlet?function=1&currentPage=${PageBean1.currentPage-1}">«</a></li>
                                        
										<c:set var="c" value="${PageBean1.currentPage}"/>
 										<c:set var="t" value="${PageBean1.totalPage}"/>
                                    	<c:forEach var="item" varStatus="status" begin="${c>3?((c+2)>t?(t-4):(c-2)):1}" end="${(c+2)>t?t:(c>3?(c+2):5)}">
                                    	<c:if test="${status.index==PageBean1.currentPage}">
                                    		<li class="am-active"><a href="PaperCheckServlet?function=1&currentPage=${status.index}">${status.index}</a></li>
                                    	</c:if>
                                    	<c:if test="${status.index!=PageBean1.currentPage}">
                                    		<li><a href="PaperCheckServlet?function=1&currentPage=${status.index}">${status.index}</a></li>
                                    	</c:if>
                                    	</c:forEach>                    

                                    
                                    <li class="${PageBean1.currentPage==PageBean1.totalPage?'am-disabled':''}">
                                    <a href="PaperCheckServlet?function=1&currentPage=${PageBean1.currentPage+1}">»</a></li>
                                </ul>
                            </div>
                        </div>
                        <hr />
                        <p>注：<span class="iseasy degree degree0"></span>随机
                        	<span class="iseasy degree degree1"></span>简单
                        	<span class="iseasy degree degree2"></span>正常
                        	<span class="iseasy degree degree3"></span>困难
                        </p>
                    </form>
                </div>

            </div>
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

</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
<script>
function getRemark(txt){
    var remark=txt.getAttribute("remark");
    alert(remark);
}

function viewPaper(btn){	
	window.location.href="PaperCheckServlet?function=2&paperno="+btn.value;
}
    $(function(){
    	
    	$.ajax({
			url : 'PaperInfoServlet?function=0',
			type : 'post',
			dataType : "json",
			success : function(msg) {
				$("#subjectid").html("<option value=\"0\">所有科目</option>");
				for (var i = 0; i < msg.length; i++) {
					var strhtml = "<option value="+msg[i].value+">"
							+ msg[i].name + "<option>";
					$("#subjectid").append(strhtml);
				}
			},
			error : function(r, s, e) {
				alert("出错了==" + r.status + "---" + s + "---" + e);
			}
		});
  /*   	$("#subjectid").change(
				function() {
					var subjectid = this.value;
					$.ajax({
						url : 'PaperCheckServlet?function=2',
						data : "subjectid=" + subjectid,
						type : 'post',
						dataType : "json",
						success : function(msg) {
							
						},
						error : function(r, s, e) {

						}
					})

				}); */
        $("#cball").change(function(){
            var ischeck=this.checked;
            $(".ischeckbox").each(function(){
                this.checked=ischeck;
                //alert($(this).attr('checked'));
            });
        });
        $(".deletebtn").each(function(){
            $(this).click(function(){
            	var paperno=this.value;
            	$.ajax({
         			url:"PaperGenerateServlet?function=3",
         			type:"post",
         			data:"paperno="+paperno,
         			success:function(msg){
         				if(msg!=1){
         					if(confirm("删除后不可恢复，确认删除？")){
         	                    $.ajax({
         							url : 'PaperCheckServlet?function=3',
         							data : "paperno=" + paperno,
         							type : 'post',
         							dataType : "json",
         							success : function(msg) {
         								var s=$("#totalsize").text();
         								$("#totalsize").text(s-1);
         								window.location.reload();
         							},
         							error : function(r, s, e) {
         								alert("fail");
         							}
         						});
         	                    
         	                }
         				}
         				else{
         					alert("试卷已被用于考试，不能删除");
         				}
         			},
         			error:function(r, s, e) {
        				alert("出错了==" + r.status + "---" + s + "---" + e);
        			}
         		});
            	
                
       		 });
        });
    });
</script>
</body>
</html>


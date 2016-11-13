<%@ page language="java" import="java.util.*,cn.hpe.po.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HPE在线考试系统</title>
  <meta name="description" content="这是一个 index 页面">
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
  <style >
      .a{
          list-style:none;
          margin-top:30px;
          
      }
      #firstli{
          margin-top:90px;
      }
      .btn{
          margin-left:50px;
      }
      #footp{
          margin-left:0px;
          margin-top: 136px;
          position:fixed;
      }
  </style>
</head>
<script type="text/javascript">
	function querenxiugai(){
	var reg=/^[a-zA-Z0-9_]{6,16}$/;
	var oldpwd=${student.spwd};
	var pwd=$("#pwd").val();
	var pwd1=$("#pwd1").val();
	var pwd2=$("#pwd2").val();
		if(pwd==null||pwd.length==0){
			alert("请输入原密码");
			return;
		}else if(pwd1==null||pwd1.length==0){
			alert("请输入新密码");
			return;
		}else if(pwd2==null||pwd2.length==0){
			alert("请输入确认密码");
			return;
		}else if(reg.test(pwd1)==false){
			alert("新密码不符合规则");
			return;
		}else if(reg.test(pwd2)==false){
			alert("确认密码不符合规则");
			return;
		}else if(pwd!=oldpwd){
			alert("原密码输入错误");
			return;
		}else if(pwd==pwd1){
			alert("新密码与原密码相同");
			return;
		}else if(pwd1!=pwd2){
			alert("两次密码输入不一致");
			return;
		}else{		
		    if(window.confirm("确定修改密码吗？")){
            	document.getElementById('changepwdform').submit();
            }				    
        }
	}
</script>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，本系统暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <small>修改密码</small>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="StudentServlet?op=index">主界面</a></li>
        <li><a href="StudentServlet?op=begin">开始考试</a></li>
        <li><a href="StudentServlet?op=showhistory">查看历史成绩</a></li>               
        <li><a href="StudentServlet?op=changepwd">密码修改</a></li>
        <li><a href="StudentServlet?op=exit">退出系统</a></li>
      </ul>

    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content" >
     <div class="admin-content-body">
     <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">修改密码</strong></div>
      </div>
      
       <div class="am-g">
        <div class="am-u-sm-12">
        
     <div align="center">
		<form action="StudentServlet" method="post" id="changepwdform">
		<input name="op" type="hidden" value="change">
		
        <ul>
            <li class="a" id="firstli"><div id="firstdiv"></div></li>
            <li class="a" >
                                             输入原密码：<input name="pwd" type="text" placeholder="原密码" id="pwd"/></li>
            <li class="a">输入新密码：<input name="pwd1" type="text" placeholder="密码长度6-16位" id="pwd1"/></li>
            <li class="a">确认新密码：<input name="pwd2" type="text" placeholder="必须与新密码一致" id="pwd2"/></li>
            <li class="a" id="btn">
                
                <input type="button" value="确认" class="btn" onclick="querenxiugai()"/>
                <input type="reset" value="重置" class="btn" />
                <a href="StudentServlet?op=index">
                <input type="button" value="返回" class="btn" /></a>
            </li>
        </ul> 
        
        </form>
        </div>
     </div>
     </div>
    <footer class="admin-content-footer" id="footp">
      <hr/>
      <p class="am-padding-left">© 2016 hpe</p>
    </footer>
   </div>
  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

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
</body>
</html>

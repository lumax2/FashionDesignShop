<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<title>欢迎登陆FashionDesignShop</title>
	<link href="/staticfile/css/bootstrap/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="/staticfile/css/bootstrap/animate.css" rel="stylesheet" media="screen">
	<link href="/staticfile/css/bootstrap/css-index-orange.css" rel="stylesheet" media="screen">
	<script type="text/javascript" src="/staticfile/js/jquery-1.4.2.js"></script>
	<script type="text/javascript">
	$(function(){
		$("input[name=username]").blur(function(){
			var val = $(this).val();
			if(!formObj.checkNull("username","用户名不能为空")){
				$("#username_msg").html("用户名不能为空");
			}else{
				
				$.ajax({  
	                type:"POST",  
	                url:"/tocheckname.action",  
	                dataType:"json",  
	                data:{username:val},  
	                success:function(data){
	                   if(true==data){
							$("#username_msg").html("用户名已存在");
						}else if(false==data){
							$("#username_msg").html("<font color='green'>用户名可用</font>");
						}
	                },  
	                error:function(data){  
	                        alert("方法执行不成功!");  
	                    }    
	                 });  
			}
			
		});
		
		var formObj={
				
				checkNull:function(name){
					var value=$("input[name="+name+"]").val();
					if($.trim(value)==""){
						return false;
					}
					return true;
				}
				
			};	
	});
	</script>
</head>
<body data-spy="scroll" data-target="#navbar-scroll">

<div id="preloader"></div>
<div id="top"></div>

<div class="fullscreen landing parallax" style="background-image:url('/staticfile/images/login/loginBG.jpg');" data-img-width="1000" data-img-height="500" data-diff="100">
	<div class="overlay">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<br/>
					<div class="logo wow fadeInDown"></div>
					<br/>
						<h1 class="wow fadeInLeft">
						Fashion Design Shop<br/>欢 迎 您
						</h1>	
						<br/><br/>  

					<div class="head-btn wow fadeInLeft">
						<a href="/home.action" class="btn-primary">主页</a>
						<a href="/toLogin.action" class="btn-default">登录</a>
					</div>
				</div> 
				
				<div class="col-md-5">
				
					<div class="signup-header wow fadeInUp">
						<h3 class="form-title text-center">欢 迎 光 临 FDS</h3>
						<form class="form-header" action="${app}/createuser.action" role="form" method="POST" id="#">
							<div class="form-group">
								<input class="form-control input-lg" name="username" id="name" type="text" placeholder="您要注册的用户名" required>
								<span id="username_msg" style="color:red">${requestScope.username_msg}</span>
							</div>
							<div class="form-group">
								<input class="form-control input-lg" name="password" id="password" type="password" placeholder="您要设置的密码" required>
								<span style="color:red">${requestScope.password_msg }</span>
							</div>
							<div class="form-group">
								<input class="form-control input-lg" name="name" id="name" type="text" placeholder="您的真实姓名" required>
								<span style="color:red">${requestScope.name_msg }</span>
							</div>
							<div class="form-group">
								<input class="form-control input-lg" name="telephone" id="name" type="text" placeholder="您的联系方式" required>
								<span style="color:red">${requestScope.telephone_msg }</span>
							</div>
							<p><font size="4PX" style="font-weight:900; " color="red">${errorInfo }</font></p>
							<div class="form-group last">
								<input type="submit" class="btn btn-warning btn-block btn-lg" value="注册">
							</div>
							<p class="privacy text-center">FDS 您私人的成衣订制大师</p>
						</form>
					</div>				
				</div>
			</div>
		</div> 
	</div> 
</div>

    <script src="/staticfile/js/bootstrap/jquery.js"></script>
    <script src="/staticfile/js/bootstrap/bootstrap.min.js"></script>
    <script src="/staticfile/js/bootstrap/custom.js"></script>
    <script src="/staticfile/js/bootstrap/jquery.sticky.js"></script>
	<script src="/staticfile/js/bootstrap/wow.min.js"></script>
	<script src="/staticfile/js/bootstrap/owl.carousel.min.js"></script>
	<script>
		new WOW().init();
	</script>
  </body>
</html>

   
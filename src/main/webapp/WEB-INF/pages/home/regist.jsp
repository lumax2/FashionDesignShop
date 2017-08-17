<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${app}/staticfile/css/regist.css"/>
	<title>欢迎注册FashionDesignShop</title>
	<script type="text/javascript" src="${app}/staticfile/js/jquery-1.4.2.js"></script>
	<script type="text/javascript">
	$(function(){
		var uname = "${cookie.remname.value }";
		$("#username").val(decodeURI(uname));
	});
	</script>
</head>
<body>
	<h1>欢迎注册FashionDesignShop</h1>
	<form action="${app}/createuser.action" method="post">
		<table>
			<tr>
				<td class="tdx">用户名：</td>
				<td><input type="text" id="username" name="username" value=""/>
					<span style="color:red">${requestScope.username_msg}</span>
				</td>
			</tr>
			<tr>
				<td class="tdx">密&nbsp;&nbsp; 码：</td>
				<td><input type="password" name="password"/>
				<span style="color:red">${requestScope.password_msg }</span>
				</td>
			</tr>
			<tr>
				<td class="tdx">真实姓名：</td>
				<td><input type="text" name="name"/>
				<span style="color:red">${requestScope.name_msg }</span>
				</td>
			</tr>
			<tr>
				<td class="tdx">电话：</td>
				<td><input type="text" name="telephone"/>
				<span style="color:red">${requestScope.telephone_msg }</span>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align:center">
					<input type="submit" value="注册"  />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span style="color:red">${msg}</span>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>

   
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="${ctx}/staticfile/css/bootstrap/bootstrap_cart.css" rel="stylesheet" type="text/css" media="all" />
<script src="${ctx}/staticfile/js/bootstrap/jquery_cart.min.js"></script>
<link href="${ctx}/staticfile/css/bootstrap/style_cart.css" rel="stylesheet" type="text/css" media="all" />	
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${ctx}/staticfile/css/bootstrap/memenu_cart.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu_cart.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="${ctx}/staticfile/js/bootstrap/simpleCart.min.js"> </script>
<link href="${ctx}/staticfile/css/cart.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${ctx}/staticfile/js/jquery-1.6.2.js"></script>
<script language="javascript" src="${ctx}/staticfile/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		$(".del").click(function(){
			if(confirm("确定删除吗?")){
				var id = $(this).parent().find("input[class=buyNum]").attr("id");
				window.location.href="/cart/deleteCart.action?productId="+id;
			}
		});
		
		$(".buyNum").blur(function(){
			var buyNum = $(this).val();
			var oldNum = $(this).next().next().val();
			var id = $(this).attr("id");
			var reg = /^[1-9][0-9]*$/;
			if(buyNum<=0){
				window.location.href="/cart/deleteCart.action?productId="+id;
			}else{
				if(!reg.test(buyNum)){
					alert("请输入非负整数!");
					$(this).val(oldNum);
				}else{
					window.location.href="/cart/editCart.action?productId="+id+"&buyNum="+buyNum;
				}
			}
		});
	});
</script>
</head>
<body>
<div class="container-fluid">
	<div class="container" ">
		<div class="head-top">
			<table width="100%">
				<tr>
					<td width="33%" align="center">
						<p class="log">
							<c:if test="${empty userSession }" >
								<a href="/toLogin.action">登录</a>
								<a href="/toRegist.action">注册</a>
							</c:if>
							<c:if test="${!empty userSession }">
								<a href="/toLogin.action">${userSession.username }</a>
								<a href="/logout.action">注销</a>
								<a href="/toback.action">后台</a>
							</c:if>
						</p>
					</td>
					<td width="33%" align="center">
						<a href="home.action"> <img alt="logo" src="${ctx}/staticfile/images/index/logo.png"></a>	
					</td>
					<td width="33%" align="center">
						<p class="log" style="margin-left: 150px;">
							<a href="/cart/toCart.action">购物车</a>
							<a href="#">我的订单</a>
						</p>
					</td>
				</tr>
			</table>
			<div class="col-md-12 h_menu4"  style="border-bottom: solid;border-top: solid;">
				<ul class="memenu black">
					  <li class="grid"><a  href="/home.action" style="font-weight: bolder;font-size: large;">主页</a></li>	
				      <li class="grid"><a  href="/home.action" style="font-weight: bolder;font-size: large;">男装</a></li>
				      <li class="grid"><a  href="/home.action" style="font-weight: bolder;font-size: large;">女装</a>
					  <li class="grid"><a  href="/home.action" style="font-weight: bolder;font-size: large;">部落格</a></li>				
					  <li class="grid"><a  href="/home.action" style="font-weight: bolder;font-size: large;">联系方式</a></li>
			  	</ul> 
			</div>
			<br/><br/><br/><br/>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				
				<h1 align="left" style="font-weight: bolder;color: #5B5B5B;margin-left: 50px;">
					购 物 车
				</h1>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<form action="" method="post">
				<table width="100%">
					  <tr bgcolor="#5B5B5B">
						<td width="10%" align="center"><input name="allC" type="checkbox" value="" onclick="checkAll('prodC',this)" style="margin-left: 30px;"/> </th>
						<td width="26%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">商品</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">数量</font></td>		
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">单价</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">小计</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">操作</font></td>
					  </tr>
					  <c:set var="money" value="0"></c:set>
					  <c:forEach items="${cartSession}" var="entry">
					  	<tr>
							<td height="5"></td>
						</tr>
					  	<tr bgcolor="F0F0F0">
							<td width="10%" align="center"><input name="prodC" type="checkbox" value="" onclick="" style="margin-left: 30px;"/></td>
							<td width="26%" class="ring-in" align="center"><a href="#" class="at-in"><img src="/img/17.png" class="img-responsive" alt=""></a>
								<div class="sed">
									<h5>${entry.key.productName}</h5>
									<p>${entry.key.productDesc}</p>
								</div>
								<div class="clearfix"></div>
							</td>
							<td width="16%" class="check" align="center">
								<input style="width:40px;" id="${entry.key.productId }" class="buyNum" type="text" value="${entry.value }" /> 
								<input type="hidden" value="${entry.value}"/> 
							</td>		
							<td width="16%" align="center">${entry.key.productPrice }</td>
							<td width="16%" align="center">${entry.key.productPrice*entry.value}</td>
							<c:set var="money" value="${money+entry.key.productPrice*entry.value }"></c:set>
							<td class="del" width="16%" align="center"><a href="#">删除</a></td>
					  	</tr>
					  </c:forEach>
					  <tr>
							<td height="5"></td>
						</tr>
					  <tr bgcolor="#5B5B5B">
						<td width="10%" align="center"><input name="allC" type="checkbox" value="" onclick="checkAll('prodC',this)" style="margin-left: 30px;"/><span></span></td>
						<td width="26%" align="center"></td>
						<td width="16%" align="center"></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">总价</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">${money }</font></td>
						<td width="16%" align="center"><a id="del_a" href="#" style="font-weight: bolder;font-size: medium;color: white;">删除</a></td>
					  </tr>
				</table>
				<button type="submit" style="width:100px;height:40px;background:orange;margin-left: 1000px;" class="btn"><font style="font-weight: bolder;color: white;font-size: large;">去 结 算</font></button>
			</form>
			<br/><br/><br/>
		</div>
	</div>
		</div>
	</div>
</div>
</body>
</html>
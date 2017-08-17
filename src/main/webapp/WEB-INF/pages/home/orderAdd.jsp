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
		var formObj={
				checkForm:function(){
					var flag = this.checkNull();
					return flag;
				},
				
		checkNull:function() {
			var value = $("textarea[name='receiveInfo']").val();
			if($.trim(value)=="请输入您的送货地址"){
				alert("请输入您的送货地址")
				return false;
			}
			return true;
			}
		};
</script>
</head>
<body onload="opener.location.reload()">
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
						<a href="/home.action"> <img alt="logo" src="${ctx}/staticfile/images/index/logo.png"></a>	
					</td>
					<td width="33%" align="center">
						<p class="log" style="margin-left: 150px;">
							<a href="/cart/toCart.action">购物车</a>
							<a href="/head/toOrderList.action">我的订单</a>
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
			<form action="/order/toOrderList" method="post" onsubmit="return formObj.checkForm()">
			<div class="page-header">
				<h1 align="left" style="font-weight: bolder;color: #5B5B5B;margin-left: 0px;">
					订 单 添 加
				</h1>
				<br/><br/>
			</div>
				<table width="100%">
					  <tr bgcolor="#5B5B5B">
						<td width="36%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">商品</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">类目</font></td>		
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">单价</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">数量</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">小计</font></td>
					  </tr>
					  <c:set var="money" value="0"></c:set>
					  <c:forEach items="${cartSession}" var="entry">
					  	<tr>
							<td height="5"></td>
						</tr>
					  	<tr bgcolor="F0F0F0">
							<td width="36%" class="ring-in" align="center"><a href="#" class="at-in"><img src="${entry.key.imgUrl }" class="img-responsive" alt=""></a>
								<div class="sed">
									<h5 style="margin-top: 10px;">${entry.key.productName}</h5>
									<p><font color="black">${entry.key.productDesc}</font></p>
								</div>
								<div class="clearfix"></div>
							</td>
							<td width="16%" align="center"><font color="black">${entry.key.productCatory }</font></td>		
							<td width="16%" align="center"><font color="black">${entry.key.productPrice }</font></td>
							<td width="16%" align="center"><font color="black">${entry.value }</font></td>
							<td width="16%" align="center"><font color="black">${entry.key.productPrice*entry.value}</font></td>
							<c:set var="money" value="${money+entry.key.productPrice*entry.value }"></c:set>
					  	</tr>
					  </c:forEach>
					  <tr>
							<td height="5"></td>
						</tr>
					  <tr bgcolor="#5B5B5B">
						<td width="36%" align="center"></td>
						<td width="16%" align="center"></td>
						<td width="16%" align="center"></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">总价</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">${money }</font></td>
							<input type="hidden" name="money" value="${money }"/> 
						</td>
					  </tr>
					  <tr>
					  	<td height="5"></td>
					  </tr>
					  <tr bgcolor="F0F0F0">
					  	<td width="68%" colspan="3">
        						<textarea cols="60" class="" rows="3" name="receiveInfo" class="receiveInfo" onfocus="if(value=='请输入您的送货地址'){value=''}"  onblur="if (value ==''){value='请输入您的送货地址'}">请输入您的送货地址</textarea>
						</td>
						<td width="32%" colspan="2">
							<button id="order_btn" type="submit" style="width:120px;height:40px;background:#CE0000;margin-left: 205px;" class="btn" onmouseover="this.style.backgroundColor='#FF0000';" onmouseout="this.style.backgroundColor='#CE0000';"><font style="font-weight: bolder;color: white;font-size: large;">提 交 订 单</font></button>
						</td>
					  </tr>	
				</table>
			</form>
			<br/><br/><br/>
		</div>
	</div>
		</div>
	</div>
</div>
</body>
</html>
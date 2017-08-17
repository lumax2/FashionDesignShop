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
				var id = $(this).parent().parent().find("input[class=orderId]").attr("id");
				window.location.href="/order/deleteOrder.action?orderId="+id;
			}
		});
		
		/* $(".pay").click(function(){
				var id = $(this).parent().find("input[class=pay_orderId]").attr("id");
				window.location.href="/pay.action?orderId="+id;
		}); */
	});
</script>
<style type="text/css">
	#pay_td:hover{
		background-color: #FF0000;
	}
</style>
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
								<a href="#">${userSession.username }</a>
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
			<div class="page-header">
				<h1 align="left" style="font-weight: bolder;color: #5B5B5B;margin-left: 50px;">
					订 单 列 表
				</h1>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<form action="/topay.action" method="post">
				<table width="100%">
					  <tr bgcolor="#5B5B5B" height="5px">
						<td width="10%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">支付状态</font></td>
						<td width="26%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">商品详情</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">数量</font></td>		
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">单价</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">小计</font></td>
						<td width="16%" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">操作</font></td>
					  </tr>
					  <c:forEach items="${orderInfoSession}" var="oi">
					  <c:set var="money" value="0"></c:set>
					  	<tr>
								<td height="5"></td>
							</tr>
					  	<tr bgcolor="F0F0F0" >
					  		<td width="10%" align="center">
					  			<c:if test="${oi.order.payState==0}"><font style="font-weight: bolder; color: red">待支付</font></c:if>
					  			<c:if test="${oi.order.payState==1}"><font style="font-weight: bolder; color: green">已支付</font></c:if>
					  		</td>
					  		<td colspan="4" width="74%">
					  			<font style="font-weight: bolder;color: black;font-size: small;">订单编号:</font>&nbsp;&nbsp;<font color="black">${oi.order.orderId }</font>
					  			<input type="hidden" name="orderId" value="${oi.order.orderId }"/>
					  			<br/><br/>
					  			<font style="font-weight: bolder;color: black;font-size: small;">收货地址:</font>&nbsp;&nbsp;<font color="black">${oi.order.receiveInfo }</font>
					  			<input type="hidden" class="orderId" id=${oi.order.orderId }>
					  		</td>
					  		<td width="16%" align="center">
					  			<c:if test="${oi.order.payState==0}">
					  				<a class="del" href="#">取消订单</a>
					  			</c:if>
					  		</td>
					  	</tr>
					  <c:forEach items="${oi.map }" var="entry">
						  	<tr>
								<td width="10%"></td>
								<td width="26%" class="ring-in" align="center"><a href="#" class="at-in"><img src="${entry.key.imgUrl }" class="img-responsive" alt=""></a>
									<div class="sed">
										<h5>${entry.key.productName}</h5>
										<p><font color="black">${entry.key.productDesc}</font></p>
									</div>
									<div class="clearfix"></div>
								</td>
								<td width="16%" align="center"><font color="black">${entry.value }</font></td>		
								<td width="16%" align="center"><font color="black">${entry.key.productPrice }</font></td>
								<td width="16%" align="center"><font color="black">${entry.key.productPrice*entry.value}</font></td>
								<c:set var="money" value="${money+entry.key.productPrice*entry.value }"></c:set>
								<td width="16%" align="center"></td>
						  	</tr>
					  </c:forEach>
					  <tr>
							<td height="5"></td>
					  </tr>
					  <tr >
						<td width="10%" bgcolor="#5B5B5B"></td>
						<td width="26%" bgcolor="#5B5B5B" align="center"></td>
						<td width="16%" bgcolor="#5B5B5B" align="center"></td>
						<td width="16%" bgcolor="#5B5B5B" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">订单金额</font></td>
						<td width="16%" bgcolor="#5B5B5B" align="center"><font style="font-weight: bolder;font-size: medium;color: white;">${money }</font></td>
						<c:if test="${oi.order.payState==0}">
							<td width="16%" bgcolor="#CE0000" align="center" id="pay_td">
								<a id="pay" href="/topay.action?orderId=${oi.order.orderId }" style="font-weight: bolder;font-size: medium;color: white;text-decoration: none;">去付款</a>
							</td>
						</c:if>
						<c:if test="${oi.order.payState==1}">
							<td width="16%" bgcolor="#5B5B5B" align="center">
								<font style="font-weight: bolder;font-size: medium;color: white;">已支付</font>
							</td>
						</c:if>
							<%-- <input class="pay_orderId" id=${oi.order.orderId } type="hidden"/> --%>
						<!-- <td width="16%"></td> -->
					  </tr>
				</c:forEach>
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
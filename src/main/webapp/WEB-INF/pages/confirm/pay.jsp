<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link href="/staticfile/css/pay.css" rel="stylesheet" type="text/css">
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
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div class="container-fluid">
	<div class="container" >
		<div class="head-top">
			<table width="100%">
				<tr>
					<td width="33%" align="center">
						<p class="log">
							
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
	<form action="/pay.action" method="post">
		<dl class="payment_page">
			<dt>
				<strong>订单号：</strong> 
				<input class="idinp" name="orderId" readonly="readonly" type="text" value="${order.orderId}">
				<%-- <input type="hidden" name="orderId" value="${order.orderId}"/> --%>
				<strong>支付金额：</strong>
				<input class="moneyinp" name="money" type="text" readonly="readonly" type="text" value="${money }">元
				<input type="hidden" name="money" value="${money}"/>
			</dt>
			<dd class="payment_page_name">
				<strong>请您选择在线支付银行 :</strong>
			</dd>
			<dd class="banks">
				<ul>
					<li>
						<input name="pd_FrpId" type="radio" value="ICBC-NET"> 
						<img src="${app}/img/pay/01gs.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="CMBCHINA-NET-B2C">
						<img src="${app}/img/pay/02zs.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="CCB-NET">
						<img src="${app}/img/pay/03js.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/04ny.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/05zg.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/06jt.jpg" width="130" height="52">
					</li>
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/07hx.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/08xy.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/09gd.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/10sz.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/11ms.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/12sh.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/13zx.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/14gd.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/15cq.jpg" width="130" height="52">
					</li>
	
					<li>
						<input name="pd_FrpId" type="radio" value="">
						<img src="${app}/img/pay/16bh.jpg" width="130" height="52">
					</li>
				</ul>
			</dd>
			<div style="clear: both;"></div>
			<dd class="ok_dd">
				<input  type="submit" class="ok_pay" value="确认支付">
			</dd>
		</dl>
	</form>
</body>
</html>

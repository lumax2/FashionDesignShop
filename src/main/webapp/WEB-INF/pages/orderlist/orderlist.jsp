<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<link href="/staticfile/css/orderList.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/staticfile/css/head.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/staticfile/css/foot.css"/>
</head>
<body style="text-align:center">
<div id="common_head">
	<div id="line1">
		<div id="content">
		<%-- <c:if test="${empty sessionScope.user }" var="eptun" scope="page"> --%>
		<a href="${pageContext.request.contextPath }/toLogin.action">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath }/toRegist.action">注册</a>
		<c:if test="${!eptun }">
		欢迎${sessionScope.user.username}&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath }/logout.action">注销</a></c:if>
		
		</div>
	</div>
	<div id="line2">
		<img id="logo" src="${pageContext.request.contextPath}/img/head/logo_nn.jpg"/>
		<input type="text" name=""/>
		<input type="button" value="搜 索"/>
		<span id="goto">
			<a id="goto_order" href="/">我的订单</a>
			<a id="goto_cart" href="/home/cart.action">我的购物车</a>
		</span>
		<img id="erwm" src="${pageContext.request.contextPath}/img/head/11.jpg"/>
	</div>
	<div id="line3">
		<div id="content">
			<ul>
				<li><a href="#">首页</a></li>
				<li><a href="${pageContext.request.contextPath }/home.action">全部商品</a></li>
				<li><a href="#">西装区</a></li>
				<li><a href="#">衬衫</a></li>
				<li><a href="#">女装</a></li>
				<li><a href="#">配饰</a></li>
			</ul>
		</div>
	</div>
</div>
 <c:forEach items="${orderinfolist}" var="info"> 
		<dl class="Order_information">
			<dt>
				<h3>订单信息</h3>
			</dt>
			<dd>
				订单编号		${info.order.orderId}<br/>
				 下单时间：${info.order.orderTime}<br/> 
				 订单金额：${info.order.orderMoney}<br/> 
				 支付状态：
				  <c:if test="${info.order.payState==0}" var="flag"> 
						<font color="red">未支付</font>&nbsp;&nbsp;&nbsp;
						<%-- <a href="${app}/OrderDeleteServlet?id="><img src="${app }img/orderList/sc.jpg" width="69" height="19"></a>  --%>
				 		<a href="${app}/test.action?orderId=info.order.orderId&money=info.order.orderMoney"> <img src="${app}img/orderList/zx.jpg" width="69" height="19"></a><br />
				 	 </c:if>	 
				 	<c:if test="${!flag }">
						<font color="blue">已支付</font>
				</c:if>
				 收货地址：${info.order.receiveInfo}<br/> 
				支付方式：在线支付
			</dd>
		</dl>
	
		<table width="1200" border="0" cellpadding="0"
			cellspacing="1" style="background:#d8d8d8;color:#333333">
			<tr>
				<th width="276" height="30" align="center" valign="middle" bgcolor="#f3f3f3">商品图片</th>
				<th width="247" align="center" valign="middle" bgcolor="#f3f3f3">商品名称</th>
				<th width="231" align="center" valign="middle" bgcolor="#f3f3f3">商品单价</th>
				<th width="214" align="center" valign="middle" bgcolor="#f3f3f3">购买数量</th>
				<th width="232" align="center" valign="middle" bgcolor="#f3f3f3">总价</th>
			</tr>
			 <c:forEach items="${orderinfolist.map}" var="entry">  
			<tr>
				<td align="center" valign="middle" bgcolor="#FFFFFF">
					<img src="/img/19.png" width="90" height="105">
				</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.key.productName}</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.productMoney}元</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.value}件</td>
				<td align="center" valign="middle" bgcolor="#FFFFFF">${entry.key.productMoney*entry.value}人民币</td>
			</tr>
			</c:forEach>  
		</table>
		<div class="Order_price">${info.order.orderMoney}元</div>
	</c:forEach>
	<div id="common_foot">
	<p>
		Copyright © 2016-2017 FashionDesignShop有限公司 版权所有 保留一切权利 沪B2-20130048号 | 京ICP备09062682号-9
		<br>
		网络文化经营许可证沪网文[2016]0401-019号
	</p>
</div>	
</body>
</html>

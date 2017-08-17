<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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


	<link href="/staticfile/css/prodInfo.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/staticfile/css/head.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/staticfile/css/foot.css"/>
	<script type="text/javascript" src="/js/jquery-1.4.2.js"></script>
	<script type="text/javascript">
	</script> 
</head>
<body>
<!-- 页面头 -->
 <div id="common_head">
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
							<a href="#">我的订单</a>
						</p>
					</td>
				</tr>
			</table>
	</div>		
	<div id="line3">
		<div id="content">
			<ul>
				<li><a href="${pageContext.request.contextPath }/home.action">首页</a></li>
				<li><a href="${pageContext.request.contextPath }/home.action#projects-container">全部商品</a></li>
				<li><a href="${pageContext.request.contextPath }/home.action#projects-container">西装区</a></li>
				<li><a href="${pageContext.request.contextPath }/home.action#projects-container">衬衫</a></li>
				<li><a href="${pageContext.request.contextPath }/home.action#projects-container">女装</a></li>
				<li><a href="${pageContext.request.contextPath }/home.action#projects-container">配饰</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- 主体 -->
<form action="cart/addCart.action" method="post">
	<div id="warp">
		<div id="left">
			<div id="left_top">
				<img src=${prod.imgUrl } style="width:300px">
			</div>
			<div id="left_bottom">
				<img id="lf_img" src="${app}/img/prodInfo/lf.jpg"/>
				<img id="mid_img" src=${prod.imgUrl } width="60px" height="60px"/>
				<img id="rt_img" src="${app}/img/prodInfo/rt.jpg"/>
			</div>
			
		</div>
		<div id="right">
			 <div id="right_top">
				<div id="right_top">
				<span id="prod_desc">${prod.productName }</span>
				<br/>
				<span style=" margin-left: 30px;">${prod.productDesc }</span>
				<img style="margin-top: 40px;margin-left: 20px;" src="/img/prodInfo/youhui.png"/>
			</div>
			</div> 
			<div id="right_middle" >
				 <span id="right_middle_span" >
					
						FashionDesign 价：<span id="price_red" style="color:#FF6666;font-size:25px;font-weight:bold ">￥${prod.productPrice}<br/></span>
										
										<input type="hidden" name ="productPrice"/>
			            运     费：满 100 免运费<br />
			            月 销 量:<span id="price_reds" style="color:red;font-size:20px;font-weight:bold" /> 1000 </span> 
			            &nbsp;&nbsp;&nbsp;累计评价:<span id="price_reds" style="color:red;font-size:20px;font-weight:bold"/>6666 <br/></span>
			            服     务：由FashionDesignShop负责发货，并提供售后服务<br />
			         	
			      
			       购买数量：
	            <input id="buyNumInp" name="buyNum" type="text" value="1" onblur="">
			</div>
			<div id="right_bottom">
				<input class="pid" type="hidden" name="productId" value="${prod.productId}"/>
				<input class="add_cart_but" onclick="" type="submit" value=""/></a>	
			</div>
			<div id="right_lastbottom">
				<img src="/img/prodInfo/132.png"/>
			</div>
		</div>
	</div>
</form>
	<div id="common_foot">
	<p>
		Copyright © 2016-2017 FashionDesignShop有限公司 版权所有 保留一切权利 沪B2-20130048号 | 京ICP备09062682号-9
		<br>
		网络文化经营许可证沪网文[2016]0401-019号
	</p>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- saved from url=(0024)http://www.meweidea.com/ -->
<html lang="zh-CN" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
    

    <link rel="stylesheet" media="all" href="${pageContext.request.contextPath}/img/application-c6879735dbedf70624026b5229550bcbbc32c7c86fcc4d159ce7a4d232a36719.css" data-turbolinks-track="true">
    <link rel="stylesheet" media="all" href="${pageContext.request.contextPath}/img/home.css" data-turbolinks-track="true">
    


    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  <link rel="apple-touch-icon" sizes="180x180" href="http://www.meweidea.com/apple-touch-icon.png"><link rel="icon" type="image/png" href="http://www.meweidea.com/favicon-32x32.png" sizes="32x32"><link rel="icon" type="image/png" href="http://www.meweidea.com/favicon-16x16.png" sizes="16x16"><title>FashionDesignShop</title><meta name="csrf-param" content="authenticity_token"><meta name="csrf-token" content="ZyIpfvtbNoXYZv+0dlJCbIpdhvKwBkGihXpTvw9pv0ZZbK4puCgprzgQyo8Hvjonw5AZ77BZBsjDW/sBIYWqFA=="></head>

  <body>
    	<header>
      <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="true">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">
              <img class="" src="${pageContext.request.contextPath}/img/logo.jpg">
              FashionDesignShop™
            </a>
            <p align="left">
            <c:if test="${empty userSession}" var="eptun" scope="page">
            <a class="navbar-brand" href="/toLogin.action">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            			请登录</a>
            
             <a class="navbar-brand" href="/toRegist.action">免费注册</a> 
            </c:if>
            <c:if test="${!eptun }">
             <a class="navbar-brand" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎${userSession.username }</a>
            <a class="navbar-brand" href="/logout.action">退出</a> 
            <c:forEach items="${roleSession}" var="r">
            <c:if test="${r.roleId=='1'}">
             <a class="navbar-brand"  href="/toback.action">后台</a>
            </c:if>
            </c:forEach>
            </c:if>
			<a class="navbar-brand" href="/cart/toCart.action">&nbsp;&nbsp;&nbsp; 购物车</a>
			<a class="navbar-brand" href="/head/toOrderList.action">我的订单</a>  
			</p>        
          </div>
          <div class="navbar-collapse collapse" id="navbar-collapse" aria-expanded="true" style="">
            <ul class="nav navbar-nav navbar-right">
              <li class=""><a href="http://www.meweidea.com/#services" class="scrollto">服务介绍</a></li>
              <li class=""><a href="http://www.meweidea.com/#portfolio" class="scrollto">最新推荐</a></li>
              <li class=""><a href="http://www.meweidea.com/#about" class="scrollto">关于我们</a></li>
              <li class=""><a href="http://www.meweidea.com/#wechat" class="scrollto">联系我们</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <a href="#projects-container"><img class="" src="${pageContext.request.contextPath}/img/banner-2.jpg" align="center" style="height:100%;width:100%"></a>
	</header>

    <section id="services">
      <div class="container">
        <div class="title">
          <h4 class="text-center">服务介绍</h4>
          <div></div>
        </div>  
        <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-3 service-item scrollimation scale-in in">
            <div class="service-icon"><!-- <i class="fa fa-apple"></i>--></div>
            <h4>品牌</h4>
            <p>根据品牌文化、价值观和差异性制定服装策略，设计个性突显款式；我们以前瞻性的眼光创造独特的品牌认同</p>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-3 service-item scrollimation scale-in d1 in">
            <div class="service-icon"><!-- <i class="fa fa-dropbox"></i> --></div>
            <h4>包装</h4>
            <p>包装设计的好坏，对于产品至关重要，直接关系产品的市场表现；我们拥有丰富的成功案例，专业且追求极致</p>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-3 service-item scrollimation scale-in d2 in">
            <div class="service-icon"><!-- <i class="fa fa-pencil"></i> --></div>
            <h4>广告</h4>
            <p>广告创意、宣传物料设计对于线上线下市场活动必不可少；快速反应和超强的执行力是我们对客户的郑重承诺</p>
          </div>
          <div class="col-xs-12 col-sm-6 col-md-3 service-item scrollimation scale-in d3 in">
            <div class="service-icon"><!-- <i class="fa fa-html5"></i> --></div>
            <h4>网站</h4>
            <p>互联网是一个变化、持续创新的互动平台；我们应用最新的设计理念和技术方案，助您高效的连接每一位客户</p>
          </div>
        </div>
      </div>  
    </section>
	
    <section id="portfolio">
      <div class="container-fluid masonry-wrapper scrollimation fade-in in">
        <div id="projects-container" class="masonry">
        
        <c:forEach items="${productSession}" var="p" >
        <a class="project-item masonry-brick"  data-images="${p.imgUrl }" >
 	  		<img class="img-responsive project-image" src="${p.imgUrl }" alt="abc">
	 		<div class="hover-mask">
	    	<h2 class="project-title">${p.productName}</h2>
	   		<p>Marzoni</p>
	  		</div>
	  		<div class="sr-only project-description">${p.productId}</div>
		</a>
        </c:forEach>
        
<%--	<a class="project-item masonry-brick" data-images="${pageContext.request.contextPath}/img/38.jpg,${pageContext.request.contextPath}/img/39.jpg">
	  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/38.jpg" alt="">
	  <div class="hover-mask">
	    <h2 class="project-title">经典两粒扣修身款西装</h2>
	    
	    <p>Marzoni</p>
	  </div>
	  <div class="sr-only project-description">1</div>
	</a>
	
	

	 <a class="project-item masonry-brick" data-images="${pageContext.request.contextPath}/img/33.jpg,${pageContext.request.contextPath}/img/34.jpg,${pageContext.request.contextPath}/img/35.jpg">
	  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/33.jpg" alt="">
	  <div class="hover-mask">
	    <h2 class="project-title">经典两粒扣商务修身款西装</h2>
	    <p>Marzoni</p>
	  </div>
	  <div class="sr-only project-description">
	    <a href="toProductInfo.action?productId=2">aa</a>
	  </div>
	</a>

	<a class="project-item masonry-brick" data-images="${pageContext.request.contextPath}/img/36.jpg,${pageContext.request.contextPath}/img/37.jpg">
  	<img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/36.jpg" alt="">
  	<div class="hover-mask">
    <h2 class="project-title">经典一粒扣修身款西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    <a href="toProductInfo.action?productId=3">aa</a>
  </div>
</a>





<a class="project-item masonry-brick" data-images="${pageContext.request.contextPath}/img/17.png">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/17.png" alt="">
  <div class="hover-mask">
    <h2 class="project-title">浅蓝亚麻休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    <a href="toProduc.action">acd</a>
  </div>
</a>

<a class="project-item masonry-brick" data-images="${pageContext.request.contextPath}/img/32.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/18.png" alt="">
  <div class="hover-mask">
    <h2 class="project-title">酒红亚麻休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/033/original/8_.jpg,/system/comfy/cms/files/files/000/000/036/original/8-1.jpg,/system/comfy/cms/files/files/000/000/035/original/8-3.jpg,/system/comfy/cms/files/files/000/000/034/original/8-4.jpg,/system/comfy/cms/files/files/000/000/037/original/8-5.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/19.png" alt="">
  <div class="hover-mask">
    <h2 class="project-title">暖黄亚麻休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/041/original/11.jpg,/system/comfy/cms/files/files/000/000/040/original/11-1.jpg,/system/comfy/cms/files/files/000/000/038/original/11-2.jpg,/system/comfy/cms/files/files/000/000/039/original/11-3.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/20.png" alt="">
  <div class="hover-mask">
    <h2 class="project-title">墨绿太阳提花休闲外套</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/044/original/5-2.jpg,/system/comfy/cms/files/files/000/000/043/original/5-1.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/21.png" alt="">
  <div class="hover-mask">
    <h2 class="project-title">蓝色方格双排休闲一粒扣外套</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/045/original/13.jpg,/system/comfy/cms/files/files/000/000/100/original/13-1.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/22.png" alt="">
  <div class="hover-mask">
    <h2 class="project-title">玫瑰紫亚麻休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/048/original/4.jpg,/system/comfy/cms/files/files/000/000/046/original/4-1.jpg,/system/comfy/cms/files/files/000/000/047/original/4-2.jpg,/system/comfy/cms/files/files/000/000/101/original/4-3.jpg,/system/comfy/cms/files/files/000/000/102/original/4-4.jpg,/system/comfy/cms/files/files/000/000/103/original/4-5.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/23.png" alt="">
  <div class="hover-mask">
    <h2 class="project-title">咖啡条纹休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
   Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/139/original/15-1.jpg,/system/comfy/cms/files/files/000/000/138/original/15-2.jpg,/system/comfy/cms/files/files/000/000/137/original/15-3.jpg,/system/comfy/cms/files/files/000/000/136/original/15-4.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/24.png" alt="">
  <div class="hover-mask">
    <h2 class="project-title">深灰休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/128/original/14-1.jpg,/system/comfy/cms/files/files/000/000/129/original/14-2.jpg,/system/comfy/cms/files/files/000/000/130/original/14-3.jpg,/system/comfy/cms/files/files/000/000/131/original/14-4.jpg,/system/comfy/cms/files/files/000/000/132/original/14-5.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/25.jpg" alt="">
  <div class="hover-mask">
    <h2 class="project-title">深蓝休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/124/original/16-1.jpg,/system/comfy/cms/files/files/000/000/125/original/16-2.jpg,/system/comfy/cms/files/files/000/000/126/original/16-3.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/26.jpg" alt="">
  <div class="hover-mask">
    <h2 class="project-title">地中海蓝休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/050/original/3-1.jpg,/system/comfy/cms/files/files/000/000/051/original/3-2.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/27.jpg" alt="">
  <div class="hover-mask">
    <h2 class="project-title">亚麻灰休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/057/original/7-1.jpg,/system/comfy/cms/files/files/000/000/056/original/7-2.jpg,/system/comfy/cms/files/files/000/000/055/original/7-3.jpg,/system/comfy/cms/files/files/000/000/054/original/7-4.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/28.jpg" alt="">
  <div class="hover-mask">
    <h2 class="project-title">亚麻蓝休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/062/original/6.jpg,/system/comfy/cms/files/files/000/000/060/original/6-1.jpg,/system/comfy/cms/files/files/000/000/061/original/6-2.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/29.jpg" alt="">
  <div class="hover-mask">
    <h2 class="project-title">亚麻白休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/067/original/1.jpg,/system/comfy/cms/files/files/000/000/066/original/1-1.jpg,/system/comfy/cms/files/files/000/000/065/original/1-2.jpg,/system/comfy/cms/files/files/000/000/064/original/1-3.jpg,/system/comfy/cms/files/files/000/000/063/original/1-4.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/30.jpg" alt="">
  <div class="hover-mask">
    <h2 class="project-title">亚麻浅灰休闲西装</h2>
    <p> Marzoni</p>
  </div>
  <div class="sr-only project-description">
     Marzoni
  </div>
</a>

<a class="project-item masonry-brick" data-images="/system/comfy/cms/files/files/000/000/070/original/2.jpg,/system/comfy/cms/files/files/000/000/068/original/2-1.jpg,/system/comfy/cms/files/files/000/000/069/original/2-2.jpg">
  <img class="img-responsive project-image" src="${pageContext.request.contextPath}/img/31.jpg" alt="">
  <div class="hover-mask">
    <h2 class="project-title">亚麻兰格条纹休闲西装</h2>
    <p>Marzoni</p>
  </div>
  <div class="sr-only project-description">
    Marzoni
  </div>
</a> 
 --%>

        </div>
      </div>
      
      <div id="project-modal" class="modal fade">
        <div class="modal-dialog modal-lg">
          <div class="modal-header" data-dismiss="modal">
            <span class="close">
              <i class="fa fa-times" aria-hidden="true"></i>
            </span>
          </div>
          <div class="modal-content">
            <div class="modal-body">
              <div id="project-img" class="project-img text-center"></div>
              <h1 class="text-center project-title"></h1>
              <div class="project-descr text-center"> </div>
              
            </div>
          </div>
        </div>
      </div>
       
    </section>

    <section id="about">
      <div class="container">
        <div class="title">
          <h4 class="text-center">关于我们</h4>
          <div></div>
        </div>
        <div class="row">
          <div class="col-sm-6 logo scrollimation fade-right in">
            <h1>MEWE<span>IDEA.COM</span></h1>
            <h4>FashionDesignShop™</h4>
            <div class="addr scrollimation fade-right d2 in">
              <address>
                上海徐家汇汇银大厦7楼<br>
                <span class="hidden-xs">电话：</span><i class="fa fa-phone visible-xs-inline" aria-hidden="true"></i>+86-10-60573611<br>
                <span class="hidden-xs">邮箱：</span>business@clothshop.com
              </address>
            </div>
          </div>
          <div class="col-sm-6 slogon scrollimation fade-left d1 in">
            <p>我们是领先的服装咨询&amp;服务平台，由各领域精英组成，包括国际4A美术指导，知名设计公司设计总监、策略总监，知名模特、技术主管；</p>
            <p>我们是一支经验丰富、具有国际化视野和创新能力的团队；</p>
            <p>我们坚持“与梦想者同行”，致力于成为“从中国制造到中国创造”这场变革的重要参与者,打造国际领先品牌.</p>
            <div class="city text-right scrollimation fade-left d3 in">
              <img src="${pageContext.request.contextPath}/img/city.png">
            </div>
          </div>
        </div>  
      </div>
    </section>  

    <section id="contact">
      <div class="container-fluid dark-bg text-center">
        <div class="container text-center clients">
          <img src="${pageContext.request.contextPath}/img/1.png">
          <img src="${pageContext.request.contextPath}/img/2.png">
          <img src="${pageContext.request.contextPath}/img/3.png">
          <img src="${pageContext.request.contextPath}/img/4.png">
          <img src="${pageContext.request.contextPath}/img/5.png">
          <img src="${pageContext.request.contextPath}/img/6.png">
          <img src="${pageContext.request.contextPath}/img/7.png">
          <img src="${pageContext.request.contextPath}/img/8.png">
          <img src="${pageContext.request.contextPath}/img/9.png">
          <img src="${pageContext.request.contextPath}/img/10.png">
          <img src="${pageContext.request.contextPath}/img/11.png">
          <img src="${pageContext.request.contextPath}/img/12.png">
        </div>
        <div id="quotes" class="container quotes owl-carousel owl-theme" style="opacity: 1; display: block;">
        	<div class="owl-wrapper-outer">
        		<div class="owl-wrapper" style="width: 5820px; left: 0px; display: block; transition: all 800ms ease; transform: translate3d(0px, 0px, 0px);">
        			<div class="owl-item" style="width: 970px;">
        				<div class="item">
            				<div class="container-icon"></div>
            				<p>跟FashionDesignShop合作很愉快，我们觉得FashionDesignShop是一家很专业的服装设计公司，这个团队非常棒，有激情、有创造力、有执行力，经常给我们带来很多好的产品，是我们合作过的供应商中设计水平比较高，非常值得信任的一家。</p>
            				<h4 class="quote-author"><span>阿里巴巴 / 马云</span></h4>
          				</div>
          			</div>
          		
	          		<div class="owl-item" style="width: 970px;">
	          			<div class="item">
	            			<div class="container-icon"></div>
	            			<p>FashionDesignShop是一家很用心的服装设计公司，相比之前合作过的一些供应商，FashionDesignShop的工作态度认真主动，项目进度控制严格，即便我们没有要求，他们也会主动做多款不同方向的设计稿供我们选择，与FashionDesignShop合作我们很放心。</p>
	            			<h4 class="quote-author"><span>京东 / 刘强东 </span></h4>
	          			</div>
	          		</div>
	          		
	          		<div class="owl-item" style="width: 970px;">
	          			<div class="item">
	            			<div class="container-icon"></div>
	           				<p>我们是通过一次比稿选择了FashionDesignShop创意，他们除了设计能力突出之外，还有自己的技术研发团队，经营模式融合了互联网的服务理念，沟通流程扁平化，服务态度诚恳，执行效率高，是一家性价比很高的设计公司。</p>
	            			<h4 class="quote-author"> <span>二龙湖 / 浩哥</span></h4>
	          			</div>
	          		</div>
          		
          		
          	</div>
         </div>
          
         <div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page active"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div></div></div>
		
        <div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page"><span class=""></span></div><div class="owl-page"><span class=""></span></div><div class="owl-page active"><span class=""></span></div></div></div></div>
        <div id="wechat" class="contact-btn container scrollimation scale-in in">
          <img src="${pageContext.request.contextPath}/img/wechat.jpg">
          <h4>详细服务及报价，请扫二维码加入我们的微信服务号进行咨询</h4>
          <p>或</p>
          <p>微信搜索公众号：FashionDesignShop</p>
        </div>
      </div>
    </section>

	<footer>
      <div class="container">
        <div class="col-sm-8 text-left">© 2016 上海Fashion服装设计有限公司 版权所有 <span>沪ICP备16046633号</span></div>
        <div class="col-sm-4 text-right"><i class="fa fa-desktop" aria-hidden="true"></i> MEWEIDEA.COM</div>
      </div>
    </footer>


    <script src="${pageContext.request.contextPath}/img/application-8e9c91d2bce887a99a31d0808e57af0cb9680a4e9b9fa8f80d14bcf82002dc9a.js" data-turbolinks-track="true"></script>
    <script src="${pageContext.request.contextPath}/img/home.js" data-turbolinks-track="true"></script>
  

</body></html>
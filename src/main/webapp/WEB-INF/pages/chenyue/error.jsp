<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Free Bootstrap Error Template</title>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/staticfile/css/error/bootstrap.css" rel="stylesheet">
    <!-- FONT AWESOME CSS -->
    <link href="${ctx}/staticfile/css/error/font-awesome.min.css" rel="stylesheet" />
    <!--GOOGLE FONT -->
 <link href='http://fonts.googleapis.com/css?family=Nova+Flat' rel='stylesheet' type='text/css'>
    <!-- custom CSS here -->
    <link href="${ctx}/staticfile/css/error/style.css" rel="stylesheet" />
   	<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
    <script type="text/javascript">
    	$(function(){
			setTimeout("top.location.href = 'toback.action'",3600);
    	});
    </script>
</head>
<body>
    
   
    <div class="container">
      
          <div class="row pad-top text-center">
                 <div class="col-md-6 col-md-offset-3 text-center">
                  <h1>  数据下载中 </h1>
                   <h3> 请稍后</h3> 
              		<span id="error-link">100</span>
            <h2>导出成功,${title}存在本机E盘根目录下,成功后自动跳转回主页!</h2>
</div>
        </div>

            <div class="row text-center">
                 <div class="col-md-8 col-md-offset-2">
                     
               <a href="#" class="btn btn-primary">若未自动跳转,请点击此处</a> 
</div>
        </div>

    </div>
    <!-- /.container -->
  
  
    <!--Core JavaScript file  -->
    <script src="${ctx}/staticfile/js/error/jquery-1.10.2.js"></script>
    <!--bootstrap JavaScript file  -->
    <script src="${ctx}/staticfile/js/error/bootstrap.js"></script>
     <!--Count Number JavaScript file  -->
    <script src="${ctx}/staticfile/js/error/countUp.js"></script>
       <!--Custom JavaScript file  -->
    <script src="${ctx}/staticfile/js/error/custom.js"></script>
</body>
</html>

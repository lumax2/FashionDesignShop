<%@ page contentType="text/html; charset=utf-8"%>
<!-- 从htbase.jsp引入 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FashionDesignShop</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

	<!--图片上传css格式 dropzone  -->
    <link href="${ctx}/js/dropzone/dropzone.min.css" type="text/css" rel="stylesheet" />  
  </head>


  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      <header class="main-header">
        <!-- 左上角logo -->
        <a href="/toback.action" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>FashionDesignShop</b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>FashionDesignShop</b></span>
        </a>
       
            <!-- 右上方 横直蓝条 -->
        <nav class="navbar navbar-static-top" role="navigation">
        	<!-- 用户登录-->
        	<div class="navbar-custom-menu"> </div>
        	<div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <li>
            		<a href="/home.action">
            			<font style="font-weight: bolder;color: white">回到前台</font>
            		</a>
            	</li>
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs">${userSession.name }</span>
                </a>
              </li>
              <!-- 用户登录右边齿轮-->
              <!-- <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li> -->
            </ul>
          </div>
        </nav>
        
      </header>
      <!-- 左侧导航栏区域-->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
  
          <!-- 搜索区提交框-->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /搜索区 -->
          
          
          <!-- 系统列表 -->
          <ul class="sidebar-menu">
            <li class="header">系统管理</li>
            
            <li class="active treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>商品管理</span> <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
               <li><a href="toproductlist"><i class="fa fa-circle-o"></i>商品列表</a></li>
                <li><a href="#" onclick="formSubmit('tocreateproduct','_self');this.blur();"><i class="fa fa-circle-o"></i>商品增加</a></li>
                <li><a href="todeleteproduct"><i class="fa fa-circle-o"></i>商品删除</a></li>
                <li><a href="toupdateproduct"><i class="fa fa-circle-o"></i>商品修改</a></li>
                <li><a href="toqueryproduct"><i class="fa fa-circle-o"></i>商品查询</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i>
                <span>订单管理</span>
              </a>
              <ul class="treeview-menu">
               <li><a href="toorderlist"><i class="fa fa-circle-o"></i> 订单列表</a></li>
               <li><a href="tocreateorder"><i class="fa fa-circle-o"></i> 订单新增</a></li>
               <li><a href="todeleteorder"><i class="fa fa-circle-o"></i> 订单删除</a></li>
               <li><a href="toupdateorder"><i class="fa fa-circle-o"></i> 订单修改</a></li>
               <li><a href="toqueryorder"><i class="fa fa-circle-o"></i> 订单查看</a></li>
              </ul>
            </li>
            
       
            <li class="treeview">
              	<a href="#"><i class="fa fa-pie-chart"></i>
                <span>用户管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
               <li><a href="touserlist"><i class="fa fa-circle-o"></i> 用户列表</a></li>
                <li><a href="tocreateuser"><i class="fa fa-circle-o"></i> 用户增加</a></li>
                <li><a href="todeleteuser"><i class="fa fa-circle-o"></i> 用户删除</a></li>
                <li><a href="toupdateuser"><i class="fa fa-circle-o"></i> 用户修改</a></li>
                <li><a href="toqueryuser"><i class="fa fa-circle-o"></i> 用户查询</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>角色管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
              	 <li><a href="torolelist"><i class="fa fa-circle-o"></i> 角色列表</a></li>
                <li><a href="tocreaterole"><i class="fa fa-circle-o"></i> 角色增加</a></li>
                <li><a href="todeleterole"><i class="fa fa-circle-o"></i> 角色删除</a></li>
                <li><a href="toupdaterole"><i class="fa fa-circle-o"></i>角色修改</a></li>
                <li><a href="toqueryrole"><i class="fa fa-circle-o"></i> 角色查询</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>权限管理</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
             	<li><a href="tomodulelist"><i class="fa fa-circle-o"></i> 权限列表</a></li>
                <li><a href="tocreatemodule"><i class="fa fa-circle-o"></i> 权限增加</a></li>
              </ul>
            </li>
          </ul>
        </section>
        <!-- 系统列表结束 -->
        <!-- /.侧边导航栏结束 -->
      </aside>

      <!-- 右下主页内容-->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
           产品修改
          </h1>
          <ol class="breadcrumb">
            <li><a href="/toback.action"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">产品管理</li>
            <li class="active">产品增加</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
           <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">产品修改</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form action="updateproduct"  method ="post"  enctype="multipart/form-data" >
                  <table id="example2" class="table table-bordered table-hover">
                    
					<tr>
						<td>产品货号：</td>
						<td><input name="productId" type="text"   readonly="readonly" value="${product.productId }"></td>
					</tr>
					<tr>
						<td>产品名称：</td>
						<td><input name="productName" type="text" value="${product.productName }" ></td>
					</tr>
					<tr>
						<td>产品单价：</td>
						<td><input name="productPrice" type="text"  value="${product.productPrice }"></td>
					</tr>
					<tr>
						<td>产品品类：</td>
						<td><input name="productCatory" type="text" value="${product.productCatory }" ></td>
					</tr>
					<tr>
						<td>产品备注：</td>
						<td><input name="productDesc" type="text"  value="${product.productDesc }"></td>
					</tr>
				 	<tr>
						<td>产品照片：</td>
 						<td>
 						<!--ajax 利用dropzone插件，先提交找文件到服务器
 						  -->
 						<p>原始照片</p><img src="${product.imgUrl }">
 						<input type="hidden" name="imgUrl" value="${product.imgUrl }">
 						<input name="file" type="file">
 						  
 					<!-- 	  <div class="field">
 						  	<label>照片</label>
 						  	<div id="file" class="dropzone"></div>
 						  	<input type="button" value="添加照片" style="width:65px;height:30px;"  />
 						  </div> -->
 						</td>
					</tr>
					<tr>
						<td>数据上传：</td>
						<td><input type="submit"   value="保存" ></td>
					</tr>
                    
				
                  </table>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2017-2018 </a>.</strong> All rights reserved.
      </footer>
	
	<!--保存照片到服务器硬盘 dropzone js  -->
	<script type="text/javascript" src="${ctx}/js/dropzone/dropzone.min.js"></script>
	
	<script type="text/javascript">  
    Dropzone.autoDiscover = false;  
    var dropz = new Dropzone("#file", {  
/*     addRemoveLinks: true,    */   
        autoProcessQueue:false,  
        parallelUploads:8,  
        maxFiles: 8,//最大可上传的文件个数  
        maxFilesize: 2,  
        acceptedFiles: ".bmp,.jpg,.jpeg,.gif,.png",   
        init: function() {  
            this.on("removedfile", function(file) {  
                console.log("File " + file.name + "removed");  
            });  
        },  
        success:function(d){  
             callback(d);
        },  
        dictMaxFilesExceeded:"文件数量过多",  
        dictDefaultMessage:"拖动文件到该区域或点击上传文件",  
        dictCancelUpload:"取消",  
        dictCancelUploadConfirmation:"取消上传操作",  
        dictRemoveFile:"删除",  
        dictFileTooBig:"可添加的最大文件大小为{{maxFilesize}}Mb，当前文件大小为{{filesize}}Mb ",  
    });  
   dropz.on("removedfile",function(file){  
   })  
 
    </script>  


	<!--从ht 引入的script  -->
	<script language="javascript" src="${ctx}/staticfile/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/staticfile/js/datepicker/WdatePicker.js"></script>
    <!-- jQuery 2.1.4 配置 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="plugins/morris/morris.min.js"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="plugins/knob/jquery.knob.js"></script>
    <!-- daterangepicker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="plugins/daterangepicker/daterangepicker.js"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
  </body>
</html>

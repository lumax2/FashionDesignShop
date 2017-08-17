<%@ page contentType="text/html; charset=utf-8"%>
<!-- 从htbase.jsp引入 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/echarts.js"></script>
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
    <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> 
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${ctx}/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="${ctx}/dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="${ctx}/plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="${ctx}/plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="${ctx}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="${ctx}/plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="${ctx}/plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="${ctx}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	<!--echart引入jsp  -->
    <script type="text/javascript" src="js/echarts.js"></script>
    
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
                <i class="fa fa-dashboard"></i> <span>商品管理</span><i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
               <li><a href="toproductlist"><i class="fa fa-circle-o"></i>商品列表</a></li>
                <li><a href="tocreateproduct"><i class="fa fa-circle-o"></i>商品增加</a></li>
                <li><a href="todeleteproduct"><i class="fa fa-circle-o"></i>商品删除</a></li>
                <li><a href="toupdateproduct"><i class="fa fa-circle-o"></i>商品修改</a></li>
                <li><a href="toqueryproduct"><i class="fa fa-circle-o"></i>商品查询</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i>
                <span>订单管理</span>
                <i class="fa fa-angle-left pull-right"></i>
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
              <a href="tomodulelist">
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
           指标信息
            <small>中国区</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="/toback.action"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
  
         
          <div class="row">
            <!-- 右下中间区 -->
            <section class="col-lg-7 connectedSortable">
            
                    
            
              <!-- 销售统计折线图饼状图-->
              <div class="nav-tabs-custom">
                <!-- Tabs within a box -->
                <ul class="nav nav-tabs pull-right">
                  <li class="pull-left header"> <i class="fa fa-inbox"> </i> 产品销售统计</li>
                </ul>
                <div class="tab-content no-padding">
                  <!-- Morris chart - Sales -->
                	  <div  id="showChart"  style="position: relative; height: 300px;"></div>
             	 	    <!-- 示例图标 class="chart tab-pane active" id="revenue-chart"prodProportion-chart-->
             	 </div><!-- /.nav-tabs-custom -->
				

              <!-- 待办事项 -->
              <div class="box box-primary">
                <div class="box-header">
                  <i class="ion ion-clipboard"></i>
                  <h3 class="box-title">待办事项</h3>
                  <div class="box-tools pull-right">
                    <ul class="pagination pagination-sm inline">
                      <li><a href="#">&laquo;</a></li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">&raquo;</a></li>
                    </ul>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <ul class="todo-list">
                    <li>
                      <!-- drag handle -->
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                      <!-- checkbox -->
                      <input type="checkbox" value="" name="">
                      <!-- todo text -->
                      <span class="text">回复网站产品评论</span>
                      <!-- Emphasis label -->
                      <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
                      <!-- General tools such as edit or delete-->
                      <div class="tools">
                        <i class="fa fa-edit"></i>
                        <i class="fa fa-trash-o"></i>
                      </div>
                    </li>
                    <li>
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                      <input type="checkbox" value="" name="">
                      <span class="text">统计周销售额</span>
                      <small class="label label-info"><i class="fa fa-clock-o"></i> 4 hours</small>
                      <div class="tools">
                        <i class="fa fa-edit"></i>
                        <i class="fa fa-trash-o"></i>
                      </div>
                    </li>
                    <li>
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                      <input type="checkbox" value="" name="">
                      <span class="text">向研发部门提出新的网站需求</span>
                      <small class="label label-warning"><i class="fa fa-clock-o"></i> 1 day</small>
                      <div class="tools">
                        <i class="fa fa-edit"></i>
                        <i class="fa fa-trash-o"></i>
                      </div>
                    </li>
                    <li>
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                      <input type="checkbox" value="" name="">
                      <span class="text">整理数据</span>
                      <small class="label label-success"><i class="fa fa-clock-o"></i> 3 days</small>
                      <div class="tools">
                        <i class="fa fa-edit"></i>
                        <i class="fa fa-trash-o"></i>
                      </div>
                    </li>
                  </ul>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix no-border">
                  <button class="btn btn-default pull-right"><i class="fa fa-plus"></i> Add item</button>
                </div>
              </div><!-- /.box -->

              <!-- quick email widget -->
              <div class="box box-info">
                <div class="box-header">
                  <i class="fa fa-envelope"></i>
                  <h3 class="box-title">邮件</h3>
                  <!-- tools box -->
                  <div class="pull-right box-tools">
                    <button class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                  </div><!-- /. tools -->
                </div>
                <div class="box-body">
                  <form action="#" method="post">
                    <div class="form-group">
                      <input type="email" class="form-control" name="emailto" placeholder="Email to:">
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" name="subject" placeholder="Subject">
                    </div>
                    <div>
                      <textarea class="textarea" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                    </div>
                  </form>
                </div>
                <div class="box-footer clearfix">
                  <button class="pull-right btn btn-default" id="sendEmail">Send <i class="fa fa-arrow-circle-right"></i></button>
                </div>
              </div>

            </section><!-- /.Left col -->
            <!-- right col (We are only adding the ID to make the widgets sortable)-->
            <section class="col-lg-5 connectedSortable">

              <!-- Map box -->
              <div class="box box-solid bg-light-blue-gradient">
                <div class="box-header">
                  <!-- tools box -->
                  <div class="pull-right box-tools">
                    <button class="btn btn-primary btn-sm daterange pull-right" data-toggle="tooltip" title="Date range"><i class="fa fa-calendar"></i></button>
                    <button class="btn btn-primary btn-sm pull-right" data-widget="collapse" data-toggle="tooltip" title="Collapse" style="margin-right: 5px;"><i class="fa fa-minus"></i></button>
                  </div><!-- /. tools -->

                  <i class="fa fa-map-marker"></i>
                  <h3 class="box-title">
                    Visitors
                  </h3>
                </div>
                <div class="box-body">
                  <div id="world-map" style="height: 250px; width: 100%;"></div>
                </div><!-- /.box-body-->
                <div class="box-footer no-border">
                  <div class="row">
                    <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                      <div id="sparkline-1"></div>
                      <div class="knob-label">访客记录</div>
                    </div><!-- ./col -->
                    <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                      <div id="sparkline-2"></div>
                      <div class="knob-label">Online</div>
                    </div><!-- ./col -->
                    <div class="col-xs-4 text-center">
                      <div id="sparkline-3"></div>
                      <div class="knob-label">Exists</div>
                    </div><!-- ./col -->
                  </div><!-- /.row -->
                </div>
              </div>
              <!-- /.box -->

              

              <!--日历 -->
              <div class="box box-solid bg-green-gradient">
                <div class="box-header">
                  <i class="fa fa-calendar"></i>
                  <h3 class="box-title">日历</h3>
                  <!-- tools box -->
                  <div class="pull-right box-tools">
                    <!-- button with a dropdown -->
                    <div class="btn-group">
                      <button class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i></button>
                      <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#">新加事件</a></li>
                        <li><a href="#">清空事件</a></li>
                        <li class="divider"></li>
                        <li><a href="#">View calendar</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div><!-- /. tools -->
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <!--The calendar -->
                  <div id="calendar" style="width: 100%"></div>
                </div><!-- /.box-body -->
                <div class="box-footer text-black">
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- Progress bars -->
                      <div class="clearfix">
                        <span class="pull-left">任务 #1</span>
                        <small class="pull-right">90%</small>
                      </div>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                      </div>

                      <div class="clearfix">
                        <span class="pull-left">任务 #2</span>
                        <small class="pull-right">70%</small>
                      </div>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                      </div>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                      <div class="clearfix">
                        <span class="pull-left">任务 #3</span>
                        <small class="pull-right">60%</small>
                      </div>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                      </div>

                      <div class="clearfix">
                        <span class="pull-left">任务 #4</span>
                        <small class="pull-right">40%</small>
                      </div>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                      </div>
                    </div><!-- /.col -->
                  </div><!-- /.row -->
                </div>
              </div><!-- /.box -->

            </section><!-- right col -->
          </div><!-- /.row (main row) -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <script type="text/javascript">
      var name=${prodNameJson};
      var value=${prodNVJson};
      var option = {
      	    title : {
      	        text: '定制产品销售比例',
      	        subtext: '2017年第三季度',
      	        x:'center'
      	    },
      	    tooltip : {
      	        trigger: 'item',
      	        formatter: "{a} <br/>{b} : {c} ({d}%)"
      	    },
      	    legend: {
      	        orient: 'vertical',
      	        left: 'left',
      	        data:name
      	    },
      	    series : [
      	        {
      	            name: '访问来源',
      	            type: 'pie',
      	            radius : '55%',
      	            center: ['50%', '60%'],
      	            data:value,
      	            itemStyle: {
      	                emphasis: {
      	                    shadowBlur: 10,
      	                    shadowOffsetX: 0,
      	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
      	                }
      	            }
      	        }
      	    ]
      	};
      var myChart = echarts.init(document.getElementById('showChart'));  
      myChart.setOption(option); 
</script> 
      
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2017-2018 </a>.</strong> All rights reserved.
      </footer>
     <!--echart传入数据 -->
      
      
	<!--从ht 引入的script  -->
	<script language="javascript" src="${ctx}/staticfile/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/staticfile/js/datepicker/WdatePicker.js"></script>
    <!-- jQuery 2.1.4 配置 -->
    <script src="${ctx}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${ctx}/bootstrap/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
    <!-- Sparkline -->
    <script src="${ctx}/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="${ctx}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="${ctx}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="${ctx}/plugins/knob/jquery.knob.js"></script>
    <!-- daterangepicker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="${ctx}/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- datepicker -->
    <script src="${ctx}/plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="${ctx}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="${ctx}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="${ctx}/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${ctx}/dist/js/app.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="${ctx}/dist/js/pages/dashboard.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${ctx}/dist/js/demo.js"></script>
  </body>
</html>

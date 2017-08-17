<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="../head-less.jsp" %>          
          
          <!-- 系统列表 -->
          <ul class="sidebar-menu">
            <li class="header">系统管理</li>
            
            <li class="treeview">
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
            <li class="active treeview">
              <a href="#">
                <i class="fa fa-files-o"></i>
                <span>订单管理</span>
              </a>
              <ul class="treeview-menu">
              <li><a href="toorderlist"><i class="fa fa-circle-o"></i> 订单列表</a></li>
               <li><a href="tocreateorder"><i class="fa fa-circle-o"></i> 订单新增</a></li>
               <li><a href="#" onclick="formSubmit('todeleteorder','_self');this.blur();"><i class="fa fa-circle-o"></i>订单删除</a></li>
               <li><a href="#" onclick="formSubmit('toupdateorder','_self');this.blur();"><i class="fa fa-circle-o"></i>订单修改</a></li>
               <li><a href="#" onclick="formSubmit('toqueryorder','_self');this.blur();"><i class="fa fa-circle-o"></i>订单查看</a></li>
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
           订单管理 
          </h1>
          <ol class="breadcrumb">
            <li><a href="/toback.action"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">订单管理</li>
            <li class="active">订单添加</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
           <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">订单增加</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form method="post">
                  <table id="example2" class="table table-bordered table-hover">
                   
					<tr>
						<td>订单金额：</td>
						<td><input name="orderMoney" type="text"/></td>
					</tr>
					<tr>
						<td>订单信息：</td>
						<td><textarea style="height:50px;width:100%" name="receiveInfo"></textarea></td>
					</tr>
					<tr>
						<td>收货虚拟id：</td>
						<td><input name="userId" type="text"/></td>
					</tr>
					
					<tr>
						<td align="center"><a href="#" onclick="formSubmit('newOrder','_self');this.blur();">保存</a></td>
						<td align="center"><a href="#" onclick="window.history.go(-1)">返回</a></td>
					</tr>
					
                  </table>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
<%@include file="../foot.jsp" %>
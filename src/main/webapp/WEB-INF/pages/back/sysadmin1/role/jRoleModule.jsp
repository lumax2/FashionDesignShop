<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="../head-lesss.jsp" %>
          
          <!-- 系统列表 -->
          <ul class="sidebar-menu">
            <li class="header">系统列表</li>
            
            <li class=" treeview">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>商品列表</span> <i class="fa fa-angle-left pull-right"></i>
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
                <span>订单列表</span>
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
                <span>用户列表</span>
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
            <li class="active treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>角色列表</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
              	 <li><a href="torolelist"><i class="fa fa-circle-o"></i> 角色列表</a></li>
                <li><a href="#" onclick="formSubmit('tocreaterole','_self');this.blur();"><i class="fa fa-circle-o"></i> 角色增加</a></li>
                <li><a href="#" onclick="formSubmit('todeleterole','_self');this.blur();"><i class="fa fa-circle-o"></i> 角色删除</a></li>
                <li><a href="#" onclick="formSubmit('toupdaterole','_self');this.blur();"><i class="fa fa-circle-o"></i>角色修改</a></li>
                <li><a href="#" onclick="formSubmit('toqueryrole','_self');this.blur();"><i class="fa fa-circle-o"></i> 角色查询</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>权限列表</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
             	<li><a href="tomodulelist"><i class="fa fa-circle-o"></i> 权限列表</a></li>
                <li><a href="tocreatemodule"><i class="fa fa-circle-o"></i> 权限增加</a></li>
                <li><a href="todeletemodule"><i class="fa fa-circle-o"></i>权限删除</a></li>
                <li><a href="toupdatemodule"><i class="fa fa-circle-o"></i> 权限修改</a></li>
                <li><a href="toquerymodule"><i class="fa fa-circle-o"></i> 权限查询</a></li>
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
           角色列表
          </h1>
          <ol class="breadcrumb">
            <li><a href="/toback.action"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">角色列表</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
           <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">设置权限</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form method="post">
                  <table id="example2" class="table table-bordered table-hover">
                   <tr class="odd" hidden="hidden">
					  <td>角色id</td>
					  <td>
					  <input name="roleId" value="${roleId }">
					  </td>
					</tr>
					<tr class="odd">
					  <td>权限名称</td>
					  <c:forEach items="${moduleList}" var="m">
					  <td >
					  <input name="moduleId" type="checkbox"
						  <c:forEach items="${rModuleList }" var="rm">
						  <c:if test="${rm==m.moduleId }">checked="checked"</c:if>
						  </c:forEach>
						  value="${m.moduleId}"
					   >${m.moduleName}
					  
					  </td>
					  </c:forEach>
					</tr>
					<tr class="odd">
					  <td colspan="2"><a href="#" onclick="formSubmit('saveRoleModule','_self');this.blur();">提交</td>
					</tr>
                  </table>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
    <%@include file="../foot.jsp"%>
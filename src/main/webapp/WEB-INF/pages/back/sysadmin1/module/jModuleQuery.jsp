<%@ page contentType="text/html; charset=utf-8"%>
<%@include file="../head-less.jsp" %>          
          
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
           权限管理 
          </h1>
          <ol class="breadcrumb">
            <li><a href="/toback.action"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">权限管理</li>
            <li class="active">权限列表</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
           <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">权限查询</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form>
                  <table id="example2" class="table table-bordered table-hover">
                    <thead>
                      <tr>
						<th class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('productId',this)"></td>
                        <th class="tableHeader">产品货号</th>
                        <th class="tableHeader">产品名称</th>
                        <th class="tableHeader">产品单价</th>
                        <th class="tableHeader">产品详情</th>
                      
                      </tr>
                    </thead>
                    <tbody>
                 <%--    <c:forEach items="${productList}" var="p" varStatus="status"> --%>
                      <tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'"> 
                        <td><input type="checkbox" name="userId" value="${p.productId}"/></td>
                        <td>Mozilla 1.0</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td>1</td>
                        <td>A</td>
                      </tr>
                <%--       </c:forEach> --%>
                      <tr>
                        <td>Gecko</td>
                        <td>Mozilla 1.1</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td>1.1</td>
                        <td>A</td>
                      </tr>
                      <tr>
                        <td>Gecko</td>
                        <td>Mozilla 1.2</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td>1.2</td>
                        <td>A</td>
                      </tr>
                      <tr>
                        <td>Gecko</td>
                        <td>Mozilla 1.3</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td>1.3</td>
                        <td>A</td>
                      </tr>
                      <tr>
                        <td>Gecko</td>
                        <td>Mozilla 1.4</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td>1.4</td>
                        <td>A</td>
                      </tr>
                      <tr>
                        <td>Gecko</td>
                        <td>Mozilla 1.5</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td>1.5</td>
                        <td>A</td>
                      </tr>
                      <tr>
                        <td>Gecko</td>
                        <td>Mozilla 1.6</td>
                        <td>Win 95+ / OSX.1+</td>
                        <td>1.6</td>
                        <td>A</td>
                      </tr>
            
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>Rendering engine</th>
                        <th>Browser</th>
                        <th>Platform(s)</th>
                        <th>Engine version</th>
                        <th>CSS grade</th>
                      </tr>
                    </tfoot>
                  </table>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
     <%@include file="../foot.jsp"%>
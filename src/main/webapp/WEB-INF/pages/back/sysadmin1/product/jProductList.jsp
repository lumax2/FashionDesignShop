<%@ page contentType="text/html; charset=utf-8"%>
<!-- 从htbase.jsp引入 -->
<%@include file="../head.jsp"%>
<!-- 右下主页内容-->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>产品管理</h1>
		<ol class="breadcrumb">
			<li><a href="/toback.action"><i class="fa fa-dashboard"></i>
					Home</a></li>
			<li class="active">产品管理</li>
			<li class="active">产品列表</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<form action="prodListExcelOut">
							<input type="submit" value="Excel导出">
						</form>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form style="text-align:center">
							<table id="example2" class="table table-bordered table-hover" >
								<thead>
									<tr>
										<th class="tableHeader">序号</th>
										<th class="tableHeader">产品货号</th>
										<th class="tableHeader">产品名称</th>
										<th class="tableHeader">产品单价</th>
										<th class="tableHeader">产品品类</th>
										<th class="tableHeader">产品详情</th>
										<th class="tableHeader">产品照片</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${productList}" var="p" varStatus="status">
										<tr class="odd" onmouseover="this.className='highlight'"
											onmouseout="this.className='odd'">
											<td>${status.index+1}</td>
											<td>${p.productId}</td>
											<td>${p.productName }</td>
											<td>${p.productPrice }</td>
											<td>${p.productCatory }</td>
											<td>${p.productDesc }</td>
											<td><img src="${p.imgUrl }" width="50px"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
									<ul class="pagination" style="align:center">
										<li><a href="#">&laquo;</a></li>
										<li class="active"><a href="#">1</a></li>
										<li class="disabled"><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
						</form>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<%@include file="../foot.jsp"%>
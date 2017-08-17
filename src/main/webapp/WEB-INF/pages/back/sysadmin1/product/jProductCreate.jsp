<%@ page contentType="text/html; charset=utf-8"%>
<!-- 从htbase.jsp引入 -->
<%@include file="../head.jsp" %>

      <!-- 右下主页内容-->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
           产品管理 
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
                  <h3 class="box-title">产品增加</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form action="createproduct"  method ="post"  enctype="multipart/form-data" >
                  <table id="example2" class="table table-bordered table-hover">
                    
					<tr>
						<td>产品货号：</td>
						<td><input name="productId" type="text"  ></td>
					</tr>
					<tr>
						<td>产品名称：</td>
						<td><input name="productName" type="text"  ></td>
					</tr>
					<tr>
						<td>产品单价：</td>
						<td><input name="productPrice" type="text"  ></td>
					</tr>
					<tr>
						<td>产品品类：</td>
						<td><input name="productCatory" type="text"  ></td>
					</tr>
					<tr>
						<td>产品备注：</td>
						<td><input name="productDesc" type="text"  ></td>
					</tr>
				 	<tr>
						<td>产品照片：</td>
 						<td>
 						<!--ajax 利用dropzone插件，先提交找文件到服务器
 						  -->
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

   <%@include file="../foot.jsp"%>
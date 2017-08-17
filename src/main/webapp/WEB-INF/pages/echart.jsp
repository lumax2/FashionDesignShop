<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript" src="js/echarts.js"></script>


<h3 class="page-title">
     Echarts 展示 <small>可视化图表</small>
</h3>
</div>
 
 
<div class="row">
     <div class="col-lg-6 col-sm-12 col-xs-12 col-sm-12">
         <div id="showChart" style="width:100%;height:600px;margin-left:0px;margin-right:6px;margin-bottom:8px;float:left;overflow:hidden;"></div>
     </div>

 </div>
 <!--  ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎'] [
	                {value:335, name:'直接访问'},
	                {value:310, name:'邮件营销'},
	                {value:234, name:'联盟广告'},
	                {value:135, name:'视频广告'},
	                {value:1548, name:'搜索引擎'}
	            ]-->

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












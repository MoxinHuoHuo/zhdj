<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>重新提交计划</title>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="重新提交计划">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}assets/css/amazeui.min.css" />
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
	      <div class="am-header-left am-header-nav">
	          <a href="#left-link" class="">

	              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
	          </a>
	      </div>

	      <h1 class="am-header-title">
	          计划详情
	      </h1>

 	 </header>

 	 <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        计划开展：
	    </h2>
	</div>
	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}images/time1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>开始时间:</b></div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;">2016-06-14 14:45:00</div>
	  	</div>
  	<div class="am-g">
  		<div class="am-u-sm-5">
  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}images/time2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>结束时间:</b></div>
  		</div>
  		<div class="am-u-sm-7" style="margin-top: 10px;">2016-06-14 14:45:00</div>
	</div>
	<div class="am-g">
  		<div class="am-u-sm-5">
  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}images/titime.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>提交时间:</b></div>
  		</div>
  		<div class="am-u-sm-7" style="margin-top: 10px;">2016-06-14 14:45:00</div>
	</div>
	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        计划详情：
	    </h2>
	</div>
	<div class="am-g">
  		<div class="am-u-sm-5">
  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}images/place.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>执行地点:</b></div>
  		</div>
  		<div class="am-u-sm-7" style="margin-top: 10px;">海量数换个活法规范化对方</div>
  	</div>
  	<div class="am-g">
  			<div class="am-u-sm-5">
	    		<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}images/po1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>计划内容:</b></div>
	    	</div>
	    	<div class="am-u-sm-7" style="margin-top: 10px;float: right;"><button
				  type="button"
				  class="am-btn am-btn-sm am-btn-success"
				  data-am-modal="{target: '#my-alert'}">
				  查看
				</button>
				</a>
			</div>	
	</div>
	<!-- <div class="am-form-group am-form" style="margin-left: 10px;margin-right: 12px;">
		<textarea class="" rows="7" id="doc-ta-1">倒萨尽快立法实践的福克斯尽快立法的快乐</textarea>
	</div> -->
	

	<div class="am-g" style="margin-top: 28px;">
		<center><button type="button" class="am-btn am-btn-danger" style="width: 85%">删除该计划并重新提交</button></center>
	</div>


	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">计划内容</div>
		    <div class="am-modal-bd">
		      撒旦解放拉就发生看来飞机撒看来是放假啊看来
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn">确定</span>
		    </div>
		  </div>
	</div>

	<script src="${pageContext.request.contextPath}assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}assets/js/amazeui.min.js"></script>
</body>
</html>
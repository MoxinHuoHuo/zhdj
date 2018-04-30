<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>任务详情</title>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="任务详情">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
</head>
<body>

	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="javascript:history.back(-1)" class="">

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          任务详情
      </h1>

  </header>

   <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        任务标题：
	    </h2>
	</div>

  	<div class="am-g">
  		<div class="am-u-lg-12">
  			<!-- <legend style="margin-bottom: 5px;">任务标题:</legend> -->
  			<div><h4 style="margin-left: 10px;">${rows.tastTitle}</h4></div>
  		</div>
  	</div>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        任务开展：
	    </h2>
	</div>
	  	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/time1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>开始时间:</b></div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;">${rows.startTime}</div>
	  	</div>
	  	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/time2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>结束时间:</b></div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;">${rows.finishTime}</div>
  		</div>


  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 20px;">
	    <h2 class="am-titlebar-title ">
	        任务信息：
	    </h2>
	</div>
  	<div class="am-g">
	  		<div class="am-u-sm-4">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>附件:</b></div>
	  		</div>
	  		<div class="am-u-sm-5" style="margin-top: 10px;">${rows.finishTime}</div>
	  		<div class="am-u-sm-3" style="margin-top: 10px;"><a href="#"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius">下载</button></a></div>
  	</div>

  	<div class="am-g">
	  		<div class="am-u-sm-9">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po1.png" width="23" style="margin-left: 10px;margin-bottom: 6px;margin-right: 5px;"><b>内容:</b></div>
	  		</div>
	  		<div class="am-u-sm-3" style="margin-top: 10px;float: right;"><button
				  type="button"
				  class="am-btn am-btn-sm am-btn-success"
				  data-am-modal="{target: '#my-alert'}">
				  查看
				</button>
				</a>
			</div>
  	</div>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 15px;">
	    <h2 class="am-titlebar-title ">
	        提交情况：
	    </h2>
	</div>

	<div class="am-g">
	  		<div class="am-u-sm-4">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/sub1.png" width="30" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>计划:</b></div>
	  		</div>
	  		<!-- <div class="am-u-sm-5" style="margin-top: 15px;">未提交</div> -->
	  		<div class="am-u-sm-3" style="margin-top: 10px;"><a href="#"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius">审核</button></a></div>
  	</div>

	<div class="am-g">
	  		<div class="am-u-sm-4">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/sub2.png" width="30" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>报告:</b></div>
	  		</div>
	  		<!-- <div class="am-u-sm-5" style="margin-top: 15px;">未提交</div> -->
	  		<div class="am-u-sm-3" style="margin-top: 10px;"><a href="#"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius" id="bt1">审核</button></a></div>
	  </div>
  	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">任务内容</div>
		    <div class="am-modal-bd">
		      Hello world！
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn">确定</span>
		    </div>
		  </div>
	</div>

	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script type="text/javascript">
		/*document.getElementById("bt1").innerHTML="我是另一个按钮";*/
	</script>
</body>
</html>
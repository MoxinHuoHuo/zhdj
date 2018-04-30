<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>计划列表</title>
	<meta http-equiv="description" content="已下达任务">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

	<meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
	">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/lib/weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/jquery-weui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/demos/css/demos.css">
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
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
          计划审核
      </h1>
  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title ">
	        计划列表
	    </h2>
   </div>
   <div data-am-widget="tabs"
       class="am-tabs am-tabs-default"
        >
        <ul class="am-tabs-nav am-cf">
	          <li class="am-active"><a href="[data-tab-panel-0]">私人计划</a></li>
	          <li class=""><a href="[data-tab-panel-1]">本组织计划</a></li>
	          <li class=""><a href="[data-tab-panel-2]">下级组织计划</a></li>
      	</ul>
      <div class="am-tabs-bd">
  		  <div data-tab-panel-0 class="am-tab-panel am-active">
  		  	  <div class="weui-panel__bd">
		          <div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">姓名：小梅<b style="float: right;">未通过</b></h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">组织:官方机构</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">审核</a></b>
		            	
		            </p>
          			</div>
		           <div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">姓名：小梅<b style="float: right;">未通过</b></h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">组织:官方机构</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">审核</a></b>
		            	
		            </p>
          			</div>
          
        		</div>
  		  </div>

  		  <div data-tab-panel-1 class="am-tab-panel">
  		  		<div class="weui-panel__bd">
		          <div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">姓名：小梅<b style="float: right;">未通过</b></h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">组织:官方机构</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">审核</a></b>
		            	
		            </p>
          			</div>
		           <div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">姓名：小梅<b style="float: right;">未通过</b></h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">组织:官方机构</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">审核</a></b>
		            	
		            </p>
          			</div>
          			<div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">姓名：小梅<b style="float: right;">未通过</b></h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">组织:官方机构</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">审核</a></b>
		            	
		            </p>
          			</div>
          
        		</div>
  		  </div>

  		  <div data-tab-panel-2 class="am-tab-panel">
  		  		<div class="weui-panel__bd">
		          <div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">姓名：小梅<b style="float: right;">未通过</b></h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">组织:官方机构</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">审核</a></b>
		            	
		            </p>
          			</div>
		           <div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">姓名：小梅<b style="float: right;">未通过</b></h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">组织:官方机构</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">审核</a></b>
		            	
		            </p>
          			</div>
          
        		</div>
  		  </div>

      </div>

      
   </div>

	<script src="${pageContext.request.contextPath}/dist/lib/jquery-2.1.4.js"></script>
	<script src="${pageContext.request.contextPath}/dist/lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	</script>
	<script src="${pageContext.request.contextPath}/dist/js/jquery-weui.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.page.js"></script>
</body>
</html>
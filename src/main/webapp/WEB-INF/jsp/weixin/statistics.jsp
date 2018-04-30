<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
  <title>统计</title>
  <meta charset="utf-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
	 <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

	 <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
	">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/lib/weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/jquery-weui.css">
	<!-- <link rel="stylesheet" href="dist/demos/css/demos.css"> -->
	<style type="text/css">
		.weui-media-box_appmsg{
			height: 35px;
		}
	</style>

  </head>

  <body ontouchstart >
    <header class='demos-header' style="margin-top: 0px; margin-bottom: 10px;">
      <div style="background-color: #0e90d2;height: 3em;">
                <a href="${pageContext.request.contextPath}/base/goURL/weixin/main"><span style="position: relative;top: 10px;left: 10px;"><img width="25" src="${pageContext.request.contextPath}/images/jian.png"></span></a>
                <center><span style="font-size: 20px;position:relative;bottom: 25px;color: #F4F4F4;font-weight: bold;">数据统计</span></center>
          </div>
    </header>
    <div class="page__bd">
      <div class="weui-panel weui-panel_access">
        <div class="weui-panel__hd" style="font-size: 19px;">会议统计</div>
        <div class="weui-panel__bd">
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/staticShowper;" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
              <img style="width: 48px;margin-top: 5px;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/po5.png" alt="">
            </div>
            <div class="weui-media-box__bd">
              <h4 class="weui-media-box__title">个人统计</h4>
            </div>
            <div class="weui-media-box__hd" style="margin-right: 0px;">
           	  <img style="width: 38px;margin-top: 10px;float: right;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/next.png" alt="">
        	</div>
          </a>
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/staticShowuon;" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
              <img style="width: 48px;margin-top: 10px;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/myuon.png" alt="">
            </div>
            <div class="weui-media-box__bd">
              <h4 class="weui-media-box__title">组织统计</h4>
            </div>
            <div class="weui-media-box__hd" style="margin-right: 0px;">
           	  <img style="width: 38px;margin-top: 10px;float: right;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/next.png" alt="">
        	</div>
          </a>
        </div>
      </div>
      
    </div>
<shiro:hasAnyRoles  name="superAdmin,admin,secretary">
    <div class="page__bd" style="margin-top: 27px;">
      <div class="weui-panel weui-panel_access">
        <div class="weui-panel__hd" style="font-size: 19px;">任务统计</div>
        <div class="weui-panel__bd">
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/StaticTask;" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
              <img style="width: 48px;margin-top: 5px;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/tj1.png" alt="">
            </div>
            
            <div class="weui-media-box__bd">
              <h4 class="weui-media-box__title">组织统计</h4>
            </div>
            <div class="weui-media-box__hd" style="margin-right: 0px;">
           	  <img style="width: 38px;margin-top: 10px;float: right;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/next.png" alt="">
        	</div>
          </a>
        </div>
      </div>
      
    </div>
    </shiro:hasAnyRoles>
    
    <div class="page__bd" style="margin-top: 27px;">
      <div class="weui-panel weui-panel_access">
        <div class="weui-panel__hd" style="font-size: 19px;">考核</div>
        <div class="weui-panel__bd">
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/ogAudit" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
              <img style="width: 48px;margin-top: 5px;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/stat1.png" alt="">
            </div>
            
            <div class="weui-media-box__bd">
              <h4 class="weui-media-box__title">组织考核</h4>
            </div>
            <div class="weui-media-box__hd" style="margin-right: 0px;">
           	  <img style="width: 38px;margin-top: 10px;float: right;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/next.png" alt="">
        	</div>
          </a>
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/personalAudit" class="weui-media-box weui-media-box_appmsg">
            <div class="weui-media-box__hd">
              <img style="width: 48px;margin-top: 5px;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/stat2.png" alt="">
            </div>
            
            <div class="weui-media-box__bd">
              <h4 class="weui-media-box__title">个人考核</h4>
            </div>
            <div class="weui-media-box__hd" style="margin-right: 0px;">
           	  <img style="width: 38px;margin-top: 10px;float: right;" class="weui-media-box__thumb" src="${pageContext.request.contextPath}/images/next.png" alt="">
        	</div>
          </a>
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
    <center><div>粤icp备09004280号</div></center>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="description" content="会议操作">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css" />
<style type="text/css">
#am-list a{
	padding:0;
	font-size: 18px;
	color: #111;
}
.co7{
	position: absolute;
	right: 4%;
}
</style>
</head>
<body>
	<header data-am-widget="header" class="am-header am-header-default" style="height: 50px;">
	<div class="am-header-left am-header-nav" >
		<a href="javascript:history.go(-1)"><img class="am-header-icon-custom"
			src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;"
			alt="" style="margin-top:17px;">
		</a>
	</div>


		<div class="am-header-right am-header-nav">
			<a href="${pageContext.request.contextPath}/base/goURL/weixin/main" class="">
				主页
			</a>
		</div>

	<h1 class="am-header-title" style="font-size: 23px;">会议操作</h1>
	</header>

	<div class="am-g" style="margin-top:20px;">
	  <div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;">
	    <ul class="am-list am-list-static am-list-border" id="am-list">
	    
	      <li><a href="${pageContext.request.contextPath}/base/goURL/weixin/mtComment?mtId=<%=request.getParameter("mtId")%>">&nbsp;<img src="images/co6.png" width="25px" height="25px">
		  &nbsp;&nbsp;评论
		  <shiro:hasAnyRoles  name="superAdmin,admin,secretary">
		  <img src="images/next.png" width="25px" height="25px" class="co7"></a></li>
		  <li><a href='${pageContext.request.contextPath}/base/goURL/weixin/mtDetails?mtId=<%=request.getParameter("mtId")%>'>&nbsp;<img src="images/co1.png" width="25px" height="25px">
		  &nbsp;&nbsp;详情
		 </shiro:hasAnyRoles >
		 <shiro:hasAnyRoles  name="superAdmin,admin,secretary">
		  <img src="images/next.png" width="25px" height="25px" class="co7"></a></li>
		  <li><a href="${pageContext.request.contextPath}/base/goURL/weixin/mtSignCode?mtId=<%=request.getParameter("mtId")%>">&nbsp;<img src="images/co2.png" width="25px" height="25px">
		  &nbsp;&nbsp;扫二维码签到
		  </shiro:hasAnyRoles>
		  <shiro:hasAnyRoles  name="superAdmin,admin,secretary">
		  <img src="images/next.png" width="25px" height="25px" class="co7"></a></li>
		  <li><a href="${pageContext.request.contextPath}/base/goURL/weixin/addRecord?mtId=<%=request.getParameter("mtId")%>">&nbsp;<img src="images/co4.png" width="25px" height="25px">
		  &nbsp;&nbsp;上传记录
		  <img src="images/next.png" width="25px" height="25px" class="co7"></a></li>
		  <li><a href="${pageContext.request.contextPath}/base/goURL/weixin/recordList?mtId=<%=request.getParameter("mtId")%>">&nbsp;<img src="images/co5.png" width="25px" height="25px">
		  &nbsp;&nbsp;查看记录
		  </shiro:hasAnyRoles>
		   <shiro:hasAnyRoles  name="superAdmin,admin,secretary">
		  <img src="images/next.png" width="25px" height="25px" class="co7"></a></li>
		  <li><a href="javascript:void(0)" onclick="opr.deleted()">&nbsp;<img src="images/mt5.png" width="25px" height="25px">
		  &nbsp;&nbsp;删除会议
		  </shiro:hasAnyRoles>
		  <img src="images/next.png" width="25px" height="25px" class="co7"></a></li>
		</ul>

	  </div>
	</div>
	<footer data-am-widget="footer" class="am-footer am-footer-default"
		data-am-footer="{  }" style="margin-top: 30px;">
	<div class="am-footer-miscs ">

		<p>CopyRight©2018</p>
		<p>Reserved huizhouxueyuan development team</p>
	</div>
	</footer>
	
	
	<div class="am-modal am-modal-confirm" tabindex="-1" id="deleteModal">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd"></div>
	    <div class="am-modal-bd">
	      你，确定要删除这条记录吗？
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
	    </div>
	  </div>
	</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script>
<script type="text/javascript">
var meetingId=<%=request.getParameter("mtId")%>;
var opr={
	deleted:function(){
		$("#deleteModal").modal({
	        relatedTarget: this,
	        onConfirm: function(options) {
	        	$.ajax({
	        		url:"${pageContext.request.contextPath}/meeting/delete",
	        		dataType:"JSON",
	        		type:"POST",
	        		data:{
	        			meetingId:meetingId
	        		},
	        		success:function(data){
	        			if(data.status==1){
	        				location.href="${pageContext.request.contextPath}/base/goURL/weixin/showMeetingList";
	        			}
	        		}
	        	})
	        }
      	});
	}
}
</script>
	<center>粤icp备09004280号</center>
</body>
</html>

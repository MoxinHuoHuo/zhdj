<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="description" content="人员详情">
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
#peopleDiv{
	width:100%;
}
#peopleDiv li{
	width:80%;
	height:50px;
	display:flex;
	display:-webkit-flex;
	align-items:center;
	font-size:18px;
	margin:0px 10%;
	padding:10px 0;
	line-height:50px;
}
.name:before{
	display:inline-block;
	content:"";
	width:18px;
	height:18px;
	background-image:url(images/mt7.png);
	background-size:18px 18px;
}
.status{
	position:absolute;
	right:0%;
	font-size:16px;
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

	<h1 class="am-header-title" style="font-size: 23px;">人员详情</h1>
	</header>

	<div id="peopleDiv">
		<ul class="am-list am-list-static">
			<li>
				<span class="name">测试名</span>
				<span class="status am-badge am-badge-success">已签到</span>
			</li>
			<li>
				<span class="name">测试名</span>
				<span class="status am-badge am-badge-danger">未签到</span>
			</li>
			<li>
				<span class="name">测试名</span>
				<span class="status">测试状态</span>
			</li>
		</ul>
	</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script>
<script type="text/javascript">
var opr={
	deleted:function(){
		$("#deleteModal").modal({
	        relatedTarget: this,
	        onConfirm: function(options) {
	        	$.ajax({
	        		url:"",
	        		dataType:"JSON",
	        		type:"POST",
	        		data:{
	        			
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
</body>
</html>

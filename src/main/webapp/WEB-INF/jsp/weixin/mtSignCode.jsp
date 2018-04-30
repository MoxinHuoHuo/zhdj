<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="签到二维码">
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<style type="text/css">
		#sp1{background:  #F4F4F4;}
	</style>
</head>
<body>
	<header data-am-widget="header" class="am-header am-header-default" style="height: 50px;">
	<div class="am-header-left am-header-nav" >
		<a href="javascript:history.go(-1)"><img class="am-header-icon-custom"
			src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;"
			alt="" >
		</a>
	</div>

	<h1 class="am-header-title" style="font-size: 23px;">签到二维码</h1>
	</header>

	<div class="am-g" style="margin-top:20px;">
	  <div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;width:100%;display: flex;justify-content:center;">
	    <img src="" id="codeImg" style="width:220px;height:220px;display:block;">
	  </div>
	  <div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;width:100%;display: flex;justify-content:center;">
	    <p style="font-size:16px;">扫描以上二维码进行会议签到</p>
	  </div>
	</div>
	
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
	var relUserTreeId=<%=session.getAttribute("RelUserTreeId")%>;
	var relUserLoginId=<%=session.getAttribute("RelUserLoginId")%>;
	var mtId=<%=request.getParameter("mtId")%>;
	var signCode=({
		getCode:function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/meeting/getuuid",
				type:"POST",
				data:{
					id:mtId
				},
				success:function(data){
					$("#codeImg").attr("src","http://zhdj.huidong.gov.cn/zhdj/meeting/getSign?url=http://zhdj.huidong.gov.cn/zhdj/base/goURL/weixin/mtSign?uuid="+data);
				}
			})
		}
	})
	signCode.getCode();
</script>
	<center>粤icp备09004280号</center>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="description" content="上传记录">
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

	<h1 class="am-header-title" style="font-size: 23px;">查看记录</h1>
	</header>

	  <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        记录信息查看：
	    </h2>
  </div>
<div id="mainDiv">
</div>

   


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script>
<script type="text/javascript">
var meetingId=<%=request.getParameter("mtId")%>;
var index;
var record={
	getRecordList:function(){							//从后台获得会议数据，并调用createMTNode方法创建会议列表
		index=1;				
		$.ajax({
			url:"/zhdj/meeting/getFileUrl",
	 		data:{
	 			meetingId:meetingId
	 		},
	 		dataType:"JSON",
	 		type:"GET",
			success:function(data){
				for(i in data.rows)
					record.createMTNode(data.rows[i]);
			}
		})
	},
	createMTNode:function(data){						//根据数据创建每一条评论列表
		var $newDiv=$("<div class='am-u-sm-8'><div style='margin-top: 10px;font-size:15px;'><img src='images/po2.png' width='23' style='margin-left: 10px;margin-right: 5px;'><b>附件"+index+"</b></div></div>");
		var $newDiv1=$("<div class='am-u-sm-4' style=''><a href='' class='downlo am-btn am-btn-sm am-btn-success am-radius' onclick='record.upload($(this))'>下载</a><input type='hidden' id='fileUrl' value='"+data.file+"'></div>");
		var $newDiv2=$("<div class='am-g' style='margin-top:5px;'></div>");
		$newDiv2.append($newDiv);
		$newDiv2.append($newDiv1);
		$("#mainDiv").append($newDiv2);
		index++;
	},
	upload:function($this){
		var url=$this.next().val();
		alert(url);
	
		window.open(url);
	}
}
record.getRecordList();
</script>
	<center>粤icp备09004280号</center>
</body>
</html>

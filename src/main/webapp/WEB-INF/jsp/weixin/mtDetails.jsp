<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
<base href='<%=basePath%>'>
   
<meta charset='utf-8'>
<title>会议详情</title>
<meta http-equiv='description' content='会议详情'>
<meta http-equiv='pragma' content='no-cache'>
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='keywords' content='keyword1,keyword2,keyword3'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no'>
   <meta name='apple-mobile-web-app-capable' content='yes' />
   <meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta name='format-detection' content='telephone=no'>
<meta name='renderer' content='webkit'>
<meta http-equiv='Cache-Control' content='no-siteapp' />
<link rel='alternate icon' type='image/png' href='${pageContext.request.contextPath}/assets/i/favicon.png'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/assets/css/amazeui.min.css' />
<style type="text/css">
#am-list1,#am-list2,#am-list3{
	padding:0;
	font-size: 18px;
	color: #111;
}
.am-list img{
	position: relative;
	top:-3px;
}
.am-list li{
	width: 90%;
	margin-left: 5%;
	margin-right: 5%;
	border:0;
}
.co7{
	position: absolute;
	right: 4%;
}
.am-list a{
	padding:0;
}
.am-list{
	margin-bottom: 6px;
}
</style>
</head>
<body>
	<header data-am-widget="header"
          class="am-header am-header-default">
      <div class="am-header-left am-header-nav">
          <a href="javascript:history.back(-1)" class="">
              <img class="am-header-icon-custom" style="margin-top:15px;"
              src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          会议详情
      </h1>
  </header>

  	<div class="am-g" style="margin-top:20px;">
	  <div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;">
	    <ul class="am-list am-list-static " id="am-list1">
		  <li style="border-bottom: 2px solid #999;"><a href="" style="font-size: 20px;color:#3498DB;border-left: 3px solid #3498DB;padding:0;">
		  &nbsp;会议标题
		  </a></li>
		  <li id="coTitle"></li>
		</ul>
	  </div>
	</div>

	<div class="am-g" >
	  <div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;">
	    <ul class="am-list am-list-static " id="am-list2">
		  <li style="border-bottom:2px solid #999;"><a href="" style="font-size:20px;color:#3498DB;border-left: 3px solid #3498DB;padding:0;">
		  &nbsp;会议签到
		  </a></li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/po3.png" width="24px" height="24px">
		  &nbsp;开始时间&nbsp;:&nbsp;<span id="startTime2"></span>
		  </li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/po4.png" width="24px" height="24px">
		  &nbsp;结束时间&nbsp;:&nbsp;<span id="overTime2"></span>
		  </li>
		  </li>
		</ul>
	  </div>
	</div>

	<div class="am-g" >
	  <div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;">
	    <ul class="am-list am-list-static " id="am-list2">
		  <li style="border-bottom:2px solid #999;"><a href="" style="font-size:20px;color:#3498DB;border-left: 3px solid #3498DB;padding:0;">
		  &nbsp;会议开展
		  </a></li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/time1.png" width="24px" height="24px">
		  &nbsp;开始时间&nbsp;:&nbsp;<span id="startTime1"></span>
		  </li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/time2.png" width="24px" height="24px">
		  &nbsp;结束时间&nbsp;:&nbsp;<span id="overTime1"></span>
		  </li>
		  </li>
		</ul>
	  </div>
	</div>

	<div class="am-g" >
	  <div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;">
	    <ul class="am-list am-list-static " id="am-list2">
		  <li style="border-bottom:2px solid #999;"><a href="" style="font-size:20px;color:#3498DB;border-left: 3px solid #3498DB;padding:0;">
		  &nbsp;会议信息
		  </a></li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/myuon.png" width="24px" height="24px">
		  &nbsp;应到人数&nbsp;:&nbsp;<span id="people"></span><span style="width: 50px;height: 24px;position: absolute;right: 0%;"><a href="${pageContext.request.contextPath}/base/goURL/weixin/attendSta?id=<%=request.getParameter("mtId")%>">详情</a></span>
		  </li>
		  <li>&nbsp;<img src="${pageContext.request.contextPath}/images/place.png" width="24px" height="24px">
		  &nbsp;会议地址&nbsp;:&nbsp;<span id="dtLocation"></span>
		  </li>
		  <li >&nbsp;<img src="${pageContext.request.contextPath}/images/po1.png" width="24px" height="24px">
		  &nbsp;内容&nbsp;&nbsp;<span ></span><span style="width: 50px;height: 24px;position: absolute;right: 0%;"><a onclick="mtDetails.showContentModal()">详情</a></span>
		  </li>
		</ul>
	  </div>
	</div>

<footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }" style="margin-top: 30px;">
  	<div class="am-footer-miscs ">

        <p>CopyRight©2018</p>
        <p>Reserved huizhouxueyuan development team</p>
    </div>
</footer>

<div class="am-modal am-modal-alert" tabindex="-1" id="contentModal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">会议内容</div>
    <div class="am-modal-bd" id="content">
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
    </div>
  </div>
</div>


 <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
 <script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
 <script type="text/javascript">
 var mtId=<%=request.getParameter("mtId")%>;
 var mtDetails={
 showData:function(){							//从后台获取会议数据展示
 	$.ajax({
 		url:"/zhdj/meeting/getMeetingById",
 		data:{
 			id:mtId
 		},
 		dataType:"JSON",
 		type:"GET",
 		success:function(data){
            console.log('data.rows.aEndTime',data.rows.aEndTime);
 			$("#coTitle").html(data.rows.meetingTitle);		//agr1表示后台传来的会议标题参数
 			$("#startTime1").html(data.rows.aStartTime);		//agr2表示后台传来的会议开展开始时间
 			$("#overTime1").html(data.rows.aEndTime);		//agr3表示后台传来的会议开展结束时间
 			$("#startTime2").html(data.rows.aSignStartTime);		//agr4表示后台传来的会议签到开始时间
 			$("#overTime2").html(data.rows.aSignEndTime);		//agr5表示后台传来的会议签到结束时间
 			$("#people").html(data.rows.arriveNumber);		//agr6表示后台传来的参会人数
 			/* $("#location").html(data.agr7);		//agr7表示后台传来的会议地址 */
 			$("#dtLocation").html(data.rows.dtLocation);		//agr8表示后台传来的会议详细地址
 			$("#content").html(data.rows.meetingContent);		//agr9表示后台传来的会议内容
 		}
 	})
 },
 showContentModal:function(){
 	$("#contentModal").modal();
 }
 }
 mtDetails.showData();
 </script>
	<center>粤icp备09004280号</center>
</body>
</html>

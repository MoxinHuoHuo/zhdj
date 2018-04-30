<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>党员大会</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/lib/weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/jquery-weui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/demos/css/demos.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
</head>
<body>
	<div style="background-color: #0e90d2;height: 3em;">
                <a href="javascript:window.history.go(-1)"><span style="position: relative;top: 10px;left: 10px;"><img width="25" src="${pageContext.request.contextPath}/images/jian.png"></span></a>
                <center><span id="sp" style="font-size: 20px;position:relative;bottom: 20px;color: #F4F4F4;font-weight: bold;"></span></center>
    </div>
    <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title ">
	        会议列表
	    </h2>
   </div>
   <div data-am-widget="tabs"
       class="am-tabs am-tabs-default"
        >
        <ul class="am-tabs-nav am-cf">
	          <li class="am-active"><a href="[data-tab-panel-0]">会议</a></li>
      	</ul>
      	<div class="am-tabs-bd">
      		<div data-tab-panel-0 class="am-tab-panel am-active">
      			<div class="weui-panel__bd" id="body">
      				<!-- <div class="weui-media-box weui-media-box_appmsg">
	      				<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/met.png">
				      	</div>
				      	<div class="weui-media-box__bd">
					        <h4 class="weui-media-box__title">标题：大声地适</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">时间:2016-10-30</b>
				            	<b style="float: right;">迟到</b>
			            	</p>
				      	</div>
				      </div>
				      <div class="weui-media-box weui-media-box_appmsg">
				      	<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/met.png">
				      	</div>
				      	<div class="weui-media-box__bd">
					        <h4 class="weui-media-box__title">标题：大声地</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">时间:2016-10-30</b>
				            	<b style="float: right;">迟到</b>
			            	</p>
				      	</div>
      				  </div> -->
      			</div>
      		</div>
      		<div id="page"></div>
      	</div>
   </div>


   <script src="${pageContext.request.contextPath}/dist/lib/jquery-2.1.4.js"></script>
   <script src="${pageContext.request.contextPath}/dist/lib/fastclick.js"></script>
   <script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/365;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=365, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=365, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=365, user-scalable=no, target-densitydpi=device-dpi">');
       }
	</script>
	<script src="${pageContext.request.contextPath}/dist/js/jquery-weui.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.page.js"></script>
	<script type="text/javascript">
		var time1="<%=request.getParameter("time1")%>";
		var time2="<%=request.getParameter("time2")%>";
		var status=<%=request.getParameter("status")%>;
		var type=<%=request.getParameter("type")%>;
		var RelUserTel=<%=session.getAttribute("RelUserTel")%>;
		var page1=<%=request.getParameter("page1")%>;
		var orgId=<%=session.getAttribute("RelUserTreeId")%>;
		if(type==1){
			$("#sp").html("党员大会")
		}
		else if(type==2){
			$("#sp").html("党代会")
		}
		else if(type==3){
			$("#sp").html("民主生活会")
		}
		else if(type==4){
			$("#sp").html("党课")
		}
		var pages1;
		pages1=1;
		showT();

		function createNode(nodeData){
			var $newDiv=$("<div class='weui-media-box weui-media-box_appmsg'></div>");
			var $newDiv1=$("<div class='weui-media-box__hd'></div>");
			var $newImg=$("<img width='10' class='weui-media-box__thumb' src='${pageContext.request.contextPath}/images/met.png'>");
			var $newDiv2=$("<div class='weui-media-box__bd'></div>");
			var $newH=$("<h4 class='weui-media-box__title'>标题："+nodeData.meetingTitle+"</h4>");
			var $newP=$("<p class='weui-media-box__desc' style='margin-bottom: 3px;margin-top: 12px;'></P>");
			var $newB1=$("<b style='font-size: 15px;'>时间："+nodeData.startTime+"</b>");
			var $newB2=$("<b style='float: left;margin-top:20px;font-size: 15px;'>状态："+nodeData.signStatus+"</b>");
			$newDiv1.append($newImg);
			$newDiv2.append($newH);
			$newDiv2.append($newP);
			$newP.append($newB1);
			$newP.append($newB2);
			$newDiv.append($newDiv1);
			$newDiv.append($newDiv2);
			$("#body").append($newDiv);
		}

		function showT(){
			$.ajax({
				url:'${pageContext.request.contextPath}/meeting/personalMeetingCount',
				dataType:'json',
				type:'post',
				data:{time1:time1,time2:time2,status:status,orgId:orgId,signPeoplePhone:RelUserTel,type:type},
				success:function(data){
					for(var i=0;i<data.rows.length;i++){
						createNode(data.rows[i]); 
					}
					if(page1==null){
					page1=1;
					}
					pages1=data.total/10+1;
					$("#page").page({
					pages:pages1,
					curr:page1,
					theme:'secondary',
					first:"首页",
					prev:"<",
					next:">",
					groups:3,
					jump:function(context,first){
						if(!first){
							location.href="${pageContext.request.contextPath}/base/goURL/weixin/MetDY?page1="+context.option.curr;
						}
					}
					})
				}
			})
		}
	</script>
</body>
</html>

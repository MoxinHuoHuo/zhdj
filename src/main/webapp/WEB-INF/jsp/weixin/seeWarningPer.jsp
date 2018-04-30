<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>查看预警</title>
	
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
                <a href=""><span style="position: relative;top: 10px;left: 10px;"><img width="25" src="${pageContext.request.contextPath}/images/jian.png"></span></a>
                <center><span style="font-size: 20px;position:relative;bottom: 20px;color: #F4F4F4;font-weight: bold;">预警处理详情</span></center>
    </div>
    <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title ">
	        处理情况列表
	    </h2>
   	</div>

   	<div data-am-widget="tabs"
       class="am-tabs am-tabs-default"
        >
        <ul class="am-tabs-nav am-cf">
	          <li class="am-active"><a href="[data-tab-panel-0]">未处理</a></li>
	          <li class=""><a href="[data-tab-panel-1]">已处理</a></li>
      	</ul>
      	<div class="am-tabs-bd">
      		<div data-tab-panel-0 class="am-tab-panel panel1 am-active">
      			<div class="weui-panel__bd" id="body1">

      				<!-- <div class="weui-media-box weui-media-box_appmsg">
	      				<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/yj2.png">
				      	</div>
				      	<div class="weui-media-box__bd" style='margin-left: 7px;'>
					        <h4 class="weui-media-box__title">xisd</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">大声地</b>
			            	</p>
				      	</div>
				    </div>
				    <div class="weui-media-box weui-media-box_appmsg">
	      				<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/yj2.png">
				      	</div>
				      	<div class="weui-media-box__bd" style='margin-left: 7px;'>
					        <h4 class="weui-media-box__title">小李</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">惠东</b>
			            	</p>
				      	</div>
				    </div> -->

      			</div>
      			<div id="page1"></div>
      		</div>

      		<div data-tab-panel-1 class="am-tab-panel panel2">
      			<div class="weui-panel__bd" id="body2">
      				<!-- <div class="weui-media-box weui-media-box_appmsg">
	      				<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/yj3.png">
				      	</div>
				      	<div class="weui-media-box__bd" style='margin-left: 7px;'>
					        <h4 class="weui-media-box__title">小李</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">sdads</b>
			            	</p>
				      	</div>
				    </div>
				    <div class="weui-media-box weui-media-box_appmsg">
	      				<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/yj3.png">
				      	</div>
				      	<div class="weui-media-box__bd" style='margin-left: 7px;'>
					        <h4 class="weui-media-box__title" >小李</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">dsadsa</b>
			            	</p>
				      	</div>
				    </div> -->
      			</div>
      			<div id="page2"></div>
      		</div>

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
		var taskId=<%=request.getParameter("taskId")%>;
		var taskWarnId=0;
		var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>;
		var page1=<%=request.getParameter("page1")%>;
		var page2=<%=request.getParameter("page2")%>;
		var pages1;
		var pages2;

		if(page2>=1&&page1==null){
		page1=1;
		$(".panel1").removeClass("am-active");
		$("#tab1").removeClass("am-active");
		$(".panel2").addClass("am-active");
		$("#tab2").addClass("am-active");
		showT();
	}else if(page1>=1&&page2==null){
		page2=1;
		$(".panel2").removeClass("am-active");
		$("#tab2").removeClass("am-active");
		$(".panel1").addClass("am-active");
		$("#tab1").addClass("am-active");
		showT();
	}else{
		page1=1;
		page2=1;
		showT();
	}

	function createNode1(nodeData){
			var $newDiv=$("<div class='weui-media-box weui-media-box_appmsg'></div>");
			var $newDiv1=$("<div class='weui-media-box__hd'></div>");
			var $newDiv2=$("<div class='weui-media-box__bd' style='margin-left: 7px;'></div>");
			var $newImg=$("<img width='10' class='weui-media-box__thumb' src='${pageContext.request.contextPath}/images/yj2.png'>");
			var $newH=$("<h4 class='weui-media-box__title'>姓名："+nodeData.name+"</h4>");
			var $newP=$("<p class='weui-media-box__desc' style='margin-bottom: 3px;margin-top: 12px;'></div>");
			var $newB=$("<b style='font-size: 15px;'>手机号码:"+nodeData.tel+"</b>");
			$newDiv1.append($newImg);
			$newP.append($newB);
			$newDiv2.append($newH);
			$newDiv2.append($newP);
			$newDiv.append($newDiv1);
			$newDiv.append($newDiv2);
			$("#body1").append($newDiv);
	}

	function createNode2(nodeData){
			var $newDiv=$("<div class='weui-media-box weui-media-box_appmsg'></div>");
			var $newDiv1=$("<div class='weui-media-box__hd'></div>");
			var $newDiv2=$("<div class='weui-media-box__bd' style='margin-left: 7px;'></div>");
			var $newImg=$("<img width='10' class='weui-media-box__thumb' src='${pageContext.request.contextPath}/images/yj3.png'>");
			var $newH=$("<h4 class='weui-media-box__title'>姓名："+nodeData.name+"</h4>");
			var $newP=$("<p class='weui-media-box__desc' style='margin-bottom: 3px;margin-top: 12px;'></div>");
			var $newB=$("<b style='font-size: 15px;'>手机号码:"+nodeData.tel+"</b>");
			$newDiv1.append($newImg);
			$newP.append($newB);
			$newDiv2.append($newH);
			$newDiv2.append($newP);
			$newDiv.append($newDiv1);
			$newDiv.append($newDiv2);
			$("#body2").append($newDiv);
	}

	function showT(){
		$.ajax({
			url:'${pageContext.request.contextPath}/warning/getSettingWarning',
			dataType:'json',
			type:'get',
			data:{warnOrgId:loginTreeId,taskId:taskId,start:1,handleStatus:0,taskWarnId:taskWarnId},
			success:function(data){
				for(var i=0;i<data.rows.length;i++){
					createNode1(data.rows[i]);
				}
				if(page1==null){
				page1=1;
				}
				pages1=data.total/10+1;
				$("#page1").page({
				pages:pages1,
				curr:page1,
				theme:'secondary',
				first:"首页",
				prev:"<",
				next:">",
				groups:3,
				jump:function(context,first){
					if(!first){
						location.href="${pageContext.request.contextPath}/base/goURL/weixin/seeWarningPer?&page1="+context.option.curr+"&taskId="+taskId;
					}
				}
				})

			}
		})

		$.ajax({
			url:'${pageContext.request.contextPath}/warning/getSettingWarning',
			dataType:'json',
			type:'get',
			data:{warnOrgId:loginTreeId,taskId:taskId,start:1,handleStatus:1,taskWarnId:taskWarnId},
			success:function(data){
				for(var i=0;i<data.rows.length;i++){
					createNode2(data.rows[i]);
				}
				if(page2==null){
				page2=1;
				}
				pages2=data.total/10+1;
				$("#page2").page({
				pages:pages2,
				curr:page2,
				theme:'secondary',
				first:"首页",
				prev:"<",
				next:">",
				groups:3,
				jump:function(context,first){
					if(!first){
						location.href="${pageContext.request.contextPath}/base/goURL/weixin/seeWarningPer?&page2="+context.option.curr+"&taskId="+taskId;
					}
				}
				})

			}
		})
	}
	</script>
</body>
</html>

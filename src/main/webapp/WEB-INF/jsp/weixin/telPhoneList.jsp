<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>组织电话谱</title>
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
                <center><span style="font-size: 20px;position:relative;bottom: 20px;color: #F4F4F4;font-weight: bold;">组织电话谱</span></center>
    </div>
    <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title ">
	        人员
	    </h2>
   	</div>

   	
      	
      			<div class="weui-panel__bd" id="body1">

      				<!-- <div class="weui-media-box weui-media-box_appmsg">
	      				<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/po5.png">
				      	</div>
				      	<div class="weui-media-box__bd">
					        <h4 class="weui-media-box__title" style="margin-bottom: 0px;">姓名：小李</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 10px;">
				            	<b style="font-size: 15px;color: black;">手机号码：1231314142</b>
				            	<b style="font-size: 15px;float: left;margin-top: 10px;color: black;">所在组织：法撒发射点发生</b>
			            	</p>
				      	</div>
				    </div>
				    <div class="weui-media-box weui-media-box_appmsg">
	      				<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/po5.png">
				      	</div>
				      	<div class="weui-media-box__bd">
					        <h4 class="weui-media-box__title">姓名：小李</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">手机号码:1231314142</b>
			            	</p>
				      	</div>
				    </div> -->

      			</div>
      			<div id="page1"></div>
      		

      		

      	
  

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
		var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>;
		var page1=<%=request.getParameter("page1")%>;	
		var pages1;
		page1=1;	
		showT();

	function createNode(nodeData){
			var $newDiv=$("<div class='weui-media-box weui-media-box_appmsg'></div>");
			var $newDiv1=$("<div class='weui-media-box__hd'></div>");
			var $newDiv2=$("<div class='weui-media-box__bd'></div>");
			var $newImg=$("<img width='10' class='weui-media-box__thumb' src='${pageContext.request.contextPath}/images/po5.png'>");
			var $newH=$("<h4 class='weui-media-box__title' style='margin-bottom: 0px;'>姓名："+nodeData.userName+"</h4>");
			var $newP=$("<p class='weui-media-box__desc' style='margin-bottom: 3px;margin-top: 10px;'></div>");
			var $newB=$("<b style='font-size: 15px;color:black;'>手机号码："+nodeData.tel+"</b>");
			var $newB2=$("<b style='font-size: 15px;float: left;margin-top: 10px;color: black;'>所在组织："+nodeData.tel+"</b>");
			$newDiv1.append($newImg);
			$newP.append($newB);
			$newP.append($newB2);
			$newDiv2.append($newH);
			$newDiv2.append($newP);
			$newDiv.append($newDiv1);
			$newDiv.append($newDiv2);
			$("#body1").append($newDiv);
	}



	function showT(){
		$.ajax({
			url:"${pageContext.request.contextPath}/User/GetAdminTel",
			dataType:'json',
			type:'post',
			data:{},
			success:function(data){
				for(var i=0;i<data.length;i++){
					createNode(data[i]);
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
						location.href="${pageContext.request.contextPath}/base/goURL/weixin/telPhoneList?page1="+context.option.curr;
					}
				}
				})

			}
		})

		
	}
	</script>
</body>
</html>

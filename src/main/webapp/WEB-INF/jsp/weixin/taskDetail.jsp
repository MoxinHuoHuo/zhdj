<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>任务详情</title>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="任务详情">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
</head>
<body>

	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="javascript:history.back(-1)" class="">

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title">
          任务详情
      </h1>

  </header>

   <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        任务标题：
	    </h2>
	</div>

  	<div class="am-g">
  		<div class="am-u-lg-12">
  			<!-- <legend style="margin-bottom: 5px;">任务标题:</legend> -->
  			<div><h4 style="margin-left: 10px;" id="title"></h4></div>
  		</div>
  	</div>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 10px;">
	    <h2 class="am-titlebar-title ">
	        任务开展：
	    </h2>
	</div>
	  	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/time1.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;">开始时间:</div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;" id="start"></div>
	  	</div>
	  	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/time2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;">结束时间:</div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;" id="finish"></div>
  		</div>


  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 20px;">
	    <h2 class="am-titlebar-title ">
	        任务信息：
	    </h2>
	</div>

	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po5.png" width="23" style="margin-left: 10px;margin-bottom: 6px;margin-right: 5px;"><b>接收者:</b></div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;" id="get"></div>
  	</div>

	<div class="am-g">
	  		<div class="am-u-sm-5">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po6.png" width="23" style="margin-left: 10px;margin-bottom: 6px;margin-right: 5px;"><b>所在组织:</b></div>
	  		</div>
	  		<div class="am-u-sm-7" style="margin-top: 10px;" id="uon"></div>
  	</div>
  	<div class="am-g">
	  		<div class="am-u-sm-4">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po2.png" width="23" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>附件:</b></div>
	  		</div>
	  		<div class="am-u-sm-5" style="margin-top: 10px;" id="urlname"></div>
	  		<div class="am-u-sm-3" style="margin-top: 10px;">
	  			<button type="button" class="am-btn am-btn-sm am-btn-success am-radius" id="download">下载</button></div>
  	</div>

  	<div class="am-g">
	  		<div class="am-u-sm-9">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/po1.png" width="23" style="margin-left: 10px;margin-bottom: 6px;margin-right: 5px;"><b>内容:</b></div>
	  		</div>
	  		<div class="am-u-sm-3" style="margin-top: 10px;float: right;"><button
				  type="button"
				  class="am-btn am-btn-sm am-btn-success"
				  data-am-modal="{target: '#my-alert'}">
				  查看
				</button>
				</a>
			</div>
  	</div>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="margin-top: 15px;">
	    <h2 class="am-titlebar-title ">
	        审核情况：
	    </h2>
	</div>

	<div class="am-g">
	  		<div class="am-u-sm-4">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/sub1.png" width="30" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>计划:</b></div>
	  		</div>
	  		<div class="am-u-sm-5" style="margin-top: 15px;" id="shenhe1"></div>
	  		<div class="am-u-sm-3" style="margin-top: 10px;"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius" id="see1"></button></div>
  	</div>

	<div class="am-g">
	  		<div class="am-u-sm-4">
	  			<div style="margin-top: 10px;"><img src="${pageContext.request.contextPath}/images/sub2.png" width="30" style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>报告:</b></div>
	  		</div>
	  		<div class="am-u-sm-5" style="margin-top: 15px;" id="shenhe2"></div>
	  		<div class="am-u-sm-3" style="margin-top: 10px;"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius" id="see2"></button></div>
	  </div>
	
  	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">任务内容</div>
		    <div class="am-modal-bd" id="content">
		      
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn">确定</span>
		    </div>
		  </div>
	</div>

	<center><div>粤icp备09004280号</div></center>

	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script type="text/javascript">
		var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/420;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=420, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=420, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=420, user-scalable=no, target-densitydpi=device-dpi">');
       }
		/*document.getElementById("bt1").innerHTML="我是另一个按钮";*/
		$(function (){
		 (function ($) {
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURI(r[2]); return null;
                }
            })(jQuery);
          
          	var id =$.getUrlParam('id');
          	var receiveUnit=$.getUrlParam('receiveUnit');
          	var uuid=$.getUrlParam('uuid');
		$.getJSON("${pageContext.request.contextPath}/GetStateFromFP?tastId="+id,function(data){
    			$('#shenhe1').html(data.INF);
    			$('#shenhe2').html(data.FINF);
    			$(function(){
    			 var t=$('#shenhe1').html();
    			 if(t=="等待审核"){
    			 	$('#see1').html("审核");
    			 	$('#see1').on('click',function(){
    			 		location.href="${pageContext.request.contextPath}/base/goURL/weixin/proSubmit?tastId="+id
    			 	})
    			 }
    			 else if(t=="通过"){
    			 	$('#see1').html("查看");
    			 	$('#see1').on('click',function(){
    			 		location.href="${pageContext.request.contextPath}/base/goURL/weixin/haveSubmitpro?tastId="+id
    			 	})
    			 }
    			 else if(t=="未通过"){
    			 	$('#see1').html("查看");
    			 	$('#see1').on('click',function(){
    			 		location.href="${pageContext.request.contextPath}/base/goURL/weixin/haveSubmitpro?tastId="+id
    			 	})
    			 }
    			 else if(t=="未提交"){
    			 	$('#see1').html("等待提交");
    			 	
    			 }
    			})
    			$(function(){
    			 var t=$('#shenhe2').html();
    			 if(t=="等待审核"){
    			 	$('#see2').html("审核");
    			 	$('#see2').on('click',function(){
    			 		location.href="${pageContext.request.contextPath}/FinishConditionToCheck?uuid="+uuid+"&tastId="+id
    			 	})
    			 }
    			 else if(t=="通过"){
    			 	$('#see2').html("查看");
    			 	$('#see2').on('click',function(){
    			 		location.href="${pageContext.request.contextPath}/FinishConditionToCheck?uuid="+uuid+"&tastId="+id
    			 	})
    			 }
    			 else if(t=="未通过"){
    			 	$('#see2').html("查看");
    			 	$('#see2').on('click',function(){
    			 		location.href="${pageContext.request.contextPath}/FinishConditionToCheck?uuid="+uuid+"&tastId="+id
    			 	})
    			 }
    			 else if(t=="未提交"){
    			 	$('#see2').html("等待提交");
    			 	
    			 }
    			})
    	})		
          	$.getJSON("${pageContext.request.contextPath}/SelectMsgByTastId?tastId="+id,function(data){
          		$('#get').html(data.userName);
          		$('#uon').html(data.treeName);
          	})
          	$.getJSON("${pageContext.request.contextPath}/SelectByPrimarkey?id="+id,function(data){
          		$('#title').html(data.tast.tastTitle);
          		$('#start').html(data.tast.startTime);
          		$('#finish').html(data.tast.finishTime);
          		$('#urlname').html(data.tast.urlName);
          		$('#content').html(data.tast.tastContent);
          		$('#download').on('click',function(){
          			var url=data.tast.testUrl;
          			window.open("${pageContext.request.contextPath}/News/DownFile?fileName="+url)
          		})
          		})
		})
	</script>
</body>
</html>
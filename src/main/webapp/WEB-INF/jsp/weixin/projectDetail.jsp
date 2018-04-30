<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="description" content="任务详情">
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<style type="text/css">
		html,body{overflow:hidden;overflow-y:auto;}	
	</style>
</head>
<body>
	<header data-am-widget="header" class="am-header am-header-default"
		style="height: 50px;">
		<div class="am-header-left am-header-nav">
			<a href="javascript:history.back(-1)" class=""> <img class="am-header-icon-custom"
				src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;"
				alt="" />
			</a>
		</div>

		<h1 class="am-header-title">任务详情</h1>

	</header>
	<div class="am-g" style="margin-left: 10px;">
		<legend style="margin-bottom: 0px;"><img width="25" src="${pageContext.request.contextPath}/images/po5.png">下达者：<span id="name"></span></legend>
	</div>

	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default"
		style="margin-top: 10px;">
		<h2 class="am-titlebar-title ">任务标题：</h2>
	</div>

	<div class="am-g">
		<div class="am-u-lg-12">
			<!-- <legend style="margin-bottom: 5px;">任务标题:</legend> -->
			<div>
				<h4 style="margin-left: 10px;" id="title"></h4>
			</div>
		</div>
	</div>

	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default"
		style="margin-top: 10px;">
		<h2 class="am-titlebar-title ">任务开展：</h2>
	</div>
	<div class="am-g">
		<div class="am-u-sm-5">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/time1.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>开始时间:</b>
			</div>
		</div>
		<div class="am-u-sm-7" style="margin-top: 10px;" id="start"></div>
	</div>
	<div class="am-g">
		<div class="am-u-sm-5">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/time2.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>结束时间:</b>
			</div>
		</div>
		<div class="am-u-sm-7" style="margin-top: 10px;" id="finish"></div>
	</div>


	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default"
		style="margin-top: 20px;">
		<h2 class="am-titlebar-title ">任务信息：</h2>
	</div>
	<div class="am-g">
		<div class="am-u-sm-4">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/po2.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>附件:</b>
			</div>
		</div>
		<div class="am-u-sm-5" style="margin-top: 10px;" id="urlname"></div>
		<div class="am-u-sm-3" style="margin-top: 10px;">
			<button id="download" type="button"
				class="am-btn am-btn-sm am-btn-success am-radius">下载</button>
		</div>
	</div>

	<div class="am-g">
		<div class="am-u-sm-9">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/po1.png"
					width="23"
					style="margin-left: 10px;margin-bottom: 6px;margin-right: 5px;"><b>内容:</b>
			</div>
		</div>
		<div class="am-u-sm-3" style="margin-top: 10px;float: right;">
			<button type="button" class="am-btn am-btn-sm am-btn-success"
				data-am-modal="{target: '#my-alert'}">查看</button>
			
		</div>
	</div>

	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default"
		style="margin-top: 15px;">
		<h2 class="am-titlebar-title ">提交情况：</h2>
	</div>

	<div class="am-g">
		<div class="am-u-sm-4">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/pr2.png"
					width="30"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>计划:</b>
			</div>
		</div>
		<div class="am-u-sm-5" style="margin-top: 15px;" id="tijiao"></div>
		<div class="am-u-sm-3" style="margin-top: 10px;">
			<button id="probtn" type="button" class="am-btn am-btn-sm am-btn-success"
				data-am-modal="{target: '#project'}">提交</button>
			<button id="bt1" type="button" class="am-btn am-btn-sm am-btn-success"></button>
		</div>
	</div>

	<div class="am-g">
		<div class="am-u-sm-4">
			<div style="margin-top: 10px;">
				<img src="${pageContext.request.contextPath}/images/pr1.png"
					width="30"
					style="margin-left: 10px;margin-bottom: 8px;margin-right: 5px;"><b>报告:</b>
			</div>
		</div>
		<div class="am-u-sm-5" style="margin-top: 15px;" id="tijiao2"></div>
		<div class="am-u-sm-3" style="margin-top: 10px;">
			<button type="button" class="am-btn am-btn-sm am-btn-success am-radius" id="bt2"></button>
		</div>
	</div>
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">任务内容</div>
			<div class="am-modal-bd" id="content"></div>
			<div class="am-modal-footer">
				<span class="am-modal-btn">确定</span>
			</div>
		</div>
	</div>
	
	<div class="am-modal am-modal-alert" tabindex="-1" id="project">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">计划内容</div>
			<div class="am-modal-bd">
				<div class="am-form am-form-group">
					<input type="hidden" id='tastId'>
					<textarea rows="5" id="submitContent" placeholder="请输入计划内容"></textarea>
				</div>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn"><a href="javascript:void(0)" id="confirm">提交</a></span>
			</div>
		</div>
	</div>
	
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script type="text/javascript">
		var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/380;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=380, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=380, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=380, user-scalable=no, target-densitydpi=device-dpi">');
       }
		var submitUserId=<%=session.getAttribute("RelUserLoginId")%>;
		$(function () {
		 (function ($) {
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return decodeURI(r[2]); return null;
                }
            })(jQuery);
          	
          	var id = $.getUrlParam('id');
          	var name=$.getUrlParam('name');
          	$('#tastId').val(id);
          	$('#name').html(name);
          	$.getJSON("${pageContext.request.contextPath}/GetStateFromFP?tastId="+id,function(data){
    			$('#tijiao2').html(data.FINF);
    			$('#tijiao').html(data.INF);
    			$(function(){
    				var t=$('#tijiao').html();
    				
    				if(t=="未提交")
    				{
    					$('#bt1').hide();
    					$('#confirm').on('click',function(){
    						
    						if($('#submitContent').val()==null||$('#submitContent').val()=="")
    						{alert("请填写计划内容")}
    						else{
    							
    							$.ajax({
    							url:'${pageContext.request.contextPath}/Submit/Add',
    							dataType:'json',
    							type:'post',
    							data:{submitUserId:submitUserId,
    								submitContent:$('#submitContent').val(),
    								tastId:$('#tastId').val()
    							},
    							success:function(data){
    								if(data.status==1){
    									alert(data.message);
    									location.reload();
    								}
    								else if(data.status==-1)
    								{alert(data.message);}
    								else if(data.status==-2)
    								{alert(data.message);}
    							}
    						})
    						} 
    					})
    				}
    				else if(t=="等待审核"){
    					$('#probtn').hide();
    					$('#bt1').html('查看');
    					$('#bt1').on('click',function(){
    						var tastId=$('#tastId').val()
    						location.href="${pageContext.request.contextPath}/base/goURL/weixin/proNosub?tastId="+id;
    					})
    				}
    				else if(t=="通过")
    					{	
    						$('#probtn').hide();
    						$('#bt1').html('查看');
    						$('#bt1').on('click',function(){
    						location.href="${pageContext.request.contextPath}/base/goURL/weixin/haveSubmitpro?tastId="+id;
    						})
    					}
    				else if(t=="未通过")
    					{	
    						$('#bt1').html('查看');
    						$('#probtn').hide();
    						$('#bt1').on('click',function(){
    						location.href="${pageContext.request.contextPath}/base/goURL/weixin/proNosub?tastId="+id;
    						})
    					}
    				})
    				
    				$(function(){
    				var t1=$('#tijiao2').html();
    				if(t1=="未提交")
    				{
    					$('#bt2').html("提交");
    					$('#bt2').on('click',function(){
    						location.href="${pageContext.request.contextPath}/base/goURL/weixin/sendReport?id="+id
    					})
    					
    				}
    				else if(t1=="等待审核"){
    					$('#reportbtn').hide();
    					$('#bt2').html('查看');
    					$('#bt2').on('click',function(){
    						location.href="${pageContext.request.contextPath}/FinishConditionToLook?tastId="+id
    					})
    				}
    				else if(t1=="通过")
    					{	
    						$('#reportbtn').hide();
    						$('#bt2').html('查看');
    						$('#bt2').on('click',function(){
    						location.href="${pageContext.request.contextPath}/FinishConditionToLook?tastId="+id
    						})
    					}
    				else if(t1=="未通过")
    					{	
    						$('#reportbtn').hide();
    						$('#bt2').html('查看');
    						$('#bt2').on('click',function(){
    						location.href="${pageContext.request.contextPath}/ReadFinishCondition?tastId="+id+"&uuid="+uuid
    						})
    					}
    				})
    		})
          	$.getJSON("${pageContext.request.contextPath}/SelectByPrimarkey?id="+id,function(data){
          		$('#title').html(data.tast.tastTitle);
          		$('#start').html(data.tast.startTime);
          		$('#finish').html(data.tast.finishTime);
          		$('#urlname').html(data.tast.urlName);
          		$('#content').html(data.tast.tastContent);
          		var uuid=data.tast.tastType;

          		
          		$('#download').on('click',function(){
          		var url=data.tast.testUrl;
          		
          			window.open("${pageContext.request.contextPath}/News/DownFile?fileName="+url);
          		})
          	})
          })
		
		
	</script>
</body>
</html>
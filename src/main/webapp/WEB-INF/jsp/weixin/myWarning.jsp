<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>预警</title>
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/lib/weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/jquery-weui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/demos/css/demos.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<style type="text/css">
		input{
			width: 230px;
			height: 35px;
			font-size: 1.8rem;
			border-left-width:0px;
			border-top-width:0px;
			border-right-width:0px;
			border-bottom: 1px solid #0e90d2;
			outline:medium;
			outline: none;
			background:transparent;
		}
	</style>
</head>
<body>
	<div style="background-color: #0e90d2;height: 3em;">
                <a href=""><span style="position: relative;top: 10px;left: 10px;"><img width="25" src="${pageContext.request.contextPath}/images/jian.png"></span></a>
                <center><span style="font-size: 20px;position:relative;bottom: 20px;color: #F4F4F4;font-weight: bold;">预警情况</span></center>
    </div>
    <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title ">
	        预警列表
	    </h2>
	    <!-- <nav class="am-titlebar-nav">
	        <button id="xiada" style="margin-bottom: 0.8rem;width: 40%" type="button" class="am-btn am-btn-md am-btn-primary am-radius">预警</button>
	    </nav> -->
   </div>
   
      	
      			<div class="weui-panel__bd" id="body">
      				<!-- <div class="weui-media-box weui-media-box_appmsg">
	      				<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/yj1.png">
				      	</div>
				      	<div class="weui-media-box__bd" style="margin-left: 10px;">
					        <h4 class="weui-media-box__title">第一预警</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">时间：2016-10-30</b>
				            	<b style="float: right;"><button class="weui-btn weui-btn_mini weui-btn_primary bt" style="">查看</button></b>
			            	</p>
				      	</div>
				      </div>
				      <div class="weui-media-box weui-media-box_appmsg">
				      	<div class="weui-media-box__hd">
				        	<img width="10" class="weui-media-box__thumb" src="images/yj1.png">
				      	</div>
				      	<div class="weui-media-box__bd" style="margin-left: 10px;">
					        <h4 class="weui-media-box__title">第二次预警</h4>
					        <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
				            	<b style="font-size: 15px;">时间：2016-10-30</b>
				            	<b style="float: right;"><button class="weui-btn weui-btn_mini weui-btn_primary bt" style="">查看</button></b>
			            	</p>
				      	</div>
      				  </div> -->

      				  
      			</div>
      			<div id="page"></div>
      		
      	<div class="am-modal am-modal-prompt" tabindex="-1" id="prompt">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd" style="float: left;margin-left: 10px;font-weight: bold;font-size: 20px;">处理预警</div>
		    <div class="am-modal-bd" style="float: left;margin-left: 10px;margin-top: 7px;">
		      <!-- <div class="am-form">
		      		<div class="am-form-group">
		      			<input type="text" name="">
		      		</div>
		      </div> -->
		      <input id="til" type="text" placeholder="请输入处理方式">
		      <input type="hidden" id="time">
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
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
		var loginUserId=<%=session.getAttribute("RelUserLoginId")%>;
		var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>;
		var page1=<%=request.getParameter("page1")%>;
		var pages1;
		page1=1;
		showT();

		function createNode(nodeData){
			var $newDiv=$("<div class='weui-media-box weui-media-box_appmsg'></div>");
			var $newDiv1=$("<div class='weui-media-box__hd'></div>");
			var $newImg=$("<img width='10' class='weui-media-box__thumb' src='${pageContext.request.contextPath}/images/yj1.png'>");
			var $newDiv2=$("<div class='weui-media-box__bd' style='margin-left: 10px;'></div>");
			var $newH=$("<h4 class='weui-media-box__title'>标题："+nodeData.title+"</h4>");
			var $newP=$("<p class='weui-media-box__desc' style='margin-bottom: 3px;margin-top: 12px;'></P>");
			var $newB1=$("<b style='font-size: 15px;'>时间："+nodeData.createTime+"</b>");
			var $newB2=$("<b style='float: right;'></b>")
			var $newA=$("<button class='weui-btn weui-btn_mini weui-btn_primary bt' style='margin-top:7px;margin-right:20px;'>处理</button>");
			var $nId=$("<input type='hidden' value="+nodeData.id+">");
			$newDiv1.append($newImg);
			$newDiv2.append($newH);
			$newDiv2.append($newP);
			$newB2.append($newA);
			$newB2.append($nId);
			$newP.append($newB1);
			$newP.append($newB2);
			$newDiv.append($newDiv1);
			$newDiv.append($newDiv2);
			$("#body").append($newDiv);
		}

		function showT(){
			$.ajax({
				url:'${pageContext.request.contextPath}/warning/aGetHandleWarning',
				dataType:'json',
				type:'get',
				data:{userId:loginUserId,start:1},
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
							location.href="${pageContext.request.contextPath}/base/goURL/weixin/myWarning?page1="+context.option.curr;
						}
					}
					})
				}
			})
		}

	
		$(document).on('click','.bt',function(){
			var id=$(this).next().val();
			$('#prompt').modal({
		      relatedTarget: this,
		      onConfirm: function(e) {
		      	
		      	
		      	var title=$('#til').val();
		      	$.ajax({
		      		url:'${pageContext.request.contextPath}/warning/handle',
		      		dataType:'json',
		      		type:'get',
		      		data:{id:id,handleWay:title},
		      		success:function(){
		      			location.reload();
		      		}
		      	})
		      },
		      onCancel: function(e) {
		      	/*$('#xiada').modal("close")*/
		      }
		    });
		})

		
	</script>
</body>
</html>

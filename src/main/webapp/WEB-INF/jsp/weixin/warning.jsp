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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.datetimepicker-se.min.css" />
	<style type="text/css">
		input{
			
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
		/* #prompt{
			position:absolute;
			z-index:998;
		}
		 #dataT{
			position:absolute;
			z-index:999;
		}  */
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
	    <nav class="am-titlebar-nav">
	        <button id="xiada" style="margin-bottom: 0.8rem;width: 40%" type="button" class="am-btn am-btn-md am-btn-primary am-radius">下达预警</button>
	    </nav>
	    
   </div>
   
      	<div id="xd" class="am-g" style="border-bottom: 1px solid #ccc">
      		
      			
	      			<div class="am-u-sm-6">
	      				<input class="weui-input" id="til" type="text" placeholder="请输入预警标题">
	      			</div>
      			
      			
      				<div class="am-u-sm-6">
	      				<input value="" name="finishTime" class="weui-input" id='datetimepicker1' placeholder="请选择预警时间">
	      			</div>
      			
      			
      		
      		
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
				            	<b style="font-size: 15px;float: left;margin-top: 10px;">创建时间：2016-10-30 20:15:20</b>
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
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否下达此预警？
		      
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
		    </div>
		  </div>
		</div>
   


   <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/dist/js/swiper.min.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/city-picker.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.page.js"></script>
	<script type="text/javascript">
		$('#xd').css("display","none");
		var taskId=<%=request.getParameter("taskId")%>;
		var loginUserId=<%=session.getAttribute("RelUserLoginId")%>;
		var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>;
		var page1=<%=request.getParameter("page1")%>;
		var pages1;
		page1=1;
		showT();

		function createNode1(nodeData){
			var $newDiv=$("<div class='weui-media-box weui-media-box_appmsg'></div>");
			var $newDiv1=$("<div class='weui-media-box__hd'></div>");
			var $newImg=$("<img width='10' class='weui-media-box__thumb' src='${pageContext.request.contextPath}/images/yj1.png'>");
			var $newDiv2=$("<div class='weui-media-box__bd' style='margin-left: 10px;'></div>");
			var $newH=$("<h4 class='weui-media-box__title'>标题："+nodeData.title+"</h4>");
			var $newP=$("<p class='weui-media-box__desc' style='margin-bottom: 3px;margin-top: 12px;'></P>");
			var $newB1=$("<b style='font-size: 15px;'>创建日期："+nodeData.createTime+"</b>");
			var $newB2=$("<b style='float: right;'></b>");
			var $newB3=$("<b style='font-size: 15px;float: left;margin-top: 10px;'>预警时间："+nodeData.deadLine+"</b>");
			var $newInput=$("<input type='hidden' value='"+nodeData.id+"'>");
			var $newA=$("<button class='weui-btn weui-btn_mini weui-btn_primary bt1' style='margin-top:7px;margin-right:20px;'>查看</button>");
			$newDiv1.append($newImg);
			$newDiv2.append($newH);
			$newDiv2.append($newP);
			$newB2.append($newA);
			$newB2.append($newInput);
			$newP.append($newB1);
			$newP.append($newB3);
			$newP.append($newB2);
			$newDiv.append($newDiv1);
			$newDiv.append($newDiv2);
			$("#body").append($newDiv);
		}
		
		function createNode2(nodeData){
			var $newDiv=$("<div class='weui-media-box weui-media-box_appmsg'></div>");
			var $newDiv1=$("<div class='weui-media-box__hd'></div>");
			var $newImg=$("<img width='10' class='weui-media-box__thumb' src='${pageContext.request.contextPath}/images/yj1.png'>");
			var $newDiv2=$("<div class='weui-media-box__bd' style='margin-left: 10px;'></div>");
			var $newH=$("<h4 class='weui-media-box__title'>标题："+nodeData.title+"</h4>");
			var $newP=$("<p class='weui-media-box__desc' style='margin-bottom: 3px;margin-top: 12px;'></P>");
			var $newB1=$("<b style='font-size: 15px;'>创建日期："+nodeData.createTime+"</b>");
			var $newB2=$("<b style='float: right;'></b>");
			var $newB3=$("<b style='font-size: 15px;float: left;margin-top: 10px;'>预警时间："+nodeData.deadLine+"</b>");
			var $newA=$("<button class='weui-btn weui-btn_mini weui-btn_primary bt2' style='margin-top:7px;margin-right:20px;'>查看</button>");
			$newDiv1.append($newImg);
			$newDiv2.append($newH);
			$newDiv2.append($newP);
			$newB2.append($newA);
			$newP.append($newB1);
			$newP.append($newB3);
			$newP.append($newB2);
			$newDiv.append($newDiv1);
			$newDiv.append($newDiv2);
			$("#body").append($newDiv);
		}

		function showT(){
			$.ajax({
				url:'${pageContext.request.contextPath}/warning/getTaskWarning',
				dataType:'json',
				type:'get',
				data:{warnOrgId:loginTreeId,start:1,taskId:taskId},
				success:function(data){
					
						for(var i=0;i<data.rows.length;i++){
							if(data.rows[i].warnType==1){
							createNode1(data.rows[i]);
							}
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
							location.href="${pageContext.request.contextPath}/base/goURL/weixin/warning?taskId="+taskId+"&page1="+context.option.curr;
						}
					}
					})
				}
			})
			
			
			$.ajax({
				url:'${pageContext.request.contextPath}/warning/getPersonalWarning',
				dataType:'json',
				type:'get',
				data:{warnOrgId:loginTreeId,taskId:taskId,start:1},
				success:function(data){
					
						for(var i=0;i<data.rows.length;i++){
							if(data.rows[i].warnType==0){
							createNode2(data.rows[i]);
							}
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
							location.href="${pageContext.request.contextPath}/base/goURL/weixin/warning?taskId="+taskId+"&page1="+context.option.curr;
						}
					}
					})
				}
			})
		}
		$('#xiada').on('click',function(){
			if($('#xd').css("display")=="none"){
				$('#xd').show(1200);
			}
			else{
				$('#xd').hide(1200);
			}
		})
		$("#datetimepicker1").datetimePicker({
        title: '预警日期',
        toolbarCloseText:'确认下达',
        min: "1990-12-12",
        max: "2035-12-12 59:12",
        onClose: function (picker, values, displayValues) {
          $('#prompt').modal({
		      relatedTarget: this,
		      onConfirm: function(e) {
		      	var time=$('#datetimepicker1').val();
		      	var title=$('#til').val();
		      	$.ajax({
		      		url:'${pageContext.request.contextPath}/warning/addWarning',
		      		dataType:'json',
		      		type:'post',
		      		data:{taskId:taskId,orgAdminId:loginUserId,warnOrgId:loginTreeId,title:title,wDeadLine:time},
		      		success:function(data){
		      			alert("下达成功");
		      			
		      		}
		      	})
		      },
		      onCancel: function(e) {
		      	/*$('#xiada').modal("close")*/
		      }
		    });
        }
      	});
	
		$(document).on('click','.bt1',function(){
			var taskWarnId=$(this).next().val();
			//alert(taskWarnId);
			location.href="${pageContext.request.contextPath}/base/goURL/weixin/seeWarning?taskId="+taskId+"&taskWarnId="+taskWarnId
		})

		$(document).on('click','.bt2',function(){
			location.href="${pageContext.request.contextPath}/base/goURL/weixin/seeWarningPer?taskId="+taskId
		})
	</script>
</body>
</html>

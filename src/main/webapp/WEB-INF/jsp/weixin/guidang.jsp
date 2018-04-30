<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>任务归档</title>
	<meta http-equiv="description" content="任务归档">
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
                <a href="javascript:history.back(-1)"><span style="position: relative;top: 10px;left: 10px;"><img width="25" src="${pageContext.request.contextPath}/images/jian.png"></span></a>
                <center><span style="font-size: 20px;position:relative;bottom: 20px;color: #F4F4F4;font-weight: bold;">任务归档</span></center>
    </div>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title ">
	        任务列表
	    </h2>

	     <nav class="am-titlebar-nav">
	        <button id="dol" style="margin-bottom: 10px;" type="button" class="am-btn am-btn-md am-btn-primary am-radius">
	               <i class="am-icon-arrow-down"></i>&nbsp;本组织归档</button>
	    </nav>
   </div>

   <div data-am-widget="tabs"
       class="am-tabs am-tabs-default"
        >
        <ul class="am-tabs-nav am-cf">
	          <li class="am-active"><a href="[data-tab-panel-0]">按任务归档</a></li>
      	</ul>
      <div class="am-tabs-bd">
  		  <div data-tab-panel-0 class="am-tab-panel am-active">
  		  	  <div class="weui-panel__bd" id="body">
		          <!-- <div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">任务标题:大数据库电话卡</h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">下达时间:2016-10-30</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">查看</a></b>
		            	
		            </p>
          			</div>
		           <div class="weui-media-box weui-media-box_text" style="padding-bottom: 5px;">
		            <h4 class="weui-media-box__title">任务标题:大数据库电话卡</h4>
		            <p class="weui-media-box__desc" style="margin-bottom: 3px;margin-top: 12px;">
		            	<b style="font-size: 15px;">下达时间:2016-10-30</b>
		            	<b style="float: right;"><a href="#" class="weui-btn weui-btn_primary weui-btn_mini" style="width: 100%">查看</a></b>
		            	
		            </p>
          			</div> -->
          
        		</div>
  		  </div>
  		  <div id="page"></div>
      </div>

      
   </div>
	<div id="ta" class="weui-tabbar" style="height: 80px;position: fixed;left: 0px;">
        <a id="time-format" class="weui-tabbar__item  weui-btn weui-btn">
	        <p class="weui-tabbar__label" style="margin-top: 8px;margin-bottom: 5px;">
	            <b style="color: #0B9BA9;font-size: 15px;">请选择</b>
	        </p> 
	          <p class="weui-tabbar__label" style="margin-top: 0px;color: #000000;font-size: 16px;">开始时间</p>
	        <input id="hid1" type="hidden">
	    </a>
         <a id="time-format2" class="weui-tabbar__item  weui-btn" style="margin-top: 0px;">
	        <p class="weui-tabbar__label" style="margin-top: 8px;margin-bottom: 5px;">
	            <b style="color: #C54A2A;font-size: 15px;">请选择</b>
	        </p> 
	          <p class="weui-tabbar__label" style="margin-top: 0px;color: #000000;font-size: 16px;">结束时间</p>
	        <input id="hid2" type="hidden" name="">
	    </a>
	    <a id="picker" class="weui-tabbar__item  weui-btn"  style="margin-top: 0px;">
	        <p class="weui-tabbar__label" style="margin-top: 8px;margin-bottom: 5px;">
	            <b style="color: #82C12F;font-size: 15px;">请确认</b>
	        </p> 
	        <p class="weui-tabbar__label" style="margin-top: 3px;color: #000000;font-size: 16px;">归档</p>
	    </a>
    </div>
	<script src="${pageContext.request.contextPath}/dist/lib/jquery-2.1.4.js"></script>
	<script src="${pageContext.request.contextPath}/dist/lib/fastclick.js"></script>
	<script>
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/320;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=320, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=320, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=320, user-scalable=no, target-densitydpi=device-dpi">');
       }
	</script>
	<script src="${pageContext.request.contextPath}/dist/js/jquery-weui.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.page.js"></script>
	<script type="text/javascript">
		$("#ta").css("display","none");
		$("#time-format").datetimePicker({
        title: '日期选择',
        yearSplit: '-',
        monthSplit: '-',
        dateSplit: '',
        times: function () {
          return [
            {
              divider: true,  // 这是一个分隔符
              content: ''
            }
          ];
        },
        /*format: "yyyy-mm-dd"，*/
        onClose: function (picker, values, displayValues) {
          $('#hid1').val($("#time-format").val());
        }
      });
    $("#time-format2").datetimePicker({
        title: '日期选择',
        yearSplit: '-',
        monthSplit: '-',
        dateSplit: '',
        times: function () {
          return [
            {
              divider: true,  // 这是一个分隔符
              content: ''
            }
          ];
        },
        /*format: "yyyy-mm-dd"，*/
        onClose: function (picker, values, displayValues) {
          
          $('#hid2').val($("#time-format2").val());
        }
      });
		var sentId=<%=session.getAttribute("RelUserLoginId")%>;
		var page1=<%=request.getParameter("page1")%>;
		var pages1;
		pages1=1;
		showT();
		
		/* $(function(){
			$.getJSON("${pageContext.request.contextPath}/GetTastOnlyType",function(data){
				
			})
		}) */
		
		function createNode(nodeData){
			var $newDiv=$("<div class='weui-media-box weui-media-box_text' style='padding-bottom: 5px;'></div>");
			var $newH=$("<h4 class='weui-media-box__title' style='font-size: 15px;'>任务标题:"+nodeData.tast_title+"</h4>");
			var $newP=$("<p class='weui-media-box__desc' style='margin-bottom: 3px;margin-top: 12px;'></p>");
			/* var $newB1=$("<b style='font-size: 15px;'>下达时间:"+nodeData.time+"</b>"); */
			var $newB2=$("<b style='float: right;'></b>");
			var $newA=$("<a href='javascript:void(0)' class='weui-btn weui-btn_primary weui-btn_mini bt' style='width: 100%'>查看</a>");
			var $nId=$("<input tyep='hidden' value='"+nodeData.only_type+"'>");
			$newB2.append($newA);
			$newB2.append($nId);
			/* $newP.append($newB1); */
			$newP.append($newB2);
			$newDiv.append($newH);
			$newDiv.append($newP);
			$("#body").append($newDiv);
		}

		function showT(){
			$.ajax({
				url:"${pageContext.request.contextPath}/GetTastOnlyType?sentId="+sentId,
				dataType:'json',
				type:'post',
				success:function(data){
					for(var i=0;i<data.onlyType.length;i++){
						createNode(data.onlyType[i]); 
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
							location.href="${pageContext.request.contextPath}/base/goURL/weixin/guidang?id="+treeId+"&page1="+context.option.curr;
						}
					}
					})
				}
			})
		}

		$(document).on('click','.bt',function(){
			var uuid=$(this).next().val();
			window.open("${pageContext.request.contextPath}/toOut?onlyUuid="+uuid);	
		})
		
		$('#dol').on('click',function(){
			if($("#ta").css("display")=="none"){
				$("#ta").show(1250);
			}else{
				$("#ta").hide(1250);
			}
		})
		$('#picker').on('click',function(){
			var startTime=$('#hid1').val();
			var endTime=$('#hid2').val();
			$("#ta").hide(1250);
			window.open("${pageContext.request.contextPath}/toOut?startTime="+startTime+"&endTime="+endTime+"&unit="+sentId);
		})
	</script>
	<center>粤icp备09004280号</center>
</body>
</html>
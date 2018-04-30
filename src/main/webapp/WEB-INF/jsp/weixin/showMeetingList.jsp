<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
 <head>
   <base href='<%=basePath%>'>
   
   <meta charset='utf-8'>
 	<meta http-equiv='description' content='展示所有会议'>
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
<link rel='alternate icon' type='image/png' href='assets/i/favicon.png'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/dist/lib/weui.min.css'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/dist/css/jquery-weui.css'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/assets/css/amazeui.min.css' />
<link rel='stylesheet' href='${pageContext.request.contextPath}/dist/css/pagination.css' />
<style type='text/css'>
body{
	overflow:-Scroll;overflow-x:hidden;
}
p{
	margin:0;
}[]
.weui-cell__bd,.weui-cell__ft p{
	margin-bottom:0px;
	margin-top:0px;
}
.mtDate{
	color:#999;
}
.addA{
	float:right;
	margin-right:5%;
	font-size:16px;
	margin-top:8px;
	color:#1296db;	
}
.weui-cells {
	margin-top:42px;
}
.weui-cell_access .weui-cell__ft {
    padding-right: 15px;
    position: relative;
}
.m-style{
	margin-top:5px;
}
.addA img{
	position:relative;
	top:-3px;
}
</style>

 </head>
  
  <body>
    <header data-am-widget='header'
          class='am-header am-header-default' style='height: 50px;'>
      <div class='am-header-left am-header-nav'>
          <a href='${pageContext.request.contextPath}/base/goURL/weixin/main' class=''>
              <img style='margin-top:20px;' class='am-header-icon-custom' src='data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;' alt=''/>
          </a>
      </div>

      <h1 class='am-header-title' style='font-size:20px;'>
          会议展示
      </h1>

  </header>
	 
      
       <div class="weui-tab">
	      <div class='weui-navbar'>
	        <a class='weui-navbar__item weui-bar__item--on' href="#tab1">
	         党代会
	        </a>
	        <a class='weui-navbar__item' href="#tab2">
	          党员大会
	        </a>
	        <a class='weui-navbar__item' href="#tab3" >
	          民主生活会
	        </a>
	        <a class='weui-navbar__item' href="#tab4">
	         党课
	        </a>
	      </div>
      <div class="weui-tab__bd">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active " >
          	<a class='addA' href="${pageContext.request.contextPath}/base/goURL/weixin/addMeeting">
          		<img src='${pageContext.request.contextPath}/images/mt3.png' alt='' style='width:25px;'>新增会议
          	</a>
	        <div class='weui-cells'></div>
	        <div class="m-style pageDiv"></div>
	    </div>
	    <div id="tab2" class="weui-tab__bd-item ">
          <a class='addA' href="${pageContext.request.contextPath}/base/goURL/weixin/addMeeting">
          		<img src='${pageContext.request.contextPath}/images/mt3.png' alt='' style='width:25px;'>新增会议
          	</a>
          <div class='weui-cells'></div>
	      <div class="m-style pageDiv"></div>
        </div>
        <div id="tab3" class="weui-tab__bd-item ">
        	<a class='addA' href="${pageContext.request.contextPath}/base/goURL/weixin/addMeeting">
          		<img src='${pageContext.request.contextPath}/images/mt3.png' alt='' style='width:25px;'>新增会议
          	</a>
          	<div class='weui-cells'></div>
	        <div class="m-style pageDiv"></div>
        </div>
        <div id="tab4" class="weui-tab__bd-item ">
          	<a class='addA' href="${pageContext.request.contextPath}/base/goURL/weixin/addMeeting">
          		<img src='${pageContext.request.contextPath}/images/mt3.png' alt='' style='width:25px;'>新增会议
          	</a>
          	<div class='weui-cells'></div>
	        <div class="m-style pageDiv"></div>
        </div>
      </div> 
     </div>

        
 	
	

<script src='${pageContext.request.contextPath}/dist/lib/jquery-2.1.4.js'></script>
<script src='${pageContext.request.contextPath}/dist/js/jquery-weui.min.js'></script>
<script src='${pageContext.request.contextPath}/dist/js/jquery.pagination.js'></script>
<script type='text/javascript'>
var RelUserTel=<%=session.getAttribute("RelUserTel")%>;
var pageArray=new Array(4);							//建立页面数组，从链接参数获取出来指向当前4类会议当前页码
pageArray[0]=<%=request.getParameter("page1")%>;
pageArray[1]=<%=request.getParameter("page2")%>;
pageArray[2]=<%=request.getParameter("page3")%>;
pageArray[3]=<%=request.getParameter("page4")%>;
var page={
	setPage:function(type){							//初始化四个分页组件
		if(pageArray[0]==null)
			for(i in pageArray)
				pageArray[i]=1;
		var pageCount;
		$.ajax({
			url:'meeting/userGetMeeting',
			dataType:'JSON',
			type:'POST',
			data:{
				type:type,
				arrivePeoplePhone:RelUserTel,
				start:pageArray[type-1]
			},
			success:function(data){
				var	total=total%10==0?Math.floor(data.count/10):Math.floor(data.count/10)+1;
				$('.pageDiv').eq(type-1).pagination({
					mode: 'fixed',
				    pageCount: total,
				    current:pageArray[type-1],
				    showData:10,
				    isHide:true,
				    callback: function (api) {
				    	pageArray[type-1]=api.getCurrent();
				    	location.href="${pageContext.request.contextPath}/base/goURL/weixin/showMeetingList?page1="+pageArray[0]+"&page2="+pageArray[1]+"&page3="+pageArray[2]+"&page4="+pageArray[3];
				    }
				});
			}
		})
	}
}
var mtList={
	getMTList:function(type){							//从后台获得会议数据，并调用createMTNode方法创建会议列表				
	page.setPage(type);
	$.ajax({
		url:'meeting/userGetMeeting',
		dataType:'JSON',
		type:'POST',
		data:{
			type:type,
			arrivePeoplePhone:RelUserTel,
			start:pageArray[type-1]
		},
		success:function(data){
			$(".weui-cells").eq(type-1).empty();
			for(i in data.rows)
				mtList.createMTNode(data.rows[i],type-1);
		}
	})
	},
	createMTNode:function(data,i){						//根据数据创建每一条会议列表
		
		var $newA=$("<a class='weui-cell weui-cell_access' href='${pageContext.request.contextPath}/base/goURL/weixin/mtOperations?mtId="+data.id+"'></a>");
		var $newDiv1=$("<div class='weui-cell__hd'><img src='${pageContext.request.contextPath}/images/mt2.png' alt='' style='width:30px;margin-right:5px;display:block'></div>");
		var $newDiv2=$("<div class='weui-cell__bd'></div>");
		var $newP1=$("<p style='font-size:17px;'>&nbsp;"+data.meetingTitle+"</p>");
		var $newP2=$("<p class='mtDate'>&nbsp;时间："+data.aStartTime+"</p>");
		var $newDiv3=$("<div class='weui-cell__ft'></div>");
		var $newBr=$("<br>");
		var $newP3=$("<p><img src='${pageContext.request.contextPath}/images/mt1.png' alt='' style='width:18px;height:18px;position:relative;top:-2px'>&nbsp;"+data.status+"</p>")
		$newDiv2.append($newP1);
		$newDiv2.append($newP2);
		$newDiv3.append($newBr);
		$newDiv3.append($newP3);
		$newA.append($newDiv1);
		$newA.append($newDiv2);
		$newA.append($newDiv3);
		$(".weui-cells").eq(i).append($newA);
	},
	setMtContent:function(){					//让每个tab调用getMTList方法
		for(var i=1;i<=4;i++)
			mtList.getMTList(i);
	}
}
mtList.setMtContent();	
</script>

	<center><div>粤icp备09004280号</div></center>
</body>
</html>

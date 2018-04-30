<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="任务">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.page.css" />
	<style type="text/css">
		 table{  
            table-layout: fixed;/*只有定义表格的算法为fixed,th才有效果*/  
            border-collapse: collapse;/*边框合并模式*/  
        }  
        table tr td{  
            overflow:hidden;/*超出的文字隐藏*/  
            text-overflow:ellipsis;/*文字超出后,显示省略号*/  
            width:100%;
            /*width: 20em;*/
            white-space:nowrap;/*文字不换行*/  
            word-break:keep-all;/*文字不换行*/  
        }  
	</style>
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
          任务
      </h1>

  </header>

  <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title ">
	        任务列表
	    </h2>

	    <nav class="am-titlebar-nav">
	        <button id="send" style="margin-bottom: 10px;" type="button" class="am-btn am-btn-md am-btn-primary am-radius">
	               <i class="am-icon-plus-square"></i>&nbsp;我要下达</button>
	    </nav>
   </div>
  
  <div data-am-widget="tabs"
       class="am-tabs am-tabs-default"
        >
      <ul class="am-tabs-nav am-cf">
          <li class="am-active"><a href="javascript:void(0)">组织任务</a></li>
          <li class=""><a href="[data-tab-panel-1]">私人任务</a></li>
          
      </ul>
      <div class="am-tabs-bd">
          <div data-tab-panel-0 class="am-tab-panel panel1 am-active">
            	<table class="am-table am-table-striped am-table-hover table-main">
	  				<thead>
	  					<tr>
	  						<td align="center">任务标题</td>
	  						<td align="center">下达时间</td>
	  						<td align="center">操作</td>
	  					</tr>
	  				</thead>
	  				<tbody id="tbody1">
	  					<!-- <tr>
	  						<td align="center"><h5>萨首发身份的根深蒂固所发生的根都是个色鬼色鬼的事但是大概是个色鬼发高烧</h5></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><button id="see" type="button" class="am-btn am-btn-sm am-btn-success am-radius">任务详情</button></td>
	  					</tr>
	  					<tr>
	  						<td align="center"><h3>asfilak</h3></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius">任务详情</button></td>
	  					</tr>
	  					<tr>
	  						<td align="center"><h3>asfilak</h3></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius">任务详情</button></td>
	  					</tr> -->
	  				</tbody>
  				</table>
  				<div id="pageUon"></div>
          </div>
          <div data-tab-panel-1 class="am-tab-panel panel2">
            	<table class="am-table am-table-striped am-table-hover table-main">
	  				<thead>
	  					<tr>
	  						<td align="center">任务标题</td>
	  						<td align="center">下达时间</td>
	  						<td align="center">操作</td>
	  					</tr>
	  				</thead>
	  				<tbody id="tbody2">
	  					<!-- <tr>
	  						<td align="center"><h5>萨首发身份的根深蒂固所发生的根都是个色鬼色鬼的事</h5></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius">任务详情</button></td>
	  					</tr>
	  					<tr>
	  						<td align="center"><h3>asfilak</h3></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius">任务详情</button></td>
	  					</tr>
	  					<tr>
	  						<td align="center"><h3>asfilak</h3></td>
	  						<td align="center"><h3>12534657687</h3></td>
	  						<td align="center"><button type="button" class="am-btn am-btn-sm am-btn-success am-radius">任务详情</button></td>
	  					</tr> -->
	  				</tbody>
  				</table>
  				<div id="pagePer"></div>
          </div>
          
      </div>
	  <center><div>粤icp备09004280号</div></center>
  </div>

	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.page.js"></script>
	<script type="text/javascript">

		var treeId=<%=request.getParameter("id")%>;
		var loginUserId=<%=session.getAttribute("RelUserLoginId")%>;
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
		showtask();
	}else if(page1>=1&&page2==null){
		page2=1;
		$(".panel2").removeClass("am-active");
		$("#tab2").removeClass("am-active");
		$(".panel1").addClass("am-active");
		$("#tab1").addClass("am-active");
		showtask();
	}else{
		page1=1;
		page2=1;
		showtask();
	}


	function createNode1(nodeData){
		var $newTr=$("<tr></tr>");
		var $newTd1=$("<td align='center' style='padding-bottom: 0px;'></td>");
		var $newTd2=$("<td align='center'></td>");
		var $newTd3=$("<td align='center'></td>");
		var $newSpan=$("<span>"+nodeData.tastTitle+"</span>");
		var $newSpan2=$("<span>"+nodeData.creatTastTime+"</span>");
		var $newId=$("<input type='hidden' value='"+nodeData.tastId+"'>");
		var $newText=$("<input type='hidden' value='"+nodeData.name+"'>");
		var $newButton=$("<button type='button' class='am-btn am-btn-sm am-btn-success am-radius see1'>任务详情</button>");
		$newTd1.append($newSpan);
		$newTd2.append($newSpan2);
		$newTd3.append($newButton);
		$newTd3.append($newId);
		$newTd3.append($newText);
		$newTr.append($newTd1);
		$newTr.append($newTd2);
		$newTr.append($newTd3);
		$("#tbody1").append($newTr);
	}

	function createNode2(nodeData){
		var $newTr=$("<tr></tr>");
		var $newTd1=$("<td align='center' style='padding-bottom: 0px;'></td>");
		var $newTd2=$("<td align='center'></td>");
		var $newTd3=$("<td align='center'></td>");
		var $newSpan=$("<span>"+nodeData.tastTitle+"</span>");
		var $newSpan2=$("<span>"+nodeData.creatTastTime+"</span>");
		var $newId=$("<input type='hidden' value='"+nodeData.tastId+"'>");
		var $newText=$("<input type='hidden' value='"+nodeData.name+"'>");
		var $newButton=$("<button type='button' class='am-btn am-btn-sm am-btn-success am-radius see2'>任务详情</button>");
		$newTd1.append($newSpan);
		$newTd2.append($newSpan2);
		$newTd3.append($newButton);
		$newTd3.append($newId);
		$newTd3.append($newText);
		$newTr.append($newTd1);
		$newTr.append($newTd2);
		$newTr.append($newTd3);
		$("#tbody2").append($newTr);
	}

	function  showtask(){
		
		$.ajax({
		url:"${pageContext.request.contextPath}/PerReceiveTast",
		dataType:"JSON",
		type:"POST",
		data:{
			selfType:0,
			userId:loginUserId,
			page:page1
		},
		success:function(data){
			for(var i=0;i<data.rows.length;i++){
				createNode1(data.rows[i]); 
			}
			if(page1==null){
				page1=1;
			}
			pages1=data.total/10+1;
			$("#pageUon").page({
			pages:pages1,
			curr:page1,
			theme:'secondary',
			first:"首页",
			prev:"<",
			next:">",
			groups:3,
			jump:function(context,first){
				if(!first){
					location.href="${pageContext.request.contextPath}/base/goURL/weixin/showProject?id="+treeId+"&page1="+context.option.curr;
				}
			}
			})
			
		}
	})
	$.ajax({
		url:"${pageContext.request.contextPath}/PerReceiveTast",
		dataType:"JSON",
		type:"POST",
		data:{
			selfType:1,
			userId:loginUserId,
			page:page2
		},
		success:function(data){
			for(var i=0;i<data.rows.length;i++){
				createNode2(data.rows[i]); 
			}
			pages2=data.total/10+1;
			if(page2==null){
				page2=1;
			}
			$("#pagePer").page({
			pages:pages2,
			curr:page2,
			theme:'secondary',
			first:"首页",
			prev:"<",
			next:">",
			groups:3,
			jump:function(context,first){
				if(!first){
					location.href="${pageContext.request.contextPath}/base/goURL/weixin/showProject?id="+treeId+"&page2="+context.option.curr;
				}
			}
		})
			
		}
	})
	}

	$('#send').on('click',function(){
		location.href="${pageContext.request.contextPath}/base/goURL/weixin/Havetask"
	})
	$(document).on('click','.see1',function(){
		var name=$(this).nextAll().eq(1).val();
		var id=$(this).next().val();
		location.href="${pageContext.request.contextPath}/base/goURL/weixin/projectDetail?id="+id+"&name="+name
	})
	$(document).on('click','.see2',function(){
		var name=$(this).nextAll().eq(1).val();
		var id=$(this).next().val();
		location.href="${pageContext.request.contextPath}/base/goURL/weixin/projectDetail?id="+id+"&name="+name
	})

	</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
	<title>智慧党建</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/easyui_animation.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/easyui_plus.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wu.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.insdep-extend.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
	<script type='text/javascript' src='/zhdj/dwr/engine.js'></script>
	<script type='text/javascript' src='/zhdj/dwr/interface/dwrDemo.js'></script>
<style type="text/css">
	#deleteWin p{
		margin-top:20px;
		text-align:center;
	}
	#deleteWin a{
		margin-left:20px;
		margin-top:40px;
	}
</style>
</head>
<body class="easyui-layout">
	<div id="content" region="center"style="width:1095px;height:800px">
		<table id="meeting" singleSelect="true"></table>
	</div>
	<div id="meetingTb" style="padding-top:0px">
		<a class="easyui-linkbutton" onclick="meeting.addMeetingWin()" iconCls="icon-tip" plain='true'>查看签到情况</a>		
	</div>
	
	<div id="addWin" class="easyui-window" title="签到记录" modal="true" data-options="iconCls:'icon-save'" style="top:20px;width:600px;height:500px;padding-top:20px;" closed="true">

		<table id="meetingSign">
			
		</table>
		 
	</div>  
	
    <script type="text/javascript">
		$(function(){
		$("#meeting").datagrid({
			width:1195,
			url:"${proPath }" + '/zhdj/meeting/getEndMeeting?orgId=2',
			title:'会议列表',
			columns:[[
				{field:'id',title:'会议id',width:20},
				{field:'orgName',title:'组织',width:35},
				{field:'meetingTitle',title:'大会标题',width:55},
				{field:'aStartTime',title:'开始时间',width:35},
				{field:'aEndTime',title:'结束时间',width:35},
				{field:'arriveNumber',title:'应到人数',width:15}
			]],
			pagination:true,
			fitColumns:true,
			toolbar:"#meetingTb",
		});
	});
	
	var meeting = {
		//新增会议窗口
		addMeetingWin:function(){
			if($(".datagrid-row-selected").size()==0){
				$.messager.alert('警告','请选择一项进行查看');
				return;
			}else if($(".datagrid-row-selected").size()>1){
				$.messager.alert('警告','请只选择一项进行查看');
				return;
			}
			$("#addWin").window('open');
			var meetingId  = $(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text();
			$("#meetingSign").datagrid({
			width:590,
			url:"${proPath }" + '/zhdj/meeting/getSignRecord?meetingId='+meetingId,
			title:'签到列表',
			columns:[[
				{field:'signPeople',title:'姓名',width:20},
				{field:'signPeoplePhone',title:'手机',width:35},
				{field:'signStarttime',title:'签到时间',width:55},
				{field:'signStatus',title:'签到情况',width:35}
			]],
			pagination:true,
			fitColumns:true
		});
		}
		}
		
  	</script>
</body>
</html>
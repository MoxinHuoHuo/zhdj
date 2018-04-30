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
		<table id="box1" singleSelect="true"></table>
	</div>
	<div id="tb1" style="padding-top:0px">
		<a class="easyui-linkbutton" onclick="warning1.getWarning()" iconCls="icon-tip" plain='true'>查看</a>	
		<a class="easyui-linkbutton" onclick="warning1.cancelWarningWin()" iconCls="icon-table-edit" plain='true'>处理预警</a>	
	</div>
	<div id="getWarningDetail" class="easyui-window" title="查看" modal="true" data-options="iconCls:'icon-save'" style="top:100px;width:370px;height:370px;padding:5px;" closed="true">
		 <table align="center" width="300" cellspacing="20" >
		 	<tr>
		 		<th align="right" style="margin-right:20px"><span style="font-size:16px">id:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="id" id="idh" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right" style="margin-right:20px"><span style="font-size:16px">设置预警组织:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="warnOrgName" id="warnOrgNameh" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">预警标题:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="title" id="titleh" /></td>
		 	</tr>
		 	
		 	<tr>
		 		<th align="right"><span style="font-size:16px">预警日期:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="DeadLine" id="deadLineh" /></td>
		 	</tr>
		 	
		 </table>
	</div>  
	<div id="handlewin" class="easyui-window" title="处理预警" modal="true" data-options="iconCls:'icon-save'" style="top:80px;width:360px;height:380px;padding-top:20px;" closed="true">

		 <table align="center" width="300" border="0" cellspacing="20" >
		 	<tr>
		 		<th align="right" style="margin-right:20px"><span style="font-size:16px">id:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="id" id="idC" readonly  unselectable="on" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right" style="margin-right:20px"><span style="font-size:16px">设置预警组织:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="warnOrgName" id="warnOrgNameC" readonly  unselectable="on" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">预警标题:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="title" id="titleC" readonly  unselectable="on" /></td>
		 	</tr>
		 	
		 	<tr>
		 		<th align="right"><span style="font-size:16px">预警日期:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="DeadLine" id="deadLineC" readonly  unselectable="on" /></td>
		 	</tr>
		 	
		 	<tr>
		 		<th align="right"><span style="font-size:16px">处理方式:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="handleWay" id="handleWayC" /></td>
		 	</tr>
		 	
		 	<tr>
		 		<td align="right"><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="warning1.cancelWarning()">处理</a></td>
		 		<td><a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#handlewin').window('close')">取消</a></td>
		 	</tr> 
		 </table>
	</div>  
    <script type="text/javascript">
    	var TreeId='<%=session.getAttribute("loginTreeId")%>';
		$(function(){
		$("#box1").datagrid({
			width:1195,
			url:"${proPath }" + '/zhdj/warning/getHandleWarning?orgId='+TreeId,
			title:'预警列表',
			columns:[[
				{field:'id',title:'id',width:10},
				{field:'warnOrgName',title:'设置预警组织',width:35},
				{field:'title',title:'预警标题',width:35},
				{field:'deadLine',title:'预警时间',width:35},
				{field:'handleWay',title:'处理方式',width:35}
			]],
			pagination:true,
			fitColumns:true,
			toolbar:"#tb1",
		});
	});
	
	var warning1 = {
		//打开查看窗口
		getWarning:function(){
			if($(".datagrid-row-selected").size()==0){
				$.messager.alert('警告','请选择一项进行查看');
				return;
			}else if($(".datagrid-row-selected").size()>1){
				$.messager.alert('警告','请只选择一项进行查看');
				return;
			}
			//alert($(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text());
			//var row = $("#box").datagrid('getSelected');
			//alert(row.id);
			$("#idh").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text());
			$("#warnOrgNameh").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-warnOrgName")).text());
			//$("#titleh").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-title")).text());
			$("#titleh").val("fdgdfgfdg");
			//$("#moduleh").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-module")).text());
			$("#deadLineh").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-deadLine")).text());
			//$("#exceptionReasonh").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-exceptionReason")).text());
			$("#getWarningDetail").window('open');
		},
		//处理预警窗口
		cancelWarningWin:function(){
			if($(".datagrid-row-selected").size()==0){
				$.messager.alert('警告','请选择一项进行处理');
				return;
			}else if($(".datagrid-row-selected").size()>1){
				$.messager.alert('警告','请只选择一项进行处理');
				return;
			}
			$("#idC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text());
			$("#warnOrgNameC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-warnOrgName")).text());
			$("#titleC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-title")).text());
			//$("#moduleC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-module")).text());
			$("#deadLineC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-deadLine")).text());
			//$("#exceptionReasonC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-exceptionReason")).text());
			$("#handleWayC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-handleWay")).text());
			//$("#resultC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-result")).text());
			$("#handlewin").window('open');
		},
		//处理预警
		cancelWarning:function(){
			var id = $(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text();
			var handleWay = $("#handleWayC").val();
			var result = $("#resultC").val();
			$.ajax({
				   type: "POST",
				   url: "/zhdj/warning/handle",
				   data: {id:id,handleWay:handleWay,result:result},
				   success: function(data){
				   		if(data["status"] == 1){
						alert("操作成功");
						window.location.reload();
				   	}else{
						alert(data["message"]);
						window.location.reload();
				   	}
			   }
			});	
		}
		}
  	</script>
</body>
</html>
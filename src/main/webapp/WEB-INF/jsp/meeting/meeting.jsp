<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String orgId = session.getAttribute("loginTreeId").toString();
//Object orgId = session.getAttribute("loginTreeId");

%>

<!DOCTYPE html>
<html>
<head>
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
		<a class="easyui-linkbutton" onclick="meeting.addMeetingWin()" iconCls="icon-add1" plain='true'>新增</a>	
		<a class="easyui-linkbutton" onclick="meeting.deleteWin()" iconCls="icon-table-row-delete" plain='true'>删除</a>	
	</div>
	
	<div id="addWin" class="easyui-window" title="新增会议" modal="true" data-options="iconCls:'icon-save'" style="top:20px;width:600px;height:500px;padding-top:20px;" closed="true">

		 <table align="center" width="500" border="0" cellspacing="20" >
		 	<tr>
		 		<th align="right" style="margin-right:20px"><span style="font-size:16px">组织id:</span></th>
		 		<td><input class="easyui-textbox" style="height:30px;width:300px;font-size:20px" type="text" name="orgId" id="orgId" value='<%=session.getAttribute("loginTreeId")%>' readonly  unselectable="on" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">组织名称:</span></th>
		 		<td><input class="easyui-textbox" style="height:30px;width:300px;font-size:20px" type="text" name="orgName" id="orgName" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">会议类型:</span></th>
		 		<td>
		 			<select class="easyui-textbox" style="height:30px;width:300px;font-size:20px"  name="type" id="type" >
		 				<option value ="1">支部党员大会</option>
						<option value ="2">支部委员会</option>
						<option value="3">党小组会</option>
						<option value="4">党课</option>
		 			</select>
		 		</td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">大会标题:</span></th>
		 		<td><input class="easyui-textbox" style="height:30px;width:300px;font-size:20px" type="text" name="meetingTitle" id="meetingTitle"  /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">开始时间:</span></th>
		 		<td><input class="easyui-datetimebox" style="height:30px;width:300px;font-size:20px" type="text" name="startTime" id="startTime"  /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">结束时间:</span></th>
		 		<td><input class="easyui-datetimebox" style="height:30px;width:300px;font-size:20px" type="text" name="endTime" id="endTime" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">签到开始时间:</span></th>
		 		<td><input class="easyui-datetimebox" style="height:30px;width:300px;font-size:20px" type="text" name="signStartTime" id="signStartTime" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">签到结束时间:</span></th>
		 		<td><input class="easyui-datetimebox" style="height:30px;width:300px;font-size:20px" type="text" name="signEndTime" id="signEndTime" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">应到人数:</span></th>
		 		<td><input class="easyui-textbox" style="height:30px;width:300px;font-size:20px" type="text" name="arriveNumber" id="arriveNumber" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">大会内容:</span></th>
		 		<td><textarea class="easyui-textbox"  style="height:200px;width:300px;font-size:20px;resize:none" id="meetingContent" ></textarea></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">应参加人员:</span></th>
		 		<td><a onclick="meeting.addPeopleWin()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加人员</a></td>
		 	</tr>
		 </table>
	
		 <table class="easyui-datagrid" id="people">
		    <thead>
				<tr>
					<th data-options="field:'arrivePeople',width:300">姓名</th>
					<th data-options="field:'arrivePeoplePhone',width:300">手机号</th>
				</tr>
		    </thead>
		    <tbody>
				
			</tbody>
		</table>
		<div style="margin-top:50px;margin-bottom:50px">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="margin-right:100px;margin-left:100px" onclick="meeting.addMeeting()">确定</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addWin').window('close')">取消</a>
		</div> 
	</div>  
	<div id="addPeopleWin" class="easyui-window" title="添加人员"  data-options="iconCls:'icon-save'" style="top:20px;width:450px;height:300px;padding-top:20px;" closed="true">
		<table align="center" width="450" border="0" cellspacing="20" >
			<tr>
		 		<th align="right"><span style="font-size:16px">姓名:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px;width:200px" type="text" name="arrivePeople" id="arrivePeople" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">手机:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px;width:200px" type="text" name="arrivePeoplePhone" id="arrivePeoplePhone" /></td>
		 	</tr>
		 </table>
		 <div style="margin-top:20px;margin-bottom:20px">
			 <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="margin-right:50px;margin-left:100px" onclick="meeting.addPeople()">添加</a>
			 <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addPeopleWin').window('close')">取消</a>
		</div>
	</div>
	
	<div id="deletewin" class="easyui-window" title="删除会议" modal="true" data-options="iconCls:'icon-save'" style="top:100px;width:300px;height:200px;padding:5px;" closed="true">
		<div style="margin-bottom:50px;margin-top:30px"><p style="margin:0 auto;width:160px;font-size:16px;">请问要删除此会议？</p></div>
		<div style="margin:0 auto;width:215px">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="meeting.deleteMeeting()">确认删除</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#deletewin').window('close')">取消删除</a>
		</div>
	</div>  
    <script type="text/javascript">
		var TreeId='<%=session.getAttribute("loginTreeId")%>';
		$(function(){
		$("#meeting").datagrid({
			width:1195,
			url:"${proPath }" + '/zhdj/meeting/backGetMeeting?orgId='+TreeId,
			title:'会议列表',
			columns:[[
				{field:'id',title:'会议id',width:20},
				{field:'orgId',title:'组织id',width:25},
				{field:'orgName',title:'组织',width:35},
				{field:'meetingTitle',title:'大会标题',width:55},
				{field:'aStartTime',title:'开始时间',width:35},
				{field:'aEndTime',title:'结束时间',width:35},
				{field:'aSignStartTime',title:'签到开始时间',width:35},
				{field:'aSignEndTime',title:'签到结束时间',width:35},
				{field:'arriveNumber',title:'应到人数',width:15},
				{field:'status',title:'状态',width:15}
			]],
			pagination:true,
			fitColumns:true,
			toolbar:"#meetingTb",
		});
	});
	
	var meeting = {
		//新增会议窗口
		addMeetingWin:function(){
			$("#addWin").window('open');
		},
		//添加人员窗口
		addPeopleWin:function(){
			$("#arrivePeople").val("");
			$("#arrivePeoplePhone").val("");
			$("#addPeopleWin").window('open');
		},
		//添加人员
		addPeople:function(){
			var arrivePeople = $("#arrivePeople").val();
			var arrivePeoplePhone = $("#arrivePeoplePhone").val();
			if(arrivePeople != "" && arrivePeoplePhone != ""){
				//向datagrid动态添加数据
				$('#people').datagrid('insertRow',{
	            row: {
		            arrivePeople: $("#arrivePeople").val(),
		            arrivePeoplePhone: $("#arrivePeoplePhone").val(),
	            }
	    		});
    		}
    		$("#addPeopleWin").window('close'); 
		},
		
		//新增会议
		addMeeting:function(){
			//获取表单数据
			var orgId = $("#orgId").val();
			var orgName = $("#orgName").val();
			var meetingTitle = $("#meetingTitle").val();
			var startTime = $("input[name='startTime']").val(); 
			var endTime = $("input[name='endTime']").val();
			var signStartTime = $("input[name='signStartTime']").val();
			var signEndTime = $("input[name='signEndTime']").val();
			var arriveNumber = $("#arriveNumber").val();
			var meetingContent = $("#meetingContent").val();
			var rows = $("#people").datagrid("getRows"); 
			var type = $("#type option:selected").val();
			//获取所添加人员信息
			var jsonArray = [];
			for(var i=0;i<rows.length;i++){
				//获取每一行的数据
				var json = new Object;
				json.arrivePeople = rows[i].arrivePeople+"";
				json.arrivePeoplePhone = rows[i].arrivePeoplePhone+"";
				jsonArray.push(json);
			}
			jsonArray = JSON.stringify(jsonArray);
			$.ajax({
				   type: "POST",
				   url: "/zhdj/meeting",
				   data: {
					   orgId:orgId,
					   orgName:orgName,
					   meetingTitle:meetingTitle,
					   starttime:startTime,
					   endtime:endTime,
					   signStarttime:signStartTime,
					   signEndtime:signEndTime,
					   arriveNumber:arriveNumber,
					   meetingContent:meetingContent,
					   jsonArray:jsonArray,
					   type:type
				   },
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
			
		},
		//编辑会议窗口
		editMeetingWin:function(){
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
			$("#moduleC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-module")).text());
			$("#deadLineC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-deadLine")).text());
			$("#exceptionReasonC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-exceptionReason")).text());
			$("#handleWayC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-handleWay")).text());
			$("#resultC").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-result")).text());
			$("#handlewin").window('open');
		},
		//打开删除窗口
		deleteWin:function(){
			if($(".datagrid-row-selected").size()==0){
				$.messager.alert('警告','请选择一项进行删除');
				return;
			}else if($(".datagrid-row-selected").size()>1){
				$.messager.alert('警告','请只选择一项进行删除');
				return;
			}
			$("#deletewin").window('open');
		},
		//删除会议
		deleteMeeting:function(){
			var id  = $(".datagrid-row-selected").find($(".datagrid-cell-c2-id")).text();
			$.ajax({
				   type: "POST",
				   url: "/zhdj/meeting/delete",
				   data: {meetingId:id},
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
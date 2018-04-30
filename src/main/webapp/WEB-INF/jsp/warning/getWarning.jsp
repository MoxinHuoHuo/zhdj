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
		<table id="box" rownumbers="true" singleSelect="true"></table>
	</div>
	
		
	
	<div id="tb" style="padding-top:0px">
		<!--  <a class="easyui-linkbutton" onclick="warning.editWin()" iconCls="icon-table-edit" plain='true'>编辑预警</a>	-->
		<a class="easyui-linkbutton" onclick="warning.deleteWin()" iconCls="icon-cancel" plain='true'>删除预警</a>	
		<a class="easyui-linkbutton" onclick="warning.getHandledWarning()" iconCls="icon-tip" plain='true'>查看已处理预警</a>
		<a class="easyui-linkbutton" onclick="warning.getNoHandledWarning()" iconCls="icon-tip" plain='true'>查看未处理预警</a>
	</div>
	<div id="deletewin" class="easyui-window" title="删除预警" modal="true" data-options="iconCls:'icon-save'" style="top:100px;width:300px;height:200px;padding:5px;" closed="true">
		<div style="margin-bottom:50px;margin-top:30px"><p style="margin:0 auto;width:160px;font-size:16px;">请问要删除此预警吗？</p></div>
		<div style="margin:0 auto;width:215px">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="warning.deleteRecord()">确认删除</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#deletewin').window('close')">取消删除</a>
		</div>
	</div>  
	<div id="editwin" class="easyui-window" title="编辑预警" modal="true" data-options="iconCls:'icon-save'" style="top:80px;width:360px;height:380px;padding-top:20px;" closed="true">

		 <table align="center" width="300" border="0" cellspacing="20" >
		 	<tr>
		 		<th align="right" style="margin-right:20px"><span style="font-size:16px">id:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="id" id="id" readonly  unselectable="on"/></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">标题:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="title" id="title" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">模块:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="module" id="module" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">预警日期:</span></th>
		 		<td><input class="easyui-datetimebox" style="height:20px" type="datetime" name="DeadLine" id="deadLine"  /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">异常原因:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="exceptionReason" id="exceptionReason" /></td>
		 	</tr>
		 	<tr>
		 		<td align="right"><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="warning.editRecord()">确认</a></td>
		 		<td><a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#editwin').window('close')">取消</a></td>
		 	</tr> 
		 </table>
	</div>  
    <script type="text/javascript">
  		//前台轮询
  		/*$(function(){
  			setInterval(function(){
			    getMsgNum();
			},10000);
  		});*/
  		var TreeId='<%=session.getAttribute("loginTreeId")%>';
    
		 /*function getMsgNum(){
		    $.ajax({
		        url:'/zhdj/warning/getWarningInTime?orgId='+TreeId,
		        type:'post',
		        //dataType:'json',
		        success:function(data){
		           if(data=="success"){
		           		alert("您有新预警，请及时查看!")
		           }
		           
		        }
		    });
		}*/
		
		
		$(function(){
		$("#box").datagrid({
			width:1195,
			url:"${proPath }" + '/zhdj/warning/getSetWarning?warnOrgId='+TreeId,
			title:'预警列表',
			columns:[[
				{field:'id',title:'id',width:10},
				{field:'title',title:'预警标题',width:35},
				{field:'deadLine',title:'预警时间',width:35},
				{field:'handleWay',title:'处理方式',width:35}
			]],
			queryParams: {
			    	 handleStatus:'0'
				}, 
			pagination:true,
			fitColumns:true,
			toolbar:"#tb",
		});
	});
	
	var warning = {
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
		
		//编辑记录窗口
		editWin:function(){
			if($(".datagrid-row-selected").find($(".datagrid-cell-c1-result")).text()!=""){
				alert("已处理，不能编辑!");
				return;
			}
			if($(".datagrid-row-selected").size()==0){
				$.messager.alert('警告','请选择一项进行编辑');
				return;
			}else if($(".datagrid-row-selected").size()>1){
				$.messager.alert('警告','请只选择一项进行编辑');
				return;
			}
			//alert($(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text());
			var row = $("#box").datagrid('getSelected');
			alert(row.id);
			$("#id").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text());
			$("#title").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-title")).text());
			$("#module").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-module")).text());
			$("#deadLine").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-deadLine")).text());
			$("#exceptionReason").val($(".datagrid-row-selected").find($(".datagrid-cell-c1-exceptionReason")).text());
			$("#editwin").window('open');
		},
		//编辑记录
		editRecord:function(){
			var id = $(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text();
			var title = $("#title").val();
			var module = $("#module").val();
			var DeadLine = $(".combo-value").val();
			var exceptionReason = $("#exceptionReason").val();
			$.ajax({
				   type: "POST",
				   url: "/zhdj/warning/edit",
				   data: {id:id,title:title,module:module,DeadLine:DeadLine,exceptionReason:exceptionReason},
				   success: function(data){
				   		if(data["success"] == 1){
						alert("操作成功");
						window.location.reload();
				   	}else{
						alert(data["message"]);
						window.location.reload();
				   	}
			   }
			});	
		},
		//删除记录
		deleteRecord:function(){
			var id  = $(".datagrid-row-selected").find($(".datagrid-cell-c1-id")).text();
			$.ajax({
				   type: "POST",
				   url: "/zhdj/warning/delete",
				   data: {id:id},
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
		
		//查看已处理预警
		getHandledWarning:function(){
			$('#box').datagrid('load',{
					handleStatus:'1'
				});
		},
		
		//查看未处理预警
		getNoHandledWarning:function(){
			$('#box').datagrid('load',{
					handleStatus:'0'
				});
		}
	
	}
  	</script>
</body>
</html>

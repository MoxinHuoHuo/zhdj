<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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

  </head>
  
  <body class="easyui-layout">
   		<div id="content" region="center"style="width:1095px;height:800px">
   			<table id="projectShowdg" title="已下达任务" rownumbers="true" pagination="true"  singleSelect="true"
   			data-options="iconCls:'icon-application-cascade',
			toolbar: '#projectshowtb'"
   			>
   				<thead>
    				<tr>
    					<th data-options="field:'ck',checkbox:true"></th>
    					<th data-options="field:'tastId',width:100">任务id</th>
    					<th data-options="field:'tastType',width:100">任务标号</th>
    					<th data-options="field:'tastTitle',width:150">任务标题</th>
    					<th data-options="field:'name',width:230,align:'center'">接受任务方</th>
    					<th data-options="field:'startTime',width:200,align:'center'">任务开始时间</th>
    					<th data-options="field:'finishTime',width:200,align:'center'">任务要求完成时间</th>
    				</tr>
    			</thead>
			</table>
			<div id="projectshowtb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-control-blank" plain="true" onclick="checkprojectshow()">查看任务内容</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-table-delete" plain="true" id="deleteproject">删除任务</a>
			<input id="tastTypesub" type="text" style="line-height:20px;border:2px solid #ccc">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search"  plain="true" onclick="doSearch()">搜索</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-control-blank"  plain="true" onclick="addWarningWin()">新增预警</a>
			<div style="float:right">
			任务标号：
			<input id="Exceltext" type="text" style="line-height:20px;border:2px solid #ccc;">
			<a href="#" class="easyui-linkbutton" iconCls="icon-page-white-excel" plain="true" id="Excel">导出Excel表格</a>
			</div>
			</div>
   		</div>
   		
   		<div id="checkProshow" class="easyui-dialog" title="计划内容" style="width:520px;padding:30px 70px 20px 110px" closed="true">
    			<div style="margin-bottom:10px;">
    				<div>附件:</div>
    				<input class="easyui-textbox" id="projectFileshow" style="width:223px;">
    				<a href="javascript:void(0)" class="easyui-linkbutton" style="width:22%;margin-left:8px;" id="downloadshow">下载文件</a>
    			</div>
  				任务内容:
  				<br>
  				<textarea rows="5" id="testcteshow" readonly="readonly" data-options="multiline:true" style="width:300px;height:150px;"></textarea>
    			<div>
    			<br>
    			<a href="javascript:void(0)" class="easyui-linkbutton" style="width:90%;margin-left:3px;" onclick="$('#checkProshow ').dialog('close')">确定</a>
    		</div>
    	</div>
    
    	<div id="addWarningWin" class="easyui-window" title="新增预警" modal="true" data-options="iconCls:'icon-save'" style="top:80px;width:360px;height:380px;padding-top:20px;" closed="true">

		 <table align="center" width="300" border="0" cellspacing="20" >
		 	
		 	<tr>
		 		<th align="right"><span style="font-size:16px">预警标题:</span></th>
		 		<td><input class="easyui-textbox" style="height:20px" type="text" name="title" id="title" /></td>
		 	</tr>
		 	<tr>
		 		<th align="right"><span style="font-size:16px">预警日期:</span></th>
		 		<td><input class="easyui-datetimebox" style="height:20px" type="datetime" name="DeadLine" id="wDeadLine"  /></td>
		 	</tr>
		 	<tr>
		 		<td align="right"><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  onclick="addWarning()">确认</a></td>
		 		<td><a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="$('#addWarningWin').window('close')">取消</a></td>
		 	</tr> 
		 </table>
	</div>  
   		
   		<script type="text/javascript">
   		var UserId='<%=session.getAttribute("loginUserId")%>';
		var TreeId='<%=session.getAttribute("loginTreeId")%>';
		
   		$('#projectShowdg').datagrid({
		url:"/zhdj/GetTaskByYourSelf?userId="+UserId,
		
	});
   		function doSearch(){
   		var tastType=$('#tastTypesub').val();
   		$('#projectShowdg').datagrid({
		url:"/zhdj/SelectByTastType?tastType="+tastType,
		
	});
   		}
   		
   		function checkprojectshow(){
   		var row = $('#projectShowdg').datagrid('getSelected');
   		if(row){
   			$('#checkProshow').dialog('open');
	   		$('#testcteshow').val(row.tastContent);
	   		$('#projectFileshow').textbox('setValue',row.urlName);
   		}  		
   	}
   	
   	$('#downloadshow').on('click',function(){
   		var row = $('#projectShowdg').datagrid('getSelected');
   		var fileurl=row.testUrl;
   		window.open("/zhdj/DownFile?fileName="+fileurl);
   	})
   		
   		$('#deleteproject').on('click',function(){
   		var row = $('#projectShowdg').datagrid('getSelected');
   		if(row){
	   		$.messager.confirm('提示','是否删除此任务？',function(r){
	   			if(r){
	   				$.ajax({
	   					url:'/zhdj/delete',
	   					dataType:'json',
	   					type:'post',
	   					data:{tastId:row.tastId},
	   					success:function(){
	   						$('#projectShowdg').datagrid('reload');
	   						$.messager.alert('提示','此任务已删除成功');
	   					} 
	   				})
	   			}
	   		})
   		};
   	})
   		
   	$('#Excel').on('click',function(){
   		var Exceltext=$('#Exceltext').val();
   		window.open("/zhdj/excel/export?testType="+Exceltext);
   	})	
   	
   	function addWarningWin(){
   		if($(".datagrid-row-selected").size()==0){
				$.messager.alert('警告','请选择一项任务');
				return;
			}
			$("#addWarningWin").window('open');
   	}
   	
   	function addWarning(){
   		var taskId = $(".datagrid-row-selected").find($(".datagrid-cell-c1-tastId")).text();
   		var title = $("#title").val();
   		var wDeadLine = $("#wDeadLine").val();
   		$.ajax({
				   type: "POST",
				   url: "/zhdj/warning/addWarning",
				   data: {taskId:taskId,wDeadLine:wDeadLine,orgAdminId:UserId,warnOrgId:TreeId,title:title},
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
   				
   		</script>
  </body>
</html>

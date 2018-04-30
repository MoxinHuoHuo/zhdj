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
    		<table id="projectsubmitdg" title="计划审核" rownumbers="true" pagination="true"  singleSelect="true"
    			data-options="iconCls:'icon-layout-edit',
				toolbar: '#projectsubmittb'">
    			<thead>
    				<tr>
    					<th data-options="field:'tastTitle',width:200">任务标题</th>
    					<th data-options="field:'submitName',width:200">计划提交者</th>
    					<th data-options="field:'doStartTime',width:200,align:'center'">计划提交时间</th>
    					<th data-options="field:'doStartTime',width:200,align:'center'">计划开始时间</th>
    					<th data-options="field:'doFinishTime',width:200,align:'center'">计划任务完成时间</th>
    					<th data-options="field:'doWhere',width:200,align:'center'">计划执行地点</th>
    					<th data-options="field:'readOk',width:200,align:'center'">是否通过审核</th>
    				</tr>
    			</thead>
			</table>
			<div id="projectsubmittb">
				<a href="#" class="easyui-linkbutton" iconCls="icon-report" plain="true" id="person">本人计划</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-report" plain="true" id="myUnopro">组织成员的计划</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-report" plain="true" id="Unopro">下级管理员计划</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-table-delete" plain="true" id="deletepj">删除计划</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-table-cell" plain="true" onclick="checkproject1()">查看计划</a>
				<a href="#" class="easyui-linkbutton" iconCls="icon-table-cell" plain="true" onclick="checkproject2()">查看私人计划</a>
			</div>
    	</div>
    	
    	<div id="checkPro1" class="easyui-dialog" title="计划内容" style="width:450px;padding:30px 70px 20px 70px" closed="true">
    			<form id="projectSub" method="post" data-options="novalidate:true" enctype="multipart/form-data">
  				计划内容:
  				<br>
  				<textarea rows="5" id="testcte1" readonly="readonly" data-options="multiline:true" style="width:300px;height:150px;"></textarea>
    			<div>
    			<div style="margin-bottom:20px">
					<div>审核意见:</div>
					<input class="easyui-textbox" name="checkOpinion" id="projectView"  style="width:100%">
				</div>
					
	    			<a id="submitPro" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:45%;margin-left:5px;" id="submitPro">通过审核</a>
	    			<a id="submitProNo " href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-bullet-cross'" style="width:45%;margin-left:15px;" id="submitProNo">不通过审核</a>
    			</div>
    			</form>
    	</div>
    	<!-- <div id="checkPro2" class="easyui-dialog" title="私人计划" style="width:1000px;top:150px;left:210px;" closed="true">
    			<table id="personalTestdg" title="私人计划" rownumbers="true" pagination="true"  singleSelect="true">
				</table>
				<div id="personalTesttb">
					<a href="#" class="easyui-linkbutton" iconCls="icon-report" plain="true" id="personlTest">审核计划</a>
				</div>
    	</div> -->
    	
    	
    	
   	<script type="text/javascript">
   		var UserId='<%=session.getAttribute("loginUserId")%>';
		var TreeId='<%=session.getAttribute("loginTreeId")%>';
		
   		$('#projectsubmitdg').datagrid({
			url:"/zhdj/submit/read?userId="+UserId+"&distinction=1"
		});
  	
  		$('#person').on('click',function(){
  			$('#projectsubmitdg').datagrid({
			url:"/zhdj/submit/read?userId="+UserId+"&distinction=1"
		    });
  		})
  	
  		$('#Unopro').on('click',function(){
  			$('#projectsubmitdg').datagrid({
			url:"/zhdj/submit/read?userId="+UserId+"&distinction=Unit"
		    });
  		})
  		
  		$('#myUnopro').on('click',function(){
  			$('#projectsubmitdg').datagrid({
			url:"/zhdj/submit/read?userId="+UserId+"&distinction=Per"
		    });
  		})
  		function checkproject2(){
  			$('#projectsubmitdg').datagrid({
  				url:"/zhdj/submit/PerSentTastRead?userId="+UserId,
  			
  			    });
   		
   	}
  
   	function checkproject1(){
   		var row = $('#projectsubmitdg').datagrid('getSelected');
   		if(row){
   			$('#checkPro1').dialog('open');
	   		$('#testcte1').val(row.taskName);
	   		
   		}  		
   	}
   	//绑定一个点击事件
   	$('#submitPro').on('click',function(){
   		
   		var row = $('#projectsubmitdg').datagrid('getSelected');
   		var projectSub = new FormData($("#projectSub")[0]);
   		projectSub.append('submitId',row.submitId);
   		projectSub.append('readOk',1);
   		projectSub.append('receiveUserId',UserId);
   		
   		if(row){
   			$.messager.confirm('提示','是否通过此计划？',function(r){
   				if(r){
   					$.ajax({
   						url:'/zhdj/submit/Check',
   		   				dataType:'json',
   		   				type:'post',
   		   				processData:false,
   		   				contentType:false,
   		   				data:projectSub,
   		   				success:function(data){
   		   					if(data.status==-1){
   		   					$.messager.alert('提示','你无权对自己的计划进行审核');
   		   					}
   		   					else{
   		   					$('#projectsubmitdg').datagrid('reload');
   		   					/* $.messager.alert('提示','计划已通过审核'); */
   		   					alert("计划已通过审核");
   		   					$('#checkPro1').dialog('close');
   		   					}
   		   					
   		   				}
   					})
   				}
   			})
   		}
   			
   	})
   	
   	$('#submitProNo').on('click',function(){
   		var row = $('#projectsubmitdg').datagrid('getSelected');
   		var projectSub = new FormData($("#projectSub")[0]);
   		projectSub.append('submitId',row.submitId);
   		projectSub.append('readOk',0);
   		projectSub.append('receiveUserId',UserId);
   		
   		if(row){
   			$.messager.confirm('提示','是否不通过此计划？',function(r){
   				if(r){
   					$.ajax({
   						url:'/zhdj/submit/Check',
   		   				dataType:'json',
   		   				type:'post',
   		   				processData:false,
   		   				contentType:false,
   		   				data:projectSub,
   		   				success:function(data){
   		   					if(data.status==-1){
   		   					$.messager.alert('提示','你无权对自己的计划进行审核');
   		   					}
   		   					else{
   		   					$('#projectsubmitdg').datagrid('reload');
   		   					/* $.messager.alert('提示','计划已通过审核'); */
   		   					alert("计划已拒绝通过审核");
   		   					$('#checkPro1').dialog('close');
   		   					}
   		   					
   		   				}
   					})
   				}
   			})
   		}
   			
   	})
   	
   	$('#deletepj').on('click',function(){
 			var row = $('#projectsubmitdg').datagrid('getSelected');
 			if(row){
 				$.messager.confirm('提示','是否删除此计划？',function(r){
 					if(r){
 						$.ajax({
 							url:'/zhdj/submit/delete',
 							dataType:'json',
 							type:'post',
 							data:{submitId:row.submitId ,userId:UserId},
 							success:function(data){
 								if(data.status==-2){
 									$.messager.alert('提示','你无权对他人的计划删除');
 								}else{
 								alert('此计划已删除成功');
 								$('#projectsubmitdg').datagrid('reload');
 								}
 							}
 						})
 					}
 				})
 			}
 		})
 	
 		
 	
   	</script>
  </body>
</html>

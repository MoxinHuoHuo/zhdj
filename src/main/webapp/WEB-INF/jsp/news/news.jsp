<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
</head>

<body class="easyui-layout">
	<div id="content" region="center"style="width:1000px;height:800px">
		<table id="newsdg" title="新闻" rownumbers="true" pagination="true"  singleSelect="true">
		</table>
		<div id="newstb">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add1" plain="true" onclick="newsAdd()">增加新闻</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-application-edit" plain="true" id="newsEdit">编辑新闻</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="newsDelete()">删除新闻</a>
		</div>
	</div>
	
	<div id="Addnews" class="easyui-dialog" title="添加新闻" style="width:400px;padding:30px 70px 20px 70px" closed="true">
		<form id="Anews" method="post" data-options="novalidate:true" enctype="multipart/form-data">
			<div style="margin-bottom:20px">
				<div>新闻标题:</div>
				<input class="easyui-textbox" placeholder="请输入新闻标题" style="width:100%" name="title" id="newTitle">
			</div>
			<div style="margin-bottom:20px">
				<div>新闻链接:</div>
				<input class="easyui-textbox" name="href" id="newHref" placeholder="请输入新闻链接" style="width:100%">
			</div>
			<div style="margin-bottom:20px">
				<div>新闻图片:</div>
				<input class="easyui-filebox" name="Mrequest" id="imgs" data-options="prompt:'请选择图片'" style="width:100%">
			</div>
			<div style="margin-bottom:20px">
			    <img id="img" style="width:230px;height:230px;margin-left:20px;" />
			</div>
		</form>
	</div>
	
	<div id="Editnews" class="easyui-dialog" title="编辑新闻" style="width:400px;padding:30px 70px 20px 70px" closed="true">
		<form id="Enews" method="post" data-options="novalidate:true" enctype="multipart/form-data">
			<div style="margin-bottom:20px">
				<div>新闻标题:</div>
				<input class="easyui-textbox" placeholder="请输入新闻标题" style="width:100%" name="title" id="newTitle1">
			</div>
			<div style="margin-bottom:20px">
				<div>新闻链接:</div>
				<input class="easyui-textbox" name="href" id="newHref1" placeholder="请输入新闻链接" style="width:100%">
			</div>
			<div style="margin-bottom:20px">
				<div>新闻图片:</div>
				<input class="easyui-filebox" name="Mrequest" id="imgs1" data-options="prompt:'请选择图片'" style="width:100%">
			</div>
			<div style="margin-bottom:20px">
			    <img id="img1" style="width:230px;height:230px;margin-left:20px;" />
			</div>
			<div>
				<a href="javascript:void(0)" id="finshEdit" class="easyui-linkbutton" iconCls="icon-ok" style="width:40%;margin-left:10px;">编辑完成</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-bullet-cross" style="width:40%;margin-left:20px;" onclick="$('#Editnews').dialog('close')">取消编辑</a>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
	$('#newsdg').datagrid({
	url:"/zhdj/News/listUI",
	iconCls:'icon-chart-curve',
	toolbar: '#newstb',
	columns:[[
    	{field:'ck',checkbox:true},
    	/* {field:'userId',title:'ID',width:25}, */
		{field:'newTitle',title:'新闻标题',width:300},
		{field:'newHref',title:'新闻链接',width:350},
		{field:'imgs',title:'新闻图片',formatter:formatImg,width:80,height:50,align:'center'}
    ]]
});
	$('#imgs1').filebox({
		buttonText:"选择图片"
	})
	
	$('#imgs').filebox({
		buttonText:"选择图片"
	})
	
	function formatImg(val,row){
		if(val){
			return '<img src="/zhdj/News/listUI/pic/'+val+'" style=width:80px;height:50px;>';
		}
		else{
			return '<img src='+AppContextPath+'/img/3.jpg style=width:80px;height:50px;>';
		};
	}
	
	$('#Addnews').dialog({
		buttons: [{
					text:'添加新闻',
					iconCls:'icon-ok',
					handler:function(){
						var news = new FormData($("#Anews")[0]);
						$.ajax({
							url:'/zhdj/News/addNews',
							type: "POST",
							data: news,
							dataType : "json",
							processData: false,  // 告诉jQuery不要去处理发送的数据
							contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
							success:function(data){
								$('#newsdg').datagrid('reload');
								$.messager.alert('提示','新闻添加成功');
								$('#Addnews').dialog('close');
							}
						})
					}
				},{
					text:'取消',
					iconCls:'icon-bullet-cross',
					handler:function(){
						$('#Addnews').dialog('close');
					}
				}]
	})
	
	function newsAdd(){
		$('#Addnews').dialog('open');
		$.extend($.fn.filebox.methods, {
        getFile: function (myself) {
		        var temp = $(myself).next().children("[type='file']");
		        var file = document.getElementById(temp.attr("id"));
		
		        if (file.files.length > 0) {
		            // 若选中一个文件，则返回该文件的File对象
		            return file.files[0];
		        }
		
		        // 若未选中不论什么文件，则返回null
		        return null;
		    }
		});
	$("#imgs").filebox({
	    	onChange: function (event) {
	
	        // 获取所选文件的File对象
	        var file = $(this).filebox("getFile");
	
	        if (file != null) {
	            // 创建FileReader对象
	            var reader = new window.FileReader();
	            // 定义reader的onload事件
	            // 当读完文件信息后触发onload事件
	            reader.onload = function (e) {
	                // reader.result保存着产生的虚拟URL
	                $("#img").attr("src", this.result);
	            }
	            // 读取指定文件并形成URL
	            reader.readAsDataURL(file);
	        }
	    }
	});
	}
	
	$('#newsEdit').on('click',function(){
		var row = $('#newsdg').datagrid('getSelected');
		if(row){
			$('#Editnews').dialog('open');
			$('#newTitle1').textbox("setValue", row.newTitle);
			$('#newHref1').textbox("setValue", row.newHref);
			$('#imgs1').filebox("getValue",row.imgs);
			
		$.extend($.fn.filebox.methods, {
        getFile: function (myself) {
		        var temp = $(myself).next().children("[type='file']");
		        var file = document.getElementById(temp.attr("id"));
		
		        if (file.files.length > 0) {
		            // 若选中一个文件，则返回该文件的File对象
		            return file.files[0];
		        }
		
		        // 若未选中不论什么文件，则返回null
		        return null;
		    }
		});
		$("#imgs1").filebox({
		    	onChange: function (event) {
		        // 获取所选文件的File对象
		        var file = $(this).filebox("getFile");
		
		        if (file != null) {
		            // 创建FileReader对象
		            var reader = new window.FileReader();
		            // 定义reader的onload事件
		            // 当读完文件信息后触发onload事件
		            reader.onload = function (e) {
		                // reader.result保存着产生的虚拟URL
		                $("#img1").attr("src", this.result);
		            }
		            // 读取指定文件并形成URL
		            reader.readAsDataURL(file);
		        }
		    }
		});
}

})

$('#finshEdit').on('click',function(){
	var row = $('#newsdg').datagrid('getSelected');
	var editnews = new FormData($("#Enews")[0]);
	editnews.append("newsId",row.newId);
	$.ajax({
		url:"/zhdj/News/updateNews",
		data:editnews,
		dataType:'json',
		type:'post',
		processData: false,  // 告诉jQuery不要去处理发送的数据
		contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
		success:function(data){
			$('#newsdg').datagrid('reload');
			$.messager.alert('提示','编辑成功');
			$('#Editnews').dialog('close');
		}
	})
})

function newsDelete(){
	var row = $('#newsdg').datagrid('getSelected');
	if(row){
		$.messager.confirm('提示','是否确定删除此条新闻？',function(r){
			if(r){
				$.ajax({
					url:"/zhdj/News/deleteNews",
					dataType:'json',
					type:'post',
					data:{newsId:row.newId},
					success:function(){
						$('#newsdg').datagrid('reload');
						$.messager.alert('提示','此条新闻已成功删除');
					}
				})
			}
		})
	}
}
	
	</script>
</body>
</html>
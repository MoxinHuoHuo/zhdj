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
	
<body>
	<div style="margin:0;">
	<div class="easyui-panel" iconCls="icon-table-cell" title="任务发布" style="width:1080px;background-color:#FFFFFF">
		<div style="padding:20px 120px 40px 160px">
			<form id="Addtb" class="easyui-form" method="post" data-options="novalidate:true" enctype="multipart/form-data">
				<table cellpadding="12">
					<tr>
						<td><strong style="font-size:15px;">任务标题:</strong></td>
						<td><input class="easyui-textbox" style="width:200px;" type="text" name="tastTitle" id="title" data-options="prompt:'请输入任务标题'"></td>
						<td><strong style="font-size:15px;">选择文件:</strong></td>
						<td><input class="easyui-filebox" name="Mrequest" id="pto" data-options="prompt:'请选择文件'" style="width:195px;"></td>
					</tr>
					<tr>
						
						<td style="margin-top:20px;"><div style="margin-top:20px;"><strong style="font-size:15px;">组织:</strong></div></td>
						<td style="margin-top:20px;"> 
							<div style="margin-top:20px;">
								<select id="cc" class="easyui-combotree" multiple style="width:200px;" data-options="prompt:'请选择组织'"></select>
							&nbsp;&nbsp;&nbsp;<input type="button" class="easyui-linkbutton" style="width:50px;height:28px;" checked onclick="$('#cc').combotree({cascadeCheck:$(this).is(':checked')})" value="清除" ><input type="hidden" id="or">
							</div>
							
						</td>
						
						<td><div style="margin-top:20px;margin-left:20px;"><strong style="font-size:15px;">个人:</strong></div></strong></td>
						<td>
							<div style="margin-top:20px;">
							<input id="ids" value="" type="text" placeholder="请选择人员">
							&nbsp;&nbsp;<input type="button" class="easyui-linkbutton" onclick="confirm()" value="确认" style="width:50px;height:27px;">
							</div>
						</td>
						
						
					</tr>
					<tr style="margin-top:20px;">
						<td><strong style="font-size:15px;">任务内容:</strong></td>
						<td><textarea rows="6" name="tastContent " cols=""id="tastcontent" class="easyui-validatebox" data-options="multiline:true" style="width:300px;height:170px;" placeholder="请输入任务内容"></textarea></td>
						<td><div style="margin-left:20px;"><strong style="font-size:15px;">个人名称:</strong></div></td>
						<td>
							<div  id="idsName" name="idsName" style="width:250px;height:180px;border:1px solid #ccc;margin-top:46px;"></div>
							<input type="button" id="clear" class="easyui-linkbutton" value="清除" style="margin-top:20px;width:50px;height:27px;"><input type="hidden" id="perName">
						</td>
					</tr>
					
					<tr>
						<td><div style="margin-top:25px;"><strong style="font-size:15px;">任务开始时间:</strong></div></td>
						<td><div style="margin-top:25px;"><input id="strattime" name="startTime" data-options="prompt:'请选择任务开始时间'" class="easyui-datetimebox"style="width:150px"></div></td>
						<td><div style="margin-top:25px;"><strong style="font-size:15px;">任务结束时间:</strong></div></td>
						<td><div style="margin-top:25px;"><input id="finishtime" name="finishTime" data-options="prompt:'请选择任务结束时间'" class="easyui-datetimebox"style="width:150px"></div></td>
					</tr>
					
				</table>
				<div style="margin-top:30px;margin-left:190px;">
							<input type="button" class="easyui-linkbutton" style="width:60%;height:30px;" value="确认下达" id="saveAdd">
							</div>
			</form>
		</div>
	</div>
</div>	
	
	
	
	
	
	
<script type="text/javascript">
	var selectedUserId;
	var userId='<%=session.getAttribute("loginUserId")%>';
	var treeId='<%=session.getAttribute("loginTreeId")%>';
	var PowerId='<%=session.getAttribute("loginPowerId")%>';
	var title=$('#title').val();
	var pto=$('#pto').val();
	var cc=$('#cc').val();
/* 	var idsName=$('#idsName').val(); */
	var tastcontent=$('#tastcontent').val();
	var strattime=$('#strattime').val();
	var finishtime=$('#finishtime').val();
	var loading = false;
	var selectedUserName;
$('#cc').combotree({
	cascadeCheck:false,
    url:'/zhdj/tree/recursiveTree',
    method:'get',
    animate:true,
    onlyLeafCheck:false,
	onSelect: function(node) {
             return;
      },
    onBeforeLoad: function(row) {
             loading = true; 
      },
    onLoadSuccess: function (row, data) {
             loading = false; 
      },
    onCheck: function (data, checked) {
             if (loading) {
                  return;
             }
             if (checked == true) {
             var orValue=$("#or").val();
             $("#or").val(orValue+data.id+',');
             /* alert($("#or").val()); */
             }
      },
});

$(function(){
		$("#ids").on('input',function(){
			/* var t=this.value; */
			$("#ids").combobox({
		      valueField: 'userId',  
		      textField: 'userName',
		      url:'/zhdj/user/selectByName',
		      mode: 'remote', //从服务器加载就设置为‘remote‘
		      hasDownArrow: false,  //为true时显示下拉选项图标
		      onBeforeLoad: function (parm) {  //在请求加载数据之前触发，返回 false 则取消加载动作         
		      var  value = $(this).combobox('getValue');
		      if (value) {  
		           
		            parm.userName = value;
		           
		            parm.paramType = 5;
		            return true;  
		       }  
		          return false;  
		       },
		       onSelect: function(row){    //当用户选择一个列表项时触发。
		            //这样赋值便于取值（否则该字段为空）
		            /* document.getElementById("ids").value= row.userName; */
		           	$('#ids').val(row.userName);
		           	selectedUserName=row.userName;
		            selectedUserId = row.userId;
		            /* alert(selectedUserId); */
		            
		        }
		        
		  })

		})
						
	})
	
function confirm(){
		var d=$('#ids').val();
		if(d==null||d==''){
			return;
		}
		else{
		$('#idsName').append(selectedUserName+'&nbsp;&nbsp;&nbsp;');
		}
		var perName=$("#perName").val();
		if(selectedUserId==null){
			return;
		}
		else{
        $("#perName").val(perName+selectedUserId+',');
        };
        /* alert($("#perName").val()); */
}
	
$('#clear').on('click',function(){
		$('#idsName').html('');
		$("#perName").val('');
})

	$('#pto').filebox({
		buttonText:"选择文件"
	})
	
$('#saveAdd').on('click',function(){
	
		var t=$('#idsName').html();
		var array=t.split("&nbsp;&nbsp;&nbsp;");
		/* for(var i=0;i<array.length-1;i++){			
		}; */
			var fd = new FormData($("#Addtb")[0]);
			fd.append("uid",$("#or").val());
			fd.append("ids",$("#perName").val());
		if($('#title').val()==null||$('#title').val()=='')
			{alert("请输入任务标题");}
		else if($('#tastcontent').val()==null||$('#tastcontent').val()=='')
			{alert("请输入任务内容");}
		else if($('#strattime').val()==null||$('#strattime').val()=='')
			{alert("请选择任务开始时间")}
		else if($('#finishtime').val()==null||$('#finishtime').val()=='')
			{alert("请选择任务结束时间")}	
		else{
			$.ajax({
				url: "/zhdj/SentTast?userId="+userId,
				type: "POST",
				data: fd,
				dataType : "json",
				processData: false,  // 告诉jQuery不要去处理发送的数据
				contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
				success:function(data){
					if(data.status==-1){
						$.messager.alert('提示','接收任务的人所在组织较高，无权发送');
					}
					else if(data.status==-2){
						$.messager.alert('提示','接收任务的人所在组织较高，无权发送');
					}
					else if(data.status==1){
						$.messager.alert('提示','发布成功');
						setTimeout(function(){
							window.location.reload();
						},1500)
					}
				}   
			});
		}
			
})

	
</script>
	
</body>
</html>
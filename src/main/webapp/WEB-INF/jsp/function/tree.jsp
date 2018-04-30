查看私人<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
</head>
<body class="easyui-layout">
	<div class="easyui-layout" style="width:1130px;height:1000px;">
	<div region="west" split="true" title="组织与机构" style="width:310px;height:600px">
	
	<u id="tt" class="easyui-tree"></u>
	
    <div id="mm" class="easyui-menu" style="width:80px;">
		<div onclick="append()" data-options="iconCls:'icon-add1'">增加</div>
		<div onclick="edit()" data-options="iconCls:'icon-pencil'">修改</div>
		<div onclick="remove()" data-options="iconCls:'icon-user-delete'">删除</div>
	</div>
	
	<div id="d1" class="easyui-dialog" title="添加" style="width:240px;height:85px;line-height:40px;"
    data-options="iconCls:'icon-add1',resizable:true" closed="true">
   		<input type="text" id="id1" placeholder="请输入名称" style="margin-left:10px;">
   		&nbsp;&nbsp;<button type="button" id="save1">确认</button>
	</div>
	
	<div id="d2" class="easyui-dialog" title="修改名称" style="width:240px;height:85px;line-height:40px;"
    data-options="iconCls:'icon-pencil',resizable:true" closed="true">
   		<input type="text" id="id2" placeholder="请输入修改的名称" style="margin-left:10px;">
   		&nbsp;&nbsp;<button type="button" id="save2">确认</button>
	</div>
	
	<div id="edbe" class="easyui-dialog" title="修改资料" style="width:320px;height:250px;"
    data-options="iconCls:'icon-pencil',resizable:true" closed="true">
   		<form action="">
			<table cellpadding="3" style="margin-left:50px;margin-top:40px;">
				<tr>
					<td>姓名：</td>
					<td><input id="name1" type="text" ></td>
				</tr>
				<tr style="margin-top:30px;">
					<td>电话号码：</td>
					<td><input id="tel1" type="text"></td>
				</tr>
				<tr>
					<td>管理员：</td>
					<td>
						<select class="easyui-combobox" id="ma1" style="width:135px;height:30px;">
							<option value="是">是</option>
							<option value="否">否</option>
						</select>
					</td>
				</tr>
				<!-- <tr>
					<td>管理员：</td>
					<td><input id="ma1"  type="text"></td>
				</tr> -->
			</table>
			<button type="button" id="save3" style="width:65%;margin-left:45px;margin-top:15px;" class="easyui-linkbutton">确认</button>
		</form>
   		
	</div>
	
	<div id="apbe" class="easyui-window" title="添加人员" style="width:320px;height:250px;"
    data-options="iconCls:'icon-add1',resizable:true" closed="true">
    	<div id="pan1" class="easyui-panel">
   		<form action="">
			<table cellpadding="3" style="margin-left:50px;margin-top:40px;">
				<tr>
					<td>姓名：</td>
					<td><input id="name2" type="text"></td>
				</tr>
				<tr>
					<td>电话号码：</td>
					<td><input id="tel2" type="text"></td>
				</tr>
				<tr>
					<td>管理员：</td>
					<td>
						<select class="easyui-combobox" id="ma2" style="width:135px;">
							<option value="是">是</option>
							<option value="否">否</option>
						</select>
					</td>
				</tr>
				
			</table>
			<button type="button" id="save4" style="width:65%;margin-left:45px;margin-top:15px;" class="easyui-linkbutton">确认</button>
		</form>
   		</div>
	</div>
	
	
	<div id="d3" class="easyui-dialog" title="转换组织" style="width:240px;height:150px;padding-left:30px;"
    data-options="iconCls:'icon-user-go',resizable:true" closed="true">
    	<br>
    	<div style="margin-top:15px;">
    		<input id="proBidSectionone" name="proBidSectionone" value="">
   		<!-- <input type="text" id="id3" size="24" maxlength="50" class="easyui-combobox" data-options="required:false,validType:'special'"/> -->
   		&nbsp;&nbsp;<button type="button" id="save5" class="easyui-linkbutton">确认</button>
    	</div>
    	
	</div>
	
	</div>
	<div id="content" region="center"style="padding:5px;width:680px;height:600px">
		<!-- <table id="t" class="easyui-datagrid" style="width:680px;height:250px;"
			 toolbar="#tb"
			title="人员" iconCls="icon-user"
			rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="itemid" width="120">姓名</th>
				<th field="productid" width="120">手机号码</th>
				<th field="listprice" width="120" align="right">管理员</th>
			</tr>	
		</thead>
		</table> -->
	<table id="dg" title="人员" rownumbers="true" pagination="true"  singleSelect="true">
	</table>
	<div id="tb1" style="display:none;">
		<a href="javascript:void(0)" id="ap" class="easyui-linkbutton" data-options="iconCls:'icon-add1',plain:true">添加</a>
		<a href="javascript:void(0)" id="ed" class="easyui-linkbutton" data-options="iconCls:'icon-pencil',plain:true">修改</a>
		<a href="javascript:void(0)" id="rem" class="easyui-linkbutton" data-options="iconCls:'icon-edit-clear',plain:true">转为历史人员</a>
		<a href="javascript:void(0)" id="change" class="easyui-linkbutton" data-options="iconCls:'icon-user-go',plain:true">转换组织</a>
	</div>
</div>
	</div>
	<script type="text/javascript">
	var treeId='<%=session.getAttribute("loginTreeId")%>';
    var UserId='<%=session.getAttribute("loginUserId")%>';
$(function(){
	$('#tt').tree({
	   url:'/zhdj/tree/recursiveTree'
	}); 
});
$(function(){
	$("#tt").tree({
	onClick:function(node){
		$('#dg').datagrid({
	    url:"/zhdj/user/selectByPage?treeId="+node.id+"&loginTreeId="+treeId,
	    iconCls:'icon-user',
	    toolbar: '#tb1',
	    columns:[[
	    	{field:'ck',checkbox:true},
	    	/* {field:'userId',title:'ID',width:25}, */
			{field:'userName',title:'姓名',width:200},
			{field:'tel',title:'手机号码',width:200},
			{field:'status',title:'管理员',width:200,align:'center'}
	    ]]
	});



	}
	})
})

$('#ap').on('click',function(){
	$('#apbe').window('open');
	
})

$('#save4').on('click',function(){
	var selected = $('#tt').tree('getSelected');
	/* alert(selected.id); */
	if(selected){
		if($('#name2').val()==null||$('#name2').val()=="")
			{$.messager.alert('提示','请填写姓名')}
		else if($('#tel2').val()==null||$('#tel2').val()=="")
		{$.messager.alert('提示','请填写手机号码')}
	
		else {$.ajax({
		url:"/zhdj/user/AddUser?treeId="+selected.id,
		dataType:"json",
		type:"post",
		data:{
			userName:$('#name2').val(),
			tel:$('#tel2').val(),
			status:$('#ma2').combobox('getValue'),
			userId:UserId
			
			
		},
		success:function(data){
			if(data.status==-1){
			/* alert("你可能无权修改非自己组织人员信息，如不是，请再尝试"); */
			$.messager.alert('提示','你可能无权修改非自己组织人员信息，如不是，请再尝试');
			$('#apbe').window('close');
		}else{
			
			/* alert(node.id); */
			alert("添加成功！");
			$('#dg').datagrid('reload');
			$('#pan1').panel('refresh');
			$('#apbe').window('close');
			/* $.off('click','#save4'); */
			//解除绑定事件
			/* $('#save4').unbind(); */
		}
		}
	});
		}
	}
});

$('#change').on('click',function(){
	var row = $('#dg').datagrid('getSelected');
	var selected = $('#tt').tree('getSelected');
	if(row){
		$.messager.confirm('提示', '是否转换组织？', function(r){
			if (r){
				$('#d3').dialog('open');
				$('#save5').on('click',function(){
					if($('#proBidSectionone').val()==null||$('#proBidSectionone').val()==""){
						alert("请输入组织的名称！");
					}
					else{
						$.ajax({
							url:"/zhdj/user/updateUser",
							dataType:'json',
							type:'post',
							data:{
								treeId:$('#proBidSectionone').val(),
								userId:row.userId,
								LoginId:UserId
							},
							success:function(data){
								if(data.status==-1){
								$.messager.alert('提示','你可能无权修改非自己组织人员信息，如不是，请再尝试');
							}else{
								$('#dg').datagrid('reload');
								$.messager.alert('提示','转换组织成功！');
								$('#d3').window('close');
								
							}
							}
						});
					};
				});
			}
		});
	}
})

$(function(){
					$("#proBidSectionone").on('input',function(){
						/* var t=this.value; */
						$("#proBidSectionone").combobox({
					      valueField: 'id',  
					      textField: 'text',
					      url:'/zhdj/tree/FindTreeByName',
					      mode: 'remote', //从服务器加载就设置为‘remote‘
					      hasDownArrow: false,  //为true时显示下拉选项图标
					      onBeforeLoad: function (parm) {  //在请求加载数据之前触发，返回 false 则取消加载动作         
					      var  value = $(this).combobox('getValue');
					      if (value) {  
					           
					            parm.treeName = value;
					            parm.paramType = 5;
					            return true;  
					       }  
					          return false;  
					       },
					       onSelect: function(row){    //当用户选择一个列表项时触发。
					            //这样赋值便于取值（否则该字段为空）
					            document.getElementById("proBidSectionone").value= row.id;
					        }
					  })

					})
						
				})



$('#ed').on('click',function(){
	var row = $('#dg').datagrid('getSelected');
	if(row){
		$('#edbe').window('open');
		$("#name1").val(row.userName);  
        $("#tel1").val(row.tel);     
        $("#ma1").combobox('setValue',row.status);
        $('#save3').on('click',function(){
        	$.ajax({
        		url:"/zhdj/user/updateUser?userId="+row.userId+"&LoginId="+UserId,
        		dataType:"json",
				type:"post",
				data:{
				userName:$('#name1').val(),
				tel:$('#tel1').val(),
				status:$("#ma1").combobox('getValue')
				},
				success:function(data){
					if(data.status==-1){
						$.messager.alert('提示','你可能无权修改非自己组织人员信息，如不是，请再尝试');
						$('#save3').unbind();
					}
					else{
					$('#dg').datagrid('reload');
					alert("修改成功！");
					$('#edbe').window('close');
					$('#save3').unbind();
				}
				}
        	});
        });
	};
});

$('#rem').on('click',function(){
	var row = $('#dg').datagrid('getSelected');
	if(row){
		$.messager.confirm('提示','是否转为历史人员?',function(r){
			if(r){
				$.ajax({
                     url : "/zhdj/user/makeHistory",
                     dataType : "json",
                     type:"post",
                     data:{
                      	userId:row.userId,
                      	history:"1",
                      	LoginId:UserId
                      	
                      },
                      success : function(data) {
                     	 if(data.status==-1){
  							$.messager.alert('提示','你可能无权修改非自己组织人员信息，如不是，请再尝试');
  						}else{
                          alert("转为历史人员成功！");
                          $('#dg').datagrid('reload');
                         
                      }
                      }
                  });
			};
		});
	};
});
	




$('#tt').tree({
	onContextMenu: function(e, node){
		e.preventDefault();
		$('#tt').tree('select', node.target);
		$('#mm').menu('show', {
			left: e.pageX,
			top: e.pageY
		});
			}
		});
	
$("#save1").click(function(){
	var selected = $('#tt').tree('getSelected');
	//var father = $('#tt').tree("getParent",selected.target);
   	if($("#id1").val()==""){
		alert("信息不能为空！")
	} else{
		$.ajax({
			url:"/zhdj/tree/add",
			data:{
				text:$("#id1").val(),
				pid:selected.id,
				//id:selected.id
			},
			type:"post",
			datatype:"json",
			success:function(data){
				alert(data.status);
				//delete father.id;
				$('#tt').tree("reload");
			}
		})
		$('#d1').window('close');
	}
})

function append(){
	var selected = $('#tt').tree('getSelected');
	var father = $('#tt').tree("getParent",selected.target);
	if(selected){
       	$('#d1').window('open'); 
       }
}
	
function edit(){
		var selected = $('#tt').tree('getSelected');
		var father = $('#tt').tree("getParent",selected.target);
		$('#d2').window('open');
		$("#save2").click(function(){
        	if($("#id2").val()==""){
			alert("信息不能为空！")
		}
		else{
			$.ajax({
				url:"/zhdj/tree/updated",
				data:{
					text:$("#id2").val(),
					pid:father.id,
					id:selected.id
				},
				type:"post",
				datatype:"json",
				success:function(data){
					alert(data.status);
					$('#tt').tree("reload");
				}
			})
			$('#d2').window('close');
			//alert($("iframe[title='组织与机构']").get(0));
			/* win = parent.$("iframe[title='组织与机构']").get(0).contentWindow;
			win.location.reload(); */
			//window.location.reload();
		}
        })
	}
	
function remove() {
	    var rows = $('#tt').tree('getSelected');
        $.messager.confirm('提示','是否确认删除？',function(r){
        	if(r){
        		$.ajax({
                     url : "/zhdj/tree/delete?cid=" + rows.id,
                     dataType : "json",
                     type:"post",
                     success : function(data) {
                         alert("删除成功");
                         $('#tt').tree("reload");
                     }
                 });
        		}
        	});
         }
 </script>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.insdep-extend.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>

</html>

  

	

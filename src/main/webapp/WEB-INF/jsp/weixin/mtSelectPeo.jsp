<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="组织成员">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
  	<meta content="telephone=no" name="format-detection" />
  	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/lib/weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/jquery-weui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/demos/css/demos.css">
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<style type="text/css">
		 table{  
            table-layout: fixed;/*只有定义表格的算法为fixed,th才有效果*/  
            border-collapse: collapse;/*边框合并模式*/  
        }  
        table tr td{  
            overflow:hidden;/*超出的文字隐藏*/  
            text-overflow:ellipsis;/*文字超出后,显示省略号*/  
            width:100%;
            white-space:nowrap;/*文字不换行*/  
            word-break:keep-all;/*文字不换行*/  
        }
        .selbtn{
        	z-index:9999;
        }  
	</style>
</head>
<body ontouchstart>
	<header data-am-widget="header"
          class="am-header am-header-default" style="height: 50px;">
      <div class="am-header-left am-header-nav">
          <a href="${pageContext.request.contextPath}/base/goURL/weixin/ogList" class="">

              <img class="am-header-icon-custom" src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;" alt=""/>
          </a>
      </div>

      <h1 class="am-header-title" style="font-size: 1.2em">
          组织成员
      </h1>
  </header>

  	<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
	    <h2 class="am-titlebar-title " style="font-size: 1.1em">
	        成员列表
	    </h2>

	    <nav class="am-titlebar-nav">
	        <button id="view" type="button" class="am-btn am-btn-success am-radius am-btn-xs" style="margin-bottom:10px;">查看已选</button>
	        <button id="allsel" type="button" class="am-btn am-btn-warning am-radius am-btn-xs" style="margin-bottom:10px;">全选</button>
	        <button id="clear" type="button" class="am-btn am-btn-danger am-radius am-btn-xs" style="margin-bottom:10px;">清空</button>
	        <input type="hidden" id="selPeo">
	        <input type="hidden" id="ids">
	    </nav>
   </div>

   <div data-am-widget="tabs"
       class="am-tabs am-tabs-default">
      <ul class="am-tabs-nav am-cf">
          <li class="am-active" id="tab1">
          <a href="javascript:void(0)" >成员列表</a>
          </li>
          
          
         
      </ul>
      <div class="am-tabs-bd">
          <div data-tab-panel-0 class="am-tab-panel panel1 am-active">
          		<div class="am-g" style="margin-left: 10px;">
          			<div class="am-u-sm-2" style="padding-left: 0px;padding-right: 0px;">
          				<img src="${pageContext.request.contextPath}/images/shuji.png" width="15"><span style="font-size: 1px;position: relative;">书记</span>
          			</div>
          			<div class="am-u-sm-4" style="padding-left: 0px;position: relative;right: 0px;">
          				<img src="${pageContext.request.contextPath}/images/mg3.png" width="11"><span style="font-size: 2px;">流动党员管理员</span>
          			</div>
          			<div class="am-u-sm-3" style="padding-left: 0px;position: relative;left: 7px;">
          				<img src="${pageContext.request.contextPath}/images/gl.png" width="11"><span style="font-size: 4px;">管理员</span>
          			</div>
          			<div class="am-u-sm-3" style="padding-left: 0px;">
          				<img src="${pageContext.request.contextPath}/images/mg4.png" width="12"><span style="font-size: 5px;">普通党员</span>
          			</div>
          		</div>
            	<table class="am-table  am-table-hover table-main">
	  				<thead>
	  					<tr>
	  						<td align="center">姓名</td>
	  						<td align="center">手机号码</td>
	  						<td align="center">操作</td>
	  					</tr>
	  				</thead>
	  				<tbody id="tbody1">
	  					
	  				</tbody>
  				</table>
  				<div id="pagenow"></div>
          </div>
          
          
      </div>
  </div>


	<div class="am-modal am-modal-prompt" tabindex="-1" id="havemodel">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">已选择成员</div>
		    <div class="am-modal-bd">
		      	<form class="am-form">
					<div class="am-form-group">
						<textarea id="selName" class="" rows="5" readonly></textarea>
					</div>
				</form>
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel id="cancl">取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm onclick="confirm()">确认选择</span>
		    </div>
		  </div>
	</div>


	<div class="am-modal am-modal-prompt" tabindex="-1" id="allmodel">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否选择全部人员？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel onclick="$('#allmodel').modal('close')">取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm onclick="confirmall()">确定</span>
		    </div>
		  </div>
	</div>
	
	<div class="am-modal am-modal-prompt" tabindex="-1" id="delmodel">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">提示</div>
		    <div class="am-modal-bd">
		      	是否清空已选择人员？
		    </div>
		    <div class="am-modal-footer">
		      <span class="am-modal-btn" data-am-modal-cancel onclick="$('#delmodel').modal('close')">取消</span>
		      <span class="am-modal-btn" data-am-modal-confirm onclick="confirmdel()">确定</span>
		    </div>
		  </div>
	</div>

	

  	<script src="${pageContext.request.contextPath}/dist/lib/jquery-2.1.4.js"></script>
	<script src="${pageContext.request.contextPath}/dist/lib/fastclick.js"></script>
	<script>
	
	
	
	var treeId=<%=request.getParameter("id")%>;
	var loginTreeId=<%=session.getAttribute("RelUserTreeId")%>; 
	
	
	
	
	  $(function() {
	    FastClick.attach(document.body);
	  });
	  //解决自适应问题
       var phoneWidth = parseInt(window.screen.width);
       var phoneScale = phoneWidth/365;
       var ua = navigator.userAgent;
       if (/Android (\d+\.\d+)/.test(ua)){
         var version = parseFloat(RegExp.$1);
         if(version>2.3){
           document.write('<meta name="viewport" content="width=365, minimum-scale = '+phoneScale+', maximum-scale = '+phoneScale+', target-densitydpi=device-dpi">');
         }else{
           document.write('<meta name="viewport" content="width=365, target-densitydpi=device-dpi">');
         }
       } else {
         document.write('<meta name="viewport" content="width=365, user-scalable=no, target-densitydpi=device-dpi">');
       }
	</script>
	<script src="${pageContext.request.contextPath}/dist/js/jquery-weui.js"></script>
	<script type="text/javascript">
	
	
	
	</script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.page.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script>
	<script type="text/javascript">	
	<%-- if(<%=request.getParameter("page1")%>==null){
		$.cookie("selPeo","",{path:"/"});
		$.cookie("ids", "",{path:"/"});
	} --%>
	/* var ogName;
	var names=$.cookie("names"); */
	<%-- var ogName=decodeURI('<%=request.getParameter("ogName")%>');
	alert(ogName); --%>
	
	/* (function ($) {
          $.getUrlParam = function (name) {
              var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
              var r = window.location.search.substr(1).match(reg);
              if (r != null) return decodeURI(r[2]); return null;
          }
      })(jQuery); */
    
   /* 	var ogName = $.getUrlParam('ogName');
    var ogNames=new Array(); */
    var ogUsers=new Array();
    var Ids=new Array();
    var oArray=new Array();
    var IdsArray=new Array();
    oArray=$.cookie("ogUsers");
    IdsArray=$.cookie("Ids");
    for(i in oArray)
    	ogUsers.push(oArray[i])
    for(i in IdsArray)
    	Ids.push(IdsArray[i])
        	
	function getSelected(){					//从cookie中获得已经被选中人员设置被点中
		$(".selbtn").each(function(){
		for(i in Ids){
			if($(this).nextAll().eq(0).val()==Ids[i]){
				$(this).removeClass("am-btn-primary");
				$(this).addClass("am-btn-success");
				break;
			}	
		}
	})
	}
	
		
	var page1=<%=request.getParameter("page1")%>;
	var page2=<%=request.getParameter("page2")%>;
	var pages1;
	var pages2;
	var n='';
	var i='';
	var a=[];
	if(page2>=1&&page1==null){
		page1=1;
		$(".panel1").removeClass("am-active");
		$("#tab1").removeClass("am-active");
		$(".panel2").addClass("am-active");
		$("#tab2").addClass("am-active");
		showUser();
		
	}else if(page1>=1&&page2==null){
		page2=1;
		$(".panel2").removeClass("am-active");
		$("#tab2").removeClass("am-active");
		$(".panel1").addClass("am-active");
		$("#tab1").addClass("am-active");
		showUser();
		
	}else{
		page1=1;
		page2=1;
		showUser();
		
	}
	
	//进入该页面时自动判断cookie有无被选中的成员，有则赋给查看已选
	$('#selPeo').val($.cookie("selPeo"));
	$('#ids').val($.cookie("ids"));
	//进入该页面时将在cookie里被选中的人员的的操作被选中

	
	$(".selbtn").each(function(){
		var sp=$('#selPeo').val().split(",");
		for(var i;i<sp.length;i++){
			if($(this).nextAll().eq(1).val()==sp[i]){
				$(this).removeClass("am-btn-primary");
				$(this).addClass("am-btn-success");
				break;
			}	
		}
	})
				
	$(document).on("click",".selbtn",function(){
		if($(this).hasClass("am-btn-primary")){
			$(this).removeClass("am-btn-primary");
			$(this).addClass("am-btn-success");
		}
		else if($(this).hasClass("am-btn-success")){
			$(this).removeClass("am-btn-success");
			$(this).addClass("am-btn-primary");
			var sp=$('#selPeo').val().split(",");
			var str='';
			for(var i=0;i<sp.length-1;i++){
				if(sp[i]!=$(this).nextAll().eq(1).val())
					str=str+sp[i]+",";
			}
			var idArray=$('#ids').val().split(",");
			var str1="";
			for(var i=0;i<idArray.length-1;i++){
				if(idArray[i]!=$(this).next().val())
					str1=str1+idArray[i]+",";
			}
			$('#selPeo').val(str);
			$('#ids').val(str1);
		}
	})
	
	//查看已选择人员
	$(function() {
	  $(document).on("click","#view",function(){
	  	var has=false;
	  	$('.selbtn').each(function(){
			if($(this).hasClass("am-btn-success"))
			{
				has=false;
				var id=$(this).next().val();
				var name=$(this).nextAll().eq(1).val();
				var selPeo=$('#selPeo').val();
				var sp=selPeo.split(",");
				var ids=$('#ids').val();
				if($('#selPeo').val()=="null"){
					$('#selPeo').val(selPeo+name+',');
					$('#ids').val(ids+id+',');
				}else{
					for(var i=0;i<sp.length-1;i++){
						if(sp[i]==name){
							has=true;
							break;
						}
					}
					if(!has){
						$('#selPeo').val(selPeo+name+',');
						$('#ids').val(ids+id+',');
					}
				} 
			}
		})
			
	  		var str=$('#selPeo').val();
			var str=str.substring(0,str.length-1); //去掉后面的逗号
			/* var t=s.ToString().RTrim(','); */
			$('#selName').val(str);
			/* var str1=$('#ids').val();
			var str1=str1.substring(0,str1.length-1); //去掉后面的逗号
			
			$('#ids').val(str1); */
		    $('#havemodel').modal();
		    
		  });
	});
	
	function removeComma(str){					//判断字符串最后有无逗号，有则去掉		
		var strs=new Array();
		strs=str.split(",");
		if(strs[strs.length-1]=="")
			str=str.substring(0,str.length-1);
		return str;
	}
	
	//提交选择
	function confirm(){
		var selName=$('#selName').val();
		var ids=$('#ids').val();
		
		var selNames=new Array();
		selNamesArray=removeComma(selName).split(",");
		idsArray=removeComma(ids).split(",");
		for(i in idsArray){
			var has=false;
			for(j in Ids){
				if(idsArray[i]==Ids[j]){
					has=true;
					break;
				}
			}
			if(!has){
				Ids.push(idsArray[i]);
				Ids.push("、");
			}
				
		}
		
		for(i in selNamesArray){
			ogUsers.push(selNamesArray[i]);
			ogUsers.push("、");
		}
		$.cookie("ogUsers",ogUsers);
		$.cookie("Ids",Ids);
		location.href="${pageContext.request.contextPath}/base/goURL/weixin/ogList";
	}
	//清空选择
	$('#clear').on('click',function(){
		$('#delmodel').modal();
	})
	function confirmdel(){
		$('#selPeo').val("");
		$('#ids').val("");
		if($('.selbtn').hasClass('am-btn-success'))
		{
			$('.selbtn').removeClass('am-btn-success');
			$('.selbtn').addClass('am-btn-primary')
		}
	}
		
	
	function createNode1(nodeData){
		var $newTr=$("<tr></tr>");
		var $newTd1=$("<td align='center' style='padding-bottom: 0px;'></td>");
		var $newTd2=$("<td align='center'></td>");
		var $newTd3=$("<td align='center'></td>");
		var $newImg;
		if(nodeData.roleId==1)
		$newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/shuji.png' style='margin-bottom: 5px;'>");
		else if(nodeData.roleId==2)
		$newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/gl.png' style='margin-bottom: 5px;'>");
		else if(nodeData.roleId==3)
		$newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/mg4.png' style='margin-bottom: 5px;'>");
		else if(nodeData.roleId==5)
		$newImg=$("<img width='20' src='${pageContext.request.contextPath}/images/mg3.png' style='margin-bottom: 5px;'>");
		var $newSpan=$("<span>"+nodeData.userName+"</span>");
		var $newH3=$("<h3>"+nodeData.tel+"</h3>");
		var $newId=$("<input type='hidden' value='"+nodeData.userId+"'>");
		var $newName=$("<input type='hidden' value='"+nodeData.userName+"'>");
		var $newButton=$("<button type='button' class='am-btn am-btn-primary am-radius selbtn' style='width:80px;height: 32px;line-height:0px;'>选择</button>");
		$newTd1.append($newImg);
		$newTd1.append($newSpan);
		$newTd2.append($newH3);
		$newTd3.append($newButton);
		$newTd3.append($newId);
		$newTd3.append($newName);
		$newTr.append($newTd1);
		$newTr.append($newTd2);
		$newTr.append($newTd3);
		$("#tbody1").append($newTr);
		
	}
	
	//全部选择
	$(document).on('click','#allsel',function(){
		
		$('#allmodel').modal();
	})
	var str2="";
	var str3="";
	function allname(Data){
		str2+=Data.userId+',';
		str3+=Data.userName+',';
	}
	function confirmall(){
		/* var idArray=$('#ids').val().spilt(",");
		alert(idArray) */
		var has=false;
		
		$.ajax({
			dataType:"JSON",
			data:{
				treeId:treeId,
			},
			url:"${pageContext.request.contextPath}/User/SelectByPage",
			type:"POST",
			success:function(data){
				for(var i=0;i<data.rows.length;i++){
					var selPeo=$('#selName').val();
					
					var ids=$('#ids').val();
					if($('#selName').val()==""){
						allname(data.rows[i]);
					}else{
						var sp=selPeo.split(",");
						for(var j=0;j<sp.length-1;j++){
							if(sp[j]==data.rows[i].userName){
								has=true;
								break;
							}
						}
						if(!has){
							allname(data.rows[i]);
						}
					} 
				}
				$('#ids').val(str2);
				$('#selName').val(str3);
				$('#havemodel').modal();
			}
		})
	}
	
	
	
	function showUser(){
		$.ajax({
		url:"${pageContext.request.contextPath}/User/SelectByPage",
		dataType:"JSON",
		type:"POST",
		data:{
			treeId:treeId,
			rows:10,
			page:page1
		},
		success:function(data){
			for(var i=0;i<data.rows.length;i++){
				createNode1(data.rows[i]);
			}
			getSelected();
			if(page1==null){
				page1=1;
			}
			pages1=data.total/10+1;
			$("#pagenow").page({
			pages:pages1,
			curr:page1,
			theme:'secondary',
			first:"首页",
			prev:"<",
			next:">",
			groups:3,
			jump:function(context,first){
				if(!first){
					for(var i=0;i<data.rows.length;i++){
					allname(data.rows[i]);
				}
					var has=false;
				  	$('.selbtn').each(function(){
						if($(this).hasClass("am-btn-success"))
						{
							has=false;
							var id=$(this).next().val();
							var name=$(this).nextAll().eq(1).val();
							var selPeo=$('#selPeo').val();
							var sp=selPeo.split("、");
							var ids=$('#ids').val();
							if($('#selPeo').val()=="null"){
								$('#selPeo').val(selPeo+name+',');
								$('#ids').val(ids+id+',');
							}else{
								for(var i=0;i<sp.length-1;i++){
									if(sp[i]==name){
										has=true;
										break;
									}
								}
								if(!has){
									$('#selPeo').val(selPeo+name+',');
									$('#ids').val(ids+id+',');
								}
							} 
						}
						})
								
				  		var str=$('#selPeo').val();
						var str=str.substring(0,str.length-1); //去掉后面的逗号
						/* var t=s.ToString().RTrim(','); */
						$('#selName').val(str);
					
					
					$.cookie("selPeo", $('#selPeo').val(),{ path: "/"});
					$.cookie("ids", $('#ids').val(),{ path: "/"}); 
					location.href="${pageContext.request.contextPath}/base/goURL/weixin/mtSelectPeo?id="+treeId+"&page1="+context.option.curr+"&rows=10";
				}
			}
			})
			$(".selbtn").each(function(){
				var sp=$('#selPeo').val().split(",");
					for(var i=0;i<sp.length;i++){
						if($(this).nextAll().eq(1).val()==sp[i]){
							$(this).removeClass("am-btn-primary");
							$(this).addClass("am-btn-success");
							break;
						}	
					}
				})
			
		}
	})
	}
				
	</script>

	<center><div>粤icp备09004280号</div></center>
</body>
</html>
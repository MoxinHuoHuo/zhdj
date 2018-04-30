<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="description" content="会议详情">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css" />
<style type="text/css">
a {
	font-size: 20px;
}


.ogSelect option {
	width: 15%;
}

.ogBtn {
	position: absolute;
	padding: 4px 9px;
}

.select {
	background-color: rgba(0, 0, 0, 0.1);
}
.am-figure-default{
}
.newsContent{
	display: flex;
	display: -webkit-flex;
	align-items: stretch;
}
.newsImg{
	width:55%;
}
.newsHref{
	font-size:16px;
	width:65%;
	padding:8px 5px;
}
.select{
	background-color: rgba(0, 0, 0, 0.1) !important;
}
.upload {
	width: 60%;
	line-height: 20px;
	position: absolute;
	left:0;
	right:0;
	margin:0 auto;
	cursor: pointer;
	overflow: hidden;
	display: inline-block;
	*display: inline;
	*zoom: 1;
}
.upload  input {
	position: absolute;
	right: 0;
	top: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	height:75px;
}
.photoList{
	width:134px;
	height:100px;
}
</style>
</head>
<body>
	<header data-am-widget="header" class="am-header am-header-default">
	<div class="am-header-left am-header-nav" style="height:100%">
		<a href="javascript:history.back(-1)"><img class="am-header-icon-custom"
			src="data:image/svg+xml;charset&#x3D;utf-8,&lt;svg xmlns&#x3D;&quot;http://www.w3.org/2000/svg&quot; viewBox&#x3D;&quot;0 0 12 20&quot;&gt;&lt;path d&#x3D;&quot;M10,0l2,2l-8,8l8,8l-2,2L0,10L10,0z&quot; fill&#x3D;&quot;%23fff&quot;/&gt;&lt;/svg&gt;"
			alt="" style="margin-top:17px;">
		</a>
	</div>

	<h1 class="am-header-title">新闻管理</h1>
	</header>

	<div class="am-g" style="margin: 10px 0 0 5px;"> 
		<a href="javascript:void(0)" class="am-btn am-btn-warning ogBtn" style="right: 7%;"
			onclick="news.showEditModal()">编辑</a> 
	</div>
	<div class="am-g" style="margin-top:40px;">
		<div class="am-u-lg-8 am-u-sm-centered" style="padding: 0;width:100%">
			
			<ul class="am-list">
			  <li class="newsLi">
			  	<input type="hidden" class="newsId">
			  	<div class="newsContent">
			  		<div class="newsImg">
						<figure data-am-widget="figure" class="am am-figure am-figure-default" data-am-figure="{  pureview: 'true' }" >
		      				<img src="${pageContext.request.contextPath}/assets/i/zhanwei.png;" data-rel="assets/i/zhanwei.png" class="newsImg1"/>  							           
		  				</figure>
	  				</div>
	  				<div class="newsHref">
	  					<b>新闻链接：</b><span class="newsHref">http://s.amazeui.org/media/i/demos/pure-1.jpg?imageView2/0/w/640</span>
	  				</div>
  				</div>
			  </li>
			  <li class="newsLi">
			  	<input type="hidden" class="newsId">
			  	<div class="newsContent">
			  		<div class="newsImg">
						<figure data-am-widget="figure" class="am am-figure am-figure-default" data-am-figure="{  pureview: 'true' }" >
		      				<img src="${pageContext.request.contextPath}/assets/i/zhanwei.png;" data-rel="assets/i/zhanwei.png" class="newsImg1"/>  							           
		  				</figure>
	  				</div>
	  				<div class="newsHref">
	  					<b>新闻链接：</b><span class="newsHref">http://s.amazeui.org/media/i/demos/pure-1.jpg?imageView2/0/w/640</span>
	  				</div>
  				</div>
			  </li>
			  <li class="newsLi">
			  	<input type="hidden" class="newsId">
			  	<div class="newsContent">
			  		<div class="newsImg">
						<figure data-am-widget="figure" class="am am-figure am-figure-default" data-am-figure="{  pureview: 'true' }" >
		      				<img src="${pageContext.request.contextPath}/assets/i/zhanwei.png;" data-rel="assets/i/zhanwei.png" class="newsImg1"/>  							           
		  				</figure>
	  				</div>
	  				<div class="newsHref">
	  					<b>新闻链接：</b><span class="newsHref">http://s.amazeui.org/media/i/demos/pure-1.jpg?imageView2/0/w/640</span>
	  				</div>
  				</div>
			  </li>
			  <li class="newsLi">
			  	<input type="hidden" class="newsId">
			  	<div class="newsContent">
			  		<div class="newsImg">
						<figure data-am-widget="figure" class="am am-figure am-figure-default" data-am-figure="{  pureview: 'true' }" >
		      				<img src="${pageContext.request.contextPath}/assets/i/zhanwei.png;" data-rel="assets/i/zhanwei.png" class="newsImg1"/>  							           
		  				</figure>
	  				</div>
	  				<div class="newsHref">
	  					<b>新闻链接：</b><span class="newsHref">http://s.amazeui.org/media/i/demos/pure-1.jpg?imageView2/0/w/640</span>
	  				</div>
  				</div>
			  </li>
			  <li class="newsLi">
			  	<input type="hidden" class="newsId">
			  	<div class="newsContent">
			  		<div class="newsImg">
						<figure data-am-widget="figure" class="am am-figure am-figure-default" data-am-figure="{  pureview: 'true' }" >
		      				<img src="${pageContext.request.contextPath}/assets/i/zhanwei.png;" data-rel="assets/i/zhanwei.png" class="newsImg1"/>  							           
		  				</figure>
	  				</div>
	  				<div class="newsHref">
	  					<b>新闻链接：</b><span class="newsHref">http://s.amazeui.org/media/i/demos/pure-1.jpg?imageView2/0/w/640</span>
	  				</div>
  				</div>
			  </li>
			</ul>
		</div>
	</div>


	<div class="am-modal am-modal-prompt" tabindex="-1" id="editModal">
		<div class="am-modal-dialog" style="width:100%;">
			<div class="am-modal-hd">请填写新闻链接与上传图片：</div>
			<div class="am-modal-bd" style="font-size:16px;height:150px;">
				<div class="upload am-form-file am-fr am-u-sm-12">
					<form id="editForm">
						<input type="file" name="Mrequest" class="imgUpload" id="comImg">
						<img class="photoList am-thumbnail"
							src='${pageContext.request.contextPath}/assets/i/zhanwei.png'
							accept='image/*' style="margin:0"/>
						</div><br><br><br><br>
						<input type="text" class="am-modal-prompt-input" name="href"
						style="margin-top:15px;margin-left: 5%;margin-right:5%;width:90%;z-index:9999;" id="href" placeholder="请填写链接"/>
					</form>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm onclick="news.edit()">提交</span>
			</div>
		</div>
	</div>

	<footer data-am-widget="footer" class="am-footer am-footer-default"
		data-am-footer="{  }" style="margin-top: 30px;">
	<div class="am-footer-miscs ">

		<p>CopyRight©2018</p>
		<p>Reserved huizhouxueyuan development team</p>
	</div>
		<center><div>粤icp备09004280号</div></center>
	</footer>


	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/ajaxfileupload.js"></script>
	<script type="text/javascript">
		var news={
			show:function(){						//从后台获取三条新闻的数据，显示
				$.ajax({
					url:"${pageContext.request.contextPath}/News/ListUI",
					dataType:"JSON",
					type:"POST",
					data:{
					},
					success:function(data){
						for(var i=0;i<data.rows.length;i++){
							if(data.rows[i].imgs!=null){
								$(".newsImg1").eq(i).attr("src","/zhdj/News/listUI/pic/"+data.rows[i].imgs);
								$(".newsImg1").eq(i).attr("data-rel","/zhdj/News/listUI/pic/"+data.rows[i].imgs);
								
							}
								
							if(data.rows[i].newHref!=null)
								$(".newsHref").eq(i).html(data.rows[i].newHref);
							$(".newsId").eq(i).val(data.rows[i].newId);
						}
					}
				})
			},
			edit:function(){
				var fd = new FormData($("#editForm")[0]);
				fd.append("newsId",$(".select").children().eq(0).val());
				$.ajax({
					url: "${pageContext.request.contextPath}/News/UpdateNews",
					type: "POST",
					data: fd,
					dataType : "json",
					processData: false,  // 告诉jQuery不要去处理发送的数据
					contentType: false,  // 告诉jQuery不要去设置Content-Type请求头
					success:function(data){
						alert(data.message);
						if(data.status==1){
							location.reload();
						}
						}
				});
			},
			set:function(){							//设置事件
				$(".newsLi").click(function(){								
					$(".newsLi").each(function(){
						if($(this).hasClass("select"))
							$(this).removeClass("select");
					})
					$(this).addClass("select");
				})
				$(".imgUpload").each(function(){			
					$(this).change(function() {
						var fr = new FileReader();
						newfile = this.files[0];
						mythis = $(this);
						if(newfile.size/1024/1024>4){
							alert("该图片大小应在4M以内");
						}
						else{
							fr.readAsDataURL(newfile);
							fr.onload = function(e) {
								mythis.next().attr("src", this.result);
							}
						}
					})
				})
			},
			showEditModal:function(){
				if(!$("li").hasClass("select"))
					alert("请选择要编辑的新闻");
				else{
					$("#editModal").modal();
				}
				
			}
		}
		news.show();
		news.set();
		
		
		
	
  </script>
</body>
</html>

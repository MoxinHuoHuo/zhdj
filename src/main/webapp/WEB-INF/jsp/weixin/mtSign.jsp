<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta http-equiv="description" content="登录界面">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone=no">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}assets/i/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
	<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
	<script src="http://webapi.amap.com/maps?v=1.4.4&key=37e179146bcffe4c4dd8a17c14ac1203&plugin=AMap.Geolocation,AMap.CitySearch,AMap.LngLat"></script>
	<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
	<style type="text/css">
		#sp1{background:  #F4F4F4;}
	</style>
</head>
<body>
	<div  data-am-widget="intro"
       class="am-intro am-cf am-intro-default">
      <div class="am-intro-hd" style="background-color:#3080ee;">
        <center><h2 class="am-intro-title">会议签到</h2></center>
      </div>
  	</div>
  	<div style="margin-top: 20px;"><center><img style="width: 90px;" src="${pageContext.request.contextPath}/images/main.png"></center></div>
  	<div style="margin-top: 6px;"><center><h5 style="color: #F72100;font-size: 25px;"><strong>智慧党建</strong></h5></center></div>

  	<div class="am-g">
  		<div class="am-u-lg-4 am-u-md-8 am-u-sm-centered" style="margin-top: 30px;">
  			<form method="post" class="am-form">
	        <div class="am-form-group">
		        <div class="am-input-group">
				    <span id="sp1" class="am-input-group-label"><center><img style="width: 28px;padding-bottom:3px;" src="${pageContext.request.contextPath}/images/login2.png" class="am-icon-fw"></center></span>
				    <input id="account" type="text" onkeyup="value=value.replace(/[^\d]/g,'')" class="am-form-field" placeholder="请输入手机号码">
			    </div>
	        </div>
	        
	        <div class="am-cf">
		        <input style="background:#3080ee;font: #F4F4F4;" id="lg" type="button" name="" value="签到"  class="am-btn  am-btn-xl am-fl am-u-sm-12 am-radius am-btn-primary">
	        </div>
	    </form>
  		</div>
  	</div>
  	<footer data-am-widget="footer" class="am-footer am-footer-default" data-am-footer="{  }" style="margin-top: 30px;">
	  	<div class="am-footer-miscs ">

	        <p>CopyRight©2018</p>
	        <p>Reserved huizhouxueyuan development team</p>
	    </div>
	</footer>
	<div id="container" tabindex="0" style="display:none;"></div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
	var uuid="<%=request.getParameter("uuid")%>";
	var lng;
	var lat;
	var lnglat;
map = new AMap.Map('container');
map.plugin('AMap.Geolocation', function () {
    geolocation = new AMap.Geolocation({
        enableHighAccuracy: true,//是否使用高精度定位，默认:true
        maximumAge: 0,           //定位结果缓存0毫秒，默认：0
        convert: false,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
        showButton: false,        //显示定位按钮，默认：true
        buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
        showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
        showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
        panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
        zoomToAccuracy:true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
    });
    map.addControl(geolocation);
    geolocation.getCurrentPosition(function(status,result){
    	lnglat=result.position;
    	lng=lnglat.getLng( );
    	lat=lnglat.getLat( );
    	
    });
});
$('#lg').on('click', function() {
   	if($("#account").val()==null||$("#account").val()==""){
   		alert("手机号不能为空!")
   	}else if(lng==undefined||lat==undefined){
   		alert("定位中，请稍候。");
   	}
   	else{
   		
   		$.ajax({
			url:"${pageContext.request.contextPath}/meeting/sign",
			type:'GET',
			data:{
				signPeoplePhone:$('#account').val(),
				uuid:uuid,
				lng:lng,
				lat:lat
			},
			dataType:'json',
			success:function(data){
				alert(data.message);
			}
		});
   	}
   	});

</script>
</body>
</html>

<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
 <head>
<base href='<%=basePath%>'>
<title>发布会议</title>
<meta charset='utf-8'>
<meta http-equiv="description" content="会议发布">
<meta http-equiv='pragma' content='no-cache'>
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='keywords' content='keyword1,keyword2,keyword3'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no'>
<meta name='apple-mobile-web-app-capable' content='yes' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta name='format-detection' content='telephone=no'>
<meta name='renderer' content='webkit'>
<meta http-equiv='Cache-Control' content='no-siteapp' />
<link rel='alternate icon' type='image/png' href='${pageContext.request.contextPath}assets/i/favicon.png'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/assets/css/amazeui.min.css' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.datetimepicker-se.min.css" />
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
<script src="http://webapi.amap.com/maps?v=1.4.4&key=37e179146bcffe4c4dd8a17c14ac1203&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<style>
#myPageTop{
left:0;
right:0;
}
</style>
</head>
<body>
	
	<div id="container"></div>
	<div id="myPageTop">
	    <table style="width:100%;">
	        <tr>
	        	<td style="text-align:right;">
	                <label style="margin-right:0">当前位置：</label>
	            </td>
	            <td style="padding-right:10px;">
	                <input id="location" style="border-radius:5px;height:35px;width:100%;"/>
	            </td>
	            <td>
	                <a style="border-radius:5px;height:35px;" class="am-btn am-btn-secondary select"/>
	                	<input type="hidden" id="lng">
	                	<input type="hidden" id="lat">                         
	                                         选中</a>
	            </td>
	        </tr>
	    </table>
	</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment-with-locales.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/amazeui.datetimepicker-se.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.cookie.js"></script> 
<script type="text/javascript">
	$.cookie('lng',null,{expires:-1});
	$.cookie('lat',null,{expires:-1});
	$.cookie('location',null,{expires:-1});
	var map = new AMap.Map('container', {				//建立地图图层
	    resizeEnable: true,
	    zoom:11,
 	 });
     map.plugin(['AMap.ToolBar'], function() {
        //设置地位标记为自定义标记
        var toolBar = new AMap.ToolBar();
        map.addControl(toolBar);
    });
    var marker;
    map.on('click', function(e) {					//设置点击事件
    	if (marker) {
            marker.setMap(null);
            marker = null;
        }
        var l=new Array(e.lnglat.getLng(),e.lnglat.getLat());
    	addMarker({x:e.lnglat.getLng(),y:e.lnglat.getLat()});			//在地图加上点标记
    	var geocoder = new AMap.Geocoder({
            radius: 1000,
            extensions: "all"
        });        
        geocoder.getAddress(l, function(status, result) {				//把当前位置放置当前位input框
            if (status === 'complete' && result.info === 'OK') {
                $("#location").val(result.regeocode.formattedAddress);
            }
        });
        $("#lng").val(e.lnglat.getLng());
        $("#lat").val(e.lnglat.getLat());
    });
      // 实例化点标记
 	function addMarker(data) {
        marker = new AMap.Marker({
            icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
            position: [data.x, data.y]
        });
        marker.setMap(map);
    }
   $(".select").click(function(){
   		$.cookie('lng', $("#lng").val());
   		$.cookie('lat', $("#lat").val());
   		$.cookie('location', $("#location").val());
   		location.href="${pageContext.request.contextPath}/base/goURL/weixin/addMeeting?hasCookie=true";
   })
</script>
	<center><div>粤icp备09004280号</div></center>
</body>
</html>

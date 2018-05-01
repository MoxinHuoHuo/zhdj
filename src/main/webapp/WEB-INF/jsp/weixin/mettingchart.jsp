
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <meta name="viewport" content="width=365, target-densitydpi=device-dpi">
    <title>会议统计表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/Chart.js/2.7.2/Chart.js"></script>
    <style>
        .years{
            text-align: center;
        }
        .am-navbar-label{
            height: 20px;
        }

    </style>
</head>
<body>
<header data-am-widget="header"
        class="am-header am-header-default" style="background-color: #dd514c;">
    <div class="am-header-left am-header-nav">
        <a href="#left-link" class="am-btn am-btn-default">
              <span class="am-header-nav-title">
                返回
              </span>

            <i class="am-header-icon am-icon-home"></i>
        </a>
    </div>

    <h1 class="am-header-title">
        会议统计表
    </h1>

    <div class="am-header-right am-header-nav">
        <a href="#user-link" class="">

            <i class="am-header-icon am-icon-refresh"></i>
        </a>
    </div>
</header>
<div style="width: 365px;height: 420px;margin-top: 20px">
    <canvas id="myChart" width="100" height="100"></canvas>
</div>

<section data-am-widget="accordion" class="am-accordion am-accordion-default" data-am-accordion='{ "multiple": true }' id="Details" style="display: none">
    <p style="text-align: center;font-weight: bold"><span id="time"></span>年度会议详情如下</p>
    <dl class="am-accordion-item  ">
        <dt class="am-accordion-title years">
            2017年1月份
        </dt>
        <dd class="am-accordion-bd am-collapse ">
            <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
            <div class="am-accordion-content">
                <p style="text-align: center;font-weight: bold">第1次会议</p>
                <dl class="am-accordion-item ">
                    <i class="am-icon-user-plus"></i>&nbsp;&nbsp;参与会议者姓名
                    <dt class="am-accordion-title"style="float: right;padding-top: 1px;position: relative;">
                    </dt>
                    <dd class="am-accordion-bd am-collapse ">
                        <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
                        <div class="am-accordion-content">
                            唐三  小舞  戴沐白  朱竹清 宁荣荣 马红俊 奥斯卡
                        </div>
                    </dd>
                </dl>
                <div><i class="am-header-icon am-icon-tasks"></i>&nbsp;&nbsp;会议标题:&nbsp;&nbsp;&nbsp;&nbsp;<span>关于十九大</span></div>
                <div><i class="am-header-icon am-icon-calendar-times-o"></i>&nbsp;&nbsp;会议时间:&nbsp;&nbsp;&nbsp;&nbsp;<span>2018/01/05/22:40</span></div>
                <div><i class="am-header-icon am-icon-user"></i>&nbsp;&nbsp;&nbsp;总负责人:&nbsp;&nbsp;&nbsp;&nbsp;<span>唐三</span></div>
                <div><i class="am-header-icon am-icon-user-secret"></i>&nbsp;&nbsp;&nbsp;参会人数:&nbsp;&nbsp;&nbsp;&nbsp;<span>20</span></div>
                <dl class="am-accordion-item ">
                    <i class="am-icon-user-times"></i>&nbsp;&nbsp;未参与会议者姓名
                    <dt class="am-accordion-title"style="float: right;padding-top: 1px;position: relative;">

                    </dt>
                    <dd class="am-accordion-bd am-collapse ">
                        <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
                        <div class="am-accordion-content">
                            唐三  小舞  戴沐白  朱竹清 宁荣荣 马红俊 奥斯卡
                        </div>
                    </dd>
                </dl>

            </div>
        </dd>
    </dl>


</section>

<div data-am-widget="navbar" class="am-navbar am-cf  "
     id="" style="background: #FFFFFF; ">
    <ul class="am-navbar-nav am-cf am-avg-sm-4">
        <li >
            <a href="javascript:void(0)" class="">
                <span class="am-icon-home"></span>
                <span class="am-navbar-label">首页</span>
            </a>
        </li>
        <li >
            <a href="javascript:void(0)" class="det">
                <span class="am-icon-bar-chart"></span>
                <span class="am-navbar-label">详情</span>
            </a>
        </li>

    </ul>
</div>



<script type="text/javascript">
    var unit="<%=request.getParameter("unit")%>";
    var year="<%=request.getParameter("startTime")%>";
    $('#time').text(year);
    console.log(unit);
    console.log(year);
    //页面刷新
    $('.am-icon-refresh').click(function () {
        window.location.reload();
    })
    //详情展示
    $('.det').click(function () {
        $('#Details').show();

    })
    $.ajax({
        type:'POST',
        url:"${pageContext.request.contextPath}/lydStatistics/showMeetStatistics",
        data:{
            unit:unit,
            startTime:year
        },
        success:function (json) {
            console.log(json);
            console.log(json.meetRecordMap[2].meetingTimes);
            var data=[];
            for(var i=0;i<12;i++){
               data.push(json.meetRecordMap[i].meetingTimes);
            }
            var ctx =$("#myChart");
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
                    datasets: [{
                        label: 'Conference statistics',
                        data:data,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255,99,132,1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    //是否自适应尺寸               --》 Boolean
                    responsive : true,
                    //缩放时绘制图标时间         --》 Number
                    responsiveAnimationDuration : 0,
                    //缩放时是否保持长宽比            --》 Boolean
                    maintainAspectRatio : true,
                    //悬停事件触发时机              --》 Array<String>
                    events : ["mousemove", "mouseout", "click", "touchstart", "touchmove", "touchend"],
                    //点击事件                      --》 function
                    onClick : function(){
                    },
                    //缩放时调用                 --》 function
                    //获取两个参数 : 图表实例及新尺寸
                    onResize : function(chart, size){},
                    // TODO
                    legendCallback : function (chart) {},
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true
                            }
                        }]
                    }
                }
            });

     /*      for(var i=0;i<12;i++){
               var tpl=
               '<dl class="am-accordion-item">'+
                   '<dt class="am-accordion-title years">'
                   +'2017年1月份'+
               '</dt>'+
               '<dd class="am-accordion-bd am-collapse ">'+
                   '<div class="am-accordion-content">'+
                   '<p style="text-align: center;font-weight: bold">'+'第1次会议'+'</p>'+
                   '<dl class="am-accordion-item ">'+
                   '<i class="am-icon-user-plus"></i>'+'&nbsp;&nbsp;参与会议者姓名'+
                   '<dt class="am-accordion-title"style="float: right;padding-top: 1px;position: relative;">'+
                  '</dt>'+
                   '<dd class="am-accordion-bd am-collapse ">'+
                   '<div class="am-accordion-content">'+
                   '唐三  小舞  戴沐白  朱竹清 宁荣荣 马红俊 奥斯卡'+
               '</div>'+
               '</dd>'+
               '</dl>'+
               '<div>'+'<i class="am-header-icon am-icon-tasks"></i>'+'&nbsp;&nbsp;会议标题:&nbsp;&nbsp;&nbsp;&nbsp;'+'<span>'+'关于十九大'+'</span>'+'</div>'+
               '<div>'+'<i class="am-header-icon am-icon-calendar-times-o"></i>'+'&nbsp;&nbsp;会议时间:&nbsp;&nbsp;&nbsp;&nbsp;'+'<span>'+'2018/01/05/22:40'+'</span>'+'</div>'+
               '<div>'+'<i class="am-header-icon am-icon-user"></i>'+'&nbsp;&nbsp;&nbsp;总负责人:&nbsp;&nbsp;&nbsp;&nbsp;'+'<span>'+'唐三'+'</span>'+'</div>'+
               '<div>'+'<i class="am-header-icon am-icon-user-secret"></i>'+'&nbsp;&nbsp;&nbsp;参会人数:&nbsp;&nbsp;&nbsp;&nbsp;'+'<span>'+'20'+'</span>'+'</div>'+
               '<dl class="am-accordion-item ">'+
                   '<i class="am-icon-user-times"></i>'+'&nbsp;&nbsp;未参与会议者姓名'+
                   '<dt class="am-accordion-title"style="float: right;padding-top: 1px;position: relative;">'+
                   '</dt>'+
                   '<dd class="am-accordion-bd am-collapse ">'+
                   '<div class="am-accordion-content">'+
                   '唐三  小舞  戴沐白  朱竹清 宁荣荣 马红俊 奥斯卡'+
               '</div>'+
               '</dd>'+
               '</dl>'+
               '</div>'+
               '</dd>'+
               '</dl>';
               $('#Details').append(tpl);

           }*/


        }

    })


   /* var ctx =$("#myChart");
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
            datasets: [{
                label: 'Conference statistics',
                data: [6, 5, 3, 5, 2, 3,7,7,6,5,4,8],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            //是否自适应尺寸               --》 Boolean
            responsive : true,
            //缩放时绘制图标时间         --》 Number
            responsiveAnimationDuration : 0,
            //缩放时是否保持长宽比            --》 Boolean
            maintainAspectRatio : true,
            //悬停事件触发时机              --》 Array<String>
            events : ["mousemove", "mouseout", "click", "touchstart", "touchmove", "touchend"],
            //点击事件                      --》 function
            onClick : function(){
            },
            //缩放时调用                 --》 function
            //获取两个参数 : 图表实例及新尺寸
            onResize : function(chart, size){},
            // TODO
            legendCallback : function (chart) {},
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
    */
</script>

</body>

</html>

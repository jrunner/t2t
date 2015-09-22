<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Highcharts Example</title>
    <script src="<%=request.getContextPath()%>/js/plugins/bootstrap/jquery/jquery.min.js"></script>

    <style type="text/css">
        ${demo.css}
    </style>
    <script type="text/javascript">
        //y轴值
        var data = [];
        //创建图表
        var chart;

        var keys = "<%=request.getParameter("keys") %>";

        function getData() {
            $.ajax({
                type: "GET",
                url: "<%=request.getContextPath()%>/RecruitServlet/fetch",
                cache: false,
                data: {keys: keys},
                dataType: 'json',
                success: JCollBack
            });
        }

        $(document).ready(function () {
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container',
                    type: 'spline',
                    animation: Highcharts.svg, // don't animate in old IE
                        marginRight: 10,
                        events: {
                    load: function () {
                        getData()
                    }
                }
            },
            title: {
                text: '实时招聘统计'
            },
            xAxis: {
                type: 'datetime',
                        tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: '数量'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function () {
                    return '<b>' + this.series.name + '</b>：' + Highcharts.dateFormat('%H:%M:%S', this.x) + " (" + this.y + ")";
                }
            },
            legend: {
                enabled: true
            },
            exporting: {
                enabled: false
            },
            series: []
        });

        var kk = keys.split(",");
        for (var i = 0; i < kk.length; i++) {
            chart.addSeries({name: kk[i]})
            }
        });

        //回调函数
        function JCollBack(response, textStuats) {

            if (response.info == "1") {
                var kk = keys.split(",");
                for (var i = 0; i < kk.length; i++) {
                    var series = chart.series[i];
                    var shift = (series.data != null && series.data.length >= 20); //如果数据系列长度比20大，我们改变第一个点，然后系列会移动到左边而不是和点靠得更紧。
                    series.addPoint(response.items[i], true, shift);// add the point
                }
                setTimeout("getData()", 10 * 1000);
                return;
            }
        }
    </script>
</head>
<body>
<script src="<%=request.getContextPath()%>/js/plugins/highcharts/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/plugins/highcharts/modules/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>

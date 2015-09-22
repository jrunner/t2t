<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>按天统计</title>
    <script src="<%=request.getContextPath()%>/js/plugins/bootstrap/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        function getData(response) {
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container',
                    type: 'spline'
                },
                title: {
                    text: '编程语言招聘实时统计',
                    x: -20 //center
                },
                subtitle: {
                    text: '作者：艾客',
                    x: -20
                },
                xAxis: {
                    categories: response.categories
                },
                yAxis: {
                    title: {
                        text: '数量'
                    }
                    ,
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: ''
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: response.series
            })
        }


        //回调函数
        function JCollBack(response, textStuats) {
            if (response.info == "1") {
                getData(response)
                return;
            }
            alert(response.msg)
        }

        var chart
        $(document).ready(function () {
            $.ajax({
                type: "GET",
                url: "<%=request.getContextPath()%>/RecruitServlet/show",
                cache: false,
                dataType: 'json',
                success: JCollBack
            });
        })


    </script>
</head>
<body>
<script src="<%=request.getContextPath()%>/js/plugins/highcharts/highcharts.js"></script>
<script src="<%=request.getContextPath()%>/js/plugins/highcharts/modules/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>

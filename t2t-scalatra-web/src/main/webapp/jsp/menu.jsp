<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
    <title>TopSpark</title>

    <%@ include file="include/set.jsp" %>
    <style>
        A{cursor: pointer; }
    </style>

    <script>
        function goto(url) {
            window.location = url
        }

        $(document).ready(function () {
            $.ajax({type: "GET", url: "<%=request.getContextPath()%>/WelcomeServlet/click", cache: false, dataType: 'json', success: JCollBack});
        });

        //回调函数
        function JCollBack(data, textStuats) {
            if (data.info == "0") {
                alert(data.msg)
                return;
            }
            $('#count').html('<h5>访问量&nbsp;&nbsp;<span class="badge"> {0} </span>&nbsp;&nbsp;</h5>'.replace("{0}", data.count) )
        }
    </script>
</head>


<body>
<div class="bs-docs-section">
    <div class="jumbotron">
        <h1>Hello, Scala and Spark!</h1>

        <p>
            <a class="btn btn-primary btn-lg" href="#" role="button" onclick="goto('<%=request.getContextPath()%>/jsp/stat/spark/list.jsp?keyword=Spark')">Spark List</a>
        </p>

        <p>
            <a class="btn btn-primary btn-lg" href="#" role="button" onclick="goto('<%=request.getContextPath()%>/jsp/demo.jsp?keyword=Spark')">Spark</a>
        </p>

        <p>
            <a class="btn btn-primary btn-lg" href="#" role="button" onclick="goto('<%=request.getContextPath()%>/index.jsp')">品红网站</a>
        </p>

        <p>
            <a class="btn btn-primary btn-lg" href="#" role="button" onclick="goto('<%=request.getContextPath()%>/jsp/stat/recruit/day.jsp')">按天招聘统计</a>
            <a class="btn btn-primary btn-lg" href="#" role="button" onclick="goto('<%=request.getContextPath()%>/jsp/stat/recruit/update.jsp?keys=PHP,JAVA,SPARK,HADOOP,C,PYTHON')">实时招聘统计</a>
        </p>

        <p>&nbsp;</p>
        <p>参考源码1：<a class="https://github.com/t2tm/t2t">https://github.com/t2tm/t2t</a></p>
        <p>参考源码2：<a class="https://github.com/jrunner">https://github.com/jrunner</a></p>
    </div>

    <div id="count" style="float: right"></div>

</div>
</body>
</html>

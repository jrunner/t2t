<%@ page pageEncoding="UTF-8"%>
<link rel="icon" href="<%=request.getContextPath()%>/theme/favicon.ico">
<%
    //页面全局使用到的变量
    String path = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/plugins/datatable/resources/bootstrap/3/dataTables.bootstrap.css">
<link href="<%=request.getContextPath()%>/js/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/js/plugins/jquery.splitter/css/jquery.splitter.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/theme/tss/css/splitter.vertical.panel.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/theme/tss/css/doc.css" rel="stylesheet" />

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="<%=request.getContextPath()%>/js/plugins/bootstrap/assets/ie10-viewport-bug-workaround.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="<%=request.getContextPath()%>/js/plugins/bootstrap/assets/html5shiv.min.js"></script>
<script src="<%=request.getContextPath()%>/js/plugins/bootstrap/assets/respond.min.js"></script>
<![endif]-->

<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/js/plugins/bootstrap/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/plugins/bootstrap/jquery/jquery.bootstrap.min.js"></script>
<!-- DataTables -->
<script src="<%=request.getContextPath()%>/js/plugins/datatable/js/jquery.dataTables.js"></script>
<script src="<%=request.getContextPath()%>/js/plugins/datatable/resources/bootstrap/3/dataTables.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/plugins/json/json_parse.js"></script>
<script src="<%=request.getContextPath()%>/js/plugins/json/json2.js"></script>
<script src="<%=request.getContextPath()%>/js/resource.action.js"></script>
<!-- splitter -->
<script src="<%=request.getContextPath()%>/js/plugins/jquery.splitter/js/jquery.splitter-0.14.0.js"></script>
<script src="<%=request.getContextPath()%>/js/frame/tss.frame.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/frame/tss.datatables.driver.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/resource.util.js"></script>

<!--tss-hdfs-web-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/plugins/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/tss-hdfs.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/theme/tss/css/tss-hdfs.css">
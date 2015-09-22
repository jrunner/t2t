<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="description" content="">
    <meta name="author" content="">
    <%@ include file="../../include/set.jsp" %>

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            searchResource()
        });
        function JFormartMessage(data,meta,full) {
            var msg = full.yy
            if(full.mm !=''){
                msg += "-" + full.mm
            }
            if(full.dd !=''){
                msg += "-" + full.dd
            }
            return msg;
        }
        function searchResource() {
            var title = "<input type='checkbox' name='dataTables.row.checkAll' id='dataTables.row.checkAll' onclick='JCheckAll()'/>";
            var columns = [
                {"data": "id", "width": 30, "title": "序号"},
                {"data": "id", "width": 20, "title": title, "render": JFormartCheckBox},
                {"data": "key", "title": "关键字"},
                {"data": "message", "title": "概要"},
                {"data": "yy", "title": "时间", "render": JFormartMessage},
                {"data": "kind", "title": "类型"},
                {"data": "order", "title": "级别"}
            ];

            var url = "<%=request.getContextPath()%>/HistoryServlet/list";
            initDataGrid('datagrid', url, {}, columns);
        }

        function JEditRow(op) {
            if (op == 0) {
                var url = "<%=request.getContextPath()%>/jsp/stat/spark/update.jsp?id=0";
                JOpenAutoPage(url, "e", 480, 640)
                return;
            }
            var json = JGetSelected();
            if (json.ids == null || json.ids == '') {
                return;
            }
            var url = "<%=request.getContextPath()%>/jsp/stat/spark/update.jsp?id=" + json.ids.split(",")[0];
            JOpenAutoPage(url, "e", 480, 640)
        }

        /**
         * 删除触发事件
         */
        function JDeleteRow() {
            var json = JGetSelected();
            if (json.ids == null || json.ids == '') {
                return;
            }

            $.messager.confirm('提示信息', json.tips, function () {
                var param = {ids: json.ids};
                var url = "<%=request.getContextPath()%>/HistoryServlet/del";
                JSendAjax(url, param, "json");
            });
        }

        function JCollBack(data) {
            if (data.info == '0') {
                alert(data.msg)
                return;
            }

            if (data.info == 'del') {
                searchResource();
            }
        }

    </script>
</head>

<body class="dt-grid">
<div class="container">
    <br><input id="keyword" value="<%=request.getParameter("keyword")%>" type="hidden"/>
    <div class="btn-group" role="group" aria-label="...">
        <button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" onclick="searchResource()">
            <span class="glyphicon glyphicon-refresh"></span> 刷新
        </button>
        <button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" onclick="JEditRow(0);">
            <span class="glyphicon glyphicon-search"></span> 查找
        </button>
        <button id="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" onclick="JEditRow(0);">
            <span class="glyphicon glyphicon-plus"></span> 新增
        </button>
        <button id="btnModify" type="button" class="btn btn-primary" data-toggle="modal" onclick="JEditRow(1);">
            <span class="glyphicon glyphicon-pencil"></span> 修改
        </button>
        <button id="btnDel" type="button" class="btn btn-primary" data-toggle="modal" onclick="JDeleteRow();">
            <span class="glyphicon glyphicon-trash"></span> 删除
        </button>
    </div>
    <div style="float: right">
        <input type="text" name="global_filter" id="global_filter" class="form-control" >
    </div>

    <div class="table-responsive" id="tssDataTableDiv">
        <table id="datagrid" class="display" cellspacing="0" width="100%"></table>
    </div>
</div>
</body>
</html>
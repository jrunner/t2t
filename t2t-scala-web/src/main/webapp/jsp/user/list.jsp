<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

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
    <%@ include file="../include/path_set2.inc" %>
    <title></title>
    <script>

        $(document).ready(function () {
            searchResource();
        });

        function formartView(data, type, full, meta) {
            return '<a href="javascript:view(\'' + data + '\')" >' + data + '</a>';
        }

        function view(data) {
            var url = "<%=request.getContextPath()%>/jsp/res/update.jsp?columns=ip_columns&kind=ips&key=" + data;
            JOpenAutoPage(url, "详情", 500, 700)
        }

        function searchResource() {
            var url = '<%=request.getContextPath()%>/UserServlet?cmd=list';
            var param = getJsonByContainer('confirmForm');
            var title = "<input type='checkbox' name='dataTables.row.checkAll' id='dataTables.row.checkAll' onclick='JCheckAll()'/>";

            var columns = [
                {"data": "id", "width": 20, "id": "序号"},
                {"data": "id", "width": 20, "title": title, "render": JFormartCheckBox},
                {"data": "username", "title": "用户名"},
                {"data": "password", "title": "密码"}
            ];
            initTssGrid('datagrid', url, param, columns);
            formatTssGrid('datagrid', columns, 'resourceTableDiv');
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
                var param = {ids: json.ids, cmd: 'del'};
                var url = "<%=request.getContextPath()%>/UserServlet";
                JSendAjax(url, param, "json");
            });
        }

        function JEditRow(op) {
            if(op == 0){
                var url = "<%=request.getContextPath()%>/jsp/user/update.jsp?id=";
                JOpenAutoPage(url, "e", 350, 500)
                return;
            }
            var json = JGetSelected();
            if (json.ids == null || json.ids == '') {
                return;
            }
            var url = "<%=request.getContextPath()%>/jsp/user/update.jsp?id=" + json.ids.split(",")[0];
            JOpenAutoPage(url, "e", 350, 500)
        }

        function JCollBack(data) {
            if (data.info == '0') {
                alert(data.msg)
                return;
            }
            if(data.info == 'del'){
                searchResource();
            }
        }
    </script>

</head>
<body>
<div id="contentLayoutSplitter">
    <div id="contentLayoutSplitterPanel2">
        <div id="resourceTableDiv" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main hide">
            <div>
                <div class="btn-group" id="dataTableToolbarNode"></div>
                <div class="btn-group hide" id="dataTableToolbarNodeMoreDiv">
                    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                        更多
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" id="dataTableToolbarNodeMoreNode"></ul>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-default btn-primary" onclick="reloadDataGrid()">
                        <span class="glyphicon glyphicon-refresh"></span> 刷新
                    </button>
                    <button type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#tableSearchModalDiv">
                        <span class="glyphicon glyphicon-search"></span> 查找
                    </button>
                    <button id="addComfirm" type="button" class="btn btn-primary" data-toggle="modal" onclick="JEditRow(0);">
                        <span class="glyphicon glyphicon-plus"></span> 新增
                    </button>
                    <button id="editComfirm" type="button" class="btn btn-primary" data-toggle="modal" onclick="JEditRow();">
                        <span class="glyphicon glyphicon-pencil"></span> 编辑
                    </button>
                    <button id="deleteComfirm" type="button" class="btn btn-primary" data-toggle="modal"
                            onclick="JDeleteRow();">
                        <span class="glyphicon glyphicon-trash"></span> 删除
                    </button>
                    <div class="btn-group">
                        <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-eye-open"></span>显示
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" id="dataTabColumnShowNode"></ul>
                    </div>
                </div>

                <div style="float: right">
                    <input type="text" name="global_filter" id="global_filter" class="form-control">
                </div>

            </div>
            <div class="table-responsive" id="tssDataTableDiv">
                <table id="datagrid" class="display" cellspacing="0" width="100%"></table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="tableSearchModalDiv" tabindex="-1" role="dialog" aria-labelledby="tableSearchLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="tableSearchLabel">
                    查询
                </h4>
            </div>
            <div class="modal-body">
                <form action="" id="confirmForm" name="confirmForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            key
                        </label>

                        <div class="input-group col-sm-6">
                            <input id="key" name="key" type="text" data-hint="ip" size="20" maxlength="40" value=""
                                   data-validation="required,domainName" class="form-control input-sm"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="reset" class="btn btn-primary" id="resetSearchForm">重置</button>
                <button type="button" class="btn btn-primary" id="searchResource">查询</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
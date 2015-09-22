<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改</title>
    <%@ include file="../../include/set.jsp" %>

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            $('#key').val(opener.document.getElementById("keyword").value);
            var data = {id: '<%=request.getParameter("id") %>'}
            if(data.id == '0' ){
                JSendAjax('<%=request.getContextPath()%>/HistoryServlet/maxLevel', data, "json");
                return
            }
            JSendAjax('<%=request.getContextPath()%>/HistoryServlet/view', data, "json");
        });

        function submitForm() {
            var data = getJsonByContainer('confirmForm');
            data.id = '<%=request.getParameter("id") %>'
            data.cmd = 'update'
            JSendAjax('<%=request.getContextPath()%>/HistoryServlet/add', data, "json");
        }

        //回调函数
        function JCollBack(data, textStuats) {
            if (data.info == "0") {
                alert(data.msg)
                return;
            }
            if(data.info == 'maxLevel'){
                $('#order').val(data.level)
                return
            }
            if (data.info == 'view') {
                var json = data.msg
                $('#key').val(json.key)
                $('#message_').val(json.message)
                $('#message').val(json.message)
                $('#note_').val(json.note)
                $('#note').val(json.note)
                $('#yymmdd').val(json.yy + json.mm + json.dd)
                $('#order').val(json.order)
                var kinds = ('#kind')[0];
                for (var i = 0; i < kinds.options.length; i++) {
                    if (kinds.options[i].value == json.kind) {
                        kinds.selectedIndex = i;
                    }
                }
                return;
            }
            opener.searchResource();
            self.close()
        }

    </script>
    <style>
        td {
            height: 40px
        }
    </style>

</head>
<body>
<div id="titleDiv" class="alert alert-success alert-dismissible" role="alert" onclick="javascript:window.close();">
    <strong style="color: #fff">操作</strong>
</div>
<form action="" id="confirmForm" name="confirmForm" method="post" class="form-horizontal">
    <table align="center" border="0" width="70%">
        <tr>
            <td>关键字</td>
            <td>
                <input id="key" name="key" type="text" placeholder="Spark" size="30" maxlength="40" class="form-control input-sm" readonly/>
            </td>
        </tr>
        <tr>
            <td style="height: 78px">概要</td>
            <td>
                <textarea id="message" name="message" rows="3" class="form-control input-sm" ></textarea>
            </td>
        </tr>
        <tr>
            <td style="height: 78px">备注</td>
            <td>
                <textarea id="note" name="note" rows="3" class="form-control input-sm"  ></textarea>
            </td>
        </tr>
        <tr>
            <td>时间</td>
            <td>
                <input id="yymmdd" name="yymmdd" placeholder="20150531" type="text" size="30" maxlength="40" class="form-control input-sm"/>
            </td>
        </tr>
        <tr>
            <td>类型</td>
            <td>
                <select id="kind" name="kind" class="form-control input-sm">
                    <option value="e">版本</option>
                    <option value="v">大事件</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>级别</td>
            <td>
                <input id="order" name="order" type="text" size="30" maxlength="40" class="form-control input-sm"/>
            </td>
        </tr>
    </table>
</form>
<div id="tss-operation-div" class="modal-footer">
    <div id="resourceToolBar" class="btn-group">
        <input class="btn btn-primary" type="button" name="btnSubmit" value="提交" onclick="submitForm()"/>
        <input class="btn btn-primary" type="button" name="btnClose" value="关闭" onclick="self.close()"/>
    </div>
</div>
</body>
</html>

</script>
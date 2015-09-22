<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改</title>
    <%@ include file="../include/path_set.inc" %>

    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            var data = {id: '<%=request.getParameter("id") %>', cmd: "view"}
            JSendAjax('<%=request.getContextPath()%>/UserServlet', data, "json");
        });

        function submitForm() {
            var data = getJsonByContainer('confirmForm');
            data.id = '<%=request.getParameter("id") %>'
            data.cmd = 'update'
            JSendAjax('<%=request.getContextPath()%>/UserServlet', data, "json");
        }

        //回调函数
        function JCollBack(data, textStuats) {
            if (data.info == "0") {
                alert(data.msg)
                return;
            }
            if (data.info == 'view') {
                var json = data.msg
                $('#username').val(json.username)
                $('#password').val(json.password)
                return;
            }
            alert(data.msg)
            opener.searchResource();
            self.close()
        }
    </script>

</head>
<body>
<div id="titleDiv" class="alert alert-success alert-dismissible" role="alert" onclick="javascript:window.close();">
    <strong style="color: #fff">操作</strong>
</div>
<div id="detail" class="container-fluid" style="padding-top: 20px;">
    <div class="span12" id="content">
        <form action="" id="confirmForm" name="confirmForm" method="post" class="form-horizontal">
            <table align="center">
                <tr>
                    <td>&nbsp;</td>
                    <td></td>
                </tr>
                <tr>
                    <td> 名称</td>
                    <td><input id="username" name="username" type="text" size="30" maxlength="40"
                               class="form-control input-sm"/></td>
                </tr>
                <tr>
                    <td> 密码</td>
                    <td><input id="password" name="password" type="text" size="30" maxlength="40"
                               class="form-control input-sm"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div id="tss-operation-div" class="modal-footer">
    <div id="resourceToolBar" class="btn-group">
        <input class="btn btn-primary" type="button" name="btnSubmit" value="提交" onclick="submitForm()"/>
        <input class="btn btn-primary" type="button" name="btnClose" value="关闭" onclick="self.close()"/>
    </div>
</div>
</body>
</html>

</script>
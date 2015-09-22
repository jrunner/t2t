/**
 * Created by ypf on 2015/5/29.
 */
var language = {
    "lengthMenu": "每页显示 _MENU_ 条记录",
    "zeroRecords": "无数据.",
    "info": "当前 _PAGE_ 页/共 _PAGES_ 页   总计  _TOTAL_ 条记录",
    "infoEmpty": "总计  0  条记录",
    "infoFiltered": "共  _MAX_ 条记录",
    "infoPostFix": "",
    "search": "表内查找",
    "url": "",
    "emptyTable": "无数据.",
    "paginate": {
        "first": "首页",
        "previous": "上一页",
        "next": "下一页",
        "last": "尾页"
    }
};

function initDataGrid(id, url, param, columns) {
    //$('#' + id).DataTable().destroy(false);
    //调整表格的高度 所有元素高度总各为193
    var tableYheight = getWindowHeight() - 130;
    // 创建数据表
    $("#tssDataTableDiv")[0].innerHTML = "<table id=\"" + id + "\" class=\"table table-striped\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"></table>";
    $('#' + id).dataTable({
        "ajax": {"url": url, "type": "post", "data": param},
        "lengthMenu": [[50, 100, 200], [50, 100, 200]],
        "dom": '<<t><r><ilp>>',
        "scrollY": tableYheight + "px",
        "scrollX": true,
        "processing": true,
        "searching": true,
        "order": [],
        "columns": columns, "language": language
    });
    formatGrid('datagrid');
}

//将容器内的表单元素构建为 json串
function getJsonByContainer(id) {
    var form = $('#' + id)[0];
    var param = {};
    //文本框
    $("input[type=text]", form).each(function () {
        param[this.name] = this.value;
        if ($(this).attr("op") != null) {
            param[this.name + $(this).attr("op")] = this.value;
        } else {
            param[this.name + '_QUERYKEY_LIKE'] = this.value;
        }
    });
    $("textarea", form).each(function () {
        param[this.name] = this.value;
        if ($(this).attr("op") != null) {
            param[this.name + $(this).attr("op")] = this.value;
        } else {
            param[this.name + '_QUERYKEY_LIKE'] = this.value;
        }
    });
    $("input[type=hidden]", form).each(function () {
        //alert(this.name+","+this.value);
        param[this.name] = this.value;
        param[this.name + '_QUERYKEY'] = this.value;
    });
    //checkbox
    $("input[type=checkbox]:checked", form).each(function () {
        param[this.name] = this.value;
        param[this.name + '_QUERYKEY'] = this.value;
    });
    //下拉框
    $("select", form).each(function () {
        param[this.name] = this.value;
        param[this.name + '_QUERYKEY'] = this.value;
    });
    return param;
}

function formatGrid(id)
{
    var t = $('#' + id).DataTable();
    $('a.toggle-vis').on('click', function (e) {
        e.preventDefault();
        // Get the column API object
        var column = t.column($(this).attr('data-column'));
        // Toggle the visibility
        column.visible(!column.visible());
    });
    //追加行号
    t.on('order.dt search.dt draw.dt', function () {
        t.column(0, {
            search: 'applied',
            order: 'applied',
            draw: 'applied'
        }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
        });
    }).draw();
}


/**
 * 取得页面高度
 * @returns {Number}
 */
function getWindowHeight() {
    return $(document).height();
}

function JFormartCheckBox(data) {
    return "<input name='dataTables.row.ckbox.id' type='checkbox' value=" + data + ">";
}


/**
 * 选择表格中所有的行
 */
function JCheckAll() {
    var chk = document.getElementById("dataTables.row.checkAll");
    var inputObj = $("input[name='dataTables.row.ckbox.id']");
    for (var i = 0; i < inputObj.length; i++) {
        var temp = inputObj[i];
        if (temp.type == "checkbox") {
            temp.checked = chk.checked;
        }
    }
}

function JGetSelected() {
    var inputObj = $("input[name='dataTables.row.ckbox.id']");
    if ($("input[name='dataTables.row.ckbox.id']").is(':checked') == false) {
        $.messager.alert('提示信息', '请选择需要操作的记录!', 'warning');
        return;
    }

    var selectedRowData = "";
    var selectData = '';
    for (var i = 0; i < inputObj.length; i++) {
        var temp = inputObj[i];
        if (temp.type == "checkbox" && temp.checked == true) {
            selectData += "将要删除的资源 :" + temp.value + "<br>";
            selectedRowData += temp.value + ",";
        }
    }

    return {"ids": selectedRowData, "tips": selectData};
}

/**
 *    删除触发事件
 */
function JDeleteRow(table, url) {
    var json = JGetSelected();
    if (json.ids == null || json.ids == '') {
        return;
    }

    $.messager.confirm('提示信息', json.tips, function () {
        var param = {ids: json.ids, oper: 'del'};
        param['table'] = table;
        JSendAjax(url, param, "json");
    });
}


function getOpenerValue(id) {
    if (opener != null && opener.document.getElementById(id) != null) {
        return opener.document.getElementById(id).value;
    } else if (getArgs()[id] != null) {
        return getArgs()[id];
    }
    return null;
}

function getArgs() {
    var args = new Object();
    var query = decodeURI(location.search.substring(1));	//Get query string
    var pairs = query.split("&");
    for (var i = 0; i < pairs.length; i++) {
        var pos = pairs[i].indexOf('=');	//Look for "name=value"
        if (pos == -1) continue;				//If not found,skip
        var argname = pairs[i].substring(0, pos);//Extract the name
        var value = pairs[i].substring(pos + 1); //Extract the value
        args[argname] = value;
    }
    return args;
}

$(document).ready(function() {
    if(isFunction('searchResource')){
        //searchResource();
    }

    if($('#resetSearchForm').length > 0){
        $('#resetSearchForm').click(function(){
            resetSearchForm();
        });
    }
    if($('#searchResource').length > 0){
        $('#searchResource').click(function(){
            searchResource();
        });
    }

    //判断是否存在，如果存在则，添加如下方法
    if($('#global_filter').length > 0){
        $('#global_filter').attr('placeholder','实时检索 (CTRL+L 清空)');
        //$('#global_filter').attr('title','快捷键：CTRL+L 清空');//(CTRL+L 清空)

        $('#global_filter').on('keyup click', function () {
            $('#datagrid').DataTable().search($('#global_filter').val(),true,true).draw();
        });
    }

    document.onkeydown = function(event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        //alert(e.keyCode);
        //执行：ctrl+回车
        if (e && e.keyCode == 13 && e.ctrlKey) {
            //execute();
        }
        //清空: ctrl+退格
        if (e && e.keyCode == 8 && e.ctrlKey) {
            //clearForm();
        }
        //清空: ctrl+l
        if (e && e.keyCode == 76 && e.ctrlKey) {
            if($('#global_filter').length > 0){
                //清空文本框的内容
                $('#global_filter').val('');
                //恢复原始内容
                $('#global_filter').click();
            }
        }
    };
});

//是否存在指定函数
function isFunction(funcName) {
    try {
        if (typeof(eval(funcName)) == "function") {
            return true;
        }
    } catch(e) {}
    return false;
}
//是否存在指定变量
function isVariable(variableName) {
    try {
        if (typeof(variableName) == "undefined") {
            //alert("value is undefined");
            return false;
        } else {
            //alert("value is true");
            return true;
        }
    } catch(e) {}
    return false;
}
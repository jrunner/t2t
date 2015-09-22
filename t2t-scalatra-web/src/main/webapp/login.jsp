<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>

    <title>管理员登录</title>
    <link href="styles/css.css" rel="stylesheet" type="text/css">

    <script language="javascript">
        function checkForm(){
            with(document.form1){
                if(txtUserName.value==""){
                    alert("用户名不为空!");
                    txtUserName.focus();
                    return false;
                }
                if(txtPassword.value==""){
                    alert("密码不能为空");
                    txtPassword.focus();
                    return false;
                }
            }
            return true;
        }
        //回车换行
        function changeFocus(){
            if(event.srcElement.type!=""&&event.keyCode==13&&event.srcElement.type!="button"&&event.srcElement.type!="submit"){
                event.keyCode=9;
            }
        }
        document.onkeydown=changeFocus;
    </script>
</head>


<body>

<table width="799" border="0" align="center" cellpadding="0"
       cellspacing="0" class="n">
    <tr>
        <td colspan="2" align="left" valign="top">
            <%@ include file="top.jsp" %>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top" bgcolor="#f4f4f4">
            &nbsp;
            <a href="index.jsp" class="dong05">首页</a><span
                style="font-size: 12px;color: #FF0000;">&gt;&gt;</span><a
                href="index.jsp" class="dong05">企业建站</a>
        </td>
        <td align="left" valign="top">&nbsp;

        </td>
    </tr>
    <tr>
        <td width="156" align="center" valign="top"
            background="image/cg5.jpg" bgcolor="#f4f4f4">
            <%@include file="left.jsp"%>
        </td>
        <td width="643" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>&nbsp;

                    </td>
                </tr>
                <tr>
                    <td height="370" align="center" valign="top">
                        <table width="100%" border="0" cellspacing="20" cellpadding="0">
                            <tr>
                                <td align="left" valign="top">
                                    <p class="d02">
                                        &nbsp;&nbsp;
                                    </p>

                                    <form method="post" name="form1" target="_self" id="form1"
                                          action="doLogin.jsp" onSubmit="return checkForm();">
                                        <table width="333" height="165" border="0" align="center"
                                               cellpadding="0" cellspacing="0" bordercolor="0"
                                               class="tableStyle">
                                            <tr>
                                                <td height="48" colspan="3" align="center" class="d07">
                                                    <span class="d02"><strong>管 理 员 登 录</strong> </span>														</td>
                                            </tr>
                                            <tr>
                                                <td width="72" height="35" align="center" class="d02">
                                                    您的帐号:														</td>
                                                <td width="259" colspan="2">
                                                    <input name="txtUserName" type="text" id="txtUserName"
                                                           size="27" style="font-size:12px;height: 18">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="35" align="center" class="d02">
                                                    您的密码:														</td>
                                                <td colspan="2">
                                                    <label>
                                                        <input name="txtPassword" type="password"
                                                               id="txtPassword" size="30"
                                                               style="font-size:12px;height: 18">
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="8" colspan="3" align="right"></td>
                                            </tr>
                                            <tr>
                                                <td height="37" colspan="3" align="center">

                                                    <input name="btnSub" type="submit"
                                                           class="mouseOutStyle" id="btnSub"
                                                           onMouseOver="this.className='mouseOverStyle'"
                                                           onMouseOut="this.className='mouseOutStyle'" value="登 录">
                                                    &nbsp;&nbsp;
                                                    <input name="btnReset" type="reset" id="btnReset"
                                                           class="mouseOutStyle"
                                                           onMouseOver="this.className='mouseOverStyle'"
                                                           onMouseOut="this.className='mouseOutStyle'" value="重 置">

                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                    <p class="d02">
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                    </p>
                                </td>
                            </tr>
                        </table>
                        <p>
                            <img src="image/n10.jpg" width="165" height="72" />								</p>

                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="2" colspan="2" align="center" valign="top"
            background="image/cg5.jpg" bgcolor="#f4f4f4">
            <%@ include file="bottom.jsp"%>			</td>
    </tr>
</table>
</body>
</html>

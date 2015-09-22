<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<script language="javascript" src="js/index.js"></script>
<script language="javascript" src="js/jquery-1.3.1.js"></script>
<script language="javascript" src="js/common.js"></script>

<html>
<head>
    <title>首页</title>
    <link href="styles/css.css" rel="stylesheet" type="text/css">

    <script>
        $(document).ready(function () {
            JSendAjax("<%=request.getContextPath() %>/MainServlet/top7news", {}, "json");
        });

        function JCollBack(data) {
            if (data.info == '0') {
                alert(data.msg)
                return;
            }
            if (data.info == 'top7news') {

            }
        }
    </script>
</head>

<body>
<table width="802" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="802" height="2">
            <%@ include file="top.jsp" %>
        </td>
    </tr>
    <tr>
        <td height="265">
            <table width="802" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="356" height="247" valign="top">
                        <table width="359" height="246" border="0" align="left" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="102" height="48" align="right" valign="top"
                                    style="background-repeat:no-repeat">
                                    <img src="image/d_r7_c1.jpg" width="101" height="35">
                                </td>
                                <td width="163" background="image/d02.jpg"
                                    style="background-repeat:repeat-x">
                                </td>
                                <td width="94" valign="top"
                                    style="background-repeat:no-repeat">
                                    <img src="image/d_r7_c14.jpg" width="94" height="35">
                                </td>
                            </tr>
                            <%-- 循环开始 --%>
                            <tr>
                                <td colspan="3" class="d02">
                                    &nbsp;&nbsp; <a href="detailNews.jsp?newsID=news.getNewsID()"
                                                    class="dong02">title</a>
                                    &nbsp;&nbsp; <a href="detailNews.jsp?newsID=news.getNewsID()" class="dong05">news.getWriterDate()</a>
                                </td>
                            </tr>
                            <%-- 循环结束 --%>
                            <tr>
                                <td height="16" colspan="3" align="right">
                                    <span class="dong05"><a href="showNewList.jsp" class="dong05">更多&gt;&gt;</a>
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="268" valign="top">
                        <table width="268" height="247" border="0" cellpadding="0"
                               cellspacing="0">
                            <tr>
                                <td width="268">
                                    <img src="image/d_r11_5_r1_c1.jpg" width="268" height="63">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="image/d_r11_5_r3_c1.jpg" width="268" height="59">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="image/d_r11_5_r4_c1.jpg" width="268" height="61">
                                </td>
                            </tr>
                            <tr>
                                <td height="64">
                                    <img src="image/d_r11_5_r5_c1.jpg" width="268" height="64">
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="178" rowspan="4" valign="top">
                        <table width="178" height="615" border="0" cellpadding="0"
                               cellspacing="0">
                            <tr>
                                <td width="178" height="42">
                                    <img src="image/d_r11_6.jpg" width="175" height="42">
                                </td>
                            </tr>
                            <tr>
                                <td height="367" align="center">

                                    <DIV id="dome"
                                         style="overflow:hidden;height:560px; width=180px;"
                                         onMouseOut="run()" onMouseOver="clearTimeout(timer)">

                                        <DIV id="dome1">
                                            <img src="image/d_r11_10_r1_c1.jpg" width="172"
                                                 height="100" alt="联想笔记本电脑">
                                            <br>
                                            <img src="image/d_r11_10_r1_c2.jpg" width="172"
                                                 height="100" alt="步步高学习机">
                                            <br>
                                            <img src="image/d_r11_10_r1_c8.jpg" width="172"
                                                 height="100" alt="松下相机">
                                            <br>
                                            <img src="image/d_r11_10_r1_c16.jpg" width="172"
                                                 height="100" alt="索尼相机">
                                            <br>
                                            <img src="image/d_r11_10_r1_c22.jpg" width="172"
                                                 height="100" alt="摩托罗拉手机">
                                            <br>
                                            <img src="image/d_r11_10_r1_c81.jpg" width="172"
                                                 height="100" alt="数码摄像机">
                                            <br>
                                            <img src="image/d_r11_10_r1_c116.jpg" width="172"
                                                 height="100" alt="三星笔记本电脑">
                                            <br>
                                            <img src="image/d_r11_10_r1_c221.jpg" width="172"
                                                 height="100" alt="诺基亚手机">
                                        </DIV>

                                        <DIV id="dome2">
                                        </DIV>
                                    </DIV>
                                    <script language="javascript">
                                        dome2.innerHTML = dome1.innerHTML;
                                        var timer;
                                        function run() {
                                            if (dome1.offsetHeight - dome.scrollTop < 0) {
                                                dome.scrollTop -= dome1.offsetHeight;
                                            } else {
                                                dome.scrollTop++;
                                            }
                                            timer = setTimeout("run()", 10)
                                        }

                                        run();
                                    </script>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="27" colspan="2" align="left" valign="top">
                        <table width="626" height="27" border="0" cellpadding="0"
                               cellspacing="0" background="image/d_r11_8.jpg">
                            <tr>
                                <td width="165" height="27" align="right" background="image/d_r13_c1.jpg">&nbsp;
                                </td>
                                <td width="392" height="27" background="image/d_r11_8.jpg"></td>
                                <td width="69" background="image/d_r13_c21.jpg">&nbsp;

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="133" colspan="2" align="center" valign="top">
                        <table width="605" border="0" cellpadding="0" cellspacing="0">

                            <tr>
                                <td width="160" align="center">
                                    <img src="image/d_r11_10_r1_c1.jpg" width="143" height="112" alt="联想笔记本电脑">
                                </td>
                                <td width="143">
                                    <img src="image/d_r11_10_r1_c2.jpg" width="143" height="112" alt="步步高学习机">
                                </td>
                                <td width="149">
                                    <img src="image/d_r11_10_r1_c8.jpg" width="143" height="112" alt="步步高学习机">
                                </td>
                                <td width="153" colspan="2">
                                    <img src="image/d_r11_10_r1_c16.jpg" width="143" height="112" alt="松下相机">
                                </td>
                            </tr>
                            <tr>
                                <td height="112" align="center">
                                    <img src="image/d_r11_10_r1_c22.jpg" width="143" height="112" alt="摩托罗拉手机">
                                </td>
                                <td>
                                    <img src="image/d_r11_10_r1_c81.jpg" width="143" height="112" alt="数码摄像机">
                                </td>
                                <td>
                                    <img src="image/d_r11_10_r1_c116.jpg" width="143" height="112" alt="数码摄像机">
                                </td>
                                <td colspan="2">
                                    <img src="image/d_r11_10_r1_c221.jpg" width="143" height="112" alt="诺基亚手机">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td height="120" colspan="2" valign="top">
                        <table width="624" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="305" valign="top">
                                    <table width="305" border="0" cellpadding="0" cellspacing="0"
                                           style="display:inline">
                                        <tr>
                                            <td height="27" colspan="2" background="image/n09.jpg">
                                                <img src="image/d_r11_11_r1_c1.jpg" width="185"
                                                     height="27">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="38">
                                                <img src="image/n07_r1_c1.jpg" width="31" height="31">
                                            </td>
                                            <td width="267" class="g04">
                                                <strong>业务专线:010-63321326</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="image/n07_r1_c1.jpg" width="31" height="31">
                                            </td>
                                            <td class="g04">
                                                <strong>售后服务:010-66666666</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="image/n07_r1_c1.jpg" width="31" height="31">
                                            </td>
                                            <td class="d061">
                                                <strong class="g04">传&nbsp;&nbsp;&nbsp;&nbsp;真:010-88888888</strong>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="368" valign="top">
                                    <table width="319" border="0" cellpadding="0" cellspacing="0"
                                           style="display:inline">
                                        <tr>
                                            <td height="27" colspan="3" background="image/n09.jpg">
                                                <img src="image/d_r11_11_r1_c21.jpg" width="160"
                                                     height="27">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="107" height="41" valign="bottom">
                                                <img src="image/tg-9.gif" width="104" height="39">
                                            </td>
                                            <td width="107" valign="bottom">
                                                <img src="image/tg-5.gif" width="104" height="39">
                                            </td>
                                            <td width="107" valign="bottom">
                                                <img src="image/tg-6.gif" width="104" height="39">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="46" valign="bottom">
                                                <img src="image/tg-7.gif" width="104" height="39">
                                            </td>
                                            <td valign="bottom">
                                                <img src="image/tg-4.gif" width="104" height="39">
                                            </td>
                                            <td valign="bottom">
                                                <img src="image/tg-3.gif" width="104" height="39">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="37" background="image/n09.jpg">&nbsp;

        </td>
    </tr>
</table>
</body>
</html>

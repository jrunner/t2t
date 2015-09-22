<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<script language="javascript" src="js/overmouse.js"></script>
<style type="text/css">
    BODY {
        overflow: scroll;
        overflow-x: hidden;
    }

    .s1 {
        position: absolute;
        font-size: 12pt;
        color: blue;
        visibility: hidden;
    }

    .s2 {
        position: absolute;
        font-size: 20pt;
        color: red;
        visibility: hidden;
    }

    .s3 {
        position: absolute;
        font-size: 16pt;
        color: gold;
        visibility: hidden;
    }

    .s4 {
        position: absolute;
        font-size: 14pt;
        color: lime;
        visibility: hidden;
    }
</STYLE>
<DIV ID="div1" CLASS="s1">*</DIV>
<DIV ID="div2" CLASS="s2">*</DIV>
<DIV ID="div3" CLASS="s3">*</DIV>
<DIV ID="div4" CLASS="s4">*</DIV>
<html>
<head>

    <title>top.jsp</title>

    <script language="javascript">
        function openChat() {
            window.open("chat/index.jsp", "", "toolbars=0,scrollbars=0,location=0,statusbars=0,menubars=0,resizable=0,width=630,height=440,top=200px,left=250px");
        }
    </script>
</head>

<body>
<table width="810" border="0" align="center" cellpadding="0"
       cellspacing="0">
    <tr>
        <td colspan="7" align="center">
            <table width="803" height="1" border="0" cellpadding="0"
                   cellspacing="0">
                <tr>
                    <td width="638" height="3" background="image/d.jpg"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="7" align="center">
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                    codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                    width="800" height="161">
                <param name="movie" value="image/2.swf">
                <param name="quality" value="high">
                <embed src="image/2.swf" quality="high"
                       pluginspage="http://www.macromedia.com/go/getflashplayer"
                       type="application/x-shockwave-flash" width="800" height="161"></embed>
            </object>
        </td>
    </tr>
    <tr>
        <td colspan="7">
            <table width="805" height="1" border="0" align="center"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td height="3" background="image/d.jpg"></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="60">
            <img src="image/d_r3_c1.jpg" width="60" height="40"></td>
        <td width="100">
            <a href="index.jsp"><img src="image/d_r3_c5.jpg" width="64" height="40" border="0"><img
                    src="image/top_red.jpg" width="36" height="40" border="0"></a></td>
        <td width="130">
            <a href="showProductList.jsp"><img src="image/d_r3_c7.jpg" width="94" height="40" border="0"></a><img
                src="image/top_red.jpg" width="36" height="40" border="0"></td>
        <td width="130">
            <a href="showNewList.jsp"><img src="image/d_r3_c8.jpg" width="94" height="40" border="0"></a><img
                src="image/top_red.jpg" width="36" height="40"></td>
        <td width="130">
            <a href="#" onClick="openChat();"><img src="image/d_r3_c9.jpg" width="94" height="40" border="0"></a><img
                src="image/top_red.jpg" width="36" height="40"></td>
        <td width="130"><a href="messageBoard.jsp" target="_blank"><img src="image/d_r3_c10.jpg" width="94" height="40"
                                                                        border="0"></a><img src="image/top_red.jpg"
                                                                                            width="36" height="40"></td>
        <td width="130"><a href="login.jsp"><img src="image/d_r3_c13.jpg" width="94" height="40" border="0"></a><img
                src="image/d_r3_c25.jpg" width="36" height="40"></td>
    </tr>
    <tr>
        <td height="2" colspan="7" background="image/tiao.jpg"><img src="image/tiao1.jpg" width="297" height="1"></td>
    </tr>
</table>

</body>
</html>

<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="java.util.List" %>
<%@ page import="sysjsp.bysj.entity.*"%>

<%@ include file="checked.jsp"%>

<html>
	<head>
	
		<title>显示进入聊天室的所有登录用户列表</title>
		<meta http-equiv="refresh" content="1">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
	.STYLE1 {
	font-size: 12px;
	color: #0000FF;
}
.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}
    .STYLE5 {font-size: 12px; color: #000000; }
    .tdStyle {
	border: 1px solid #000099;
}
    </style>
	</head>
<body style="<%=(String) session.getAttribute("style")%>">
	<table width="100%" height="425" border="0" cellpadding="0" cellspacing="0">
  <tr valign="top">
    <td height="85" valign="middle" class="tdStyle">
	<span class="STYLE5">
	&nbsp;欢迎光临品红聊天室<br>
      <br>
    &nbsp;电话：0379-9999999<br>
    <br>
    &nbsp;邮箱: myph@167.com</span></td>
  </tr>
  <tr valign="top">
    <td height="23" valign="middle"><span class="STYLE3"><img src="../image/icon_arrow_r.gif" width="13" height="13">在线用户列表</span></td>
  </tr>
  <tr valign="top">
    <td width="128" height="169" class="tdStyle"><%	
		List names = (List) application.getAttribute("names");
		if (names != null) {
			for (int i = 0; i < names.size(); i++) {
	%>
	
	<img src="../image/iboy.gif">
<span class="STYLE1"><%=(String) names.get(i)%></span><br>
	
	<%
		}
		}
	%></td>
  </tr>
  <tr>
    <td height="6"></td>
  </tr>
  <tr>
    <td height="135" class="tdStyle"><img src="../image/add.JPG" width="135" height="133"></td>
  </tr>
</table>


</body>
</html>

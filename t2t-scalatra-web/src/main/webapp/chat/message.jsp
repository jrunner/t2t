<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="sysjsp.bysj.entity.Chat"%>
<%@ include file="checked.jsp"%>

<html>
	<head>

		<title>自动刷新页面</title>
		<%
			request.setCharacterEncoding("GBK");
			List messages = (List) application.getAttribute("messages");
		%>
		<meta http-equiv="refresh" content="1">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
		.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 12px;
}
        .STYLE2 {font-size: 12px}
		 .tdStyle {
	border: 1px solid #000099;
}
        </style>
	</head>

	<body style="<%=(String) session.getAttribute("style")%>"
		onLoad="scroll(0,9999)">

		<table width="100%" height="296" border="0" cellpadding="0"
			cellspacing="0" class="tdStyle">
			<tr>
				<td width="421" height="294" valign="top">
					<%
							if (messages != null) {
							for (int i = 0; i < messages.size(); i++) {
								Chat c = (Chat) messages.get(i);
					%>
					<img src="../image/iboy.gif">
					<span class="STYLE2"><%=c.getName()%>
					</span>
					<span class="STYLE1">说</span>:
					<span class="STYLE2">(<%=c.getStrTime()%>)</span>
					<br>
					<span class="STYLE2"><%=c.getMessage()%>
					</span>
					<br>
					<%
						}
						}
					%>
				</td>
			</tr>
		</table>
	</body>
</html>

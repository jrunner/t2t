<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.*"%>
<%@ page import="sysjsp.bysj.dao.impl.*"%>
<%@ page import="java.util.List"%>
<%@ page import="sysjsp.bysj.entity.*"%>
<jsp:directive.page import="java.text.SimpleDateFormat" />
<%
	request.setCharacterEncoding("gbk");
	int p = request.getParameter("p") == null ? 1 : Integer
			.parseInt(request.getParameter("p"));
	MessageDao messageDao = new MessageDaoImpl();
	List list = messageDao.findMessageList(p);

	int last = (p > 1) ? p - 1 : p;
	int next = (15 == list.size()) ? p + 1 : p;
%>
<html>
	<head>
		<title>回复留言</title>
		<link href="styles/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-size: 12px;
}
-->
        </style>

	</head>
	<body background="image/bookbg.gif">
		<table width="750" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="750">
					<img src="image/welcome.jpg" width="750" height="135">
				</td>
			</tr>
			<tr>
				<td height="18" align="right">
					<strong class="d02"> <marquee direction="left" width="750"
							scrolldelay="150">
							欢迎您使用 留言本
						</marquee> </strong>
				</td>
			</tr>
			<tr>
				<td height="147">
					<table width="748" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="90" height="25">
								<table width="90" border="0" cellpadding="0" cellspacing="0">
									<tr><td width="13" height="25" align="right"><img src="image/titlemu_1.gif" width="12" height="25"></td>
									<td width="65" align="center" background="image/titlemu_2.gif"><a href="newMessage.jsp" class="dong02"><strong>新留言</strong></a></td><td width="12"><img src="image/titlemu_3.gif" width="12" height="25"></td></tr></table>
								<a href="newMessage.jsp"></a>
						  </td>
							<td width="50">&nbsp;						  </td>
							<td width="552">&nbsp;
								

						  </td>
							<td width="56">&nbsp;
								

						  </td>
						</tr>
						<tr><td colspan="2" align="center"><img src="image/T_left.gif" width="140" height="21"></td><td background="image/T_center.GIF">&nbsp;</td><td><img src="image/T_right.gif" width="56" height="21"></td></tr>
						<tr><td colspan="4" align="center"><table width="93%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="19%" height="5"></td>
										<td width="68%"></td>
										<td width="13%"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="26" colspan="4" align="center">
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="tableborderMes">
									<tr>
										<td width="8%" height="25" align="center">
											回复
										</td>
										<td width="42%" align="center">
											标题
										</td>
										<td width="23%" align="center">
											作者
										</td>
										<td width="27%" align="center">
											时间
										</td>
									</tr>

									<%
											for (int i = 0; i < list.size(); i++) {
											Message message = (Message) list.get(i);
											RevertDaoImpl revertDaoImpl = new RevertDaoImpl();
											int count = revertDaoImpl.findCountByMessageID(message
											.getMessageID());
									%>

									<tr>
										<td height="26" align="center" class="topMes">
											<%=count%>
										</td>
										<td align="left" class="topMes">
											<a href="revertMessage.jsp?messageId=<%=message.getMessageID()%>"
												class="dong02"><%=message.getTitle()%> </a>
										</td>
										<td align="center" class="topMes">
											<%=message.getName()%>
										</td>
										<td align="left" class="topMes">
											<%=message.getLeaveDate()%>
										</td>
									</tr>
									<%
									}
									%>

								</table>
							</td>
						</tr>
						<tr>
							<td height="30" colspan="4" align="center">
								<table width="100%" height="17" border="0" cellpadding="0"
									cellspacing="0">
								  <tr><td width="145" height="17" valign="top"><img src="image/T_bottomleft.gif" width="145" height="17"></td>
								<td width="458" align="center" valign="middle"background="image/T_bottombg.gif"><a href="messageBoard.jsp?p=<%=last%>" class="dong05">上一页</a><span class="STYLE1">&nbsp;|&nbsp;</span><a href="messageBoard.jsp?p=<%=next%>" class="dong05">下一页</a></td><td width="145" align="right"><img src="image/T_bottomright.gif" width="145" height="17"></td></tr></table>
							</td>
						</tr>
					</table>
			  </td>
			</tr>
		</table>
		<p>&nbsp;
			

		</p>
		<br>
	</body>
</html>

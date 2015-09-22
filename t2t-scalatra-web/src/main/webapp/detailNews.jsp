<%@ page language="java" pageEncoding="UTF-8"	contentType="text/html; charset=UTF-8"%>
<%@ page import="syjsp.bysj.dao.NewsDao" %>
<%@ page import="sysjsp.bysj.dao.impl.NewsDaoImpl" %>
<%@ page import="sysjsp.bysj.entity.News" %>

<%
	request.setCharacterEncoding("gbk");

	try {
		int newsID = Integer.parseInt(request.getParameter("newsID"));
		NewsDao newsDao = new NewsDaoImpl();
		News news = newsDao.findNewsByNewsID(newsID);
%>
<html>
	<head>

		<title>详细新闻</title>

		<link href="styles/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
<!--
.STYLE1 {	color: #FF0000;
	font-size: 12px;
}
.fontborder {
	top: 10px;
	right: 10px;
	bottom: 10px;
	left: 10px;
	clip: rect(10px,10px,10px,10px);
	position: static;
}
-->
        </style>
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
					<td colspan="2" align="left" valign="top" bgcolor="#f4f4f4">&nbsp;<a href="index.jsp" class="dong05">首页</a><span style="font-size: 12px;color: #FF0000;">&gt;&gt;</span><a href="showNewList.jsp" class="dong05">站内新闻</a></td>
			</tr>
			<tr>
				<td width="156" align="center" valign="top"
					background="image/cg5.jpg" bgcolor="#f4f4f4"><%@include file="left.jsp"%></td>
				<td width="643" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="52">
								<table width="100%" height="52" border="0" cellpadding="0"
									cellspacing="0">

									<tr align="center" height="50">
										<td height="26" colspan="2" align="center" valign="middle"
											background="image/cg2.jpg" class="g03">
											<strong><%=news.getTitle() %></strong>										</td>
									</tr>
								</table>							</td>
						</tr>
						
						<tr>
						  <td width="10%" height="34" align="left" valign="middle"
								class="d06">
						    <table width="614" border="0" cellpadding="0" cellspacing="20">
                              <tr class="d061">
                                <td class="d02">&nbsp;&nbsp;<%=news.getContent() %></td>
                              </tr>
                            </table>
					      </td>
						</tr>

						<tr>
							<td height="72" align="right" valign="top">
								<p>&nbsp;									</p>
								<p>&nbsp;</p>
								<p><img src="image/n10.jpg" width="165" height="72" /><br>
								  <span class="g01"><%=news.getWriterDate() %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;								</p></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="30" colspan="2" align="center" valign="top"><%@ include file="bottom.jsp"%></td>
			</tr>
		</table>
	</body>
</html>
<%
	} catch (Exception e) {
		System.out.println(e.getMessage());
		response.sendRedirect("showNewList.jsp");
	}
%>

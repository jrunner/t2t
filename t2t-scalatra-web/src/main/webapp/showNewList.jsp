<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.NewsDao"%>
<%@ page import="sysjsp.bysj.dao.impl.NewsDaoImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="sysjsp.bysj.entity.News"%>

<%
	request.setCharacterEncoding("gbk");

	int p = request.getParameter("page") == null ? 1 : Integer
			.parseInt(request.getParameter("page"));

	NewsDao newsDao = new NewsDaoImpl();
	List list = newsDao.findNews(p);
	int lastp = (p == 1) ? p : p - 1;
	int nextp = (list.size() == 10) ? p + 1 : p;
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
-->
        </style>
	</head>

	<body>

		<table width="799" border="0" align="center" cellpadding="0"
			cellspacing="0" class="n">
			<tr>
				<td colspan="2" align="left" valign="top">
					<%@ include file="top.jsp"%>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="left" valign="top" bgcolor="#f4f4f4">
					&nbsp;
					<a href="index.jsp" class="dong05">首页</a><span
						style="font-size: 12px;color: #FF0000;">&gt;&gt;</span><a
						href="showNewList.jsp" class="dong05">站内新闻</a>
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
							<td height="52" colspan="2">
								<table width="100%" height="52" border="0" cellpadding="0"
									cellspacing="0">

									<tr align="center" height="50">
										<td height="26" colspan="2" align="left" valign="middle"
											background="image/cg2.jpg">
											&nbsp;&nbsp;&nbsp;
											<span class="g02"><strong>新闻列表</strong> </span>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<%
								for (int i = 0; i < list.size(); i++) {
								News news = (News) list.get(i);
						%>
						<!--新闻列表-->
						<tr>
							<td width="10%" height="34" align="center" valign="middle"
								class="d062">
								<%
										System.out.println("A:" + (p * 10 - (10 - i) + 1 - (p - 1)));
										System.out.println("B:" + (p * 10 - (10 - i) + 2 - p));
								%>
								<%=p * 10 - 8 - p + i%>
							</td>
							<td width="90%" class="dong06">
								<a href="detailNews.jsp?newsID=<%=news.getNewsID()%>"
									class="dong05"><%=news.getTitle()%> </a>&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="g01">&nbsp;<%=news.getWriterDate()%> </span>
							</td>
						</tr>
						<%
						}
						%>


						<tr>
							<td height="29" colspan="2" align="center">
								<a href="showNewList.jsp?page=<%=lastp%>" class="dong05">上一页</a><span class="STYLE1">|</span><a href="showNewList.jsp?page=<%=nextp%>" class="dong05">下一页</a>
							</td>
						</tr>
						<tr>
							<td height="72" colspan="2" align="right" valign="top">
								<img src="image/n10.jpg" width="165" height="72" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="2" colspan="2" align="center" valign="top"
					background="image/cg5.jpg" bgcolor="#f4f4f4">
					<%@ include file="bottom.jsp"%>
				</td>
			</tr>
		</table>
	</body>
</html>

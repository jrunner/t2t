<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<html>
<body>

	<table>
		<tr>
			<td>名称</td>
			<td>密码</td>
			<td>操作</td>
		</tr>
		<%
			List<Map> list = (List)request.getAttribute("list");
			for ( int i = 0; i < list.size(); i++ ) {
				Map map = list.get(i);
		%>
		<tr>
			<td><%=map.get("username")%></td>
			<td><%=map.get("password")%></td>
			<td>删除</td>
		</tr>
		<% } %>
	</table>
</body>
</html>

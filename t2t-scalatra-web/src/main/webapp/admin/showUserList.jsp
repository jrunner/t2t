<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.UsersDao"%>
<%@ page import="sysjsp.bysj.dao.impl.UsersDaoImpl"%>
<%@ page import="java.util.List"%>
<jsp:directive.page import="sysjsp.bysj.entity.Users" />

<%
	/*设置字符集*/
	request.setCharacterEncoding("GBK");
	
	/*获取数据*/
	int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
	UsersDao userDao = new UsersDaoImpl();
	List list = userDao.findUsersList(p);
	
	int last=(p>1)?p-1:p;
	int next=(list.size()==20)?p+1:p;
%>
<html>
	<head>

		<title>用户管理</title>

		<link rel="stylesheet" type="text/css" href="../styles/admin.css">

	</head>

	<body>
	<table cellspacing="1" cellpadding="4" width="100%"
			class="tableborder" id="table3">
      <tr>
        <td colspan="3" class="header"> 用户管理 </td>
      </tr>
      <tr>
        <td width="37%" align="center" bgcolor="#CCCCFF"><b>用户名</b> </td>
        <td width="39%" align="center" bgcolor="#CCCCFF"><b>身份代码</b> </td>
        <td width="24%" align="center" bgcolor="#CCCCFF"><b>删除</b> </td>
      </tr>
      <%--开始--%>
      <%
					for (int i = 0; i < list.size(); i++) {
					Users u = (Users) list.get(i);
			%>
      <tr>
        <td rowspan="1" align="center" bgcolor="#FFFFFF"><%=u.getUserName()%> </td>
        <td rowspan="1" align="center" bgcolor="#FFFFFF"><%=u.getStatus()%> </td>
        <td rowspan="1" align="center" bgcolor="#FFFFFF"><a href="doDeleteUser.jsp?userId=<%=u.getUserId() %>">删除</a> </td>
      </tr>
      <%
				}
				%>
      <%--结束--%>
      <tr>
        <td align="right" colspan="2"><a href="showUserList.jsp?p=<%=last %>">上一页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="showUserList.jsp?p=<%=next %>">下一页</a> 
		</td>
		<td>&nbsp;</td>
      </tr>
    </table>
	</body>

</html>

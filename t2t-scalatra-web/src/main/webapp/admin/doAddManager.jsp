<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="sysjsp.bysj.dao.impl.UsersDaoImpl"%>
<%@ page import="sysjsp.bysj.entity.Users"%>
<%@ page import="syjsp.bysj.dao.UsersDao"%>

<%@ include file="checkAdmin.jsp"%>

<html>
	<head>
	</head>

	<body bgcolor="#D6E0EF">

	</body>
</html>

<%
	/*设置字符集*/
	request.setCharacterEncoding("GBK");

	/*接收数据*/
	String txtUserName = request.getParameter("txtUserName");
	String txtPassword = request.getParameter("txtPassword");

	/*业务处理*/
	UsersDao userDao = new UsersDaoImpl();
	Users user = (Users) session.getAttribute("userAdmin");

	//判断是否存在名字为name的用户
	if (userDao.findUserByUserName(txtUserName) == null) {
		//重新new一个用户
		user = new Users();
		user.setUserName(txtUserName);
		user.setPassword(txtPassword);
		user.setStatus(0);
		//执行命令
		if (userDao.addUser(user) == 1) {
			%>
<script language="javascript">
	alert("添加成功!");
	window.location.href='showUserList.jsp';
</script>
<%
			//response.sendRedirect("showUserList.jsp");
			return;
		} else {
%>



<script language="javascript">
	alert("数据有错误,添加失败...");
	window.location.href='addManager.jsp';
</script>

<%
	}
	} else {
%>

<script language="javascript">
	alert("用户名已经存在,添加失败...");
	window.location.href='addManager.jsp';
</script>

<%
}
%>





<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="syjsp.bysj.dao.UsersDao"%>
<%@ page import="sysjsp.bysj.dao.impl.UsersDaoImpl"%>
<%@ page import="sysjsp.bysj.entity.Users" %>

<html>
	<head>
	</head>

	<body bgcolor="#D6E0EF">

	</body>
</html>

<%
	try{
	request.setCharacterEncoding("GBK");
	
	int userId = Integer.parseInt(request.getParameter("userId"));

	UsersDao userDao = new UsersDaoImpl();

	Users userAdmin = (Users) session.getAttribute("userAdmin");

	/*要删除用户不能是自己且不能是超级管理员*/
	if (userId == userAdmin.getUserId()) {
%>
<script language="javascript">
	alert("不能删除自己,删除失败...");
	window.location.href='showUserList.jsp';
</script>
<%
} else if (userId == 1) {
%>
<script language="javascript">
	alert("没有权限删除超级管理员,删除失败...");
	window.location.href='showUserList.jsp';
</script>
<%
		} else {
		if (userDao.deleteUserByUserId(userId) == 1) {
%>
<script language="javascript">
	alert("删除成功");
	window.location.href='showUserList.jsp';
</script>
<%
	}else{
	%>
<script language="javascript">
	alert("数据有误,删除失败...");
	window.location.href='showUserList.jsp';
</script>
<%
	}
}
}catch(Exception e){
	response.sendRedirect("right.jsp");
}
%>

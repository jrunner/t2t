<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.UsersDao"%>
<%@ page import="sysjsp.bysj.dao.impl.UsersDaoImpl"%>
<%@ page import="sysjsp.bysj.entity.Users"%>

<%
	//设置字符集
	request.setCharacterEncoding("GBK");

	//获取数据
	String userName = request.getParameter("txtUserName");
	String password = request.getParameter("txtPassword");
	
	//业务处理
	UsersDao userDao = new UsersDaoImpl();
	Users user = new Users();
	user.setUserName(userName);
	user.setPassword(password);
	user.setStatus(1);
	
	//返回结果
	String str = "";
	if (userDao.findUserByUserName(userName) == null) {
		if (userDao.addUser(user) == 1) {
			response.sendRedirect("index.jsp");
			return;
		}
	} else {
		str = "用户名已存在,不能重复,注册失败...";
	}
%>

<html>
	<head>
		<title>注册</title>
	</head>
	<body onLoad="run()">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<table width="459" border="0" align="center">
			<tr>
				<td width="128"><img src="../image/haha.gif" width="128" height="128" /></td>
				<td width="315">
					<div
						style="color: #FF0000;	font-size: 12px;font-weight: bold;font-family: "宋体";">
						<%=str%>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="register.jsp" style="color:#FF0000; font-size: 12px;">立刻返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</body>
</html>

<script type="text/javascript">
var i=3;
var tm;
function run(){
	if(i>=0){
		i--;
		tm=setTimeout("run()",1000);
	}else{
		clearTimeout(tm);
		window.location="register.jsp"
	}
}
</script>


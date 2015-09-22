<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="syjsp.bysj.dao.*"%>
<%@ page import="sysjsp.bysj.dao.impl.*"%>
<%@ page import="sysjsp.bysj.entity.*"%>
<%
	request.setCharacterEncoding("GBK");

	String txtUserName = request.getParameter("txtUserName");
	String txtPassword = request.getParameter("txtPassword");

	UsersDao userDao = new UsersDaoImpl();
	Users user = userDao.findUserByUserName(txtUserName);
	String str = "";
	if (user != null) {//判断是否存在名字为name的用户
		if (user.getPassword().equals(txtPassword)) {//用户密码是否匹配
			if (user.getStatus() == 0) {//是否是管理员
				session.setAttribute("userAdmin", user);//将用户添加到session中
				response.sendRedirect("admin/index.jsp");//进入main.jsp页面
				return;
			} else {
				str = "对不起!你不是管理员, 登录失败...";
			}
		} else {
				str = "密码不正确,登录失败...";
		}
	} else {
		str = "用户名不存在,登录失败...";
	}
%>
<html>
	<head>


	</head>
	<body onLoad="run()">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<table width="459" border="0" align="center">
			<tr>
				<td width="128">
					<img src="image/haha.gif" width="128" height="128" />
				</td>
				<td width="315">
					<div
						style="color: #FF0000;	font-size: 12px;font-weight: bold;font-family: "宋体";">
						<%=str%>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="#" onclick="window.history.go(-1);return false;" style="color:#FF0000; font-size: 12px;">立刻返回</a>
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
		window.history.go(-1);
		//	window.location="login.jsp"
	}
}
</script>

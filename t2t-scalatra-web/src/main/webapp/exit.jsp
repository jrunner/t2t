<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page  import="sysjsp.bysj.entity.Users"%>
<%
	//如果关闭聊天窗体则删除当前登录用户...没完成...
	Users user = (Users) session.getAttribute("user");
	List names =(List)application.getAttribute("names");
	names.remove(user.getUserName());
%>


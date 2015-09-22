<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="sysjsp.bysj.entity.Users" %>
<%
	Users user = (Users) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("index.jsp");
		return;
	}
%>

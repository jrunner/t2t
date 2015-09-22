<%@ page language="java" import="java.util.*" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="sysjsp.bysj.entity.*"%>

<%@ include file="checked.jsp"%>

<%
	request.setCharacterEncoding("GBK");//ÉèÖÃ±àÂë¹æ·¶

	List names = (List) application.getAttribute("names");
	System.out.println("---------");
	if (names != null) {
		names.remove(user.getUserName());
		System.out.println(names.size());
		application.setAttribute("names", names);
		session.removeAttribute("user");
		session.removeAttribute("style");
	}
%>

<%@ page language="java" import="java.util.*" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="sysjsp.bysj.entity.*"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>

<%@ include file="checked.jsp"%>

<%
	request.setCharacterEncoding("GBK");//设置编码规范

	String message = request.getParameter("txtMessage");//获取表单里的值
	
	String select = request.getParameter("select");
	session.setAttribute("style", "background-image:url(../image/"+select+")");
	
	String name = ((Users) session.getAttribute("user")).getUserName();
	Chat chat = new Chat();
	chat.setName(name);
	chat.setMessage(message);
	SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String strTime=sf.format(new Date());
	chat.setStrTime(strTime);
	List messages = application.getAttribute("messages") == null ? new ArrayList()
			: (List) application.getAttribute("messages");
	if (!(message.equals("") || message.equals(null)))
		messages.add(chat);

	application.setAttribute("messages", messages);

	response.sendRedirect("sendMessage.jsp?select=" + select);
%>

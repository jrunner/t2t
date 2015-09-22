<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.MessageDao"%>
<%@ page import="sysjsp.bysj.dao.impl.MessageDaoImpl"%>
<%@ page import="sysjsp.bysj.entity.Message"%>

<%
		try {
		/*设置字符编码*/
		request.setCharacterEncoding("GBK");
		
		/*获取数据*/
		String title = request.getParameter("txtTitle");//留言标题
		String content = request.getParameter("txtContent");//留言内容
		String name = request.getParameter("txtName");//留言者
		
		/*业务处理*/
		MessageDao messageDao = new MessageDaoImpl();
		Message message = new Message();
		message.setContent(content);
		message.setName(name);
		message.setTitle(title);
		response.sendRedirect((messageDao.addMessage(message) == 1) ? "messageBoard.jsp": "newMessage.jsp");
	} catch (Exception e) {
		response.sendRedirect("index.jsp");
	}
%>

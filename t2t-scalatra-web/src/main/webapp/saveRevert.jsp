<%@ page language="java" pageEncoding="gbk"%>
<%@ page import="sysjsp.bysj.dao.impl.RevertDaoImpl"%>
<%@ page import="sysjsp.bysj.entity.Revert"%>
<%@ page import="syjsp.bysj.dao.RevertDao"%>
<%
	/*设置字符编码*/
	request.setCharacterEncoding("GBK");
	
	/*获取数据*/
	//留言ID
	int messageID = request.getParameter("messageId")==null?1:Integer.parseInt(request.getParameter("messageId"));
	//回复标题
	String title = request.getParameter("txtTitle");
	//回复内容
	String content = request.getParameter("txtContent");
	//回复者
	String name = request.getParameter("txtName");

	/*业务处理*/
	RevertDao revertDao = new RevertDaoImpl();
	Revert revert = new Revert();
	revert.setContent(content);
	revert.setMessageID(messageID);
	revert.setName(name);
	revert.setTitle(title);

	if (revertDao.addReply(revert) == 1) {
		response.sendRedirect("revertMessage.jsp?p=1&messageId="+messageID);
	}else{
		response.sendRedirect("messageBoard.jsp.jsp");
	}
%>

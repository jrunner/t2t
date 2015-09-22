<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="sysjsp.bysj.dao.impl.NewsDaoImpl"%>
<%@ page import="syjsp.bysj.dao.NewsDao"%>

<html>
	<head>
	</head>

	<body bgcolor="#D6E0EF">

	</body>
</html>
<%
	/*设置字符编码*/
	request.setCharacterEncoding("GBK");
	
	/*获取数据*/
	int newsId = Integer.parseInt(request.getParameter("newsId"));
			
	/*业务处理*/
	NewsDao newsDao = new NewsDaoImpl();
	if (newsDao.deleteNewsByNewsID(newsId)==1) {
	%>
<script language="javascript">
	alert("删除成功!");
	window.location.href='manageNews.jsp';
</script>
<%
	}else{
	%>
<script language="javascript">
	alert("数据出错，删除失败...");
	window.location.href='right.jsp';
</script>
<%
	}
%>

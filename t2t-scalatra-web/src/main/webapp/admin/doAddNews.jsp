<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="sysjsp.bysj.dao.impl.NewsDaoImpl"%>
<%@ page import="syjsp.bysj.dao.NewsDao"%>
<%@ page import="sysjsp.bysj.entity.News"%>
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
	String txtTitle = request.getParameter("txtTitle");//新闻标题
	String txtContent = request.getParameter("txtContent");//新闻内容
	/*业务处理*/
	NewsDao newsDao = new NewsDaoImpl();
	News news = new News();
	news.setContent(txtContent);
	news.setTitle(txtTitle);
	if (newsDao.addNews(news) == 1) {
	%>
<script language="javascript">
	alert("添加成功!");
	window.location.href='manageNews.jsp';
</script>
<%
		//response.sendRedirect("manageNews.jsp");
	} else {
%>
<script language="javascript">
	alert("数据有错误,添加失败...");
	window.location.href='addProduct.jsp';
</script>
<%
}
%>

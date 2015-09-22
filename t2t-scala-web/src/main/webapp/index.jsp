<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<body>
<a href="<%=request.getContextPath() %>/JavaTestServlet">JavaTestServlet</a><br>
<a href="<%=request.getContextPath() %>/ScalaTestServlet">ScalaTestServlet</a><br>
<a href="<%=request.getContextPath() %>/UserServlet?cmd=list">UserServlet</a><br>
<a href="<%=request.getContextPath() %>/jsp/user/list.jsp">用户列表</a><br>
</body>
</html>

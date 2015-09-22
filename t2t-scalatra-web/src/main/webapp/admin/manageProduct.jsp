<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.ProductDao"%>
<%@ page import="sysjsp.bysj.dao.impl.ProductDaoImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="sysjsp.bysj.entity.Product"%>
<%
	/*设置字符编码*/
	request.setCharacterEncoding("GBK");
	
	ProductDao productDao = new ProductDaoImpl();
	String action=request.getParameter("action");
	if(action!=null){
		if(productDao.deleteProductByProductID(Integer.parseInt(action))==1){
				%><script language="javascript">alert("删除成功!");</script><%
		}	
	}
	
	int p = request.getParameter("page") == null ? 1 : Integer
			.parseInt(request.getParameter("page"));
	List list = productDao.findProductList(p);
	int last = (p == 1) ? p : p - 1;
	int next = (list.size() == 5) ? p + 1 : p;
%>

<html>
	<head>
		<title>商品管理</title>
		<link rel="stylesheet" type="text/css" href="../styles/admin.css">
	</head>

	<body bgcolor="#D6E0EF">
		<table cellspacing="1" cellpadding="4" width="100%"
			class="tableborder" id="table3">
			<tr>
				<td colspan="7" class="header">
					商品管理				</td>
			</tr>
			<tr>
				<td align="center" bgcolor="#CCCCFF">
					<b>商品编号</b>				</td>
				<td align="center" bgcolor="#CCCCFF">
					<b>商品名称</b>				</td>
				<td align="center" bgcolor="#CCCCFF">
					<b>商品商标</b>				</td>
				<td align="center" bgcolor="#CCCCFF">
					<b>商品型号</b>				</td>
				<td align="center" bgcolor="#CCCCFF">
					<b>商品价格</b>				</td>
				<td align="center" bgcolor="#CCCCFF">
					<b>修改</b>				</td>
				<td align="center" bgcolor="#CCCCFF">
					<b>删除</b>				</td>
			</tr>


			<%
					for (int i = 0; i < list.size(); i++) {
					Product product = (Product) list.get(i);
			%>
			<tr>
				<td align="center" bgcolor="#FFFFFF">
					<%=product.getSerialNumber()%>				</td>
				<td align="center" bgcolor="#FFFFFF">
					<%=product.getName()%>				</td>
				<td align="center" bgcolor="#FFFFFF">
					<%=product.getBrand()%>				</td>
				<td align="center" bgcolor="#FFFFFF">
					<%=product.getModel()%>				</td>
				<td align="center" bgcolor="#FFFFFF">
					<%=product.getPrice()%>				</td>
				<td align="center" bgcolor="#FFFFFF">
					<a href="addProduct.jsp?productId=<%=product.getProductID() %>">修改</a>				</td>
				<td align="center" bgcolor="#FFFFFF">
					<a href="manageProduct.jsp?action=<%=product.getProductID() %>">删除</a>				</td>
			</tr>

			<%
			}
			%>

			<tr>
				<td colspan="5" align="right">
					<a href="manageProduct.jsp?page=<%=last%>">上一页</a>|
					<a href="manageProduct.jsp?page=<%=next%>">下一页</a>				</td>
				<td></td><td></td>
			</tr>
		</table>
	</body>

</html>

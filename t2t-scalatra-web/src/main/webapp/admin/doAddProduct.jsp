<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="sysjsp.bysj.entity.Product"%>
<%@ page import="syjsp.bysj.dao.ProductDao"%>
<%@ page import="sysjsp.bysj.dao.impl.ProductDaoImpl"%>
<html>
	<head>
	</head>

	<body bgcolor="#D6E0EF">

	</body>
</html>
<%
	/*设置字符编码*/
	request.setCharacterEncoding("GBK");

	ProductDao productDao = new ProductDaoImpl();

	/*获取数据*/
	System.out.print(request.getParameter("productId")==null);
	
	String action = request.getParameter("action");
	String serialNumber = request.getParameter("txtSerialNumber");//商品编号
	String name = request.getParameter("txtName");//商品名称
	String brand = request.getParameter("txtBrand");//商品商标
	String model = request.getParameter("txtModel");//商品型号
	double price = Double.parseDouble(request.getParameter("txtPrice"));//商品价格
	String picture = request.getParameter("txtPicture");//商品图片
	String description = request.getParameter("txtDescription");//商品介绍

	Product product = new Product();
	product.setSerialNumber(serialNumber);
	product.setName(name);
	product.setBrand(brand);
	product.setModel(model);
	product.setPrice(price);
	product.setPicture(picture);
	product.setDescription(description);
	
	/*业务处理*/
	if (action.equals("add")) {
		if (productDao.addProduct(product) == 1) {
					%>
<script language="javascript">
	alert("添加成功!");
	window.location.href='manageProduct.jsp';
</script>
<%
			//response.sendRedirect("manageProduct.jsp");
		}else{
					%>
<script language="javascript">
	alert("数据可能有误，添加失败!");
	window.location.href='addProduct.jsp';
</script>
<%
		}
	} else {
		int productId = Integer.parseInt(request.getParameter("productId"));
		product.setProductID(productId);
		if (productDao.updateProductByProductID(product) == 1) {
					%>
<script language="javascript">
	alert("修改成功!");
	window.location.href='manageProduct.jsp';
</script>
<%
			//response.sendRedirect("manageProduct.jsp");
		}else{
					%>
<script language="javascript">
	alert("数据可能有误，修改失败!");
	window.location.href='manageProduct.jsp';
</script>
<%
		}
	}
%>

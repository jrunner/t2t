<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.ProductDao"%>
<%@ page import="sysjsp.bysj.entity.Product"%>
<%@ page import="sysjsp.bysj.dao.impl.ProductDaoImpl"%>

<%
		try {
		/*设置字符编码*/
		request.setCharacterEncoding("GBK");

		/*获取数据*/
		int productID = Integer.parseInt(request.getParameter("productID"));
		
		/*实例化ProductDao*/
		ProductDao productDao = new ProductDaoImpl();

		/*业务处理*/
		Product product = productDao.findProductByProductID(productID);
%>
<html>
	<head>

		<title>详细新闻</title>
		<script type="text/JavaScript" src="js/jquery-1.3.1.js"></script>
		<script type="text/JavaScript">
			$(function(){
			var x = 25;
			var y = -25;
			$("a.tooltip").mouseover(function(e){
				this.myTitle = this.title;
				var imgTitle = this.myTitle? "<br/>" + this.myTitle : "";
				var tooltip = "<div id='tooltip'><img style='width:230px;height:230px;' src='"+ this.href +"' alt='产品预览图'/>"+imgTitle+"<\/div>"; //创建 div 元素
				$("body").append(tooltip);	//把它追加到文档中						 
				$("#tooltip")
					.css({
						"top": (e.pageY+y) + "px",
						"left":  (e.pageX+x)  + "px"
					}).show(1000);	  //设置x坐标和y坐标，并且显示
			}).mouseout(function(){
				$("#tooltip").remove();	 //移除 
			}).mousemove(function(e){
				$("#tooltip")
					.css({
						"top": (e.pageY+y) + "px",
						"left":  (e.pageX+x)  + "px"
					});
			});
		})
		</script>
		<link href="styles/css.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<table width="799" border="0" align="center" cellpadding="0"
			cellspacing="0" class="n">
			<tr>
				<td colspan="2" align="left" valign="top">
					<%@ include file="top.jsp"%>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="left" valign="top">
					&nbsp;
					<a href="index.jsp" class="dong05">首页</a><font
						style="font-size: 12px; color: red;">&gt;&gt;</font><a
						href="showProductList.jsp" class="dong05">商品展示</a><font
						style="font-size: 12px; color: red;">&gt;&gt;</font><a href="#"
						class="dong05">商品信息</a>
				</td>
			</tr>
			<tr>
				<td width="156" align="center" valign="top"
					background="image/cg5.jpg" bgcolor="#f4f4f4">
					<%@include file="left.jsp"%>
				</td>
				<td width="643" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="621" border="0" cellpadding="0" cellspacing="6">
									<tr>
										<td width="143" align="center" valign="top">
											<a class="tooltip" href="image/<%=product.getPicture()%>" title="<p>名称: <%=product.getName() %><p>种类: <%=product.getBrand() %>">
												<img src="image/<%=product.getPicture()%>" width="125" height="102" border="0">
											</a>
										</td>
										<td width="462">
											<table width="100%" border="1" align="center" cellpadding="0"
												cellspacing="1" bordercolor="#999999">
												<tr>
													<td width="31%" height="23" align="center" valign="middle"
														bgcolor="#f4f4f4" class="g01">
														&nbsp;产品编号:
													</td>
													<td width="69%" align="center" valign="middle" class="g01">
														<%=product.getSerialNumber()%>
													</td>
												</tr>
												<tr>
													<td height="22" align="center" valign="middle"
														bgcolor="#f4f4f4" class="g01">
														产品名称:
													</td>
													<td align="center" valign="middle" class="g01">
														<%=product.getName()%>
														<br>
													</td>
												</tr>
												<tr>
													<td height="22" align="center" valign="middle"
														bgcolor="#f4f4f4" class="g01">
														产品品牌:
													</td>
													<td align="center" valign="middle" class="g01">
														<%=product.getBrand()%>
													</td>
												</tr>
												<tr>
													<td height="22" align="center" valign="middle"
														bgcolor="#f4f4f4" class="g01">
														产品型号:
													</td>
													<td align="center" valign="middle" class="g01">
														<%=product.getModel()%>
														&nbsp;
													</td>
												</tr>
												<tr>
													<td height="22" align="center" valign="middle"
														bgcolor="#f4f4f4" class="g01">
														产品价格:
													</td>
													<td align="center" valign="middle" class="g01">
														<%=product.getPrice()%>
													</td>
												</tr>
												<tr>
													<td height="22" align="center" valign="middle"
														bgcolor="#f4f4f4" class="g01">
														产品介绍:
													</td>
													<td align="center" valign="middle" class="g01">
														<%=product.getDescription()%>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="72" align="right" valign="top">
								<p>
									<br>
									<img src="image/n10.jpg" width="165" height="72" />
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="2" colspan="2" align="center" valign="top"
					background="image/cg5.jpg" bgcolor="#f4f4f4">
					<%@ include file="bottom.jsp"%>
				</td>
			</tr>
		</table>
	</body>
</html>
<%
		} catch (Exception e) {
		System.out.println(e.getMessage());
		response.sendRedirect("showProductList.jsp");
	}
%>

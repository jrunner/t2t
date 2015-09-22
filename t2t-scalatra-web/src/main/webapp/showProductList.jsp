<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.*"%>
<%@ page import="sysjsp.bysj.dao.impl.ProductDaoImpl"%>
<%@ page import="java.util.List"%>
<%@ page import="sysjsp.bysj.entity.Product"%>
<%
	/*设置字符编码*/
	request.setCharacterEncoding("gbk");

	/*得到数据*/
	int p = request.getParameter("page") == null ? 1 : Integer
			.parseInt(request.getParameter("page"));//获得要显示的页面

	/*业务处理*/
	ProductDao productDao = new ProductDaoImpl();//实例化ProductDao对象
	List list = productDao.findProductList(p);//获得商品信息
	//设置上一页标签
	int lastp = (p == 1) ? p : p - 1;//如果当前页面为1则 当前页面等于当前页面
	//设置下一页标签
	int nextp = (list.size() == 5) ? p + 1 : p;//如果查到的信息是10条 则当前页面加1
%>
<html>
	<head>

		<title>新闻列表</title>

		<link href="styles/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-size: 12px;
}
-->
        </style>
        
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
					&nbsp;<a href="index.jsp" class="dong05">首页</a><font
						style="font-size: 12px; color: red;">&gt;&gt;</font><a href="showProductList.jsp"
						class="dong05">商品展示</a></td>
			</tr>
			<tr>
				<td width="156" align="left" valign="top" background="image/cg5.jpg"
					bgcolor="#f4f4f4">
					<%@include file="left.jsp"%>
				</td>
				<td width="643" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<table width="100%" height="50" border="0" cellpadding="0"
									cellspacing="0">

									<tr align="center" height="50">
										<td height="50" colspan="2" valign="middle">

											<%
													for (int i = 0; i < list.size(); i++) {
													Product product = (Product) list.get(i);
													System.out.println(product.getPicture());
											%>
											<!--循环显示商品-->
											<table width="637" height="81" border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="143" height="75" align="center">
									<a class="tooltip" href="image/<%=product.getPicture()%>" title="<p>名称: <%=product.getName() %><p>种类: <%=product.getBrand() %>">
									<img src="image/<%=product.getPicture()%>" width="81" height="71" border="0"/></a>
													</td>
													<td width="478">
														<table width="97%" height="62" border="1" cellpadding="0"
															cellspacing="2" bordercolor="#999999" class="tdborder">
															<tr>
																<td width="24%" height="25" align="center"
																	valign="middle" bgcolor="#f4f4f4" class="d02">
																	产品名称：
																</td>
																<td width="29%" align="center" valign="middle"
																	class="d02">
																	<a href="detailProduct.jsp?productID=<%=product.getProductID()%>"><%=product.getName()%></a>
																</td>
																<td width="23%" align="center" valign="middle"
																	bgcolor="#f4f4f4" class="d02">
																	产品品牌：
																</td>
																<td width="24%" align="center" valign="middle"
																	class="d02">
																	<%=product.getBrand()%>
																</td>
															</tr>
															<tr>
																<td height="28" align="center" valign="middle"
																	bgcolor="#f4f4f4" class="d02">
																	产品型号：
																</td>
																<td align="center" valign="middle" class="d02">
																	<%=product.getModel()%>
																</td>
																<td align="center" valign="middle" bgcolor="#f4f4f4"
																	class="d02">
																	产品价格：
																</td>
																<td align="center" valign="middle" class="d02">
																	<%=product.getPrice()%>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<%
											}
											%>
										</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td width="60%" height="13" align="center" valign="top">
								<a href="showProductList.jsp?page=<%=lastp%>" class="dong05">上一页</a><span
									class="STYLE1">|</span><a
									href="showProductList.jsp?page=<%=nextp%>" class="dong05">下一页</a>&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td height="72" align="right" valign="top">
								<img src="image/n10.jpg" width="165" height="72" border="0" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="2" colspan="2">
					<%@ include file="bottom.jsp"%>
				</td>
			</tr>
		</table>
	</body>
</html>

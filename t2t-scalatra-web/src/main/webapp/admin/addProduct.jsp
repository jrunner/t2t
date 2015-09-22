<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="syjsp.bysj.dao.ProductDao"%>
<%@ page import="sysjsp.bysj.dao.impl.ProductDaoImpl"%>
<%@ page import="sysjsp.bysj.entity.Product"%>
<%
	/*设置字符集*/
	request.setCharacterEncoding("GBK");

	/*获取数据*/
	String str = request.getParameter("productId");

	/*初始化数据*/
	String serialNumber = "";//商品编号
	String name = "";//商品名称
	String brand = "";//商品商标
	String model = "";//商品型号
	String price = "";//商品价格
	String picture = "";//商品图片
	String description = "";//商品介绍
	String action = "add";

	if (str != null) {//如果有数据传来则说、明要进行修改否则是添加
		int productId = Integer.parseInt(str);
		ProductDao productDao = new ProductDaoImpl();// 实例化ProductDao
		Product product = productDao.findProductByProductID(productId);
		//给商品赋值
		productId = product.getProductID();
		serialNumber = product.getSerialNumber();
		name = product.getName();
		brand = product.getBrand();
		model = product.getModel();
		price = product.getPrice() + "";
		picture = product.getPicture();
		description = product.getDescription();
		action = "update";
	}
%>
<html>
	<head>

		<title>添加商品</title>

		<link rel="stylesheet" type="text/css" href="../styles/admin.css">

		<script type="text/javascript">
		function checkForm() {
			with(document.form1){
				if (txtSerialNumber.value == "") {
					alert("商品编号不能为空");
					txtSerialNumber.focus();
					return false;
				} 
				if (txtName.value == "") {
				 	txtName.focus();
					alert("商品名称不能为空");
					return false;
				} 
				if (txtBrand.value == "") {
					alert("商品商标不能为空");
					txtBrand.focus();
					return false;
				}  
				if (txtModel.value == "") {
					alert("商品型号不能为空");
					txtModel.focus();
					return false;
				}  
				if (txtPrice.value == "") {
					alert("商品价格不能为空");
					txtPrice.focus();
					return false;
				} 
				 if (txtPicture.value == "") {
					alert("商品图片不能为空");
					txtPicture.focus();
					return false;
				}  
				if (txtDescription.value == "") {
					alert("商品介绍不能为空");
					txtDescription.focus();
					return false;
				} 
				 if (isNaN(document.form1.txtPrice.value)) {
					alert("商品价格输入不正确");
					txtPrice.select();
					return false;
				}
				return true;
			}
		}
		
		//回车换行
	function changeFocus(){
		if(event.srcElement.type!=""&&event.keyCode==13&&event.srcElement.type!="button"&&event.srcElement.type!="submit"){
			event.keyCode=9;
		}
	}
	document.onkeydown=changeFocus;
	</script>

	</head>
	<body>
		<form name="form1"
			action="doAddProduct.jsp?productId=<%=str%>&action=<%=action%>"
			method="post" onSubmit="return checkForm();">
			<table cellspacing="1" cellpadding="4" width="100%"
				class="tableborder" id="table3">

				<tr>
					<td colspan="12" class="header">
						添加商品信息
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						商品编号：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input type="text" name="txtSerialNumber" size="34"
							value=<%=serialNumber%>>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						商品名称：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input type="text" name="txtName" size="34" value=<%=name%>>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						商品商标：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input type="text" name="txtBrand" size="34" value=<%=brand%>>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						商品型号：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input type="text" name="txtModel" size="34" value=<%=model%>>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						商品价格：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input type="text" name="txtPrice" size="34" value=<%=price%>>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						商品图片：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input type="text" name="txtPicture" size="34" value=<%=picture%>>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#FFFFFF">
						商品介绍：
					</td>
					<td colspan="11" bgcolor="#FFFFFF">
						<textarea rows="5" cols="60" name="txtDescription"><%=description%></textarea>
					</td>
				</tr>


				<tr>
					<td bgcolor="#FFFFFF"></td>
					<td colspan="11" bgcolor="#FFFFFF">
						<input name="btnSub" type="submit" class="mouseOutStyle"
							id="btnSub" onMouseOver="this.className='mouseOverStyle'"
							onMouseOut="this.className='mouseOutStyle'" value="提 交">
						&nbsp;&nbsp;
						<input name="btnReset" type="reset" class="mouseOutStyle"
							id="btnReset" onMouseOver="this.className='mouseOverStyle'"
							onMouseOut="this.className='mouseOutStyle'" value="重 置">
					</td>
				</tr>
			</table>
		</form>
	</body>

</html>

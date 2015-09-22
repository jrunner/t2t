<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=gb2312"%>

<html>
	<head>

		<title>注册页面</title>
		<script language="javascript">
	function checkForm(){
		with(document.form1){
			if(txtUserName.value==""){
				alert("用户名不为空!");
				txtUserName.focus();
				return false;
			}
			if(txtPassword.value==""){
				alert("密码不能为空");
				txtPassword.focus();
				return false;
			}
			if(txtRePassword.value==""){
				alert("确认密码不能为空");
				txtRePassword.focus();
				return false;
			}
			if(txtRePassword.value!=txtPassword.value){
				alert("两次输入不一致");
				txtPassword.select();
				return false;
			}
		}
		return true;
	}
	
	//回车换行
	function changeFocus(){
		if(event.srcElement.type!=""&&event.keyCode==13&&event.srcElement.type!="button"&&event.srcElement.type!="submit"){
			event.keyCode=9;
		}
	}
	document.onkeydown=changeFocus;
	</script>
		<link href="../styles/css.css" rel="stylesheet" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">

</style></head>

	<body >
	<p>&nbsp;</p>
		<p>&nbsp;</p>
			<p>&nbsp;</p>
		<form action="doRegister.jsp" method="post" name="form1"
			target="_self" onSubmit="return checkForm();">
			<table width="335" height="167" border="0" align="center" cellpadding="0"
				cellspacing="0" bgcolor="#FFFFCC"
				class="tableStyle">
				<tr>
					<td height="41" colspan="2" align="center" class="d02">
						<strong>会员注册</strong></td>
				</tr>
				<tr>
					<td width="102" height="28" align="center" class="d02">
						用&nbsp;户&nbsp;名：</td>
					<td width="215" height="25"><input name="txtUserName" type="text" id="txtUserName"
							style="font-size:12px" size="27" maxlength="20"></td>
				</tr>
				<tr>
					<td height="27" align="center" class="d02">
						密&nbsp;&nbsp;&nbsp;&nbsp;码：					</td>
				  <td height="25"><input name="txtPassword" type="password" id="txtPassword" style="font-size:12px"size="30" maxlength="20"></td></tr>
				<tr>
					<td height="29" align="center" class="d02">
						确认密码：					</td>
					<td height="25"><input name="txtRePassword" type="password" id="txtRePassword" style="font-size:12px"
							size="30" maxlength="20"></td>
				</tr>
				<tr>
					<td height="40" colspan="2" align="center">
						<label>
							<input type="submit" name="sub" value="登 录" class="mouseOutStyle"
								onMouseOut="this.className='mouseOutStyle'"
								onMouseOver="this.className='mouseOverStyle'">
							&nbsp;&nbsp;
							<input type="button" name="sub" value="退 出" class="mouseOutStyle"
								onMouseOut="this.className='mouseOutStyle'"
								onMouseOver="this.className='mouseOverStyle'"
								onClick="window.close();">
						</label>
				  </td>
				</tr>
		  </table>
		    <div align="center"><a href="index.jsp" class="dong05">返回登录</a>
	          </div>
		</form>
	</body>
</html>
